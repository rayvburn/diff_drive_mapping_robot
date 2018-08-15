# diff_drive_mapping_robot
This is the ROS driver for the Raspberry Pi based differential drive robot that was built as a part of my MSc thesis. 


Base of the robot was made of acrylic glass. The locomotion is provided by 3 wheels, including 1 caster. The two-wheel differential drive based on DC motors makes the machine nonholonomic.

Within the electronic part of the robot's construction, a printed circuit board was designed. All the necessary electronical components including reflective sensors used to measure the distance from obstacles were placed on the board. The sensor providing the largest amount of data is the camera. It is integrated with the Raspberry Pi microcomputer. The extension of the microcomputer's tasks to the reading of wheel positions and motor control allowed to use its resources efficiently and to avoid adding an extra microcontroller.

Looking at the PCB project (made in KiCad) should give you some idea what components to use if you plan to make a copy of it.

The robot is intended to work together with remote machine like PC that performs some more sophisticated duties. It was created to interface with ORB-SLAM2 well.


# Installation instructions

The package contents should be placed and compiled both on PC and on RPi's SD card. It was tested only on ROS Kinetic (running on Ubuntu 16.04).

wiringPi library is needed (http://wiringpi.com/). A script to install it on Raspberry Pi was provided.

raspicam_node (https://github.com/UbiquityRobotics/raspicam_node) is required if you will use Raspberry Pi camera but isn't marked as dependency for the package. If you don't plan to use it, just remove appropriate line in robot/robot_offline .launch file (the one with inclusion of raspicam_node's .launch).

# Usage

If a Raspberry Pi is present within a local Wi-Fi network

    roslaunch diff_drive_mapping_robot robot.launch

or for testing purposes (no RPi)

    roslaunch diff_drive_mapping_robot robot_offline.launch
    
# Notes
I highly recommend acquiring an Ubuntu image adequate for Raspberry Pi (with ROS Kinetic already installed) from here: https://downloads.ubiquityrobotics.com/pi.html
