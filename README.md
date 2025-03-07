# About
Memcached HealthCheck - A docker image for memcached with the following modifications:
 - added an image-internal health check mechanism

# Contents
This project contains the following:
 - Everything that is needed for building the image

# Requirements
Intention was to use the bare minimum of required commands for building this (without make or anything of the like):
 - bash
 - sed 
 - docker

# Thanks, credits, etc.
First of all, the whole team of memcached for their great work - both on the software itself and on the original memcached Docker image.

Second, John White for his great work on creating a version of a memcached image with a healtch check.
Some portions of this project are based on the original work of John White available from https://github.com/johnhwhite/memcached-healthcheck.
Despite all the good work, the memcache version used in that project is somewhat outdated and the netcat package name for the Debian base distribution (upon which the original memcached image is based) has changed with more recent versions and thus needed an update.

Third, the whole team of Debian for their great work.
