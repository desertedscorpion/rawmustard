TO BUILD

time docker build -t taf7lwappqystqp4u7wjsqkdc7dquw/rawmustard .

TO RUN

docker run -it -e DISPLAY --net=host -v $HOME/.Xauthority:/home/developer/.Xauthority --volume=${PWD}/working:/home/emory/working --volume=${PWD}/ssh:/home/emory/.ssh taf7lwappqystqp4u7wjsqkdc7dquw/rawmustard