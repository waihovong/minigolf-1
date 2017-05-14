//Ball Collision with walls

int ballSize = 10;
float xpos, ypos; 

float xspeed = 2.1;
float yspeed = 2.1;

int xdirc = 1;
int ydirc = 1;

void setup(){
  size(500,500);
  noStroke();
  frameRate(60);
  ellipseMode(RADIUS);
  xpos = width/3;
  ypos = height/2;
}

void draw(){
  background(0,100,0);
  
  xpos = xpos + (xspeed*xdirc*2);
  ypos = ypos + (yspeed*ydirc);
  
  if (xpos > width-ballSize || xpos < ballSize){
    xdirc *= -1;
  }
  if (ypos > height-ballSize || ypos < ballSize){
    ydirc *= -1;
    
}
    ellipse(xpos,ypos,ballSize,ballSize);

}