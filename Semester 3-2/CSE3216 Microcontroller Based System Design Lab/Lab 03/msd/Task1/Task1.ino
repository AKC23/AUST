#include <Servo.h>
Servo servo;
int angle=10;
const int SigPin = 9;
long duration;
int distance;

void setup() {
servo.attach(8);
servo.write(angle);
Serial.begin(9600); 
}

void loop() {
pinMode(SigPin, OUTPUT);
digitalWrite(SigPin, LOW); //clear trigger pin
delay(2);
digitalWrite(SigPin, HIGH);
delay(10);  // Set trigPin on HIGH state for 10 micro seconds
digitalWrite(SigPin, LOW); 
pinMode(SigPin, INPUT); 
duration = pulseIn(SigPin, HIGH); // Reads the echoPin, returns the sound wave travel time in microseconds
distance= (duration*0.034)/2;
Serial.print("Distance(cm): ");
Serial.println(distance);
delay(1000);

}

