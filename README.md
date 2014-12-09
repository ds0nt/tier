vagrant-coreos-spawner
======================

Tool to launch a single vagrant instance running a coreos. Make sure you have vagrant and virtualbox installed, and nfs working. It will map a ./share directory to guest os at /home/core/share

Uses the stable coreos vagrant box.

Usage

`` $ ./init.sh directory/for/vagrant/garbage ``

[Based on this Guide](https://coreos.com/docs/running-coreos/platforms/vagrant/#single-machine)

You can edit the provision.sh which will be run inside your vagrant instance when it is created to set up things.

Feel free to make this script better, and more full featured. It should make it easy for the user to spawn development instances, and be more configurable.
