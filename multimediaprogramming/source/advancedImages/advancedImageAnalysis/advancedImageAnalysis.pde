PImage img;
int channel = 0;
int hTiles = 32;
int vTiles = 32;
Tile[][] tiles = new Tile[hTiles][vTiles];
float tileWidth, tileHeight;

void setup() {
  size(425, 360);
  background(255);
  noStroke();
  rectMode(CENTER);
  img = loadImage("cat.jpg");
  
  tileWidth = (float) width/hTiles;
  tileHeight = (float) height/vTiles;
  
  for (int i = 0; i < hTiles; i++) {
    for (int j = 0; j < vTiles; j++) {
      tiles[i][j] = new Tile( new PVector(i * tileWidth + tileWidth/2, j * tileHeight + tileHeight/2) );
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      channel++;
      if (channel > 2) channel = 0;
    } else if (keyCode == DOWN) {
      channel--;
      if (channel < 0) channel = 2;
    }
  }
}

void draw() {
  background(255);
  
  for (int i = 0; i < hTiles; i++) {
    for (int j = 0; j < vTiles; j++) {
      tiles[i][j].drawMe();
    }
  }
}

class Tile {
  PVector pos;
  Tile(PVector pos) {
    this.pos = pos;
  }
  void drawMe() {
    color c =  img.get( (int) pos.x, (int) pos.y );
    fill(128);
    
    pushMatrix();
    translate(pos.x, pos.y);
    
    switch (channel) {
      case 0: scale(red(c) / 255); break;
      case 1: scale(green(c) / 255); break;
      case 2: scale(blue(c) / 255); break;
    }
    
    rect(0, 0, tileWidth, tileHeight);
    popMatrix();
  }
}
                            
