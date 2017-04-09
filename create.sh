image_name=test
container_name=ctest
host_user=yangzheng

xhost +
sudo docker create -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/${host_user}/test:/mnt --name=${container_name} --hostname=${container_name} ${image_name}
