#include <Esplora.h>

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int slider = Esplora.readSlider();
  Serial.println(slider);
  delay(250);
}
