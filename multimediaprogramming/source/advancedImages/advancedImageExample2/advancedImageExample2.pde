PImage img;
int channel = 0;
int hTiles = 48;
int vTiles = 16;
Tile[][] tiles = new Tile[hTiles][vTiles];
float tileWidth, tileHeight;

void setup() {
  size(425, 360);
  background(255);
  smooth();
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
      if (channel > 3) channel = 0;
    } else if (keyCode == DOWN) {
      channel--;
      if (channel < 0) channel = 3;
    }
  }
}

void draw() {
  background(255);
  
  tint(255, 255, 255, 64);
  image(img, 0, 0);
  
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
    fill(160);
    
    pushMatrix();
    translate(pos.x, pos.y);
    
    switch (channel) {
      case 0: translate(0, red(c) / 255 * tileHeight); break;
      case 1: translate(0, green(c) / 255 * tileHeight); break;
      case 2: translate(0, blue(c) / 255 * tileHeight); break;
      case 3: translate(0, brightness(c) / 255 * tileHeight); break;
    }
    
    rect(0, 0, tileWidth, 2);
    popMatrix();
  }
}
                            
