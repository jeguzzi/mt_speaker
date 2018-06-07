FROM jeguzzi/ros:armhf-melodic-ros-dev
MAINTAINER Jerome Guzzi "jerome@idsia.ch"

RUN apt-get update && apt-get install -y \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-tools \
    gstreamer1.0-alsa \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    libttspico-utils \
    sox \
    libsox-fmt-all \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/jeguzzi/audio_common.git src/audio_common

COPY . src/mt_speaker

RUN catkin build
