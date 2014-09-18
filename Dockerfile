FROM ubuntu:14.04

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update -qq
RUN apt-get install -yq apt-transport-https
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
RUN apt-get update -qq
RUN echo "set -o vi" >> /.bashrc
RUN apt-get -yq install silversearcher-ag
RUN apt-get -yq install vim
RUN apt-get -yq install telnet
RUN apt-get -yq install dnsutils  # I want dig
RUN apt-get -yq install wget curl
RUN apt-get -yq install netcat socat
RUN apt-get -yq install colordiff
RUN apt-get -yq install traceroute
RUN apt-get -yq install tcptraceroute
RUN apt-get -yq install git
RUN apt-get -yq install unzip
RUN apt-get -yq install lsof
RUN apt-get -yq install psmisc
RUN apt-get -yq install pv
RUN apt-get -yq install python-pip
RUN pip install httpie
RUN apt-get -yq install mysql-client
RUN apt-get -yq install postgresql-client
RUN apt-get -yq install lxc-docker
RUN apt-get -yq install zsh
RUN pip install postdoc
