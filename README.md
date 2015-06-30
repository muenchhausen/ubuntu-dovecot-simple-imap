## What is it
It is a simple [Dovecot](http://www.dovecot.org) IMAP server Docker image with one predefined account for archiving your mail on a locally available NFS share. 


## My personal motivation to create this Docker image
* I need to archive mail on a local IMAP Server at home
* there is a present NFS server (NAS server with NFS)
* home use requires limited IT security
* solution must allow to migrate easily to new technologies over many years
* as simple as possible :)

## How to use
Here I create a NFS share with the name mailarchive. Allow your Docker host IP address to access it. 

Start the docker container:  

    docker run --rm --privileged -e NFS_REMOTETARGET=192.168.10.10:/mailarchive \
    -p 143:143 muenchhausen/ubuntu-dovecot-simple-imap -F

Create an imap mail account with username mailarchive and password mailarchive and plain text authentication. Done.

To stop dovecot by Ctrl-C does not work here. I usally stop it by running 

    docker ps -all
    docker stop <id>

Because I use the --rm docker option, the container will be removed after stopping, which is fine for this use case. Just try also other dovecot options than -F. E.g. option -n will show the actual config.

## Adapt and Build it
You can optimize the IT Security settings if required. Pull it from GitHub. Edit the dockerfile and try to build it on your own :)

    docker build -t muenchhausen/ubuntu-dovecot-simple-imap .

## Future Steps
The preferred way is the Unix Way: Small reusable images with clear responsibilities. One image for Dovecot, one image for the NFS Client - e.g. [cpuguy83's nfs-client](https://registry.hub.docker.com/u/cpuguy83/nfs-client/): Somewhen this can be used to map NFS shares to volumes which can be accessed by any other Docker containers as required. This is not possible today - see [issue](https://github.com/docker/docker/issues/4213). So let's wait.
 

