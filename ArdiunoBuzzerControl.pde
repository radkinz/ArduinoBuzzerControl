import processing.serial.*;
Serial port;

void setup() {
//print the available serial ports.
  printArray(Serial.list());
//Select port from the listed array.
//replace [0] to [1],[2]...for selecting a usable open port.
port = new Serial(this,Serial.list()[0], 9600); } 
void draw() 
{   
if (mousePressed==true) { 
    port.write('H'); 
    println("H");
} else { 
    port.write('L');   
}   
delay(50); }
