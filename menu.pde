PImage[] MENU_IMGS = new PImage[12];
int MENU_HOVER = 0, MENU_BG_X = 0;
int[][] MENU_ITEMS_POS = {{540,500, 748,544}, {792,500, 1004,544}, {1036,500, 1248,544},
                          {540,570, 748,614}, {792,570, 1004,614}, {1036,570, 1248,614},
                          {540,640, 748,684}, {792,640, 1004,684}, {1036,640, 1248,684},
                          { 46,640, 278,684}};

void loadMenuImages() {
    MENU_IMGS[0] = loadImage("assets/images/menu.png");
    for (int i = 1; i <= MENU_ITEMS_POS.length; i++) {
        MENU_IMGS[i] = loadImage("assets/images/menu-hover-" + i + ".png");
    }
    MENU_IMGS[11] = loadImage("assets/images/menu-bg.png");
}

void returnToMenu() {
    SCORE = new int[9];
    LEVEL = 0;
}

void updateMenu() {
    for (int i = 0; i < MENU_ITEMS_POS.length; i++) {
        int[] m = MENU_ITEMS_POS[i];
        if (m[0] < mouseX && mouseX < m[2] && m[1] < mouseY && mouseY < m[3]) {
            MENU_HOVER = i + 1;
            break;
        } else {
            MENU_HOVER = 0;
        }
    }
}

void drawMenu() {
    image(MENU_IMGS[11], MENU_BG_X, 0);
    image(MENU_IMGS[0], 0, 0);
    if (MENU_HOVER > 0) {
        image(MENU_IMGS[MENU_HOVER], 0, 0);
    }
    MENU_BG_X--;
    if (MENU_BG_X == -MENU_IMGS[11].width + width) {
        MENU_BG_X = 0;
    }
}