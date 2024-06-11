#include <Esplora.h>


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
    // put your main code here, to run repeatedly:
  int slider = Esplora.readSlider();
  int analogX = Esplora.readJoystickX();
  int analogY = Esplora.readJoystickY();
  int powerButton = Esplora.readButton(SWITCH_4);
  int pauseButton = Esplora.readButton(SWITCH_3);
  int interactButton = Esplora.readButton(SWITCH_1);
  int gravityRGB = map(slider, -1023, 1023, 255, 0);
  slider = map(slider, 0, 1023, -1000, 1000);

  Esplora.writeRGB(gravityRGB,0,gravityRGB);

  Serial.print("sl");
  Serial.print(":");
  Serial.print(slider);
  
  Serial.print("#");
  
  Serial.print("anX");
  Serial.print(":");
  Serial.print(analogX);

  Serial.print("#");

  Serial.print("anY");
  Serial.print(":");
  Serial.print(analogY);

  Serial.print("#");

  Serial.print("bPo");
  Serial.print(":");    
  Serial.print(powerButton);

  Serial.print("#");

  Serial.print("bPa");
  Serial.print(":");    
  Serial.print(pauseButton);

  Serial.print("#");

  Serial.print("bIn");
  Serial.print(":");    
  Serial.print(interactButton);

  Serial.print("]");
  
  delay(10);
}
