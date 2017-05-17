boolean VISUALIZE = false;
Ball ball;
Object poly;
Object[] borders;

void setup() {
    size(800,800); // frameRate(60);
    ball = new Ball(11, 11, 10);
    borders = new Object[4];
    borders[0] = new Object(0,0, width,0);
    borders[1] = new Object(width,0, width,height);
    borders[2] = new Object(width,height, 0,height);
    borders[3] = new Object(0,height, 0,0);
    poly = new Object(width/2 - 100, height/2 - 100,
                      width/2 + 100, height/2 - 100,
                      width/2 + 100, height/2 + 100,
                      width/2 - 100, height/2 + 100);
}

void draw() {
    background(50);
    ball.update();
    for (Object b : borders) {
        checkLineCollision(ball, b.vertices()[0], b.vertices()[1]);
    }
    poly.display();
    checkPolygonCollision(ball, poly);
    ball.display();
}