#include <ros/ros.h>
#include <std_msgs/UInt8.h>
#include <sensor_msgs/Range.h>
#include <wiringPi.h>
#include "Sonar.h"
#include <limits>

#define SONAR_LEFT_ECHO_PIN    28
#define SONAR_LEFT_TRIGGER_PIN 29

#define SONAR_FRONT_ECHO_PIN    24
#define SONAR_FRONT_TRIGGER_PIN 25

#define SONAR_RIGHT_ECHO_PIN    22
#define SONAR_RIGHT_TRIGGER_PIN 23

#define IR_LEFT_PIN   9
#define IR_RIGHT_PIN  8

int main(int argc, char** argv)
{
  ros::init(argc, argv, "measurer_range_node");
  ros::NodeHandle nh;
  ros::Publisher sonar_left_pub  = nh.advertise<sensor_msgs::Range>("/robot/range/sonar/raw/left", 10);
  ros::Publisher sonar_front_pub = nh.advertise<sensor_msgs::Range>("/robot/range/sonar/raw/front", 10);
  ros::Publisher sonar_right_pub = nh.advertise<sensor_msgs::Range>("/robot/range/sonar/raw/right", 10);
  ros::Publisher ir_left_pub     = nh.advertise<sensor_msgs::Range>("/robot/range/ir/left", 10);
  ros::Publisher ir_right_pub    = nh.advertise<sensor_msgs::Range>("/robot/range/ir/right", 10);

  double _publish_rate = 5;
  if (nh.getParam("/robot/range/publish_rate", _publish_rate)) {
    ROS_INFO("Parameter _publish_rate: %f", _publish_rate);
  } else {
    ROS_ERROR("_publish_rate parameter not found");
  }
  ros::Rate loop_rate(_publish_rate);

  double _max_distance = 1;
  if (nh.getParam("/robot/range/max_distance", _max_distance)) {
    ROS_INFO("Parameter _max_distance: %f", _max_distance);
  } else {
    ROS_ERROR("_max_distance parameter not found");
  }

  wiringPiSetup();
  Sonar SonarLeft (SONAR_LEFT_TRIGGER_PIN,  SONAR_LEFT_ECHO_PIN,  _max_distance, "base_sonar_left");
  Sonar SonarFront(SONAR_FRONT_TRIGGER_PIN, SONAR_FRONT_ECHO_PIN, _max_distance, "base_sonar_front");
  Sonar SonarRight(SONAR_RIGHT_TRIGGER_PIN, SONAR_RIGHT_ECHO_PIN, _max_distance, "base_sonar_right");
  pinMode(IR_LEFT_PIN,  INPUT);
  pinMode(IR_RIGHT_PIN, INPUT);

  sensor_msgs::Range msgSonar;
  msgSonar.radiation_type = msgSonar.ULTRASOUND;
  msgSonar.field_of_view =  0.3665;               // 21 degrees
  msgSonar.min_range = 0.02;                      // 2 cm
  msgSonar.max_range = _max_distance;

  sensor_msgs::Range msgIR;
  msgIR.radiation_type = msgIR.INFRARED;
  msgIR.field_of_view =  0.7854;          // 45 degrees
  msgIR.min_range = 0.0025;               // 0.25 cm
  msgIR.max_range = 0.025;                //  2.5 cm

  while ( ros::ok() )
  {
    float dist;
    ros::Time scan_time;

    /* measurements executed in the following manner: sonar, IR, sonar, IR, sonar
     * just to create a small time gap between first sonar measurement finish and next
     * sonar's start; aim of that is interference avoidance
     */

    // ========== SonarLeft ================ //
    dist = SonarLeft.getDistance();
    scan_time = ros::Time::now();
    msgSonar.header.stamp = scan_time;
    msgSonar.header.frame_id = SonarLeft.getFrame();
    msgSonar.range = dist;
    sonar_left_pub.publish(msgSonar);

    // ========== IRLeft =================== //
    if ( digitalRead(IR_LEFT_PIN) ) {
      msgIR.range = -std::numeric_limits<double>::max();
    } else {
      msgIR.range = +std::numeric_limits<double>::max();
    }
    scan_time = ros::Time::now();
    msgIR.header.stamp = scan_time;
    msgIR.header.frame_id = "base_ir_left";
    ir_left_pub.publish(msgIR);

    // ========== SonarFront =============== //
    dist = SonarFront.getDistance();
    scan_time = ros::Time::now();
    msgSonar.header.stamp = scan_time;
    msgSonar.header.frame_id = SonarFront.getFrame();
    msgSonar.range = dist;
    sonar_front_pub.publish(msgSonar);

    // ========== IRRight ================== //
    if ( digitalRead(IR_RIGHT_PIN) ) {
      msgIR.range = -std::numeric_limits<double>::max();
    } else {
      msgIR.range = +std::numeric_limits<double>::max();
    }
    scan_time = ros::Time::now();
    msgIR.header.stamp = scan_time;
    msgIR.header.frame_id = "base_ir_right";
    ir_right_pub.publish(msgIR);

    // ========== SonarRight =============== //
    dist = SonarRight.getDistance();
    scan_time = ros::Time::now();
    msgSonar.header.stamp = scan_time;
    msgSonar.header.frame_id = SonarRight.getFrame();
    msgSonar.range = dist;
    sonar_right_pub.publish(msgSonar);

    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;

}
