#include "DHT.h"
  
class HumitureSensor {
  int pin;
  DHT dht;
  float humidity, temp_c, temp_f;
  bool can_read;
  
public:
  HumitureSensor(int pin) : pin(pin), dht(pin, DHT11) {}

  void setup() {
    dht.begin();

    humidity = temp_c = temp_f = 0.;
    can_read = false;
  }

  void loop() {
    can_read = true;
    humidity = dht.readHumidity();
    temp_c = dht.readTemperature();
    temp_f = dht.readTemperature(true);
    
    if (isnan(humidity) || isnan(temp_c) || isnan(temp_f)) {
      can_read = false;
    }
  }

  bool canRead() {
    return can_read;
  }

  float getHumidity() {
    return humidity;
  }

  float getTemperature(bool fahrenheit = true) {
    return (fahrenheit ? temp_f : temp_c);
  }

  float getHeatIndex(bool fahrenheit = true) {
    return dht.computeHeatIndex(getTemperature(fahrenheit), humidity, fahrenheit);
  }
};
