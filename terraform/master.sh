#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "No hostname supplied"
    exit
fi
env=$puppet
echo $env
hostname=`hostname`
apt-get update -y
apt-get upgrade -y
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
apt update -y
apt-get -y install puppetmaster
sed -i "s/$hostname/$env/g" /etc/hostname
sed -i "s/no/yes/g"  /etc/default/puppetmaster
echo "127.0.0.1  puppet.example.net    puppet" >>  /etc/hosts
echo "172.31.52.149  puppet.example.net    puppet" >>  /etc/hosts
echo "172.31.48.231 agent" >>  /etc/hosts
reboot
