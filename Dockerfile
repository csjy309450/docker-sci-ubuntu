#!/bin/bash
FROM ubuntu

RUN export user_name=yangzheng
# 完成一些必要库的安装
RUN apt-get update
RUN apt-get install -y gedit
RUN apt-get install -y python
RUN apt-get install -y libqt4-dev qt4-qtconfig libqt4-sql qt4-dev-tools qt4-doc qt4-demos qt4-designer --fix-missing
RUN apt-get install -y libxext6 "python-qt4-*" python-qt4 --fix-missing
RUN apt-get install -y git-gui

# 设置一些必要的系统权限
RUN export uid=$(id -u) gid=$(id -g)
RUN mkdir -p /home/${user_name}
RUN mkdir -p /home/myShare
# 注册用户
RUN echo "${user_name}:x:${uid}:${gid}:${user_name},,,:/home/${user_name}:/bin/bash" >> /etc/passwd
RUN echo "${user_name}:x:${uid}:" >> /etc/group
RUN echo "${user_name} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN chmod 0440 /etc/sudoers
RUN chown ${uid}:${gid} -R /home/${user_name}

USER ${user_name}
ENV HOME /home/${user_name}
#CMD git gui #测试
