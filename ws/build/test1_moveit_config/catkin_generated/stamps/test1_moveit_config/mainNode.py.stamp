#!/usr/bin/env python

import rospy
import sys
import copy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
import pickle


def move_robot():
	print "Starting rospy and moveit..."
	moveit_commander.roscpp_initialize(sys.argv)
	rospy.init_node('move_group_py')

	robot = moveit_commander.RobotCommander()
	scene = moveit_commander.PlanningSceneInterface()
	group1 = moveit_commander.MoveGroupCommander("both_arms")



	display_trajectory_publisher = rospy.Publisher('/move_group/display_planned_path',moveit_msgs.msg.DisplayTrajectory, queue_size=1)
	group1.allow_replanning(True)
	group1.set_planning_time(10.0)


	print "Waiting for RViz"
	rospy.sleep(10)
	print "Initializing..."

	print "Reference frame: %s" %group1.get_planning_frame()

	#print "Generating plan using joint angles..."
	#group_values = group1.get_current_joint_values()
	#group_values[1] = 0
	#group_values[2] = 0
	#group1.set_joint_value_target(group_values)

	#plan1 = group1.plan()
	#rospy.sleep(5)

	#print "Executing path 1..."
	#group1.go()

	file = open('plan_data.pkl','wb')
	group2 = moveit_commander.MoveGroupCommander("left_arm")

	print "Generating plan using end effector pose..."
	plan2 = planning(group2)

	pickle.dump(plan2,file)
	file.close()

	rospy.sleep(5);

	print "Executing path 2..."
	#group2.go()

	#print "Visualizing plan..."
	#display_trajectory = moveit_msgs.msg.DisplayTrajectory()
	#display_trajectory.trajectory_start = group1.get_current_joint_values()
	#display_trajectory.trajectory.append(plan1)
	#display_trajectory_publisher.publish(display_trajectory);

def planning(group):
	group_pose = group.get_current_pose()
	group_pose.pose.position.x = 0.5;
	group.set_pose_target(group_pose)
	plan2 = group.plan()
	return plan2

if __name__ == '__main__':
	try:
		move_robot()
	except rospy.ROSInterruptException:
		pass