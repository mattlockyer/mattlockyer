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

import processing.pdf.*;
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

void setup() {
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


void draw() {
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


void initTiles() {
  for (int gridY=0; gridY< gridResolutionY; gridY++) {
    for (int gridX=0; gridX< gridResolutionX; gridX++) {  
      float posX = tileSize*gridX - tileSize/2;
      float posY = tileSize*gridY - tileSize/2;
      tiles[gridX][gridY] = new Tile( new PVector(posX, posY) );
    }
  }
}


void setTile() {
  // convert mouse position to grid coordinates
  int gridX = floor((float)mouseX/tileSize) + 1;
  gridX = constrain(gridX, 1, gridResolutionX-2);
  int gridY = floor((float)mouseY/tileSize) + 1;
  gridY = constrain(gridY, 1, gridResolutionY-2);
  tiles[gridX][gridY].value = '1';
}

void unsetTile() {
  int gridX = floor((float)mouseX/tileSize) + 1;
  gridX = constrain(gridX, 1, gridResolutionX-2);
  int gridY = floor((float)mouseY/tileSize) + 1;
  gridY = constrain(gridY, 1, gridResolutionY-2);
  tiles[gridX][gridY].value = '0';
}

void drawGrid() {
  for (int gridY=0; gridY< gridResolutionY; gridY++) {
    for (int gridX=0; gridX< gridResolutionX; gridX++) {  
      tiles[gridX][gridY].drawGrid();
    }
  }
}

void drawModules() {
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

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;

  if (key == DELETE || key == BACKSPACE) initTiles();
  if (key == 'g' || key == 'G') drawGrid = !drawGrid;
  if (key == 'd' || key == 'D') debugMode = !debugMode;
  if (key == 'r' || key == 'R') randomMode = !randomMode;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

