/*
 * TransformFrames.h
 *
 *  Created on: Apr 12, 2018
 *      Author: jarek
 */

#ifndef SRC_TRANSFORMFRAMES_H_
#define SRC_TRANSFORMFRAMES_H_

#include <tf2/LinearMath/Quaternion.h>
#include <geometry_msgs/TransformStamped.h>

class TransformFrames {
 public:
  TransformFrames(const float _x, const float _y, const float _z, const double _roll_deg, const double _pitch_deg, const double _yaw_deg, const std::string _parent_frame, const std::string _child_frame);
  geometry_msgs::TransformStamped tfStamped;
  virtual ~TransformFrames();

 private:

  tf2::Quaternion quat;
  tf2::Vector3    vect;

  void fillRadValues();
  void fillQuaternion();
  void fillVect3();
  void fillTransformStamped();

  float x;
  float y;
  float z;

  double roll_deg;
  double pitch_deg;
  double yaw_deg;

  tf2Scalar roll_rad;
  tf2Scalar pitch_rad;
  tf2Scalar yaw_rad;

  std::string parent_frame;
  std::string  child_frame;
  const float DEG_TO_RAD_MULTIPLIER = 0.0174532925;

};

#endif /* SRC_TRANSFORMFRAMES_H_ */
