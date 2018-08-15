#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <wiringPi.h>
#include <stdint.h>

#define ENCODER_A_PHASE_A  1
#define ENCODER_A_PHASE_B  4
#define ENCODER_B_PHASE_A  6
#define ENCODER_B_PHASE_B  5

#define PULSES_PER_REV     243
#define ANGLE_INCREMENT    0.02585673  // 2pi / 243

volatile static long right_wheel_ticks = 0;
volatile static long  left_wheel_ticks = 0;

volatile static uint8_t right_fwd_tick_count = 1;
volatile static uint8_t  left_fwd_tick_count = 1;
volatile static uint8_t right_bwd_tick_count = 1;
volatile static uint8_t  left_bwd_tick_count = 1;

/*
 * encoder signals interpreted as in:
 *  http://www.dynapar.com/Technology/Encoder_Basics/Quadrature_Encoder/
 */

void encoder_a_ISR() {

  if ( digitalRead(ENCODER_A_PHASE_A) == 1 ) {

    if ( digitalRead(ENCODER_A_PHASE_B) == 0 ) {
      right_fwd_tick_count = 1;
      right_bwd_tick_count = 0;
    } else {
      right_fwd_tick_count = 0;
      right_bwd_tick_count = 1;
    }

  } else {

    // temporary changed from increment to decrement and vice-versa
    // TODO: remake logic
    if ( digitalRead(ENCODER_A_PHASE_B) == 1 ) {
      if ( right_fwd_tick_count == 1 ) {
        right_wheel_ticks--;
        right_fwd_tick_count = 0;
      }
    } else {
      if ( right_bwd_tick_count == 1 ) {
        right_wheel_ticks++;
        right_bwd_tick_count = 0;
      }
    }

  }

}

void encoder_b_ISR() {

  if ( digitalRead(ENCODER_B_PHASE_A) == 1 ) {

    if ( digitalRead(ENCODER_B_PHASE_B) == 0 ) {
      left_fwd_tick_count = 1;
      left_bwd_tick_count = 0;
    } else {
      left_fwd_tick_count = 0;
      left_bwd_tick_count = 1;
    }

  } else {

    if ( digitalRead(ENCODER_B_PHASE_B) == 1 ) {
      if ( left_fwd_tick_count == 1 ) {
        left_wheel_ticks++;
        left_fwd_tick_count = 0;
      }
    } else {
      if ( left_bwd_tick_count == 1 ) {
        left_wheel_ticks--;
        left_bwd_tick_count = 0;
      }
    }

  }
}



int main(int argc, char** argv)
{
  ros::init(argc, argv, "encoder_counter");
  ros::NodeHandle nh;
  ros::Publisher l_wheel_pub = nh.advertise<std_msgs::Float64>("robot/wheel_left/encoder",  250);
  ros::Publisher r_wheel_pub = nh.advertise<std_msgs::Float64>("robot/wheel_right/encoder", 250);
  ros::Rate loop_rate(250);

  wiringPiSetup();
  pinMode(ENCODER_A_PHASE_A, INPUT);
  pinMode(ENCODER_A_PHASE_B, INPUT);

  pinMode(ENCODER_B_PHASE_A, INPUT);
  pinMode(ENCODER_B_PHASE_B, INPUT);

  wiringPiISR(ENCODER_A_PHASE_A, INT_EDGE_BOTH, &encoder_a_ISR);
  wiringPiISR(ENCODER_B_PHASE_A, INT_EDGE_BOTH, &encoder_b_ISR);


  while (ros::ok())
  {
    std_msgs::Float64 msg;

    msg.data = left_wheel_ticks * ANGLE_INCREMENT;
    l_wheel_pub.publish(msg);

    msg.data = right_wheel_ticks * ANGLE_INCREMENT;
    r_wheel_pub.publish(msg);

    ros::spinOnce();
    loop_rate.sleep();
  }
}
