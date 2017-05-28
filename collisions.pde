int collisionDelay;

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

void checkLineCollision(Ball ball, PVector la, PVector lb) {
    if (collisionDelay > 0) {
        collisionDelay--;
        return;
    }
    PVector bp = ball.getPos();
    PVector bv = ball.getVel().mult(-1);
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
    if (distance <= ball.radius()) {
        //collisionDelay = 5;
        ball.setVel(refl);
    }

    // Optional visualization of approach and deflection vectors.
    if (VISUALIZE) {
        fill(255,0,0); stroke(255,0,0);
        ellipse(closest.x, closest.y, 5, 5);
        line(closest.x, closest.y, closest.x + 20 * bv.x, closest.y + 20 * bv.y);
        strokeWeight(2); stroke(225);
        line(closest.x, closest.y, closest.x + (1/bv.mag()) * orth.x,
                                   closest.y + (1/bv.mag()) * orth.y);
        strokeWeight(2); stroke(0,255,0);
        line(closest.x, closest.y, closest.x + 20 * refl.x, closest.y + 20 * refl.y);
    }
}

void checkPolygonCollision(Ball ball, Object poly) {
    if (collisionDelay > 0) {
        collisionDelay--;
        return;
    }
    PVector[] vertices = poly.vertices();
    for (PVector v : vertices) {
        float distc = PVector.dist(ball.getPos(), v);
        float distn = PVector.dist(PVector.add(ball.getPos(), ball.getVel()), v);
        if (distc <= ball.radius() && distn < distc) {
            ball.setVel(ball.getVel().mult(-1));
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
        checkLineCollision(ball, vc, vn);
    }
}

void checkPutterCollision(Putter putter, Ball ball) {
    PVector pp = putter.getPos();
    PVector pv = putter.getVel();
    float pr = putter.radius();
    PVector bp = ball.getPos();
    PVector bv = ball.getVel();
    float br = ball.radius();
    if (PVector.dist(pp, bp) <= pr + br) {
        ball.setVel(PVector.sub(pv, bv));
    }
}