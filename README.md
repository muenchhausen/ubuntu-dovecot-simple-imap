You find here the repository for the Docker image muenchhausen/ubuntu-dovecot-simple-imap.

## What is it
It is a simple [Dovecot](http://www.dovecot.org) IMAP server with one predefined account for archiving your mail on a locally available NFS share. 


## Requirements
* archive mail on a local IMAP Server at home
* e.g. a NAS server with NFS can be used
* home use requires limited IT security
* solution must allow to migrate easily to new technologies over many years
* as simple as possible :)

## How to use
Create a NFS share with the name mailarchive. Allow your Docker host IP address to access it. 

Start the docker container:  

    docker run --rm --privileged -e NFS_REMOTETARGET=192.168.10.10:/mailarchive -p 143:143 muenchhausen/ubuntu-dovecot-simple-imap -F

Create an imap mail account with username mailarchive and password mailarchive and plain text authentication. Done.

## Adapt and Build it
You can optimize the IT Security settings if required. Just edit the dockerfile and try to build it on your own :)

    docker build -t muenchhausen/ubuntu-dovecot-simple-imap .

## Future Steps
The preferred way is the Unix Way: Small reusable images with clear responsibilities. A nice image is [cpuguy83's nfs-client](https://registry.hub.docker.com/u/cpuguy83/nfs-client/): It can be used to map NFS shares to volumes which can be accessed by any other Docker containers as required. Unfortunately it is not working yet - see this [issue](https://github.com/docker/docker/issues/4213). Let's wait for that, than we work on a more beautiful solution. 

