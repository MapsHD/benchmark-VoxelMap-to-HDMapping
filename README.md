# VoxelMap-converter

## Intended use 

This small toolset allows to integrate SLAM solution provided by [VoxelMap](https://github.com/RobustFieldAutonomyLab/LeGO-LOAM) with [HDMapping](https://github.com/MapsHD/HDMapping).
This repository contains ROS 1 workspace that :
  - submodule to tested revision of VoxelMap
  - a converter that listens to topics advertised from odometry node and save data in format compatible with HDMapping.


## Building

Clone the repo
```shell
mkdir -p /test_ws/src
cd /test_ws/src
git clone https://github.com/marcinmatecki/VoxelMap-to-HDMapping.git --recursive
cd ..
catkin_make
```

## Usage - data SLAM:

Prepare recorded bag with estimated odometry:

In first terminal record bag:
```shell
rosbag record /cloud_registered /aft_mapped_to_init
```

and start odometry:
```shell 
cd /test_ws/
source ./devel/setup.sh # adjust to used shell
roslaunch voxel_map mapping_velodyne.launch
```

## Usage - conversion:

```shell
cd /test_ws/
source ./devel/setup.sh # adjust to used shell
rosrun voxelmap-to-hdmapping listener <recorded_bag> <output_dir>
```