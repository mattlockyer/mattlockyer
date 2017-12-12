//Import processing for each class, so it can store a reference to the app
import processing.core.*;
//A class to describe a ball object
public class Ball implements BallInterface, AttractionInterface {
  //Store a static reference to the app, the same, but available to each Ball object
  private static PApplet app;
  //Store a static PVector to represent fillColor (shared by all Ball objects)
  private static PVector fillColor;
  //private access modifiers will help protect the fields of our objects
  private float xPos, yPos, xVel, yVel;
  //The constructor with a parameter of type PApplet
  Ball(PApplet app) {
    //Store the reference to the current PApplet
    this.app = app;
    fillColor = new PVector();
    //Set the initial values for our Ball object's variables (fields)
    xPos = app.random(16, app.width - 16);
    yPos = app.random(16, app.height - 16);
    xVel = app.random(-2, 2);
    yVel = app.random(-2, 2);
  }
  //public getter and setter for all Ball objects
  public PVector getPos() {
    return new PVector(xPos, yPos);
  }
  public void setPos(PVector pos) {
    xPos = pos.x;
    yPos = pos.y;
  }
  //A public static method to set the fillColor (static) for all Ball objects
  public static void setFill(PVector fC) {
    fillColor = fC;
  }
  //A public method to update the ball position
  public void update() {
    dampenVel(0.99);
    
    xPos += xVel;
    yPos += yVel;
    
    checkWalls();
  }
  //A public method to attract this ball to the mouse
  public void mouseAttract() {
    xVel += (app.mouseX - xPos) / app.width;
    yVel += (app.mouseY - yPos) / app.height;
    dampenVel(0.96);
  }
   //A public method to draw the ball object
  public void drawMe() {
    app.fill(fillColor.x, fillColor.y, fillColor.z);
    app.pushMatrix();
    app.translate(xPos, yPos);
    app.ellipse(0, 0, 32, 32);
    app.popMatrix();
  }
  //A private method to dampen the veloctiy
  private void dampenVel(double d) {
    xVel *= d;
    yVel *= d;
  }
  //A private method to check collisions with the walls
  private void checkWalls() {
    if (Math.abs(xPos - app.width/2) > app.width/2 - 16) {
      xVel *= -1;
    }
    if (Math.abs(yPos - app.height/2) > app.height/2 - 16) {
      yVel *= -1;
    }
  }
}
