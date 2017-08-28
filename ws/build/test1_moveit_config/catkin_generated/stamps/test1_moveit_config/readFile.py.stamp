#!/usr/bin/env python

import rospy
import sys
import copy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
import pickle

def move():
	print "Starting rospy and moveit..."
	moveit_commander.roscpp_initialize(sys.argv)
	rospy.init_node('move_group_py')

	robot = moveit_commander.RobotCommander()
	scene = moveit_commander.PlanningSceneInterface()
	group1 = moveit_commander.MoveGroupCommander("left_arm")

	display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path',moveit_msgs.msg.DisplayTrajectory, queue_size=1)
	group1.allow_replanning(True)
	group1.set_planning_time(10.0)

	print "Waiting for RViz"
	rospy.sleep(10)
	print "Initializing..."

	print "Reference frame: %s" %group1.get_planning_frame()

	file = open('plan_data.pkl','rb')
	print "Reading plan from file..."	
	plan = pickle.load(file)
	file.close()

	print "Executing planned path..."
	group1.go()

if __name__ == '__main__':
	try:
		move()
	except rospy.ROSInterruptException:
		pass