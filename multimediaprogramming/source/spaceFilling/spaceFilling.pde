ArrayList<Circle> circles = new ArrayList<Circle>();

int mouseRect = 30;
int maxRadius = 50;
int minRadius = 4;

void setup() {
  size(900, 600);
  smooth();
  //add the first circle
  circles.add( new Circle( 0, 0, new PVector( random(width), random(height), random(20, 100) ) ) );
}
void draw() {
  background(255);
  //random new position
  Circle newCircle = new Circle(circles.size(), circles.size(),  new PVector(
  random(0+maxRadius, width-maxRadius), 
  random(0+maxRadius, height-maxRadius), minRadius) );
  //if the mouse is pressed put the new circle here
  if (mousePressed == true) {
    newCircle.props.x = random(mouseX-mouseRect/2, mouseX+mouseRect/2);
    newCircle.props.y = random(mouseY-mouseRect/2, mouseY+mouseRect/2);
    newCircle.props.z = 1;
  }
  //find out if new circle intersects with one of the others
  boolean intersection = false;
  for (int i=0; i < circles.size(); i++) {
    Circle current = circles.get(i);
    intersection = current.hasIntersectionWith( newCircle );
    if (intersection) {
      break; //stop looping if we've already hit another circle
    }
  }
  //if there's no intersection, find the closest neighbor
  if (!intersection) {
    newCircle.props.z = width;
    for (int i=0; i < circles.size(); i++) {
      Circle current = circles.get(i);
      newCircle.findClosestNeighbor( current );
    }
    //make sure we're not too big
    if (newCircle.props.z > maxRadius) newCircle.props.z = maxRadius;
    //add the new circle
    circles.add( newCircle );
  }
  //draw circles
  for (int i=0; i < circles.size(); i++) {
    Circle current = circles.get(i);
    current.drawCircle();
  }
  //draw lines
  for (int i=0; i < circles.size(); i++) {
    Circle current = circles.get(i);
    current.drawLine();
  }
}
//a circle class to store our info
class Circle {
  int id;
  int neighbor;
  PVector props;
  color c;
  Circle(int id, int neighbor, PVector props) {
    this.id = id;
    this.neighbor = neighbor;
    this. props = props;
    c = color(0, random(128), random(128, 255), 64);
  }
  //checks intersection returns true or false
  boolean hasIntersectionWith(Circle other) {
    float distance = dist(other.props.x, other.props.y, props.x, props.y);
    if (distance < (other.props.z + props.z)) { 
      return true;
    }
    return false;
  }
  //finds the closest neighbor
  void findClosestNeighbor(Circle other) {
    float distance = dist(other.props.x, other.props.y, props.x, props.y);
    if (props.z > distance - other.props.z) {
      props.z = distance - other.props.z;
      neighbor = other.id;
    }
  }
  void drawCircle() {
    fill(c);
    noStroke();
    pushMatrix();
    translate(props.x, props.y);
    ellipse(0, 0, props.z * 2, props.z * 2);
    popMatrix();
  }
  void drawLine() {
    strokeWeight(2);
    stroke(220);
    line(props.x, props.y, circles.get(neighbor).props.x, circles.get(neighbor).props.y);
  }
}
void keyPressed() {
  if (key == 's') {
    save("frame" + frameCount + ".png");
  }
}

