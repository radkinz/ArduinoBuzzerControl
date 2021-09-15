int i = 0;
int pin = 12;
int frequency = 80;
int duration = 100;

int values[] = {0,0};

void setup() {
  pinMode(13, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available()) {
    //read serial port
    values[0] = Serial.read();
    values[1] = Serial.read();

    Serial.write(values[1]);

    //buzzer turned on if serial port == 1
    if (values[0] == 1) {
          tone(pin, values[1], duration);
          digitalWrite(13, HIGH);
          delay(50);
    }
  }
  delay(50);
}



 
