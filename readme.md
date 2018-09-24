# Attempt to optimize Windows performance of Dockerized applications

## Purpose of this repository

Virtual box share folder protocol is too slow, especially with using a lot of small files. That's why I tried to explore several ways, how to optimize this behavioral.

- This repository contains basic Symfony 2 project in 2 docker containers
- There are used 2 ways to create a local environment for developement
- Try to Optimize page load speed by backward sharing from Vagrant via samba

---------------------------------------------------------------------------

# Docker-machine way

Demonstration of standard setup using `docker-machine` with `docker-compose`, setting up two containers.

## Advantages

- Everything is setup as you'd expect.

## Disadvantages

- Page speed is slow.

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

# Vagrant way (Reverse folder sharing)

It uses the same docker containers, but uses `vagrant` instead of `docker-machine`. During the setup, Vagrant VM is pulling the repository onto its virtual disk (non shared) and then share it reversely via samba protocol back to windows.

*Notice: HyperV has to be disabled*

## Advantages

- Page load speed is super fast

## Disadvantages

- Since code is lying inside of the VM, any crash of this VM can cause loss of your uncommited changes.
- Opening shared SMB folder in IDE (PhpStorm) is slow.

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