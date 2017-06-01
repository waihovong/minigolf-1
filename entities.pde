/*

    entities.pde
    
    URL: https://github.com/rjww/minigolf

*/

class Ball {
    PVector position, velocity;
    float radius;
    
    Ball(float x, float y, float r_) {
        position = new PVector(x, y);
        velocity = new PVector(0, 0);
        velocity.mult(8);
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
        noStroke(); fill(255);
        ellipse(position.x, position.y, 2 * radius, 2 * radius);
    }
}

class Obstacle {
    PVector[] vertices;

    Obstacle(float... coords) {
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

boolean PUTTER_ACTIVE = false;

class Putter extends Obstacle {
    PVector position = new PVector(0,0);
    PVector prev_pos = position.copy();
    PVector velocity;
    float radius = 10;
    
    Putter() {
        update();
    }
    
    float radius() {
        return radius;
    }
    
    PVector getPos() {
        return position.copy();
    }
    
    PVector getVel() {
        return velocity.copy();
    }
    
    void update() {
        position.x = mouseX;
        position.y = mouseY;
        velocity = PVector.sub(position, prev_pos);
        prev_pos = position.copy();
    }
    
    void display() {
        noStroke();
        if   (PUTTER_ACTIVE) { fill(200,200,200); }
        else                 { fill(200,200,200,50); }
        ellipse(position.x, position.y, 2 * radius, 2 * radius);
    }
}