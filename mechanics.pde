/*

    mechanics.pde
    
    URL: https://github.com/rjww/minigolf

*/

boolean checkPointOnLine(PVector p, PVector a, PVector b) {
    float len = PVector.dist(a, b);
    float dist_a = PVector.dist(p, a);
    float dist_b = PVector.dist(p, b);
    float distance = dist_a + dist_b;
    float buffer = 0.1;
    if (distance >= len - buffer && distance <= len + buffer) {
        return true;
    }
    return false;
}

boolean checkPointCollision(PVector b, float r, PVector p) {
    float distance = PVector.dist(b, p);
    if (distance <= r) {
        return true;
    }
    return false;
}

void checkLineCollision(PVector la, PVector lb) {
    PVector bp = BALL.getPos();
    PVector bv = BALL.getVel().mult(-1);
    float len = PVector.dist(la, lb);
    float dot = PVector.dot(PVector.sub(bp, la), PVector.sub(lb, la))/pow(len, 2);
    PVector closest = new PVector(la.x + (dot * (lb.x - la.x)),
                                  la.y + (dot * (lb.y - la.y)));
    if (checkPointOnLine(closest, la, lb) == false) {
        return;
    }
    // Calculations for deflection.
    PVector orth = PVector.sub(la, closest);
    PVector oa = orth.copy().rotate(HALF_PI);
    PVector ob = orth.copy().rotate(-HALF_PI);
    if (PVector.dist(bv, oa) < PVector.dist(bv, ob)) {
        orth = oa;
    } else {
        orth = ob;
    }
    PVector proj = orth.copy().mult(PVector.dot(bv, orth)/pow(orth.mag(), 2));
    PVector refl = proj.mult(2).sub(bv);

    // Deflect.
    float distance = PVector.dist(closest, bp);
    if (distance <= BALL.radius()) {
        deflect(refl);
    }
}

void checkPolygonCollision(Obstacle poly) {
    PVector[] vertices = poly.vertices();
    for (PVector v : vertices) {
        float distc = PVector.dist(BALL.getPos(), v);
        float distn = PVector.dist(PVector.add(BALL.getPos(), BALL.getVel()), v);
        if (distc <= BALL.radius() && distn < distc) {
            BALL.setVel(BALL.getVel().mult(-1));
            return;
        }
    }
    int next;
    for (int current = 0; current < vertices.length; current++) {
        next = current + 1;
        if (next == vertices.length) {
            next = 0;
        }
        PVector vc = vertices[current];
        PVector vn = vertices[next];
        checkLineCollision(vc, vn);
    }
}

void checkPutterCollision() {
    if (!PUTTER_ACTIVE) {
        return;
    }
    PVector bp = BALL.getPos(); float br = BALL.radius(); 
    PVector pp = PUTTER.getPos(); float pr = PUTTER.radius();
    float distance = PVector.dist(bp, pp);
    if (distance <= br + pr) {
        PVector pv = PUTTER.getVel();
        deflect(pv.mult(1.4));
        PUTTER_ACTIVE = false;
    }
}

PVector VELOCITY_0 = new PVector(0,0);
float T = 0;

void deflect(PVector v) {
    BALL.setVel(v);
    VELOCITY_0 = v;
    T = 0;
}

int FRICTION_DELAY = 10;

void applyFriction(float friction) {
    if (FRICTION_DELAY > 0) {
        FRICTION_DELAY--;
        return;
    }
    PVector nv = VELOCITY_0.copy().mult(exp(-friction * T/(frameRate/2)));
    BALL.setVel(nv);
    T++;
    if (abs(nv.x) < 0.1 && abs(nv.y) < 0.1) {
        nv.x = 0; nv.y = 0;
    }
    BALL.setVel(nv);
    FRICTION_DELAY = 10;
}