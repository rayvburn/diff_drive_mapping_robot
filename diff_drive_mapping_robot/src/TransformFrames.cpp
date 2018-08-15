/*
 * TransformFrames.cpp
 *
 *  Created on: Apr 12, 2018
 *      Author: jarek
 */

#include <TransformFrames.h>
#include <ros/ros.h>

TransformFrames::TransformFrames(const float _x, const float _y, const float _z, const double _roll_deg, const double _pitch_deg, const double _yaw_deg, const std::string _parent_frame, const std::string _child_frame)
: x(0), y(0), z(0),
  roll_deg(0), pitch_deg(0), yaw_deg(0),
  roll_rad(0), pitch_rad(0), yaw_rad(0)
{

  x = _x;                   y = _y;                   z = _z;
  roll_deg = _roll_deg;     pitch_deg = _pitch_deg;   yaw_deg = _yaw_deg;

  parent_frame = _parent_frame;
  child_frame = _child_frame;

  fillRadValues();
  fillQuaternion();
  fillVect3();
  fillTransformStamped();

}

void TransformFrames::fillRadValues(void)
{
  roll_rad  = DEG_TO_RAD_MULTIPLIER * roll_deg;
  pitch_rad = DEG_TO_RAD_MULTIPLIER * pitch_deg;
  yaw_rad   = DEG_TO_RAD_MULTIPLIER * yaw_deg;
}

void TransformFrames::fillQuaternion(void)
{
  quat.setRPY(roll_rad, pitch_rad, yaw_rad);
}

void TransformFrames::fillVect3(void)
{
  vect.setX(x);
  vect.setY(y);
  vect.setZ(z);
}

void TransformFrames::fillTransformStamped(void)
{
  tfStamped.header.stamp = ros::Time::now();
  tfStamped.header.frame_id = parent_frame;
  tfStamped.child_frame_id = child_frame;

  tfStamped.transform.translation.x = vect.getX();
  tfStamped.transform.translation.y = vect.getY();
  tfStamped.transform.translation.z = vect.getZ();

  tfStamped.transform.rotation.x = quat.x();
  tfStamped.transform.rotation.y = quat.y();
  tfStamped.transform.rotation.z = quat.z();
  tfStamped.transform.rotation.w = quat.w();
}


TransformFrames::~TransformFrames() {
  // TODO Auto-generated destructor stub
}

