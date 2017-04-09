image_name=test
container_name=ctest

xhost +
sudo docker run --log-driver="syslog" -tid --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/yangzheng/test:/mnt --name=${container_name} --hostname=${container_name} ${image_name} bash -c "while true;do echo hello world;sleep 1; done"
