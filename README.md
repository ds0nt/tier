vagrant-coreos-spawner
======================

Tool to launch and manage single vagrant instances running coreos+docker for local development. This makes it simple to develop in an environment that closely matches a production environment running coreos + docker. Any tools to facilitate vagrant + coreos + docker workflow are welcome. 

By default it will spawn an instance running the stable coreos channel.

## Spawn a CoreOS Instance

Make sure you have vagrant and virtualbox installed, and nfs working. It will map a ./share directory to guest os at /home/core/share. 

If you want to alter the behavior, change the vagrant, coreos, or provisioning configuration, edit the files in the ```/config``` folder first.

``` 
$ cd vagrant-coreos-spawner
$ ./init.sh /path/for/instance 
```
[Based on this Guide](https://coreos.com/docs/running-coreos/platforms/vagrant/#single-machine)

## Push Host OS Docker Image into CoreOS

On the Host OS (the one running vagrant), type `` $ docker images `` and you will see a list of images. To copy them inside a running instance, run the following. Note that you need to pull or build an image on the Host OS first. This prevents long delays that would occur if you let CoreOS download each image from scratch.

```
 $ cd /path/for/instance
 $ cd scripts
 $ ./push_image.sh <dockerimage/name>
```

## Sample Docker Image for NodeJS Development

I have included a dockerfile that demonstrates how to use docker as a development environment. It is located in `` /dockerfiles/nodejs-developer``. It extends the basic nodejs dockerfile and adds a volume mount point, so that source code is easily persisted across docker lifecyles and can be built from the containerized environment.

## Fork and Contribute!

You can edit the provision.sh which will be run inside your vagrant instance when it is created to set up things.

Please fork and add any scripts that help development workflow inside of vagrant+coreos+docker! Also, feel free to make the bash scripts not completely noob.
