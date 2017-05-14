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

void setup() {
    size(400, 400);
}

void draw() {
    background(50);
    
    ball.update();
    ball.display();
    ball.checkBoundaryCollision();
}