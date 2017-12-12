//Import processing for each class, so it can store a reference to the app
import processing.core.*;
//Describes what all Balls should do.
interface BallInterface {
    //Getters and Setters
    abstract PVector getPos();
    abstract void setPos(PVector pos);
    //Ball methods
    abstract void update();
    abstract void drawMe();
}
