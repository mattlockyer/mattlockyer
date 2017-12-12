import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 



public class objectsJavaExample extends PApplet {

  ArrayList<Ball> ballList = new ArrayList<Ball>();
  
  public void setup() {
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
  
  public void keyPressed() {
    if (key == ' ') {
       ballList.get(0).setFill( new PVector( (int) random(255),  (int) random(255),  (int) random(255) ) );
    }
  }
  
  public void draw() {
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


