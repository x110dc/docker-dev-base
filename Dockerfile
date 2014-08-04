FROM ubuntu:14.04

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
