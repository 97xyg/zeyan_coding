#!/bin/bash
cd /opt
#下载tomcat
wget https://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.54/bin/apache-tomcat-8.5.54.tar.gz
#解压tomcat
tar -zxvf apache-tomcat-8.5.54.tar.gz
#移除tomcat压缩包
rm -f apache-tomcat-8.5.54.tar.gz
#修改解压文件名称为tomcat
mv apache-tomcat-8.5.54/ tomcat
#下载jenkins
wget https://mirrors.tuna.tsinghua.edu.cn/jenkins/war/2.233/jenkins.war
#把jenkins移动到tomcat的webapps里面
mv jenkins.war ./tomcat/webapps
#启动tomcat
/opt/tomcat/bin/startup.sh
#清除防火墙规则
iptables -F
#增加tomcat开机自启以及开机清除防火墙规则shell文件
echo -e "/opt/tomcat/bin/startup.sh\niptables -F" >/etc/profile.d/autoStartTomcat.sh
#切换至用户家目录
cd ~
#获取ip地址
ip=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d '/')
#输出浏览器访问路径
echo 请在浏览器中访问http://$ip:8080/jenkins
