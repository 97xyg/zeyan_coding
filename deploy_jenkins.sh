#!/bin/bash
cd /opt
#下载tomcat
wget https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.54/bin/apache-tomcat-8.5.54.tar.gz
#解压tomcat
tar -zxvf apache-tomcat-8.5.54.tar.gz
#修改名称为tomcat
mv apache-tomcat-8.5.54/ tomcat
#下载jenkins
wget https://mirrors.tuna.tsinghua.edu.cn/jenkins/war/2.233/jenkins.war
#把jenkins移动到tomcat的webapps里面
mv jenkins.war ./tomcat/webapps
#启动tomcat
/opt/tomcat/bin/startup.sh
#清除防火墙规则
iptables -F
#切换至用户家目录
cd ~
ip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d '/')
echo 请在浏览器中访问http://$ip:8080/jenkins
