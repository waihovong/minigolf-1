/*

    ball.pde
    
    Author: Robert Woods <hi@robertwoods.me>
    URL:    https://github.com/rjww/minigolf
    
    Class for ball collision physics. Currently checks for boundary collisions,
    but I will create a separate class for static environmental objects and
    add detection for those too.
    
    Useful resources:
    
    *  http://www.jeffreythompson.org/collision-detection
    *  https://processing.org/examples/circlecollision.html

*/

class Ball {
    PVector position;
    PVector velocity;
    
    float radius, m;
    
    Ball(float x, float y, float r_) {
        position = new PVector(x, y);
        velocity = PVector.random2D();
        velocity.mult(3);
        radius = r_;
        m = .1 * radius;
    }
    
    void update() {
        position.add(velocity);
    }
    
    void checkBoundaryCollision() {
        if (position.x > width - radius) {
            position.x = width - radius;
            velocity.x *= -1;
        } else if (position.x < radius) {
            position.x = radius;
            velocity.x *= -1;
        } else if (position.y  > height - radius) {
            position.y = height - radius;
            velocity.y *= -1;
        } else if (position.y < radius) {
            position.y = radius;
            velocity.y *= -1;
        }
    }
    
    void display() {
        noStroke();
        fill(200);
        ellipse(position.x, position.y, 2 * radius, 2 * radius);
    }
}