
void setup() {
  pinMode(6, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(A1, INPUT);

}

void loop() {
  int a = analogRead(A1);
  analogWrite(10, a/4);
  analogWrite(6, 255-a/4);
}
