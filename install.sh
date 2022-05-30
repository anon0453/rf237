#!/bin/bash

sudo apt-get update
sudo apt-get install mininet -y
sudo apt-get install apache2 -y  
sudo apt-get install x264 -y
sudo apt-get install gpac -y

wget https://github.com/anon0453/rf237/archive/master.tar.gz
tar -xf master.tar.gz


cd rf237-main

sudo mv dashjs /var/www/html 

cd videos

sudo x264 --output bbb_1200k.264 --fps 30 --bitrate 1200 --video-filter resize:width=1280,height=720 bbb1.mp4
sudo MP4Box -add bbb_1200k.264 -fps 30 bbb_1200k.mp4
sudo MP4Box -dash 4000 -frag 4000 -rap -segment-name segment_1200k_ bbb_1200k.mp4

sudo x264 --output bbb_600k.264 --fps 30 --bitrate 600 --video-filter resize:width=1280,height=720 bbb1.mp4
sudo MP4Box -add bbb_600k.264 -fps 30 bbb_600k.mp4
sudo MP4Box -dash 4000 -frag 4000 -rap -segment-name segment_600k_ bbb_600k.mp4


sudo x264 --output bbb_300k.264 --fps 30 --bitrate 300 --video-filter resize:width=1280,height=720 bbb1.mp4
sudo MP4Box -add bbb_300k.264 -fps 30 bbb_300k.mp4
sudo MP4Box -dash 4000 -frag 4000 -rap -segment-name segment_300k_ bbb_300k.mp4






