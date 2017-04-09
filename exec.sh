container=ctest
cmd=bash

xhost +
sudo docker exec -it ${container} ${cmd}
