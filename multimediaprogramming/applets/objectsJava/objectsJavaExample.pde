public class objectsJavaExample extends PApplet {

  ArrayList<Ball> ballList = new ArrayList<Ball>();
  
  void setup() {
    size(600, 400);
    stroke(0, 128);
    strokeWeight(2);
    fill(255, 0, 0, 128);
    //The ArrayList doesn't have a size yet
    //So we have to set how much we will loop literally (10)
    for (int i = 0; i < 10; i++) {
      //Add a new ball object to the ArrayList ballList
      ballList.add(new Ball(this));
    }
  }
  
  void keyPressed() {
    if (key == ' ') {
       ballList.get(0).setFill( new PVector( (int) random(255),  (int) random(255),  (int) random(255) ) );
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
      //curBall.xPos++;
      if (mousePressed) {
        curBall.mouseAttract();
      }
      curBall.update();
      curBall.drawMe();
    }
  }
}


