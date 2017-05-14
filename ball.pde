/*

    ball.pde
    
    Authors: Aaron Clarke,
             Wai Ho Vong,
             Robert Woods <hi@robertwoods.me>,
             Joshua Wright

    URL:     https://github.com/rjww/minigolf
    
    Class for ball collision physics. Currently checks for boundary collisions,
    but I will create a separate class for static environmental objects and
    add detection for those too.
    
    Useful resources:
    
    *  http://www.jeffreythompson.org/collision-detection
    *  https://processing.org/examples/circlecollision.html
    
    TODO Fix corner collisions. May need more special cases based on direction
    of ball.

*/

class Ball {
    PVector position;
    PVector velocity;
    float radius, m;
    float friction = 0;
    
    Ball(float x, float y, float r_) {
        position = new PVector(x, y);
        velocity = PVector.random2D();
        velocity.mult(3);
        radius = r_;
    }
    
    void update() {
        position.add(velocity);
        if (velocity.x > 0) {
            velocity.x -= friction;
        } else if (velocity.x < 0) {
            velocity.x += friction;
        }
        if (velocity.y > 0) {
            velocity.y -= friction;
        } else if (velocity.y < 0) {
            velocity.y += friction;
        }
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
    
    void checkObjectCollision(Object obj) {
        float x1 = obj.vertices()[0].x;
        float y1 = obj.vertices()[0].y;
        float x2 = obj.vertices()[2].x;
        float y2 = obj.vertices()[2].y;
        
        float bx = position.x;
        float by = position.y;
            
        if (bx + radius == x1 && by + radius == y1) {
            position.x = x1;
            position.y = y1;
            velocity.x *= -1;
            velocity.y *= -1;
        }
        if (bx + radius == x1 && by - radius == y2) {
            position.x = x1;
            position.y = y2;
            velocity.x *= -1;
            velocity.y *= -1;
        }
        if (bx - radius == x2 && by + radius == y1) {
            position.x = x2;
            position.y = y1;
            velocity.x *= -1;
            velocity.y *= -1;
        }
        if (bx - radius == x2 && by - radius == y2) {
            position.x = x2;
            position.y = y2;
            velocity.x *= -1;
            velocity.y *= -1;
        }
        if (bx < x1) {
            if (bx + radius > x1 && by + radius > y1 && by - radius < y2) {
                position.x = x1 - radius;
                velocity.x *= -1;
            }
        } else if (bx > x2) {
            if (bx - radius < x2 && by + radius > y1 && by - radius < y2) {
                position.x = x2 + radius;
                velocity.x *= -1;
            }
        }
        if (by < y1) {
            if (by + radius > y1 && bx + radius > x1 && bx - radius < x2) {
                position.y = y1 - radius;
                velocity.y *= -1;
            }
        } else if (by > y2) {
            if (by - radius < y2 && bx + radius > x1 && bx - radius < x2) {
                position.y = y2 + radius;
                velocity.y *= -1;
            }
        }
    }
    
    void display() {
        noStroke();
        fill(200);
        ellipse(position.x, position.y, 2 * radius, 2 * radius);
    }
}