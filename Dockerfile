FROM ubuntu:14.04

RUN apt-get update -qq
RUN echo "set -o vi" > /.bashrc
RUN apt-get -yq install silversearcher-ag vim telnet
# for 'dig':
RUN apt-get -yq install dnsutils
