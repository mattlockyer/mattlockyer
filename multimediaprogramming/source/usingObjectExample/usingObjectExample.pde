ArrayList<Ball> ballList = new ArrayList<Ball>();

void setup() {
  size(400, 400);
  stroke(0, 128);
  strokeWeight(2);
  fill(255, 0, 0, 128);
  //The ArrayList doesn't have a size yet
  //So we have to set how much we will loop literally (10)
  for (int i = 0; i < 10; i++) {
    //Add a new ball object to the ArrayList ballList
    ballList.add(new Ball());
  }
}

void draw() {
  background(255);
  //Now that the ArrayList has a size we can use .size()
  //in our loop
  for (int i = 0; i < ballList.size(); i++) {
    //Get the current ball in the loop, the ball at position i
    //Notice we DON'T have to cast the reference variable
    //since the ArrayList is typed
    Ball curBall = ballList.get(i);
    curBall.update();
    curBall.checkWalls();
    curBall.drawMe();
  }
}

//A class to describe a ball object
class Ball {
  float xPos, yPos, xVel, yVel;
  Ball() {
    //Set the initial values for our Ball object's variables (fields)
    xPos = random(16, width - 16);
    yPos = random(16, height - 16);
    xVel = random(-2, 2);
    yVel = random(-2, 2);
  }
  //A method to update the ball position
  void update() {
    xPos += xVel;
    yPos += yVel;
  }
  //A method to check collisions with the walls
  void checkWalls() {
    if (abs(xPos - width/2) > 200 - 16) {
      xVel *= -1;
    }
    if (abs(yPos - height/2) > 200 - 16) {
      yVel *= -1;
    }
  }
  //A method to draw the ball object
  void drawMe() {
    pushMatrix();
    translate(curBall.xPos, curBall.yPos);
    ellipse(0, 0, 32, 32);
    popMatrix();
  }
}
