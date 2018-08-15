cmake_minimum_required(VERSION 2.8.3)
project(diff_drive_mapping_robot_navigation)

find_package(catkin REQUIRED COMPONENTS
    actionlib
    geometry_msgs
    nav_msgs
    roscpp
    std_msgs
    tf
    dynamic_reconfigure
    # navigation_layers # throws an error "Could not find a package configuration file provided by "navigation_layers""
)

catkin_package(
  # INCLUDE_DIRS include
  CATKIN_DEPENDS actionlib roscpp geometry_msgs nav_msgs std_msgs tf dynamic_reconfigure navigation_layers
)

###########
## Build ##
###########

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

#############
## Install ##
#############

#install(DIRECTORY urdf
#  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

#############
## Testing ##
#############

add_executable(send_goal src/send_robot_goal.cpp)
target_link_libraries(send_goal 
    ${catkin_LIBRARIES} 
)

add_executable(move_base_limiter src/move_base_limiter.cpp)
target_link_libraries(move_base_limiter 
    ${catkin_LIBRARIES} 
)
