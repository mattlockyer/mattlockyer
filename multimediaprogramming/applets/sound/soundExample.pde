import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer song;
FFT fft;
int pos;

void setup()
{
  size(512, 512);
  noStroke();
  minim = new Minim(this);
  song = minim.loadFile("schubert.mp3", 1024);
  fft = new FFT(song.bufferSize(), song.sampleRate());
}
void mousePressed() {
  if (song.isPlaying()) {
    song.pause();
    pos = song.position();
  } else {
    song.loop();
    song.cue(pos);
  }
}
void draw()
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

