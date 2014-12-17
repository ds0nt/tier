Share
=============

This directory will be copied into each new tier project to be shared with the vm over nfs.

# scripts

tier.sh is a script that provides easy access to commands in the share/scripts folder. By default a /usr/bin/tier is symbolically linked to this.

```bash
# calling tier.sh from normal file
$ ./tier.sh scriptname
 
# with symbolic link
$ tier scriptname 
```
