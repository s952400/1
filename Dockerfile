  # Nginx
  #
  # VERSION               0.0.1

  FROM      ubuntu
  MAINTAINER Guillaume J. Charmes <guillaume@dotcloud.com>

  # make sure the package repository is up to date
  RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
  RUN apt-get update

  RUN apt-get install -y inotify-tools nginx apache2 openssh-server
  # Firefox over VNC
  #
  # VERSION               0.3

  FROM ubuntu
  # make sure the package repository is up to date
  RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
  RUN apt-get update

  # Install vnc, xvfb in order to create a 'fake' display and firefox
  RUN apt-get install -y x11vnc xvfb firefox
  RUN mkdir /.vnc
  # Setup a password
  RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
  # Autostart firefox (might not be the best way, but it does the trick)
  RUN bash -c 'echo "firefox" >> /.bashrc'

  EXPOSE 5900
  CMD    ["x11vnc", "-forever", "-usepw", "-create"]
  # Multiple images example
  #
  # VERSION               0.1

  FROM ubuntu
  RUN echo foo > bar
  # Will output something like ===> 907ad6c2736f

  FROM ubuntu
  RUN echo moo > oink
  # Will output something like ===> 695d7793cbe4

  # You'll now have two images, 907ad6c2736f with /bar, and 695d7793cbe4 with
  # /oink.
