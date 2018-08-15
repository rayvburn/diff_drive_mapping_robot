#!/bin/bash
source /opt/ros/kinetic/setup.bash
source /home/ubuntu/catkin_ws/devel/setup.bash
export ROS_HOSTNAME="ubiquityrobot.local"
exec "$@"
