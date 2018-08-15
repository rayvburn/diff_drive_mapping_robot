#include <ros/ros.h>
#include "MotorCommands.h"
#include <wiringPi.h>

#define H_BRIDGE_IN1  10
#define H_BRIDGE_IN2  11
#define H_BRIDGE_IN3  26
#define H_BRIDGE_IN4  27

int main(int argc, char** argv)
{
  ros::init(argc, argv, "motor_commands_node");
  wiringPiSetup();
  MotorCommands motors(H_BRIDGE_IN1, H_BRIDGE_IN2, H_BRIDGE_IN3, H_BRIDGE_IN4);
  double pwm_freq;
  motors.nh.param<double>("/robot/motor_commands/pwm_update_frequency", pwm_freq, 10.0);

  ros::Rate loop_rate(pwm_freq);

  while (ros::ok()) {

    motors.setPWMDuty();
    ros::spinOnce();
    loop_rate.sleep();

  }

  motors.stop();

}
