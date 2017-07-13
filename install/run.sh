#!/bin/bash

ucenterVER="/data1/code/ucenter/1.2.1"

# UCenter
docker rm -f tomcat-UCenter
docker run -d --log-driver none --name tomcat-UCenter \
 --net ahcloud --ip 172.18.0.20 \
 -v /etc/localtime:/etc/localtime:ro \
 -v /data1/service/tomcat/catalina.sh:/usr/local/tomcat/bin/catalina.sh \
 -v /data1/service/tomcat/java/java.security:/usr/lib/jvm/java-1.8-openjdk/jre/lib/security/java.security \
 -v $ucenterVER/:/usr/local/tomcat/webapps/ \
 -v /data1/logs/tomcat/ucenter/:/opt/logs/ucenter/ \
 -v /data1/logs/tomcat/ucenter/tomcat/:/usr/local/tomcat/logs/ \
 -p 10001:8080 \
 -p 20880:20880 \
 --restart always \
 tomcat:8.5.15-alpine
