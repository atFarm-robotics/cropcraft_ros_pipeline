# Possiveis problemas

## 1. Docker acusando Deamon de não estar funcionando

~~~bash

sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

docker compose up -d --build

~~~ 


## Comandos basicos 

~~~bash

docker image rm $(docker image ls -q)
docker build . # Run dockerfile 
docker run <image> . # Run container


~~~
