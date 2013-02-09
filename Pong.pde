int size = 15;       // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 3.8;  // Speed of the shape
float yspeed = 3.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

int userPt = 0;  // User points
int compPt = 0;  // Comp points

int paddle_width = 10;
int paddle_height = 50;
int dist_wall = 15;
float paddle_y=0;

void setup() 
{
  size(440, 200);
  noStroke();
  frameRate(30);
  smooth();
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(102);
  
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Constrain paddle to screen
  paddle_y = constrain(paddle_y, 0, height-paddle_height);
  
  //if ball pass the paddle
  if ( xpos > width) {
    compPt += 10;
    println("User Score: " + userPt + " Comp Score: " + compPt);
    xpos=0;
    ypos=height/2;
  }
  
  // If ball hits paddle or back wall, reverse direction
  if(xpos > width-size-dist_wall && ypos > paddle_y && ypos < paddle_y+paddle_height) {
    userPt += 10;
    println("User Score: " + userPt + " Comp Score: " + compPt);
    xdirection *= -1;
  }
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if ( xpos < 0) {
    xdirection *= -1;
  }
  if (ypos > height-size || ypos < 0) {
    ydirection *= -1;
  }

  // Draw the shape
  fill(255);
  ellipse(xpos+size/2, ypos+size/2, size, size);
  
  fill(0);
  rect(width-dist_wall, paddle_y, paddle_width, paddle_height); 
}

void keyPressed(){
  switch(keyCode){
    case UP:
      paddle_y=paddle_y-20;
      break;
    case DOWN:
      paddle_y=paddle_y+20;
      break;
  }
}
