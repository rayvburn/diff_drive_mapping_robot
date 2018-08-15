/*
 * move_base_limiter.cpp
 *
 *  Created on: Jun 11, 2018
 *      Author: jarek
 */

#include <ros/ros.h>
#include <std_msgs/UInt32.h>
#include <dynamic_reconfigure/DoubleParameter.h>
#include <dynamic_reconfigure/Reconfigure.h>
#include <dynamic_reconfigure/Config.h>

#define THRESHOLD  125

static double max_vel_x;
static double min_rot_vel;
static double max_rot_vel;
static bool move_base_speed_default = true;

void limitMoveBaseSpeed(bool to_limit) {

  dynamic_reconfigure::ReconfigureRequest  srv_req;
  dynamic_reconfigure::ReconfigureResponse srv_resp;
  dynamic_reconfigure::DoubleParameter double_param;
  dynamic_reconfigure::Config conf;

  if ( to_limit ) {

    const double LIN_VEL = 0.08;
    const double ROT_VEL = 0.25;

    double_param.name = "max_vel_x";
    // double_param.name = "TrajectoryPlannerROS/max_vel_x";
    double_param.value = LIN_VEL;
    conf.doubles.push_back(double_param);

    double_param.name = "min_rot_vel";
    // double_param.name = "TrajectoryPlannerROS/min_vel_theta";
    double_param.value = -ROT_VEL;
    conf.doubles.push_back(double_param);

    double_param.name = "max_rot_vel";
    // double_param.name = "TrajectoryPlannerROS/max_vel_theta";
    double_param.value = ROT_VEL;
    conf.doubles.push_back(double_param);

  } else {

    double_param.name = "max_vel_x";
    // double_param.name = "TrajectoryPlannerROS/max_vel_x";
    double_param.value = max_vel_x;
    conf.doubles.push_back(double_param);

    double_param.name = "min_rot_vel";
    // double_param.name = "TrajectoryPlannerROS/min_vel_theta";
    double_param.value = min_rot_vel;
    conf.doubles.push_back(double_param);

    double_param.name = "max_rot_vel";
    // double_param.name = "TrajectoryPlannerROS/max_vel_theta";
    double_param.value = max_rot_vel;
    conf.doubles.push_back(double_param);

  }

  srv_req.config = conf;
  ros::service::call("/move_base/DWAPlannerROS/set_parameters", srv_req, srv_resp);
  // ros::service::call("/move_base/local_costmap/set_parameters", srv_req, srv_resp);

}

void ORBMatchedPointsCallback(const std_msgs::UInt32::ConstPtr& msg) {

  unsigned int matched_pts_nb = msg->data;
  if ( matched_pts_nb < THRESHOLD ) {
    if ( move_base_speed_default ) {
      limitMoveBaseSpeed(true);
      ROS_WARN("move_base max speed limited due to small number of matched points in ORB-SLAM2");
      move_base_speed_default = false;
    }
  } else {
    if ( !move_base_speed_default ) {
      limitMoveBaseSpeed(false);
      ROS_INFO("move_base speed parameters switched to original ones");
      move_base_speed_default = true;
    }
  }
}

int main(int argc, char** argv){

  ros::init(argc, argv, "move_base_limiter");
  ros::NodeHandle nh;

  std::string topic_name = "/orb_slam2/info/matched_points";
  ros::Subscriber matched_pts_sub = nh.subscribe(topic_name, 5, ORBMatchedPointsCallback);

  nh.param("/move_base/DWAPlannerROS/max_vel_x",   max_vel_x,    0.25);
  nh.param("/move_base/DWAPlannerROS/max_rot_vel", min_rot_vel, -1.00);
  nh.param("/move_base/DWAPlannerROS/max_rot_vel", max_rot_vel,  1.00);

  ros::spin();
  return 0;
}

// std_msgs::UInt32::ConstPtr ptr_cb;
/*
ros::Subscriber matched_pts_sub = nh.subscribe(topic_name, 2, boost::bind(ORBMatchedPointsCallback,
                                                                          boost::ref(ptr_cb),
                                                                          boost::ref(srv_req),
                                                                          boost::ref(srv_resp),
                                                                          boost::ref(double_param),
                                                                          boost::ref(conf)));
                                                                          */
/*
std::function    std::bind(ORBMatchedPointsCallback,
                    std::ref(srv_req),
                    std::ref(srv_resp),
                    std::ref(double_param),
                    std::ref(conf));
*/


