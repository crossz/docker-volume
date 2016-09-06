# docker-volume

Here I want to mount a local FILE into a docker container by --volume(-v), while not a directory. However, things are different if I pick different base images.

The issue here is that, image based FROM alpine, can not mount the FILE correctly, i.e. I can not modify and replace it inside the container; while, those ones FROM ubuntu/centos, if the uid/gid are same, are all good as expected.

Here are the demo I uses:

- Dockerfile:

>     FROM alpine:3.4
>     #FROM ubuntu:latest
>     #FROM centos:latest
>         
>     WORKDIR /opt/orig
> 
>     ADD tmp /tmp
>     ADD orig /opt/orig
> 
>     CMD sleep 120

- docker-compose.yml:

>     version: "2"
>     
>     services:
>       test:
>         build: .
>         volumes:
>           - ./orig/config.prop:/opt/orig/config.prop:rw
>         image: test4vol


If I use alpile as base image, and run the cp command inside the container, will look like this:

    /opt/orig # cp /tmp/config.prop . 
    
    cp: can't create './config.prop': File exists


This leads to that the script inside the container can not replace the file, this is bad for me.

However, if I change to the base image of ubuntu/centos, everything is good.

I know mounting a file for docker by --volume is not recommended, but here I want to know did you guys have the same issue here? or is this a bug or alpine did this on purpose?

Thanks,
Cross



