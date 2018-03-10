# Symfony in Docker Containers

Purpose of this repository: 

    - Setup simple Symfony project in two docker containers
    - Optimize page load speed by backward sharing from Vagrant via samba

---------------------------------------------------------------------------

# Docker way

It uses 2 docker containers one for nginx and one for php7-fpm

## Setup

Create Machine

    docker-machine create --driver virtualbox symfony-docker
    docker-machine env symfony-docker
    
Build php image

    cd docker
    docker build - < Dockerfile-php7-fpm

Run containers 

    docker-compose up -d
    
*For the first time, it takes a while, since it's installing all composer dependecies*

---------------------------------------------------------------------------

# Vagrant way

**Attempt to optimize performance.**

Create Vagrant machine on your host computer, install docker and symfony inside that Vagrant machine and share code via samba back to your host computer.

*Notice: HyperV has to be disabled*

## Setup

    vagrant up --provision

*For the first time, it takes a while, since it's downloading all VM images and installing all composer dependecies*

Add to hosts:

    192.168.42.100  symfony-docker.io

Now connect to the samba via `\\192.168.42.100\symfony` and do all your code changes there.


# Performance

## Loadig simple page

| Docker setup | Vagrant setup |
|:------------:|:-------------:|
| 1.2s         | 160ms         |