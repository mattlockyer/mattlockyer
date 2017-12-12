Bicycle myBike;

void setup() {
  size(400, 75);
  background(255);

  // create a bike
  myBike = new Bicycle();
}

void draw() {
  background(255);
  noStroke();
  
  //draw sky
  fill(0, 159, 255);
  rectMode(CORNER);
  rect(0, 0, 400, 60);

  // draw grass
  fill(9, 118, 0);
  rect(0, 60, 400, 15);

  // draw and move the bike.
  myBike.draw();
  myBike.moveRight();
}

class Bicycle {
  int xPos; // x-position
  int yPos; // y-position
  float spokeRotation; // spoke rotation

  Bicycle() {
    xPos = 10;
    yPos = 50;
  }

  void draw() {
    pushMatrix();
    
    // move the bike
    translate(xPos, yPos);

    //draw wheels
    noFill();
    stroke(0);
    ellipse(0, 0, 40, 40);
    ellipse(70, 0, 40, 40);

    // draw frame
    line(0, 0, 30, -25); 
    line(0, 0, 30, -5);
    line(30, -5, 65, -25);
    line(30, -25, 65, -25);

    // draw seat post 
    line(30, -5, 30, -30);
    // draw seat
    noFill();
    rectMode(CENTER);
    rect(30, -30, 10, 3);

    // draw forks
    line(70, 0, 60, -40);
    //draw handle bars
    line(60, -40, 45, -45);
    line(60, -40, 45, -40);

    popMatrix();
  }

  void moveRight() {
    // check to see if the bike is still on screen
    // return to the left of the screen
    if (xPos > width) {
      xPos = 10;
    }
    else {  
      xPos = xPos + 2;
    }
  }
}
