PFont font;

void setup() {
  size(400, 400);
  font = loadFont("Courier24.vlw");
  textFont(font);
}

void draw() {
  background(255);
  
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
  
  /*
  //Stroke
  stroke(255, 0, 0);
  strokeWeight(2);
  noFill();
  rect(40, 40, 40, 40);
  fill(0);
  text("stroke(255, 0, 0);", 100, 40);
  text("strokeWeight(2);", 100, 80);
  
  stroke(0, 255, 0);
  strokeWeight(4);
   noFill();
  rect(40, 160, 40, 40);
  fill(0);
  text("stroke(0, 255, 0);", 100, 160);
  text("strokeWeight(4);", 100, 200);
  
  stroke(0, 0, 255);
  strokeWeight(8);
   noFill();
  rect(40, 280, 40, 40);
  fill(0);
  text("stroke(0, 0, 255);", 100, 280);
  text("strokeWeight(8);", 100, 320);
  
  */
  
  /*
  //Fill
  noStroke();
  fill(255, 0, 0);
  rect(40, 40, 40, 40);
  fill(255, 0, 0, 128);
  rect(60, 60, 40, 40);
  fill(0);
  text("fill(255, 0, 0);", 100, 40);
  text("fill(255,0,0,128);", 120, 80);
  
  noStroke();
  fill(0, 255, 0);
  rect(40, 160, 40, 40);
  fill(0, 255, 0, 128);
  rect(60, 180, 40, 40);
  fill(0);
  text("fill(0, 255, 0);", 100, 160);
  text("fill(0,255,0,128);", 120, 200);
  
  noStroke();
  fill(0, 0, 255);
  rect(40, 280, 40, 40);
  fill(0, 0, 255, 128);
  rect(60, 300, 40, 40);
  fill(0);
  text("fill(0, 0, 255);", 100, 280);
  text("fill(0,0,255,128);", 120, 320);
  */
  
  /*
  //Color
  noStroke();
  fill(255, 0, 0);
  rect(40, 40, 40, 40);
  fill(255, 255, 0);
  rect(60, 60, 40, 40);
  fill(0);
  text("fill(255, 0, 0);", 100, 40);
  text("fill(255, 255, 0);", 120, 80);
  
  noStroke();
  fill(0, 255, 0);
  rect(40, 160, 40, 40);
  fill(0, 255, 255);
  rect(60, 180, 40, 40);
  fill(0);
  text("fill(0, 255, 0);", 100, 160);
  text("fill(0, 255, 255);", 120, 200);
  
  noStroke();
  fill(0, 0, 255);
  rect(40, 280, 40, 40);
  fill(255, 0, 255);
  rect(60, 300, 40, 40);
  fill(0);
  text("fill(0, 0, 255);", 100, 280);
  text("fill(255,0,255);", 120, 320);
  */
  
  //Other Color
  //Color
  noStroke();
  fill(255, 0, 0);
  rect(40, 40, 40, 40);
  fill(0);
  text("fill(255, 0, 0);", 100, 40);
  
  colorMode(RGB, 100);
  noStroke();
  fill(100, 0, 0);
  rect(40, 160, 40, 40);
  fill(0);
  text("colorMode(RGB, 100);", 100, 160);
  text("fill(100, 0, 0);", 120, 200);
  
  colorMode(HSB, 100);
  noStroke();
  fill(100, 100, 100);
  rect(40, 280, 40, 40);
  fill(0);
  text("colorMode(HSB, 100);", 100, 280);
  text("fill(100, 100, 100);", 120, 320);
  colorMode(RGB, 255);
}

void keyPressed() {
  if (key == 's') {
    save("example" + frameCount + ".png");
  }
}

