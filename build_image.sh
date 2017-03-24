image_name=test
container_name=ctest
password='123'

echo ${password}|sudo -S docker build --rm -t ${image_name} .
xhost +
echo ${password}|sudo -S docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/yangzheng/test:/home/myShare --name=${container_name} --hostname=${container_name} ${image_name}
