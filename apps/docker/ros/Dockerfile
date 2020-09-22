FROM px4io/px4-dev-ros-kinetic

ENV DEBIAN_FRONTEND noninteractive

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install -y -q --no-install-recommends apt-utils

RUN apt-get install -y -q vim tmux sudo git wget python3-pip

# Add user
RUN adduser --disabled-password --gecos "" dev &&\
    echo "dev ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dev

USER dev
ENV HOME /home/dev
WORKDIR  /home/dev

ADD vimrc     $HOME/.vimrc
ADD bashrc    $HOME/.bashrc
# ADD tmux.conf $HOME/.tmux.conf

RUN sudo chown dev:dev $HOME/.vimrc $HOME/.bashrc \
    # $HOME/.tmux.conf
    &&\
    sudo chmod 644 $HOME/.vimrc $HOME/.bashrc
    #\$HOME/.tmux.conf

RUN echo 'source /opt/ros/kinetic/setup.bash' >> $HOME/.bashrc

RUN source $HOME/.bashrc &&\
    pip3 install --user git+git://github.com/powerline/powerline

#CMD ["tmux", "-2u"]
