# Obstacle avoidance using ROS and yumi.

This project aims to implement an obstacle avoidance system using a kinect 1.0 for detecting 3D objects.
Once the object is detected, source and destination is programmed uisng Lead Through using YUMI. ROS then plans a path
which is not in collision with the 3D objects or the robot itself and sends the path to yumi/Robotware and executes the
path.



## Getting Started



### Prerequisites

- Ubuntu 14.04
- Ros Indigo
- Ros industrial robot client
- openNI drivers
- ros abb drivers
- RobotStudio 6.04 or above.



### Installing

A step by step series of examples that tell you have to get a development env running

```
sudo apt-get install ros-indigo-moveit-full
sudo apt-get install ros-indigo-openni-camera ros-indigo-openni-launch
sudo apt-get install ros-indigo-industrial-robot-client
sudo apt-get install ros-indigo-abb-driver
```

Edit freenect-xyz.launch and include

```
<node pkg="tf" type="static_transform_publisher" name="yumi" args="1.42 -0.05 -0.26 -3.14 -1.57 3.14  /camera_link /world 100"/>
```
This is the transform between camera node and the robot node.

ROS:


- The MoveIt! config files are in the package test1_moveit_config
- The description (URDF and meshes) are in testpack
- The launch file with Kinect and Octomap integrated is execute.launch. Most launch files have been commented reasonably well, and the parameters have been set to required values/states in all cases.
- The file execute.launch is set up to accept one of 2 possible parameters:
- If you want to connect to the real robot, set robot_ip:=10.140.60.194
- If a sim is fine, set sim:=true
- Important- have to set one of the above 2, as sim is false by default, and if false, it looks for a robot IP.
- The Kinect data being used is part of the launch file freenect-xyz.launch under the freenect_launch package. The TF between the Kinect and the robot is defined there, tweak according to requirements.
- The Python scripts in test1_moveit_config/scripts are coded using the Python MoveIt! API. The basic libraries used are moveit_commander, geometry_msgs, rospy, moveit_msgs.
#### Package structure:
- ~/ws/src
- testpack
- yumi.urdf
- CmakeLists.txt
- package.xml
- launch
- meshes
- worlds
- config
- scripts
- test1_moveit_config
- CMakeLists.txt
- package.xml
- config
- launch
- execute.launch
- test.launch
- scene
- scripts
- mainNode.py
- test.py



#### RobotStudio (RAPID):
- There will be 9 RAPID files in total: 3 .sys files (common, messages and socket, which are common to all tasks) and 6 .mod files (2 each of stateServer, motionServer and motion, 1 for each arm).
- Use the install server tutorial on https://wiki.ros.org/abb for reference as to how to install and run the server.
- Here's the configuration->controller setup:
##### Tasks:
	
Task	Type	TrustLevel	Use Mechanical Unit Group
- MotionServer_left	SEMISTATIC	SysStop	rob_l
- MotionServer_right	SEMISTATIC	SysStop	rob_r
- StateServer_left	SEMISTATIC	NoSafety	rob_l
- StateServer_right	SEMISTATIC	NoSafety	rob_r
- T_ROB_L	NORMAL	N/A	rob_l
- T_ROB_R	NORMAL	N/A	rob_r
##### Automatic Loading of Modules:
File	Task	All Tasks
HOME:/ROS/ROS_common.sys		YES
HOME:/ROS/ROS_socket.sys		YES
HOME:/ROS/ROS_messages.sys		YES
HOME:/ROS/ROS_stateServer.mod	StateServer_left	NO
HOME:/ROS/ROS_stateServer_right.mod	StateServer_right	NO
HOME:/ROS/ROS_motionServer.mod	MotionServer_left	NO
HOME:/ROS/ROS_motionServer_right.mod	MotionServer_right	NO
HOME:/ROS/ROS_motion.mod	T_ROB_L	NO
HOME:/ROS/ROS_motion_right.mod	T_ROB_R	NO


### Restoring Backup:
Restoring backup of robotware should load all the configuration files and automatic loading modules mentioned above. 
Steps to do that:
- Conncet controller to robot studio either via ip or service port.
- Request write access.
- Right click on controller and click restore backup and select obstacle avoidance working.




### Launching files.
```
roslaunch test1_moveit_config execute.launch robot_ip:=10.140.60.194
roscd test1_moveit_config/scripts/
python ./test.py

or 

roslaunch test1_moveit_config execute.launch robot_ip:=10.140.60.194
cd ~/ws/test1_moveit_config/scripts/
python test.py


- Set destination, move away. Press Enter.

- Enable lead through, put the arm in origin position, disable lead through and move away.

- In flexPendent:
    Open production window.
    Set PP to main.
- Press enter on ubuntu machine.
    Immediately press play on flex pendent.


```


## Authors

* **Kartik J** - *Initial work* - [Kartik](mailto:karthikj219@gmail.com)
* **Shridhar Mishra** -  [Email](mailto:shridharmishra4@gmail.com)


