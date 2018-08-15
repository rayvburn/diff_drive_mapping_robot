/* Uploaded by Emiliano Borghi (eborghi10)
 * Taken from
 * https://github.com/eborghi10/my_ROS_mobile_robot/blob/master/my_robot_base/src/my_robot_base.cpp
 */

#include <chrono>
#include <functional>
#include <ros/ros.h>
#include <ros/callback_queue.h>
#include <controller_manager/controller_manager.h>
#include "TwoWheeledInterface.h"

void controlLoop(TwoWheeledInterface &hw, controller_manager::ControllerManager &cm,
                 std::chrono::system_clock::time_point &last_time)
{
    std::chrono::system_clock::time_point current_time = std::chrono::system_clock::now();
    std::chrono::duration<double>         elapsed_time = current_time - last_time;
    ros::Duration                         elapsed(elapsed_time.count());

    last_time = current_time;
    hw.read(elapsed);
    cm.update(ros::Time::now(), elapsed);
    hw.write();
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "controller_manager_node");

    TwoWheeledInterface hw;
    controller_manager::ControllerManager cm(&hw, hw.nh);

    double control_frequency;
    hw.nh.param<double>("/robot/controller_manager/control_frequency", control_frequency, 10.0);

    ros::CallbackQueue robot_queue;
    ros::AsyncSpinner robot_spinner(1, &robot_queue);

    std::chrono::system_clock::time_point last_time = std::chrono::system_clock::now();

    ros::TimerOptions control_timer(
                  ros::Duration(1 / control_frequency),
                  std::bind(controlLoop,
                            std::ref(hw),
                            std::ref(cm),
                            std::ref(last_time)),
                  &robot_queue);

    ros::Timer control_loop = hw.nh.createTimer(control_timer);
    robot_spinner.start();
    ros::spin();

    return 0;
}
