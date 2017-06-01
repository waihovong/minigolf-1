/*

    minigolf.pde
    
    URL: https://github.com/rjww/minigolf

*/

int LEVEL = 0;

Ball BALL;
Putter PUTTER;
PVector[][] BOUNDARIES;
Obstacle[] OBSTACLES;
PVector HOLE;

void setup() {
    size(1280,720);
    frameRate(60);
    loadMenuImages();
}

void mousePressed() {
    //if (LEVEL == 0 && MENU_HOVER != 0) {
    //}
    //if (BALL.getVel().x == 0 && BALL.getVel().y == 0) {
    //    PUTTER_ACTIVE = true;
    //}
}

void mouseReleased() {
    PUTTER_ACTIVE = false;
}

void mouseMoved() {
    if (LEVEL == 0) {
        updateMenu(); //<>//
    }
    //PUTTER.update();
}

void mouseDragged() {
    //PUTTER.update();
    //checkPutterCollision();
}

void draw() {
    background(100);
    switch(LEVEL) {
        case 0:
            drawMenu();
            break;
        case 1:
            drawLevel1();
            break;
        case 2:
            drawLevel2();
            break;
        case 3:
            drawLevel3();
            break;
        case 4:
            drawLevel4();
            break;
        case 5:
            drawLevel5();
            break;
        case 6:
            drawLevel6();
            break;
        case 7:
            drawLevel7();
            break;
        case 8:
            drawLevel8();
            break;
        case 9:
            drawLevel9();
            break;
    }
}