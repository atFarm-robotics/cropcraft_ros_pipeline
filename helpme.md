# Possiveis problemas

## 1. Docker acusando Deamon de não estar funcionando

~~~bash

sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

docker compose -f "dockercompose.yaml" up -d --build

~~~ 