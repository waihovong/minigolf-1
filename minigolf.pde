/*

    minigolf.pde

    Authors: Aaron Clarke,
             Wai Ho Vong,
             Robert Woods <hi@robertwoods.me>,
             Joshua Wright

    URL:     https://github.com/rjww/minigolf

    Main file of Processing sketch for minigolf game, created by the authors as
    a group project for COMP SCI 1101 Introduction to Programming in Semester 1,
    2017.

*/

Ball ball = new Ball(190, 190, 10);
Object[] objects = {
    new Object(40, 40, 80, 80),
    new Object(100, 100, 140, 140),
    new Object(200, 200, 240, 240),
    new Object(300, 300, 340, 340)    
};

void setup() {
    size(400, 400);
}

void draw() {
    background(50);
    
    for (Object obj : objects) {
        obj.display();
    }
    
    ball.update();
    ball.display();
    ball.checkBoundaryCollision();
    
    for (Object obj : objects) {
        ball.checkObjectCollision(obj);
    }
}