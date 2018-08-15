/*
 * Sonar.h
 *
 *  Created on: Mar 7, 2018
 *      Author: jarek
 */

#ifndef SRC_SONAR_H_
#define SRC_SONAR_H_
#include <stdint.h>
#include <string>

class Sonar {

 public:
  Sonar(uint8_t trigPin, uint8_t echoPin, uint8_t maxDistance, std::string frame);
  float getDistance();
  std::string getFrame();
  virtual ~Sonar();

 private:
  int trigPin;
  int echoPin;
  double timeout;
  uint8_t maxDistance;
  std::string frame_id;
  const float DIVIDER;
  const uint16_t RISING_EDGE_TIMEOUT;
};

#endif /* SRC_SONAR_H_ */
