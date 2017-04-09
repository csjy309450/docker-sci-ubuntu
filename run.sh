image_name=test
container_name=ctest
host_user=yangzheng

xhost +
sudo docker run -tid --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/${host_user}/myShare:/home/myShare --name=${container_name} --hostname=${container_name} ${image_name}
