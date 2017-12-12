PFont font;

void setup() {
  size(400, 400);
  font = loadFont("Courier24.vlw");
  textFont(font);
}

void draw() {
  background(255);
  //smooth();
  strokeWeight(2);
  for(int i = 0; i < 400; i += 20) {
    if (i != 0) {
      if (i == 200) {
        stroke(0, 128);
      } 
      else {
        stroke(0, 64);
      }
      line(i, 0, i, 400);
      line(0, i, 400, i);
    }
  }
  
  //Accidentaly saved over these
}

void keyPressed() {
  if (key == 's') {
    save("example" + frameCount + ".png");
  }
}

