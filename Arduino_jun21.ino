void setup() {
  for (int j = 5; j < 10; j++) {
    pinMode(j, OUTPUT);
  }
}

void loop() {
  for (int m = 5; m < 10; m++) {
    digitalWrite(m, HIGH);
  }
  delay(500);
  for (int x = 5; x < 10; x++) {
    digitalWrite(x, LOW);
    delay(500);
  }
  for (int x = 9; x > 4; x--) {
    digitalWrite(x, HIGH);
    delay(500);
  }
  for (int m = 5; m < 10; m++) {
    digitalWrite(m, LOW);
  }
  delay(500);
}
