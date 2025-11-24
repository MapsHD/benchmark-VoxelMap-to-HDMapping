ARG ROS_DISTRO=noetic
FROM ros:${ROS_DISTRO}-ros-base
ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-lc"]

RUN apt-get update && apt-get install -y python3-colcon-common-extensions ros-${ROS_DISTRO}-pcl-ros git nlohmann-json3-dev libpcl-dev python3-pip ros-${ROS_DISTRO}-cv-bridge ros-${ROS_DISTRO}-eigen-conversions ros-${ROS_DISTRO}-tf libceres-dev ros-${ROS_DISTRO}-image-transport
RUN pip3 install rosbags
RUN mkdir -p /test_ws/src
COPY src/ /test_ws/src
RUN cd /test_ws && source /opt/ros/${ROS_DISTRO}/setup.bash && rosdep update && rosdep install --from-paths src --ignore-src -r -y || true && source /opt/ros/${ROS_DISTRO}/setup.bash && colcon build
