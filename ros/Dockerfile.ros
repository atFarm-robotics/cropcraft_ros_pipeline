# Use ROS Noetic as the base image
FROM ros:noetic

# Set the user to root
USER root

# Add ROS Noetic repositories
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    git \
    build-essential \
    pkg-config \
    libjpeg-dev \
    libtiff5-dev \
    libpng-dev \
    libgazebo11-dev \
    ros-noetic-catkin \
    && rm -rf /var/lib/apt/lists/*

# Install cpulimit to limit CPU usage
RUN apt-get update && \
    apt-get install -y cpulimit

# Create the Catkin workspace directory and initialize Catkin
WORKDIR /root/catkin_ws/src

# Clone gazebo_ros_pkgs repository
RUN git clone https://github.com/ros-simulation/gazebo_ros_pkgs.git -b noetic-devel

# Update rosdep and install dependencies
RUN rosdep update && \
    rosdep install --from-paths . --ignore-src --rosdistro noetic -y

# Build the Catkin workspace
WORKDIR /root/catkin_ws
RUN catkin_make

# Source ROS setup script
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source /root/catkin_ws/devel/setup.bash" >> ~/.bashrc

# Set a CPU limit of 70% for the container
CMD ["cpulimit", "--limit=70", "-i", "-e", "tail", "-f", "/dev/null"]
