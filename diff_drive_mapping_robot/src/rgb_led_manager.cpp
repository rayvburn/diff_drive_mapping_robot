/*
 * rgb_led_manager.cpp
 *
 *  Created on: Apr 11, 2018
 *      Author: jarek
 */

#include <ros/ros.h>
#include <ros/callback_queue.h>
#include <softPwm.h>
#include <wiringPi.h>
#include <sensor_msgs/BatteryState.h>
#include <std_msgs/Bool.h>
#include <std_msgs/String.h>

#define LED_RED_PIN             3
#define LED_GREEN_PIN           2
#define LED_BLUE_PIN            0

#define MAX_PWM_VALUE         100
#define SINGLE_LED_PWM_VALUE   20

#define EVENT_DURATION         10

static float intensity_factor;
static float blinking_frequency;

static uint8_t slam_state = 5;     // ORB description
static bool loop_detected = false; // GBA is running
static bool loop_blinking = false; // to prevent switching _detected to false when GBA is finished

// prototypes
void colorsInitialization();
struct RGBColor;
void lightUp(const RGBColor *color);

struct RGBColor {
  RGBColor():  r(0), g(0), b(0) {}
  uint8_t r;
  uint8_t g;
  uint8_t b;
} slam_not_ready, slam_no_img, slam_not_inited, slam_ok, slam_lost, loop_closed, led_off;


void loop_closeCallback(const std_msgs::Bool::ConstPtr &msg) {

  if ( msg->data == true ) {
    loop_detected = true;
  } else {
    loop_detected = false;
  }

}

void slam_stateCallback(const std_msgs::String::ConstPtr &msg) {

  std::string str = std::string(msg->data);
  if (str == "System not ready") {
    slam_state = 0;
  } else if (str == "No images yet") {
    slam_state = 1;
  } else if (str == "Not initialized") {
    slam_state = 2;
  } else if (str == "OK") {
    slam_state = 3;
  } else if (str == "Tracking lost") {
    slam_state = 4;
  } else {
    slam_state = 5;
  }

}

void timerCallback(const ros::TimerEvent& e, ros::Timer &timer_duration) {

  static bool led_state = true; // start with led turned on

  if ( led_state ^= true ) {    // blink

    if ( loop_detected ) {

      loop_blinking = true;
      timer_duration.start();
      lightUp(&loop_closed);

    } else if ( loop_blinking ) {

      lightUp(&loop_closed);

    } else if ( !loop_blinking && !loop_detected ) { // loop detection fully performed

      switch (slam_state) {
        case 0:
            lightUp(&slam_not_ready);
            break;
        case 1:
            lightUp(&slam_no_img);
            break;
        case 2:
            lightUp(&slam_not_inited);
            break;
        case 3:
            lightUp(&slam_ok);
            break;
        case 4:
            lightUp(&slam_lost);
            break;
        case 5:
            lightUp(&led_off);
            break;
      }
    }

  } else {
    lightUp(&led_off);
  }
}

void timer_event_durationCallback(const ros::TimerEvent& e, ros::Timer &timer_duration) {

  if ( loop_blinking ) {
    loop_blinking = false;
    timer_duration.stop();
  }

}

int main(int argc, char** argv)
{

  ros::init(argc, argv, "rgb_led_manager");
  ros::NodeHandle nh;

  colorsInitialization();
  std::string loop_close_topic, slam_state_topic;
  nh.param<std::string>("/robot/rgb_manager/loop_close_topic", loop_close_topic, "/orb_slam2/info/loop_closed");
  nh.param<std::string>("/robot/rgb_manager/slam_state_topic", slam_state_topic, "/orb_slam2/info/state_description");
  nh.param<float>("/robot/rgb_manager/intensity_factor", intensity_factor, 0.10);
  nh.param<float>("/robot/rgb_manager/blinking_frequency", blinking_frequency, 1);

  ros::Subscriber slam_loop_sub = nh.subscribe(loop_close_topic, 1, loop_closeCallback);
  ros::Subscriber slam_state_sub = nh.subscribe(slam_state_topic, 1, slam_stateCallback);

  ros::CallbackQueue tim_queue;
  ros::AsyncSpinner led_spinner(1, &tim_queue);
  ros::Timer timer_blink, timer_duration;
  ros::TimerEvent blink_event, duration_event;

  ros::TimerOptions duration_timer(ros::Duration(EVENT_DURATION),
                                   std::bind(timer_event_durationCallback,
                                             std::ref(duration_event),
                                             std::ref(timer_duration)), // to allow stop inside callback
                                &tim_queue);
  timer_duration = nh.createTimer(duration_timer);

  ros::TimerOptions blinking_timer(ros::Duration(1/blinking_frequency),
                                std::bind(timerCallback,
                                          std::ref(blink_event),
                                          std::ref(timer_duration)),
                                &tim_queue);
  timer_blink = nh.createTimer(blinking_timer);

  wiringPiSetup();
  pinMode(LED_RED_PIN,   OUTPUT);
  pinMode(LED_GREEN_PIN, OUTPUT);
  pinMode(LED_BLUE_PIN,  OUTPUT);

  softPwmCreate(LED_RED_PIN,   0, MAX_PWM_VALUE);
  softPwmCreate(LED_GREEN_PIN, 0, MAX_PWM_VALUE);
  softPwmCreate(LED_BLUE_PIN,  0, MAX_PWM_VALUE);

  led_spinner.start();
  ros::spin();

  lightUp(&led_off);
  return 0;

}

void colorsInitialization() {
  slam_not_ready.r = 204;  slam_not_ready.b = 255;   // purple
  slam_no_img.g = 204;     slam_no_img.b = 255;      // sea
  slam_not_inited.r = 255; slam_not_inited.g = 255;  // yellow
  slam_ok.g = 255;                                   // green
  slam_lost.r = 255;                                 // red
  loop_closed.r = 255;     loop_closed.g = 128;      // orange
}

void lightUp(const RGBColor *color) {

  softPwmWrite(LED_RED_PIN,   intensity_factor*color->r);
  softPwmWrite(LED_GREEN_PIN, intensity_factor*color->g);
  softPwmWrite(LED_BLUE_PIN,  intensity_factor*color->b);

}

/*
 *

ros::Subscriber battery_sub = nh.subscribe("robot/battery_state", 1, battery_stateCallback);

void battery_stateCallback(const sensor_msgs::BatteryState::ConstPtr &msg) {
  // not used at the moment due to lack of embedded ADC in RPi3
  if ( msg->voltage == 0 ) {
    softPwmWrite(LED_RED_PIN,   MAX_PWM_VALUE);
    softPwmWrite(LED_GREEN_PIN, 0);
    softPwmWrite(LED_BLUE_PIN,  0);
    batteryLow = true;
  } else {
    softPwmWrite(LED_RED_PIN,   0);
    softPwmWrite(LED_GREEN_PIN, SINGLE_LED_PWM_VALUE);
    softPwmWrite(LED_BLUE_PIN,  0);
    batteryLow = false;
  }
}
*/
