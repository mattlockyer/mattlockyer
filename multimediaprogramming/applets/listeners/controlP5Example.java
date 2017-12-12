import processing.core.*; 
import processing.xml.*; 

import controlP5.*; 

import controlP5.*; 

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

public class controlP5Example extends PApplet {

    // import controlP5 library
ControlP5 controlP5;   // controlP5 object

float leafRed = 255, leafGreen = 64, leafBlue = 0,
      branchRandom = PI/4, leafRandom = 16, leafSize = 16, startSize = 64;

public void setup() {
  size(800, 600);
  background(255);

  //Local variables to set where the components will be
  int margin = 16;
  int spacing = 36;
  int w = 128;
  int h = 32;
  
  //Initialize ControlP5
  controlP5 = new ControlP5(this);
  //Set the color of the labels
  controlP5.setColorLabel(color(255, 0, 0));
  
  //Add components
  controlP5.addButton("Clear Screen", 1, margin, spacing, w, h);
  controlP5.addSlider("Leaf Red", 0, 255, 255, margin, spacing * 2, w, h);
  controlP5.addSlider("Leaf Green", 0, 255, 64, margin, spacing * 3, w, h);
  controlP5.addSlider("Leaf Blue", 0, 255, 0, margin, spacing * 4, w, h);
  controlP5.addSlider("Branch Random", 0, PI, PI/4, margin, spacing * 5, w, h);
  controlP5.addSlider("Leaf Random", 0, 32, 16, margin, spacing * 6, w, h);
  controlP5.addSlider("Leaf Size", 0, 32, 16, margin, spacing * 7, w, h);
  controlP5.addSlider("Start Size", 0, 128, 64, margin, spacing * 8, w, h);
}
public void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {
    if (theEvent.controller().name()=="Clear Screen") {
      background(255);
    }
    if (theEvent.controller().name()=="Leaf Red") {
      leafRed = theEvent.controller().value();
    }
    if (theEvent.controller().name()=="Leaf Blue") {
      leafBlue = theEvent.controller().value();
    }
    if (theEvent.controller().name()=="Leaf Green") {
      leafGreen = theEvent.controller().value();
    }
    if (theEvent.controller().name()=="Branch Random") {
      branchRandom = theEvent.controller().value();
    }
    if (theEvent.controller().name()=="Leaf Random") {
      leafRandom = theEvent.controller().value();
    }
    if (theEvent.controller().name()=="Leaf Size") {
      leafSize = theEvent.controller().value();
    }
    if (theEvent.controller().name()=="Start Size") {
      startSize = theEvent.controller().value();
    }
  }
}
public void mousePressed() {
  if (mouseX > 144) { 
    drawBranch(mouseX, mouseY, mouseX, mouseY, -PI/2, startSize);
  }
}
public void keyPressed() {
  if (key == ' ') {
    background(255);
  }
}
//we won't be using the draw method
//however it must exist so we can have events
public void draw() {
}
//the recursive definition of a branch
public void drawBranch(float x, float y, 
float px, float py, 
float angle, float step) 
{
  //base case, we won't do anything if the
  //branch step size is less than 2
  if (step < 2) {
    for (int i = 0; i < 8; i++) {
      noStroke();
      fill(random(leafRed), random(leafGreen), random(leafBlue), 16);
      ellipse(x + random(-leafRandom, leafRandom), y + random(-leafRandom, leafRandom), leafSize, leafSize);
    }
  } 
  else {
    //store px and py
    px = x;
    py = y;
    //move the x,y
    x += step * cos(angle);
    y += step * sin(angle);
    //shrink the step size
    step *= 0.66f;
    //store the current mouseX in the window as
    //a float between 0-1
    float xMouse = (float)mouseX/width;
    //make two recursive calls to the drawBranch method
    //notice one adds the angle, and one subtracts the angle
    drawBranch(x, y, px, py, angle + PI/4 + random(-branchRandom, branchRandom), step);
    drawBranch(x, y, px, py, angle - PI/4 + random(-branchRandom, branchRandom), step);
  }
  //we'll wait to draw our branches until after
  //we've made all the recursive method calls
  stroke(0);
  strokeWeight( max( 1, (int) step/5 ) );
  line(x, y, px, py);
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#D4D0C8", "controlP5Example" });
  }
}
