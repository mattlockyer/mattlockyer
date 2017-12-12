import processing.core.*; 
import processing.xml.*; 

import processing.pdf.*; 

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

public class smartGrids extends PApplet {

// P_2_3_6_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * draw tool. draws a specific module according to 
 * its east, south, west and north neighbours. 
 * 
 * MOUSE
 * drag left           : draw new module
 * drag right          : delete a module
 * 
 * KEYS
 * del, backspace      : clear screen
 * g                   : toogle. show grid
 * d                   : toogle. show module values
 * s                   : save png
 * p                   : save pdf
 */
 
 /*
 * Modifications by Matt Lockyer
 * http://mattlockyer.com + http://multimediaprogramming.org
 * 
 * Changed name to smartGrids.pde
 * Added Tile object to store position and value
 * + drawGrid method for debugging
 * + drawModule method to encapsulte some of the logic
 * + randomize method for fun
 * 
 * KEYS
 * r                  : randomMode
 * 
 * Motivation: turn the example from pure procedural to object oriented.
 */


boolean savePDF = false;

PFont font;
PShape[] modules;

float tileSize = 60;
int gridResolutionX, gridResolutionY;

Tile[][] tiles;

boolean drawGrid = true;
boolean debugMode = false;
boolean randomMode = false;
int randomSpeed = 2;

public void setup() {
  // use full screen size 
  //size(screen.width, screen.height);
  size(840, 540);
  smooth();
  cursor(CROSS);
  font = createFont("sans-serif", 8);
  textFont(font, 20);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  shapeMode(CENTER);

  gridResolutionX = round(width/tileSize)+2;
  gridResolutionY = round(height/tileSize)+2;

  tiles = new Tile[gridResolutionX][gridResolutionY];
  initTiles();


  // load svg modules
  modules = new PShape[16]; 
  for (int i=0; i< modules.length; i++) { 
    modules[i] = loadShape(nf(i, 2)+".svg");
  }
}


public void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  background(255);

  if (mousePressed && (mouseButton == LEFT)) setTile();
  if (mousePressed && (mouseButton == RIGHT)) unsetTile();

  if (drawGrid) drawGrid();
  
  drawModules();

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}


public void initTiles() {
  for (int gridY=0; gridY< gridResolutionY; gridY++) {
    for (int gridX=0; gridX< gridResolutionX; gridX++) {  
      float posX = tileSize*gridX - tileSize/2;
      float posY = tileSize*gridY - tileSize/2;
      tiles[gridX][gridY] = new Tile( new PVector(posX, posY) );
    }
  }
}


public void setTile() {
  // convert mouse position to grid coordinates
  int gridX = floor((float)mouseX/tileSize) + 1;
  gridX = constrain(gridX, 1, gridResolutionX-2);
  int gridY = floor((float)mouseY/tileSize) + 1;
  gridY = constrain(gridY, 1, gridResolutionY-2);
  tiles[gridX][gridY].value = '1';
}

public void unsetTile() {
  int gridX = floor((float)mouseX/tileSize) + 1;
  gridX = constrain(gridX, 1, gridResolutionX-2);
  int gridY = floor((float)mouseY/tileSize) + 1;
  gridY = constrain(gridY, 1, gridResolutionY-2);
  tiles[gridX][gridY].value = '0';
}

public void drawGrid() {
  for (int gridY=0; gridY< gridResolutionY; gridY++) {
    for (int gridX=0; gridX< gridResolutionX; gridX++) {  
      tiles[gridX][gridY].drawGrid();
    }
  }
}

public void drawModules() {
  for (int gridY=1; gridY< gridResolutionY-1; gridY++) {  
    for (int gridX=1; gridX< gridResolutionX-1; gridX++) { 
      //get current tile
      Tile tile = tiles[gridX][gridY];
      //randomize value
      if (randomMode) {
        tile.randomize(); 
      }
      // use only active tiles
      if (tile.value == '1') {
        // check the four neighbours, each can be 0 or 1
        String east = str(tiles[gridX+1][gridY].value);
        String south = str(tiles[gridX][gridY+1].value);
        String west = str(tiles[gridX-1][gridY].value);
        String north = str(tiles[gridX][gridY-1].value);
        // create a binary result out of it, eg. 1011
        String binaryResult = north + west + south + east;
        
        tile.drawModule(binaryResult);
      }
    }
  }
}

public void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;

  if (key == DELETE || key == BACKSPACE) initTiles();
  if (key == 'g' || key == 'G') drawGrid = !drawGrid;
  if (key == 'd' || key == 'D') debugMode = !debugMode;
  if (key == 'r' || key == 'R') randomMode = !randomMode;
}


// timestamp
public String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

class Tile {
  PVector pos;
  char value;

  Tile(PVector pos) {
    this.pos = pos;
    value = '0';
  }

  public void drawGrid() {
    stroke(220);
    noFill();
    pushMatrix();
    translate(pos.x, pos.y);
    rect(0, 0, tileSize, tileSize);
    popMatrix();
  }
  
  public void randomize() {
    if (random(100) < randomSpeed) {
      if (random(1) < 0.5f) {
        value = '0';
      } else {
        value = '1';
      }
    }
  }

  public void drawModule(String binaryResult) {
    // convert the binary string to a decimal value from 0-15
    int decimalResult = unbinary(binaryResult);
    // decimalResult is the also the index for the shape array
    shape(modules[decimalResult], pos.x, pos.y, tileSize, tileSize);

    if (debugMode) {
      fill(255, 192);
      rect(pos.x, pos.y, tileSize, tileSize);
      fill(0);
      text(decimalResult+"\n"+binaryResult, pos.x, pos.y);
    }
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#D4D0C8", "smartGrids" });
  }
}
