import processing.serial.*;
Serial port;

void setup() {
  //arduuino setup
  //print the available serial ports.
  printArray(Serial.list());
  //Select port 
  port = new Serial(this, Serial.list()[0], 9600); 

  //processing set up
  size(500, 500);
}

void draw() {   
  background(0);

  //send multiple pieces of information to ardiuno using a byte
  if (mousePressed) { 
    byte out[] = new byte[2];
    out[0] = byte(1);
    out[1] = byte(map(mouseY, 0, 500, 500, 10));
    port.write(out);
  } else { 
    byte out[] = new byte[2];
    out[0] = byte(0);
    out[1] = byte(0);
    port.write(out);
  }   
  delay(10); 
  
  //check port
  if (port.available()>0) {
    println(port.read());
    delay(10);
  }
}
