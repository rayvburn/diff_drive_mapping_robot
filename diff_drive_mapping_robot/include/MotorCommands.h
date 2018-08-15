/*
 * MotorCommands.h
 *
 *  Created on: Apr 9, 2018
 *      Author: jarek
 */

#ifndef SRC_MOTORCOMMANDS_H_
#define SRC_MOTORCOMMANDS_H_

#include <stdint.h>
#include <std_msgs/Float64.h>

class MotorCommands {

 public:
  MotorCommands(uint8_t _H_BRIDGE_IN1, uint8_t _H_BRIDGE_IN2, uint8_t _H_BRIDGE_IN3, uint8_t _H_BRIDGE_IN4);
  void setPWMDuty();
  void stop();
  virtual ~MotorCommands();

  ros::NodeHandle nh;

 private:

  ros::Subscriber l_wheel_sub, r_wheel_sub;

  void lWheelVelocityCallback ( const std_msgs::Float64::ConstPtr& msg);
  void rWheelVelocityCallback ( const std_msgs::Float64::ConstPtr& msg);

  std::string left_wheel_cmd_topic;
  std::string right_wheel_cmd_topic;

  float   left_wheel_cmd;
  float   right_wheel_cmd;
  bool    left_direction;      // 0 rev, 1 fwd
  bool    right_direction;     // 0 rev, 1 fwd

  double  _max_velocity;

  uint8_t H_BRIDGE_IN1;
  uint8_t H_BRIDGE_IN2;
  uint8_t H_BRIDGE_IN3;
  uint8_t H_BRIDGE_IN4;

};

#endif /* SRC_MOTORCOMMANDS_H_ */
