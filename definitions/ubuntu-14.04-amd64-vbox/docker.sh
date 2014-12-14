#!/bin/sh

set -ex

DOCKER="lxc-docker-1.3.3"
FIG="fig==1.0.1"

# Docker
apt-get install -y --force-yes -q curl
curl http://get.docker.io/gpg | apt-key add -
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
apt-get update
echo lxc lxc/directory string /var/lib/lxc | debconf-set-selections
apt-get install -y --force-yes -q xz-utils $DOCKER -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold'
usermod -a -G docker vagrant

# Fig
apt-get install python-pip -y
pip install -U $FIG
