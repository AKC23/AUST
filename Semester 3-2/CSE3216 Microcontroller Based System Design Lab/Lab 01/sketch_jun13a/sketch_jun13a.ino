int ledpin = 13;

void setup() {
  // put your setup code here, to run once:
  pinMode(ledpin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
   digitalWrite(ledpin, HIGH); // turn the LED on (HIGH is the voltage level)
   delay(1000); // wait for a second
   digitalWrite(ledpin, LOW); // turn the LED off by making the voltage LOW
   delay(1000); // wait for a second
}
