/*
 * Sonar.cpp
 *
 *  Created on: Mar 7, 2018
 *      Author: jarek
 */

#include <Sonar.h>
#include <wiringPi.h>
#include <ros/ros.h>

Sonar::Sonar(uint8_t trigPin, uint8_t echoPin, uint8_t maxDist, std::string frame)
  : RISING_EDGE_TIMEOUT(500),
    DIVIDER(5800)
{

  Sonar::maxDistance = maxDist;
  Sonar::trigPin = trigPin;
  Sonar::echoPin = echoPin;
  Sonar::timeout = maxDist * 5800 * 1.3;
  Sonar::frame_id = frame;

  /* x1.3 because of interference avoidance
   * x5800 because sound travels 1m in 5800 microseconds */

  /* leaving wiringPiSetup() here instead of main node's function creates
   * "undefined reference to `wiringPiSetup'"
   * therefore there is double inclusion (both this .cpp and node's .cpp file) */

  pinMode(Sonar::trigPin, OUTPUT);
  pinMode(Sonar::echoPin, INPUT);

}

float Sonar::getDistance()
{

  uint32_t startTime;
  uint32_t time;
  float distance;

  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(12);
  digitalWrite(trigPin, LOW);

  startTime = micros();
  while ( digitalRead(echoPin) == 0 ) {       // wait until rising edge
    if ( micros() - startTime > RISING_EDGE_TIMEOUT ) {   // timeout
      // return 0;
      return maxDistance;
      break;
    }
  }

  startTime = micros();
  while ( digitalRead(echoPin) == 1 ) {       // wait until falling edge
    if ( micros() - startTime > timeout ) {  // timeout
      // return 0;
      return maxDistance; // navigation stack makes use only of values > 0.0 (for clearing costmap)
      break;
    }
  }

  time = micros() - startTime;
  distance = time / DIVIDER;
  return distance;

}

std::string Sonar::getFrame() {
  return frame_id;
}

Sonar::~Sonar()
{
  // TODO Auto-generated destructor stub
}

