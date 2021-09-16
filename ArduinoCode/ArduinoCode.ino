int i = 0;
int pin = 12;
int duration = 80;

int values[] = {0,0};
int lights[] = {5, 6, 7, 9, 10, 8};
int lights_length = sizeof(lights)/sizeof(int);

void setup() {
  pinMode(13, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available()) {
    //read serial port
    values[0] = Serial.read();
    values[1] = Serial.read();

    int frequency = values[1];

    //buzzer turned on if serial port == 1
    if (values[0] == 1) {
      //output sound of buzzer
      tone(pin, frequency, duration);

      //map freq to see how many lights to turn on
      Serial.write(frequency);
      int max_lights_off = map(frequency, 0, 300, 5, 0);

      //turn lights on
      for (int i = 0; i < (lights_length-max_lights_off); i++) {
        digitalWrite(lights[i], HIGH);
      }
          
      delay(10);
    } else {
      //turn lights off
      for (int i = 0; i < lights_length; i++) {
        digitalWrite(lights[i], LOW);
      }
      delay(10);
    }
  }
  delay(10);
}



 
