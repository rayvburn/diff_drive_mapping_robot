#include <TwoWheeledInterface.h>
#include <sstream> // ostringstream

TwoWheeledInterface::TwoWheeledInterface()
  : running_(true)
  , private_nh("~")
  , start_srv_(nh.advertiseService("start", &TwoWheeledInterface::startCallback, this))
  , stop_srv_(nh.advertiseService("stop", &TwoWheeledInterface::stopCallback, this))
  , _wheel_diameter(0.0663)
  , _wheel_radius(0.03315)
  , _max_speed(50.0)
{

  if (private_nh.getParam("/mobile_base_controller/wheel_radius", _wheel_radius)) {
    ROS_INFO("Parameter _wheel_radius: %f", _wheel_radius);
    _wheel_diameter = 2 * _wheel_radius;   // convert radius to diameter
  } else {
    ROS_ERROR("Robot description (controller's YAML file) is not complete");
  }
  if (private_nh.getParam("/mobile_base_controller/linear/x/max_velocity", _max_speed)) {
    ROS_INFO("Parameter _max_speed: %f", _max_speed);
  } else {
    ROS_ERROR("Robot description (controller's YAML file) is not complete");
  }

  // Intialize raw data
  std::fill_n(pos, NUM_JOINTS, 0.0);
  std::fill_n(vel, NUM_JOINTS, 0.0);
  // std::fill_n(vel_lin, NUM_JOINTS, 0.0);
  std::fill_n(eff, NUM_JOINTS, 0.0);
  std::fill_n(cmd, NUM_JOINTS, 0.0);

  // connect and register the joint state and velocity interfaces
  for (unsigned int i = 0; i < NUM_JOINTS; ++i)
  {
    std::ostringstream os;
    os << "wheel_" << i << "_joint";

    hardware_interface::JointStateHandle state_handle(os.str(), &pos[i], &vel[i], &eff[i]);
    jnt_state_interface.registerHandle(state_handle);

    hardware_interface::JointHandle vel_handle(jnt_state_interface.getHandle(os.str()), &cmd[i]);
    jnt_vel_interface.registerHandle(vel_handle);
  }

  registerInterface(&jnt_state_interface);
  registerInterface(&jnt_vel_interface);

  // Initialize publishers and subscribers
  left_wheel_cmd_pub_  = nh.advertise<std_msgs::Float64>("robot/wheel_left/cmd_vel/open_loop",  3);
  right_wheel_cmd_pub_ = nh.advertise<std_msgs::Float64>("robot/wheel_right/cmd_vel/open_loop", 3);

  /*
  left_wheel_vel_pub_  = nh.advertise<std_msgs::Float64>("robot/wheel_left/velocity/linear",  3);
  right_wheel_vel_pub_ = nh.advertise<std_msgs::Float64>("robot/wheel_right/velocity/linear", 3);
  */

  left_wheel_ang_vel_pub_  = nh.advertise<std_msgs::Float64>("robot/wheel_left/velocity/angular",  3);
  right_wheel_ang_vel_pub_ = nh.advertise<std_msgs::Float64>("robot/wheel_right/velocity/angular", 3);

  left_wheel_angle_sub_ =  nh.subscribe("robot/wheel_left/encoder",  3, &TwoWheeledInterface::leftWheelAngleCallback, this);
  right_wheel_angle_sub_ = nh.subscribe("robot/wheel_right/encoder", 3, &TwoWheeledInterface::rightWheelAngleCallback, this);

}

void TwoWheeledInterface::write()
{

  std_msgs::Float64 msg_left;
  std_msgs::Float64 msg_right;

  double diff_ang_speed_left  = cmd[0];
  double diff_ang_speed_right = cmd[1];
  limitDifferentialSpeed(diff_ang_speed_left, diff_ang_speed_right);

  // open loop velocity commands
  msg_left.data = diff_ang_speed_left;
  msg_right.data = diff_ang_speed_right;
  left_wheel_cmd_pub_.publish(msg_left);
  right_wheel_cmd_pub_.publish(msg_right);

  // angular velocities
  msg_left.data = vel[0];
  msg_right.data = vel[1];
  left_wheel_ang_vel_pub_.publish(msg_left);
  right_wheel_ang_vel_pub_.publish(msg_right);

  /*
  // linear velocities
  msg_left.data = vel_lin[0];
  msg_right.data = vel_lin[1];
  left_wheel_vel_pub_.publish(msg_left);
  right_wheel_vel_pub_.publish(msg_right);
  */

}

void TwoWheeledInterface::read(const ros::Duration &period)
{
  /* Reading encoder values and defining position and velocity */
  static double prev_ang_distance_left, prev_ang_distance_right = 0;
  double ang_distance_left  = _wheel_angle[0];
  double ang_distance_right = _wheel_angle[1];

  pos[0] =  ang_distance_left;
  vel[0] = (ang_distance_left - prev_ang_distance_left) / period.toSec();   // angular_velocity (rad/s)
  // vel_lin[0] = vel[0] * _wheel_radius;  // linear velocity
  pos[1] =  ang_distance_right;
  vel[1] = (ang_distance_right - prev_ang_distance_right) / period.toSec(); // angular_velocity (rad/s)
  // vel_lin[1] = vel[1] * _wheel_radius;  // linear velocity

  prev_ang_distance_left  = ang_distance_left;
  prev_ang_distance_right = ang_distance_right;

}

ros::Time TwoWheeledInterface::get_time()
{
  prev_update_time = curr_update_time;
  curr_update_time = ros::Time::now();
  return curr_update_time;
}

ros::Duration TwoWheeledInterface::get_period()
{
  return curr_update_time - prev_update_time;
}

bool TwoWheeledInterface::startCallback(std_srvs::Empty::Request& /*req*/, std_srvs::Empty::Response& /*res*/)
{
  running_ = true;
  return true;
}

bool TwoWheeledInterface::stopCallback(std_srvs::Empty::Request& /*req*/, std_srvs::Empty::Response& /*res*/)
{
  running_ = false;
  return true;
}

void TwoWheeledInterface::leftWheelAngleCallback(const std_msgs::Float64& msg) {
  _wheel_angle[0] = msg.data;
}

void TwoWheeledInterface::rightWheelAngleCallback(const std_msgs::Float64& msg) {
  _wheel_angle[1] = msg.data;
}

void TwoWheeledInterface::limitDifferentialSpeed(double &diff_speed_left, double &diff_speed_right)
{
  double speed = std::max(std::abs(diff_speed_left), std::abs(diff_speed_right));
  if (speed > _max_speed) {
    diff_speed_left  *= _max_speed / speed;
    diff_speed_right *= _max_speed / speed;
  }
}
