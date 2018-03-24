#!/bin/bash

if [ $(id -u) -eq 0 ]; then
    apt install xserver-xephyr -y
    Xephyr -screen 1024x768 :1 &
    docker run -v /tmp/.X11-unix:/tmp/.X11-unix kdeneon/plasma:dev-unstable

    # # Via Ruby
    # if ! [ -e ./neondocker.rb ]; then
    #     wget https://cgit.kde.org/docker-neon.git/plain/neondocker/neondocker.rb
    #     gem install docker-api
    #     apt-get install ruby-dev -y
    #     chmod +x ./neondocker.rb
    # fi
    # ./neondocker.rb
else
    echo "Execute como administrador"
fi
