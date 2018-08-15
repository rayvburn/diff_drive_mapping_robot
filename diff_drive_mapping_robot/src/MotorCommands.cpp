/*
 * MotorCommands.cpp
 *
 *  Created on: Apr 9, 2018
 *      Author: jarek
 */
#include <ros/ros.h>
#include <wiringPi.h>
#include <softPwm.h>
#include <stdint.h>
#include <MotorCommands.h>

MotorCommands::MotorCommands(uint8_t _H_BRIDGE_IN1, uint8_t _H_BRIDGE_IN2,
                             uint8_t _H_BRIDGE_IN3, uint8_t _H_BRIDGE_IN4)
  : left_wheel_cmd(0)
  , right_wheel_cmd(0)
  , left_direction(1)
  , right_direction(1)
  , _max_velocity(50.0)
  , left_wheel_cmd_topic("robot/wheel_left/velocity")
  , right_wheel_cmd_topic("robot/wheel_right/velocity")
{

  H_BRIDGE_IN1 = _H_BRIDGE_IN1;
  H_BRIDGE_IN2 = _H_BRIDGE_IN2;
  H_BRIDGE_IN3 = _H_BRIDGE_IN3;
  H_BRIDGE_IN4 = _H_BRIDGE_IN4;

  nh.param<double>("/mobile_base_controller/linear/x/max_velocity", _max_velocity, _max_velocity);
  nh.param<std::string>("/robot/motor_commands/cmd_vel_topic/left", left_wheel_cmd_topic, left_wheel_cmd_topic);
  nh.param<std::string>("/robot/motor_commands/cmd_vel_topic/right", right_wheel_cmd_topic, right_wheel_cmd_topic);

  // class version of subscriber definition
  l_wheel_sub = nh.subscribe(left_wheel_cmd_topic,  1, &MotorCommands::lWheelVelocityCallback, this);
  r_wheel_sub = nh.subscribe(right_wheel_cmd_topic, 1, &MotorCommands::rWheelVelocityCallback, this);

  // wiringPiSetup(); // <- creates "undefined reference to `wiringPiSetup'" in node's .cpp
  pinMode(H_BRIDGE_IN1, OUTPUT);
  pinMode(H_BRIDGE_IN2, OUTPUT);
  pinMode(H_BRIDGE_IN3, OUTPUT);
  pinMode(H_BRIDGE_IN4, OUTPUT);

  softPwmCreate(H_BRIDGE_IN1, 0, _max_velocity);  // M1 FWD Channel / RIGHT WHEEL
  softPwmCreate(H_BRIDGE_IN2, 0, _max_velocity);  // M1 REV Channel

  softPwmCreate(H_BRIDGE_IN3, 0, _max_velocity);  // M2 FWD Channel / LEFT WHEEL
  softPwmCreate(H_BRIDGE_IN4, 0, _max_velocity);  // M2 REV Channel

}

void MotorCommands::setPWMDuty() {

  if ( left_direction == 1 ) {
    softPwmWrite(H_BRIDGE_IN3, 0);
    softPwmWrite(H_BRIDGE_IN4, left_wheel_cmd);
  } else {
    softPwmWrite(H_BRIDGE_IN3, left_wheel_cmd);
    softPwmWrite(H_BRIDGE_IN4, 0);
  }

  if ( right_direction == 1 ) {
    softPwmWrite(H_BRIDGE_IN1, right_wheel_cmd);
    softPwmWrite(H_BRIDGE_IN2, 0);
  } else {
    softPwmWrite(H_BRIDGE_IN1, 0);
    softPwmWrite(H_BRIDGE_IN2, right_wheel_cmd);
  }

}

void MotorCommands::stop() {

  softPwmWrite(H_BRIDGE_IN1, 0);
  softPwmWrite(H_BRIDGE_IN2, 0);
  softPwmWrite(H_BRIDGE_IN3, 0);
  softPwmWrite(H_BRIDGE_IN4, 0);

}

void MotorCommands::lWheelVelocityCallback ( const std_msgs::Float64::ConstPtr& msg) {

  if ( msg->data >= 0 ) {
    left_direction = 1;
  } else {
    left_direction = 0;
  }
  left_wheel_cmd = abs(msg->data);

}

void MotorCommands::rWheelVelocityCallback ( const std_msgs::Float64::ConstPtr& msg) {

  if ( msg->data >= 0 ) {
    right_direction = 1;
  } else {
    right_direction = 0;
  }
  right_wheel_cmd = abs(msg->data);

}

MotorCommands::~MotorCommands() {
  MotorCommands::stop();
}

