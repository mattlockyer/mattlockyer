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
  //Complex Shapes
  //Points
  stroke(255, 0, 0);
  strokeWeight(16);
  beginShape(POINTS);
  vertex(40, 40);
  vertex(40, 80);
  vertex(80, 80);
  endShape();
  fill(0);
  text("beginShape(POINTS);", 100, 60);
  
   //Lines
  stroke(255, 0, 0);
  strokeWeight(4);
  beginShape(LINES);
  vertex(40, 100);
  vertex(40, 140);
  vertex(80, 140);
  endShape();
  fill(0);
  text("beginShape(LINES);", 100, 120);
  
   //Triangles
  stroke(255, 0, 0);
  strokeWeight(4);
  fill(255, 0, 0, 128);
  beginShape(TRIANGLES);
  vertex(40, 160);
  vertex(40, 200);
  vertex(80, 200);
  endShape();
  fill(0);
  text("beginShape(TRIANGLES);", 100, 180);
  
   //Polygon
  stroke(255, 0, 0);
  strokeWeight(4);
  fill(255, 0, 0, 128);
  beginShape(POLYGON);
  vertex(40, 220);
  vertex(40, 260);
  vertex(80, 260);
  endShape();
  fill(0);
  text("beginShape(POLYGON);", 100, 240);
  
     //Polygon
  stroke(255, 0, 0);
  strokeWeight(4);
  fill(255, 0, 0, 128);
  beginShape();
  vertex(40, 280);
  vertex(40, 320);
  vertex(80, 320);
  endShape(CLOSE);
  fill(0);
  text("beginShape();", 100, 300);
  text("endShape(CLOSE);", 100, 340);
  */
  
  /*
  //Plotting Verticies
  stroke(255, 0, 0);
  strokeWeight(4);
  fill(255, 0, 0, 128);
  beginShape();
  
  vertex(200, 40);
  
  vertex(140, 120);
  vertex(40, 120);
  vertex(140, 180);
  vertex(40, 300);
  
  vertex(200, 220);
 
  vertex(360, 300);
  vertex(260, 180);
  vertex(360, 120);
  vertex(260, 120);
  
  endShape(CLOSE);
  
  //Points
  stroke(255, 0, 0);
  strokeWeight(16);
  fill(255, 0, 0, 128);
  beginShape(POINTS);
  vertex(200, 40);
  vertex(140, 120);
  vertex(40, 120);
  vertex(140, 180);
  vertex(40, 300);
  vertex(200, 220);
  vertex(360, 300);
  vertex(260, 180);
  vertex(360, 120);
  vertex(260, 120);
  endShape();
  */
  
  //Curved Verticies
  curveTightness(5);
  stroke(255, 0, 0);
  strokeWeight(4);
  fill(255, 0, 0, 128);
  beginShape();
  
  curveVertex(140, 120);
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
  
  curveVertex(200, 40);
  curveVertex(260, 120);
 
  endShape();
  
  //Points
  stroke(255, 0, 0);
  strokeWeight(16);
  fill(255, 0, 0, 128);
  beginShape(POINTS);
  vertex(200, 40);
  vertex(140, 120);
  vertex(40, 120);
  vertex(140, 180);
  vertex(40, 300);
  vertex(200, 220);
  vertex(360, 300);
  vertex(260, 180);
  vertex(360, 120);
  vertex(260, 120);
  endShape();
}

void keyPressed() {
  if (key == 's') {
    save("example" + frameCount + ".png");
  }
}

