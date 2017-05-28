class Ball {
    PVector position, velocity;
    float radius;
    
    Ball(float x, float y, float r_) {
        position = new PVector(x, y);
        velocity = PVector.random2D();
        velocity.mult(10);
        radius = r_;
    }
    
    float radius() {
        return radius;
    }
    
    PVector getPos() {
        return position.copy();
    }
    
    void setPos(PVector pos_) {
        position.x = pos_.x;
        position.y = pos_.y;
    }
    
    PVector getVel() {
        return velocity.copy();
    }
    
    void setVel(PVector vel_) {
        velocity.x = vel_.x;
        velocity.y = vel_.y;
    }
    
    void update() {
        position.add(velocity);
    }
    
    void display() {
        if (VISUALIZE) {
            strokeWeight(2); stroke(255,0,0);
            line(position.x, position.y,
                 position.x + 20 * velocity.x, position.y + 20 * velocity.y);
        }
        noStroke(); fill(200);
        ellipse(position.x, position.y, 2 * radius, 2 * radius);
    }
}

class Object {
    PVector[] vertices;

    Object(float... coords) {
        vertices = _mapCoords(coords);
    }
    
    PVector[] _mapCoords(float[] coords) {
        if (coords.length % 2 != 0) {
            // TODO Create error for missing pairs.
        }
        vertices = new PVector[int(coords.length / 2)];
        for (int i = 0; i < vertices.length; i++) {
            float x = coords[i + (i * 1)];
            float y = coords[i + (i * 1) + 1];
            vertices[i] = new PVector(x, y);
        }
        return vertices;
    }
    
    PVector[] vertices() {
        PVector[] verts_ = new PVector[vertices.length];
        for (int i = 0; i < vertices.length; i++) {
            verts_[i] = vertices[i].copy();
        }
        return verts_;
    }
    
    void display() {
        stroke(255,0,0); fill(255,0,0,25);
        beginShape();
        for (PVector v : vertices) {
            vertex(v.x, v.y);
        }
        vertex(vertices[0].x, vertices[0].y);
        endShape();
    }
}