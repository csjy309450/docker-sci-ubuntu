#!/bin/bash
#pull的镜像名,原始镜像
FROM ubuntu

# 完成一些必要库的安装
RUN apt-get update
RUN apt-get install -y gedit
RUN apt-get install -y python
RUN apt-get install -y libqt4-dev qt4-qtconfig libqt4-sql qt4-dev-tools qt4-doc qt4-demos qt4-designer --fix-missing
RUN apt-get install -y libxext6 "python-qt4-*" python-qt4 --fix-missing
RUN apt-get install -y git-gui

# 设置一些必要的系统权限
RUN export uid=$(id -u) gid=$(id -g)
RUN mkdir -p /home/developer
RUN echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd
RUN echo "developer:x:${uid}:" >> /etc/group
RUN echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chmod 0440 /etc/sudoers
RUN chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
#CMD git gui #测试
