void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  
  curveTightness( (float) (mouseX - 200) / 25 );
  stroke(255, 0, 0);
  strokeWeight(4);
  fill(255, 0, 0, 128);
  beginShape();
  //First Control Point
  curveVertex(140, 120);
  //First Point
  curveVertex(200, 40);
  
  curveVertex(140, 120);
  curveVertex(40, 120);
  curveVertex(140, 180);
  curveVertex(40, 300);
  
  curveVertex(200, 220);
 
  curveVertex(360, 300);
  curveVertex(260, 180);
  curveVertex(360, 120);
  curveVertex(260, 120);
  
  //End Point
  curveVertex(200, 40);
  //End Control Point
  curveVertex(260, 120);
 
  endShape();
}

