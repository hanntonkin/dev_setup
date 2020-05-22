sudo docker run -it --privileged \
  --env=LOCAL_USER_ID="$(id -u)" \
  -v $WORKSPACE:/home/dev \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -e DISPLAY=:0 \
  -p 14557:14557/udp \
  --name pxros px4_dev tmux
