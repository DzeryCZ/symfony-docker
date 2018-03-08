# Symfony in Docker Containers

**Not finished !!!**

Purpose of this repository: 

    - Setup simple Symfony project in two docker containers
    - Attempt to optimize page load speed by backwady sharing from Vagrant via samba

# Docker way

It uses 2 docker containers one for nginx and one for php7-fpm

## Setup

    docker-machine create symfony-docker
    docker-machine env symfony-docker

    cd docker
    docker build - < Dockerfile-php7-fpm

    docker-compose up -d

~ 1.2s to load page

# Vagrant way

**Attempt to optimize performance.**

Create Vagrant machine on your host computer, install docker and symfony inside that Vagrant machine and share code via sambe back to your host computer.


HyperV has be disabled

## Setup

    vagrant up --provision

Add to hosts:

    192.169.33.100  symfony-docker.io

~ 160ms to load page


# Tutorials

## Docker-compose

http://geekyplatypus.com/dockerise-your-php-application-with-nginx-and-php7-fpm/