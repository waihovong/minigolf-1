/*

    object.pde
    
    Authors: Aaron Clarke,
             Wai Ho Vong,
             Robert Woods <hi@robertwoods.me>,
             Joshua Wright

    URL:     https://github.com/rjww/minigolf
    
    Class for environmental object (e.g. obstacle on hole), which is subject to
    collision detection by the Ball class.

*/

class StaticObject {
    PVector[] vertices = new PVector[4];
    
    StaticObject(float x1, float y1, float x2, float y2) {
        vertices[0] = new PVector(x1, y1);
        vertices[1] = new PVector(x2, y1);
        vertices[2] = new PVector(x2, y2);
        vertices[3] = new PVector(x1, y2);
    }
    
    PVector[] vertices() {
        return vertices;
    }
    
    int length() {
        return vertices.length;
    }
    
    void display() {
        noStroke();
        fill(255,0,0);
        beginShape();        
        for (PVector v : vertices) {
            vertex(v.x, v.y);
        }
        endShape();
    }
}
