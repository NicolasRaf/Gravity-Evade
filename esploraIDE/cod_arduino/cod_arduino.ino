#include <Esplora.h>


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
    // put your main code here, to run repeatedly:
  int slider = Esplora.readSlider();
  int button = Esplora.readButton(SWITCH_DOWN);
  slider = map(slider, 0, 1023, -100, 100);
  Serial.print("sl");
  Serial.print(":");
  Serial.print(slider);
  Serial.print("]");
  
  delay(100);
}
