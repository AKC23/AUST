
  int sensorPin = A4;
  int ledPin = 9;
  int sensorValue = 0;
  int ledPin2 = 12;

void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(sensorPin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

  sensorValue = analogRead(sensorPin);
  
  digitalWrite(ledPin, HIGH);
  digitalWrite(ledPin2, HIGH);

  delay(sensorValue);

  digitalWrite(ledPin, LOW);
  digitalWrite(ledPin2, LOW);

  delay(sensorValue);

}
