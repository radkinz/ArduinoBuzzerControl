import processing.serial.*;
Serial port;

ArrayList<Walker> walkers = new ArrayList<Walker>();

void setup() {
  //arduino setup
  //print the available serial ports.
 // printArray(Serial.list());
  //Select port 
 // port = new Serial(this, Serial.list()[0], 9600); 

  //processing set up
  size(500, 500);
  
  //make color mode hsb so can map values
 colorMode(HSB, 360, 100, 100);
}

void draw() {   
  background(0);
  //delete walkers that are out of bounds
  if (walkers.size() > 0) {
    for (int i = walkers.size()-1; i >= 0; i--) {
      if (walkers.get(i).x < -7 || walkers.get(i).x > width+7 || walkers.get(i).y < -7 || walkers.get(i).y > height+7) {
        walkers.remove(i);
      }
    }
  }

  //update walkers if availible
  if (walkers.size() > 0) {
    for (int i = 0; i < walkers.size(); i++) {
      walkers.get(i).update();
      walkers.get(i).show();
    }
  }

  if (mousePressed) { 
    //map y value to get frequency
    float freq = map(mouseY, 0, 500, 500, 10);
    
    //get color by mapping freq to color
    float c = map(freq, 500, 10, 400, 0);
    
    //generate walkers
    for (int i = 0; i < 10; i++) {
      walkers.add(new Walker(mouseX + random(1), mouseY + random(1), color(c, 100, 100)));
    }

    //create byte to send multiple pieces of infomation
    byte out[] = new byte[2];
    //send state of mouse
    out[0] = byte(1);  
    //send frq
    out[1] = byte(freq);
    //send out of port to arduino
 //   port.write(out);
  } else { 
    byte out[] = new byte[2];
    out[0] = byte(0);
    out[1] = byte(0);
  //  port.write(out);
  }   
//  delay(10);
}
