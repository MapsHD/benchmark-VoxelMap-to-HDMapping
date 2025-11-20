ARG ROS_DISTRO=noetic
FROM ros:${ROS_DISTRO}-ros-base

SHELL ["/bin/bash", "-lc"]

RUN apt-get update && apt-get install -y python3-colcon-common-extensions nlohmann-json3-dev libpcl-dev python3-pip
RUN pip3 install rosbags
RUN mkdir -p /test_ws/src
COPY src/ /test_ws/src
RUN cd /test_ws && source /opt/ros/${ROS_DISTRO}/setup.bash && rosdep update && rosdep install --from-paths src --ignore-src -r -y || true && source /opt/ros/${ROS_DISTRO}/setup.bash && colcon build
