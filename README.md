# Image Semantic Segmentation models
This repository contains 2 models:  
Our 3<sup>rd</sup> and 4<sup>th</sup> research models [mmsegmentation](https://github.com/Ilite-Kiriya/semantic-models/tree/main/mmsegmentation) 
and [DDRNet](https://github.com/Ilite-Kiriya/semantic-models/tree/main/m4_DDRNet), storing the programs for 
each model and using Docker containers to create a consistent environment for them to be run in. Documentation for the individual 
models are stored in their respective folders.   

Two other models can be found here:  
Model 1: [DecoupleSegNets](https://bitbucket.org/kiriyachristin/comp3888_th16_03_repom1/src/master/)  
Model 2: [HANet](https://bitbucket.org/abstractblaze/hanet/src/master/)  

## Jupyter Notebook
Jupyter notebook is used to provide a GUI on the server.
- Install Jupyter Notebook
```
conda install -c anaconda jupyter
```

There are two options connect to the server:

[1] Server running the jupyter notebook in port 8889
```
jupyter notebook --generate-config
jupyter notebook password
```
- Check the secret key:
```
vim /Users/you/.jupyter/jupyter_notebook_config.json
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout mykey.key -out mycert.pem
jupyter notebook --certfile=mycert.pem --keyfile mykey.key
vim /root/.jupyter/jupyter_notebook_config.py
```

- Edit the config file:
```
c.NotebookApp.ip = '[server IP]'
c.NotebookApp.password = u'sha:ce...SECRET KEY'
c.NotebookApp.open_browser = False
c.NotebookApp.port =8889 #port for your local machine
```

- Run the command line to open jupyter notebook
```
jupyter notebook
```
Then the terminal will show a link that allow your local machine to access the server: for instance,  http://[Server Address]:8889/

[2]  Using VScode directly access to the server

ipynb files can also be executable in VScode, same as the online server Jupyter Notebook. The instructions are below.
- F1 options on VScode
- Check Remote-SSH: Add New SSH Host: ssh [User]@[Server IP]

## TensorBoard
- We use Tensorboards to visulize scalars instructions below to install tensorboards.
- Install by command line below (see reference 6)
```
pip install torch-tb-profiler
```
- Or
  
```git clone https://github.com/pytorch/kineto.git
Cd kineto/tb_plugin
pip install
```

## Docker Installation
Individual information provided in the model sections. Please install Docker through normal linux pathways.

### Install dependencies:
```
sudo apt-get update
sudo apt-get install  apt-transport-https  ca-certificates  curl  gnupg  lsb-release
```
### Add secret key:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
### Add a stable database:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
### Install Docker Engine, containerd, and Docker Compose.:
```
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```
### Create docker group:
```
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 
```
### Protential issuses:

1.Error massages: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?  
run this command to give the AUTHENTICATION.  
```
systemctl start docker
```

2. “Sub-process /usr/bin/dpkg returned an error code (1)” error when Install Docker Engine, containerd, and Docker Compose.  
run this command to Reconfiguring the database.  
```
sudo dpkg --configure -a
```

## General Docker
- Dockerfile: this file will set up a docker image  
- Create a image to run a Dockerfile in directory: docker/  
```
docker build -t {IMAGE_NAME} docker/
```  
For instance:  
```
docker build -t mmsegmentation docker/
```  

- List images to check if the image has been created:
```
docker images
```

## Run the image that created by Dockerfile:
- Host data: the data in the host that export the data into docker image
- Docker: data: import the data from the host as a data directory

```
docker run --gpus all --shm-size=8g -it -v {Host: data}:{Docker: data} {IMAGE_NAME}
```
For instance:
```
docker run --gpus all --shm-size=8g -it -v /home/usyd-05a/data:/mmsegmentation/data mmsegmentation
```  

```diff
! There are few basic packages in Docker, not all of them have been installed. This means you may need to install some packages in the container.
```  

## Process
- Models are first trained, then evaluated. All models will use mean IOU (mIOU) as a measure of their accuracy, defined by the overlap between predicted out and target segmentation mask. 

- The dataset is downloaded from official [website](https://www.cityscapes-dataset.com/)
```diff
+ NOTE: Any errors with memory, for example pertaining to CUDA, is foremostly likely due to insufficient computing resources on the server. Please try again when there is little usage to see if the issue is resolved.
```

## Code Style
As the models are predeveloped and obtained online, code style is not applicable. However any Python files created by the group will use PEP 8.

## Benchmarking

README presented in the Benchmarking folder

## Authors
Docker: Kangyue(kann) Fu  
Model 3 training/improvement: Kangyue(Kann) Fu  
Model 4 training/improvement: [Ruoshui(Christin) Chen](https://github.com/ChristinChen233)  
Benchmark: Jonathan Wang  
