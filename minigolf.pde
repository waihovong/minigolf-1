/*

    TODO:
    
    * Figure out equivalent to putterCollided check for Objects. 
    
*/

boolean VISUALIZE = false;
Putter putter;
Ball ball;
Object poly;
Object[] borders;

void setup() {
    size(800,800); frameRate(60);
    putter = new Putter();
    ball = new Ball(40,40, 10);
    borders = new Object[4];
    borders[0] = new Object(0,0, width,0);
    borders[1] = new Object(width,0, width,height);
    borders[2] = new Object(width,height, 0,height);
    borders[3] = new Object(0,height, 0,0);
    
    poly = new Object(.5 * width - 200, .5 * height - 200,
                      .5 * width + 200, .5 * height - 200,
                      .5 * width + 200, .5 * height + 200);
} //<>//

void draw() {
    background(50);
    ball.update();
    if (mousePressed && putter.active()) {
        checkPutterCollision(putter, ball);
    }
    for (Object b : borders) {
        checkLineCollision(ball, b.vertices()[0], b.vertices()[1]);
    }
    poly.display();
    checkPolygonCollision(ball, poly);
    ball.display();
    putter.update();
    putter.display();
}