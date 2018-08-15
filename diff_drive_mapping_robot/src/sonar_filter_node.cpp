/*
 * sonar_filter_node.cpp
 *
 *  Created on: Jun 11, 2018
 *      Author: jarek
 */


#include <ros/ros.h>
#include <sensor_msgs/Range.h>
#include <stdint.h>


static const double DISTANCE_THRESHOLD = 0.70;
static float getMedian  (float *arr);
static void  shiftValues(float *arr, float new_val);


// arrays and messages
static float left_mmts[3] = {0};
static sensor_msgs::Range left_msg;

static float front_mmts[3] = {0};
static sensor_msgs::Range front_msg;

static float right_mmts[3] = {0};
static sensor_msgs::Range right_msg;


void leftSubCallback(const sensor_msgs::Range::ConstPtr &msg) {
  shiftValues(left_mmts, float(msg->range));
  left_msg = *msg;
}

void frontSubCallback(const sensor_msgs::Range::ConstPtr &msg) {
  shiftValues(front_mmts, float(msg->range));
  front_msg = *msg;
}

void rightSubCallback(const sensor_msgs::Range::ConstPtr &msg) {
  shiftValues(right_mmts, float(msg->range));
  right_msg = *msg;
}


int main(int argc, char** argv)
{
  ros::init(argc, argv, "sonar_filter_node");
  ros::NodeHandle nh;

  double pub_rate;
  double max_distance;

  nh.param<double>("/robot/range/publish_rate", pub_rate,     5.00);
  nh.param<double>("/robot/range/max_distance", max_distance, 1.20);
  ros::Rate loop_rate(pub_rate);

  ros::Subscriber left_sub =  nh.subscribe("/robot/range/sonar/raw/left",  3, leftSubCallback);
  ros::Subscriber front_sub = nh.subscribe("/robot/range/sonar/raw/front", 3, frontSubCallback);
  ros::Subscriber right_sub = nh.subscribe("/robot/range/sonar/raw/right", 3, rightSubCallback);

  ros::Publisher sonar_left_pub  = nh.advertise<sensor_msgs::Range>("/robot/range/sonar/filtered/left",  3);
  ros::Publisher sonar_front_pub = nh.advertise<sensor_msgs::Range>("/robot/range/sonar/filtered/front", 3);
  ros::Publisher sonar_right_pub = nh.advertise<sensor_msgs::Range>("/robot/range/sonar/filtered/right", 3);


  while ( ros::ok() ) {

    double median_value;
    // left sensor
    median_value = getMedian(left_mmts);
    if ( median_value > DISTANCE_THRESHOLD ) {
      left_msg.range = max_distance;
    } else {
      left_msg.range = median_value;
    }
    sonar_left_pub.publish(left_msg);

    // front sensor
    median_value = getMedian(front_mmts);
    if ( median_value > DISTANCE_THRESHOLD ) {
      front_msg.range = max_distance;
    } else {
      front_msg.range = median_value;
    }
    sonar_front_pub.publish(front_msg);

    // right sensor
    median_value = getMedian(right_mmts);
    if ( median_value > DISTANCE_THRESHOLD ) {
      right_msg.range = max_distance;
    } else {
      right_msg.range = median_value;
    }
    sonar_right_pub.publish(right_msg);

    ros::spinOnce();
    loop_rate.sleep();

  }

  return 0;

}



static void shiftValues(float *arr, float new_val) {
    *(arr+2) = *(arr+1);
    *(arr+1) = *arr;
    *arr = new_val;
}

// float middle_of_3(float a, float b, float c)
static float getMedian(float *arr)
{
   float middle;

   if ((*arr <= *(arr+1)) && (*arr <= *(arr+2) ))
   {
     middle = (*(arr+1) <= *(arr+2) ) ? *(arr+1) : *(arr+2);
   }
   else if ((*(arr+1) <= *arr) && (*(arr+1) <= *(arr+2) ))
   {
     middle = (*arr <= *(arr+2) ) ? *arr : *(arr+2);
   }
   else
   {
     middle = (*arr <= *(arr+1)) ? *arr : *(arr+1);
   }

   return middle;
}
