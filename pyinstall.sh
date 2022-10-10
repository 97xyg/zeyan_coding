#!/bin/bash
yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make -y
yum install libffi-devel -y
cd ~
wget http://cdn.npmmirror.com/binaries/python/3.8.5/Python-3.8.5.tgz
tar -zxvf Python-3.8.5.tgz
cd Python-3.8.5
./configure prefix=/usr/local/python3
make && make install
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
cd ~
rm -rf Python-3.8.5 Python-3.8.5.tgz
echo "脚本执行完成！"
echo "输入python3 -V 验证python3是否安装成功，输入pip3 -V 验证匹配是否成功"
