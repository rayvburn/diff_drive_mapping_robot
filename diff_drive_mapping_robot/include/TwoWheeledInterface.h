/*********************************************************************
 * Software License Agreement (BSD License)
 *
 *  Copyright (c) 2015, University of Colorado, Boulder
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above
 *     copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided
 *     with the distribution.
 *   * Neither the name of the Univ of CO, Boulder nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 *  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 *  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 *  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 *  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 *  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 *  ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 *********************************************************************/
/* Author: Dave Coleman
   Desc:   Example ros_control hardware interface blank template for the RRBot
           For a more detailed simulation example, see sim_hw_interface.h
*/
/* Edited by Emiliano Borghi (eborghi10)
 * https://github.com/eborghi10
 * https://github.com/eborghi10/my_ROS_mobile_robot
 */

/* Slightly modified to fit my robot*/

#pragma once

#include <ros/ros.h>
#include <std_msgs/Float64.h>
#include <std_srvs/Empty.h>

// #include <controller_manager/controller_manager.h>
#include <hardware_interface/joint_command_interface.h>
#include <hardware_interface/joint_state_interface.h>
#include <hardware_interface/robot_hw.h>

// Hardware interface for a two-wheeled robot
#define NUM_JOINTS 2

class TwoWheeledInterface : public hardware_interface::RobotHW
{
public:

  TwoWheeledInterface();
  void write();
  void read(const ros::Duration &period);
  ros::Time get_time();
  ros::Duration get_period();
  ros::NodeHandle nh;
  ros::NodeHandle private_nh;

private:

  hardware_interface::JointStateInterface jnt_state_interface;
  hardware_interface::VelocityJointInterface jnt_vel_interface;

  double cmd[NUM_JOINTS];
  double pos[NUM_JOINTS];
  double vel[NUM_JOINTS];
  // double vel_lin[NUM_JOINTS];
  double eff[NUM_JOINTS];

  bool running_;
  double _wheel_diameter;
  double _wheel_radius;
  double _max_speed;
  double _wheel_angle[NUM_JOINTS];

  ros::Time curr_update_time, prev_update_time;

  ros::Subscriber left_wheel_angle_sub_;
  ros::Subscriber right_wheel_angle_sub_;

  ros::Publisher left_wheel_cmd_pub_;
  ros::Publisher right_wheel_cmd_pub_;

  // linear velocity publishers
  // ros::Publisher left_wheel_vel_pub_;
  // ros::Publisher right_wheel_vel_pub_;

  ros::Publisher left_wheel_ang_vel_pub_;
  ros::Publisher right_wheel_ang_vel_pub_;

  ros::ServiceServer start_srv_;
  ros::ServiceServer stop_srv_;

  bool startCallback(std_srvs::Empty::Request& /*req*/, std_srvs::Empty::Response& /*res*/);
  bool stopCallback(std_srvs::Empty::Request& /*req*/, std_srvs::Empty::Response& /*res*/);
  void leftWheelAngleCallback(const std_msgs::Float64& msg);
  void rightWheelAngleCallback(const std_msgs::Float64& msg);
  void limitDifferentialSpeed(double &diff_speed_left, double &diff_speed_right);

};
