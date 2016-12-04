#!/bin/bash
env='puppet'
echo $env
hostname=`hostname`
apt-get update -y
apt-get upgrade -y
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
dpkg -i puppetlabs-release-pc1-trusty.deb
apt update -y
apt-get -y install puppetmaster
sed -i "s/$hostname/$env/g" /etc/hostname
sed -i "s/no/yes/g"  /etc/default/puppetmaster
echo "127.0.0.1  puppet.example.net    puppet" >>  /etc/hosts
reboot