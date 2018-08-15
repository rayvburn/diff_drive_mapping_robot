/*
 * battery_state_broadcaster.cpp
 *
 *  Created on: Apr 11, 2018
 *      Author: jarek
 */

#include <ros/ros.h>
#include <wiringPi.h>
#include <sensor_msgs/BatteryState.h>

/* Due to already designed PCB and lack of ADC in Raspberry Pi
 * a digital input was  used to approx. check battery voltage.
 * 3,3V logic interprets HIGH state as voltage above 2.4 V.
 * There is a voltage divider used to divide voltage by 3
 * and a 2 cell battery ( 8.4V for battery means 2,8V on
 * Raspberry pin ).
 */

#define BATTERY_VOLTAGE_PIN     31
#define BATTERY_HIGH_VOLTAGE     1
#define BATTERY_LOW_VOLTAGE      0

int main(int argc, char** argv)
{

  ros::init(argc, argv, "battery_state_broadcaster");
  ros::NodeHandle nh;
  ros::Rate loop_rate(0.26);
  ros::Publisher battery_pub = nh.advertise<sensor_msgs::BatteryState>("robot/battery_state", 1);

  wiringPiSetup();
  pinMode(BATTERY_VOLTAGE_PIN,  INPUT);
  sensor_msgs::BatteryState battery;
  battery.power_supply_status = battery.POWER_SUPPLY_STATUS_DISCHARGING;
  battery.power_supply_health = battery.POWER_SUPPLY_HEALTH_GOOD;
  battery.power_supply_technology = battery.POWER_SUPPLY_TECHNOLOGY_LIPO;
  battery.present = true;
  battery.header.frame_id = "base_link";

  while ( nh.ok() )
  {
        ros::Time time;
        time = ros::Time::now();
        battery.header.stamp = time;

        if ( digitalRead(BATTERY_VOLTAGE_PIN) == 1 )
        {
          battery.voltage = BATTERY_HIGH_VOLTAGE;
        } else
        {
          battery.voltage = BATTERY_LOW_VOLTAGE;
        }

        battery_pub.publish(battery);

        ros::spinOnce();
        loop_rate.sleep();
  }


}
