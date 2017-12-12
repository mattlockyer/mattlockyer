class Tile {
  PVector pos;
  char value;

  Tile(PVector pos) {
    this.pos = pos;
    value = '0';
  }

  void drawGrid() {
    stroke(220);
    noFill();
    pushMatrix();
    translate(pos.x, pos.y);
    rect(0, 0, tileSize, tileSize);
    popMatrix();
  }
  
  void randomize() {
    if (random(100) < randomSpeed) {
      if (random(1) < 0.5) {
        value = '0';
      } else {
        value = '1';
      }
    }
  }

  void drawModule(String binaryResult) {
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

