image_name=test
password='123'

echo ${password}|sudo -S docker build --rm -t ${image_name} .


