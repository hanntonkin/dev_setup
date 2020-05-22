WORKSPACE=/Users/hann/Playground/catkin_sim
ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
echo $ip
xhost + $ip
docker run -it --rm \
    -e DISPLAY=$ip:0 -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
    -v $WORKSPACE:/home/dev \
    -p 14557:14557/udp \
    --name rosmaster px4_dev tmux
