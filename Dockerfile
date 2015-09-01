FROM ubuntu:14.04

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update -qq
RUN apt-get install -yq apt-transport-https

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"

RUN apt-get update -qq
RUN echo "set -o vi" >> /.bashrc

RUN apt-get -yq install silversearcher-ag \
  vim telnet dnsutils  wget curl \
  netcat socat colordiff traceroute \
  tcptraceroute python-dev git unzip lsof psmisc pv \
  python-pip mysql-client postgresql-client awscli dc lxc-docker \
  python-yaml graphviz python3-pip golang groff libpq-dev \
  zsh
# upgrade pip:
RUN pip install -U pip
RUN pip install tutum postdoc httpie httpbin gunicorn csvkit pyyaml jinja2 pandas psycopg2 ipdb "ipython[notebook]"
RUN echo "set editing-mode vi" >> /etc/inputrc
RUN echo "set -o vi" >> /etc/zsh/zshrc

ENV GOPATH /go

# this doesn't yet work in containers.  Watch: # https://github.com/draios/sysdig/issues/152
# http://www.sysdig.org/wiki/how-to-install-sysdig-for-linux/
#RUN curl -s https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public | apt-key add -
#RUN curl -s -o /etc/apt/sources.list.d/draios.list http://download.draios.com/stable/deb/draios.list
#RUN apt-get update
#RUN apt-get -y install sysdig

# I get '/usr/bin/zsh: can't open input file: <blah>' if I try to use this
# non-interactively. There was a problem with with bash that seems similar
# where CMD was being polluted by the parent image.  But that was fixed in
# 1.2.0 and this works okay with bash.  Why would it break with zsh?
# ENTRYPOINT ["zsh"]

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  apt-key add - && \
  apt-get update && \
  apt-get install -yq postgresql-client-9.4
