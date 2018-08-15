#include <tf2_ros/static_transform_broadcaster.h>
#include <tf2_ros/transform_broadcaster.h>
#include <tf2_ros/transform_listener.h>

#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <geometry_msgs/TransformStamped.h>
#include <tf2/LinearMath/Quaternion.h>
#include <ros/ros.h>
#include <cstdio>
#include "TransformFrames.h"

struct transformation {
  transformation() : x(0), y(0), z(0), roll(0), pitch(0), yaw(0), parent_frame("base_link") {}
  float x, y, z;
  double roll, pitch, yaw;
  std::string parent_frame;
  std::string child_frame;
};
void transformsInit(transformation *SonarFront, transformation *SonarRight, transformation *SonarLeft,
                    transformation *IR_Right, transformation *IR_Left, transformation *Camera,
                    transformation *Camera_Optical) {

  /* "base link" is placed on the ground (bottom of wheels) level
   * at the central point of robot's width (between wheels) */

  SonarFront->child_frame = "base_sonar_front";
  SonarFront->x = 0.1055;
  SonarFront->z = 0.0325;

  SonarRight->child_frame = "base_sonar_right";
  SonarRight->x =  0.073;
  SonarRight->y = -0.085;
  SonarRight->z =  SonarFront->z;
  SonarRight->yaw = -90;

  SonarLeft->child_frame = "base_sonar_left";
  SonarLeft->x =    SonarRight->x;
  SonarLeft->y =   -SonarRight->y;
  SonarLeft->z =    SonarRight->z;
  SonarLeft->yaw = -SonarRight->yaw;

  IR_Right->child_frame = "base_ir_right";
  IR_Right->x = -0.155;
  IR_Right->y = -0.058;
  IR_Right->z =  0.0545;
  IR_Right->yaw = 180;

  IR_Left->child_frame = "base_ir_left";
  IR_Left->x =   IR_Right->x;
  IR_Left->y =  -IR_Right->y;
  IR_Left->z =   IR_Right->z;
  IR_Left->yaw = IR_Right->yaw;

  Camera->child_frame = "base_camera";
  Camera->x = 0.11;
  Camera->z = 0.205;

  Camera_Optical->parent_frame = "base_camera";
  Camera_Optical->child_frame = "camera_optical";
  Camera_Optical->roll =  -93; // not -90 because robot is slightly leaning forward, so there should be compensation for better map visualization
  Camera_Optical->yaw   = -90;

}

int main(int argc, char** argv) {

  ros::init(argc, argv, "tf_broadcaster");
  ros::NodeHandle n;
  ros::Rate loop_rate(25);

  std::string odometry_frame = "odom";
  std::string map_odom_interface_frame = "map_odom_interface";
  std::string base_frame = "base_link";

  transformation SonarFront;
  transformation SonarRight;
  transformation SonarLeft;
  transformation IR_Right;
  transformation IR_Left;
  transformation Camera;
  transformation Camera_Optical;

  transformsInit(&SonarFront, &SonarRight, &SonarLeft, &IR_Right, &IR_Left, &Camera, &Camera_Optical);

  TransformFrames SonarLeftTF (SonarLeft.x, SonarLeft.y, SonarLeft.z,
                               SonarLeft.roll, SonarLeft.pitch, SonarLeft.yaw,
                               SonarLeft.parent_frame, SonarLeft.child_frame);
  TransformFrames SonarFrontTF(SonarFront.x, SonarFront.y, SonarFront.z,
                               SonarFront.roll, SonarFront.pitch, SonarFront.yaw,
                               SonarFront.parent_frame, SonarFront.child_frame);
  TransformFrames SonarRightTF(SonarRight.x, SonarRight.y, SonarRight.z,
                               SonarRight.roll, SonarRight.pitch, SonarRight.yaw,
                               SonarRight.parent_frame, SonarRight.child_frame);
  TransformFrames IR_LeftTF   (IR_Left.x, IR_Left.y, IR_Left.z,
                               IR_Left.roll, IR_Left.pitch, IR_Left.yaw,
                               IR_Left.parent_frame, IR_Left.child_frame);
  TransformFrames IR_RightTF  (IR_Right.x, IR_Right.y, IR_Right.z,
                               IR_Right.roll, IR_Right.pitch, IR_Right.yaw,
                               IR_Right.parent_frame, IR_Right.child_frame);
  TransformFrames CameraTF    (Camera.x, Camera.y, Camera.z,
                               Camera.roll, Camera.pitch, Camera.yaw,
                               Camera.parent_frame, Camera.child_frame);

  TransformFrames Camera_OpticalTF (Camera_Optical.x, Camera_Optical.y, Camera_Optical.z,
                                    Camera_Optical.roll, Camera_Optical.pitch, Camera_Optical.yaw,
                                    Camera_Optical.parent_frame, Camera_Optical.child_frame);

  static tf2_ros::StaticTransformBroadcaster broadcaster;
  static tf2_ros::TransformBroadcaster broadcaster_dyn;
  static tf::TransformListener transform_listener;

  broadcaster.sendTransform(SonarLeftTF.tfStamped);
  broadcaster.sendTransform(SonarFrontTF.tfStamped);
  broadcaster.sendTransform(SonarRightTF.tfStamped);
  broadcaster.sendTransform(IR_LeftTF.tfStamped);
  broadcaster.sendTransform(IR_RightTF.tfStamped);
  broadcaster.sendTransform(CameraTF.tfStamped);
  broadcaster.sendTransform(Camera_OpticalTF.tfStamped);

  // following used for interface frame publishing
  tf::StampedTransform tfStampInterface;
  geometry_msgs::TransformStamped tfStampInterfaceMsg;
  bool print_start_info = true;

  while ( n.ok() ) {

    try {

      /* ODOMETRY */
      /* the interface frame is used by ORB-SLAM2 */
      transform_listener.waitForTransform(Camera_Optical.child_frame, odometry_frame,
                                          ros::Time::now(), ros::Duration(1.0));
      transform_listener.lookupTransform( Camera_Optical.child_frame, odometry_frame,
                                          ros::Time(0), tfStampInterface);
      if ( print_start_info ) {
        ROS_WARN("Seems like remote processes are already running!");
        print_start_info = false;
      }

      transformStampedTFToMsg(tfStampInterface, tfStampInterfaceMsg);
      tfStampInterfaceMsg.child_frame_id  = odometry_frame;
      tfStampInterfaceMsg.header.frame_id = map_odom_interface_frame;
      broadcaster_dyn.sendTransform(tfStampInterfaceMsg);

    } catch (tf::TransformException &ex) {

      ROS_ERROR("Drive controller on remote machine did not started yet...");
      // ROS_ERROR("%s",ex.what());
      ros::Duration(5.0).sleep();

    }

    ros::spinOnce();
    loop_rate.sleep();
  }

}
