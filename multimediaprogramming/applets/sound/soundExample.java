import processing.core.*; 
import processing.xml.*; 

import ddf.minim.analysis.*; 
import ddf.minim.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class soundExample extends PApplet {




Minim minim;
AudioPlayer song;
FFT fft;
int pos;

public void setup()
{
  size(512, 512);
  noStroke();
  minim = new Minim(this);
  song = minim.loadFile("schubert.mp3", 1024);
  fft = new FFT(song.bufferSize(), song.sampleRate());
}
public void mousePressed() {
  if (song.isPlaying()) {
    song.pause();
    pos = song.position();
  } else {
    song.loop();
    song.cue(pos);
  }
}
public void draw()
{
  background(255);
  fft.forward(song.mix);
  if (song.isPlaying()) {
    fill(0, 64);
    for (int i = 0; i < fft.specSize(); i++)
    {
      rect(i*2, height - fft.getBand(i)*i * 4, 4, fft.getBand(i)*i * 4  );
    }
  } else {
    fill(0);
    text("Click to play", 128, 256);
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#D4D0C8", "soundExample" });
  }
}
