#FROM centos:latest
#FROM ubuntu:latest
FROM alpine:3.4

WORKDIR /opt/orig

ADD tmp /tmp
ADD orig /opt/orig


CMD sleep 120
