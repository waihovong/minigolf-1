/*

    TODO:
    
    * Figure out equivalent to putterCollided check for Objects. 
    
*/

int LEVEL = 0;

Ball ball;
Object poly;
Object[] borders;

void setup() {
    size(1280,720);
    frameRate(30);
    loadMenuImages();
}

void mousePressed() {
    if (LEVEL == 0 && MENU_HOVER != 0) {
    }
}

void mouseMoved() {
    if (LEVEL == 0) {
        updateMenu(); //<>// //<>//
    }
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