# AMBIENTE SIMULADO ROS 

## Objetivo
> ```
>  Este projeto tem como objetivo criar um ambiente de simulação para cultivos diversos "
> ```

## Ferramentas e Containeres  

* [Blender](https://hub.docker.com/r/linuxserver/blender) >> Ferramenta de Criação de objetos e ambientes 3D

* [Cropcraft](https://github.com/Romea/cropcraft) >> CropCraft é um script python que gera modelos 3D de campos de cultivo, especializado em simulação em tempo real de aplicativos de robótica.

* [Ros](https://github.com/CIFASIS/weed_robot_description/tree/bb78a3cfc8ab1cc2623cf968375e85a9d3cbf88e) >> Simulação do robô de capina de soja desenvolvido pelo CIFASIS.

## Bibliotecas Python(Cropcraf)

1.  [Appdirs](https://pypi.org/project/appdirs/) >> A small Python module for determining appropriate platform-specific dirs

* [bpy](https://pypi.org/project/bpy/) >> This package provides Blender as a Python module for use in studio pipelines, web services, scientific research, and more.

* [certifi](https://pypi.org/project/certifi/) >> Certifi provides Mozilla’s carefully curated collection of Root Certificates for validating the trustworthiness of SSL certificates while verifying the identity of TLS hosts.

* [charset-normalizer](https://pypi.org/project/charset-normalizer/) >> A library that helps you read text from an unknown charset encoding. 
* [click](https://pypi.org/project/click/) >> Click is a Python package for creating beautiful command line interfaces in a composable way with as little code as necessary.
* [Cython](https://pypi.org/project/Cython/) >> The Cython language makes writing C extensions for the Python language as easy as Python itself. Cython is a source code translator based on Pyrex, but supports more cutting edge functionality and optimizations.
* [Idna](https://pypi.org/project/idna/) >> Support for the Internationalized Domain Names in Applications (IDNA) protocol as specified in RFC 5891. This is the latest version of the protocol and is sometimes referred to as “IDNA 2008”.
* [numpy](https://pypi.org/project/numpy/) >> NumPy is the fundamental package for scientific computing with Python.

* [pydub](https://pypi.org/project/pydub/) >> Manipulate audio with an simple and easy high level interface.

* [python-core](https://pypi.org/project/python-core/#description) >> ?

* [PyYAML](https://pypi.org/project/PyYAML/) >> YAML is a data serialization format designed for human readability and interaction with scripting languages. PyYAML is a YAML parser and emitter for Python.

* [requests](https://pypi.org/project/requests2/) >> Requests is the only Non-GMO HTTP library for Python, safe for human consumption.

> Warning:
>~~~
>        Recreational use of the Python standard library for HTTP may >  result in dangerous side-effects, including: security vulnerabilities, verbose code, reinventing the wheel, constantly reading documentation, depression, headaches, or even death.
> ~~~

* [SpeechRecognition](https://pypi.org/project/SpeechRecognition/) >> Library for performing speech recognition, with support for several engines and APIs, online and offline.

* [typing_extensions](https://pypi.org/project/typing-extensions/) >> ?  

* [urllib3](https://pypi.org/project/urllib3/) >> urllib3 is a powerful, user-friendly HTTP client for Python. Much of the Python ecosystem already uses urllib3 and you should too. urllib3 brings many critical features that are missing from the Python standard libraries: 

* [zstandard](https://pypi.org/project/zstandard/) >> This project provides Python bindings for interfacing with the Zstandard compression library. A C extension and CFFI interface are provided.

---
# Como Executar 

 #### No repositório raiz: 

~~~bash 
docker compose up -d --build
~~~

# CropCraft

CropCraft is a python script that generates 3D models of crop fields, specialized in
real-time simulation of robotics applications.

![Example of field](doc/imgs/field_demo.png)

* Designed for real-time simulation
* Suitable for use with LiDARs and cameras
* Highly configurable (YAML file)
* Provide ground truth data (identify plant types in LiDAR data)

## Requirements

This program uses blender container as a backend.
The minimal required version is `4.0`.
Ensure that blender is launchable from the command line.
It means that blender must be accessible using the `PATH` environment variable.

You also need to install some python requirements:
```
pip install -r requirements.txt
```

## Running

To generate a crop field, you first need to create a configuration file (YAML formats).
Some examples are available in the [`examples`](/examples) directory.
Then you can execute the `cropcraft.py` script and specify the path of the chosen configuration
file.
```
python3 -m venv venv

. ./venv/bin/activate

python3 cropcraft.py examples/test1.yaml
```
This command will generate a blender file named `test1.blend` and a gazebo model named `test1`

Some options are available and described using
```
python3 cropcraft.py --help
```

# Blender 

[Blender](https://www.blender.org/) is a free and open-source 3D computer graphics software toolset used for creating animated films, visual effects, art, 3D printed models, motion graphics, interactive 3D applications, virtual reality, and computer games.

## Aplication Setup 

The application can be accessed at:

- http://yourhost:3000/
- https://yourhost:3001/

## TimeZone

* [List of tz database time zone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List)

## Suport Info 

* Shell access whilst the container is running:

~~~bash
docker exec -it blender /bin/bash
~~~

* To monitor the logs of the container in realtime:

~~~bash
docker logs -f blender
~~~

Container version number:

~~~bash
docker inspect -f '{{ index .Config.Labels "build_version" }}' blender
~~~

Image version number:

~~~bash
docker inspect -f '{{ index .Config.Labels "build_version" }}' lscr.io/linuxserve
~~~

## User / Group Identifiers

When using volumes (-v flags), permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user PUID and group PGID.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance PUID=1000 and PGID=1000, to find yours use id your_user as below:

> id your_user

Example output:

> uid=1000(your_user) gid=1000(your_user) groups=1000(your_user)

# Ros - Weed Robot Simulation (Melodic/Noetic)

Simulation of the soybean crop weeding robot developed by CIFASIS.

## Video

<a href="https://youtu.be/NlTgNNLH3LA" target="_blank">
  <img src="https://github-production-user-asset-6210df.s3.amazonaws.com/6648400/260785714-3ec3388d-eb23-4e74-a1d2-6f0e85e57144.png" alt="weed_robot_simulation" width="700" />
</a>

## License

weed_robot_simulation is released under BSD-2-Clause license.

If you use weed_robot_simulation in an academic work, please cite:

@article{ait2023travelling,  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  title = {{A Travelling Salesman Problem Approach to Efficiently Navigate Crop Row Fields with a Car-Like Robot}},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  author = {Ait, Ismael and Kofman, Ernesto and Pire, Taih{\\'u}},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  journal = {IEEE Latin America Transactions},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  volume = {21},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  number = {5},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  pages = {643-–651},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  month = {April},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  year = {2023},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  issn = {1548-0992},  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  url = {https://latamt.ieeer9.org/index.php/transactions/article/view/7751} 
  
}

## Installation with Docker

### Dependencies

Install docker using apt and not the snap package.

```
sudo apt install docker.io
```

Install rocker

```
sudo apt-get install python3-rocker
```

Install Nvidia GPU and GUI support packages

```
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
	
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

curl -s -L https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
```

Restart docker daemon

```
sudo systemctl restart docker
```

### Build docker container

```
docker build . --tag navigation:latest
```

## Running

Run docker image

```
rocker --nvidia --x11 navigation:latest
```

In the opened shell run the navigation script *weed_robot.sh*, for example:

```
src/weed_robot_navigation/bin/weed_robot.sh -n -s -g -v -w field -m field \
	-t "[3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]" \
	-p "-x -14.56 -y -12.0 -Y 1.570796327"
```


## Observação

* [Arquivo para histórico de problemas](helpme.md)