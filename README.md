# cloud9
A Dockerimage for building Cloud9 Instances for diffrent Projects
# docker cloud9
A simple blank cloud9 Container definition

it offers a VOLUME /workspace

## Use

```bash
docker run -v $PWD/workspace:/workspace cloud9
```

# Cloud9 instance

A Cloud9 instance with latest version from https://github.com/c9/core

The goal is to provide the lightest possible image. 

Latest is build on node:slim. 
Other tags exist ready for some programming language ([alpine](https://github.com/sapk/dockerfiles/blob/master/cloud9/Dockerfile.alpine), [golang](https://github.com/sapk/dockerfiles/blob/master/cloud9/Dockerfile.golang), [golang-alpine](https://github.com/sapk/dockerfiles/blob/master/cloud9/Dockerfile.golang.alpine), [cordova-android](https://github.com/sapk/dockerfiles/blob/master/cloud9/Dockerfile.cordova-android)).

Docker hub: https://registry.hub.docker.com/u/dockerimages/cloud9/

## Usage

### Start with auth

    docker run -d -v $(pwd):/workspace -p 8181:8181 dockerimages/cloud9 --auth username:password
    
You can also use any starting option describe in : https://github.com/c9/core

### Use custom user settings

    docker run -d -v $(pwd):/workspace -v /home/user/c9.settings:/root/.c9/user.settings -p 8181:8181 sapk/cloud9

Where /home/user/c9.settings is the user.settings file on your file system

## Notes

If you want to only expose cloud9 localy use -p 127.0.0.1:8181:8181 instead of -p 8181:8181. Otherwise it will be accesible to any equipement that can acces to your PC through the network.

You need to set auth because if not set the server will only listen to inner-container localhost host and wouldn't be available to the host.

<table id="w92aac21c39c13b4b3b9b3">

<tbody>

<tr>

<th>**Image ID**</th>

<th>**Contents**</th>

<th>**Definition**</th>

</tr>

<tr>

<td>

[cloud9/workspace](https://hub.docker.com/r/cloud9/workspace/)

</td>

<td>

Ubuntu 14.04.5 with common tools such as Git, Node.js, OpenJDK, Apache Ant, Apache Maven, Nginx, MySQL, PostgreSQL, Ruby, Apache HTTP Server, and PHP.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/workspace/Dockerfile)

</td>

</tr>

<tr>

<td>

[cloud9/ws-android](https://hub.docker.com/r/cloud9/ws-android/)

</td>

<td>

The contents of the `cloud9/workspace` image with the Android SDK, Gradle, and common Android tools.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/ws-android/Dockerfile)

</td>

</tr>

<tr>

<td>

[cloud9/ws-cpp](https://hub.docker.com/r/cloud9/ws-cpp/)

</td>

<td>

The contents of the `cloud9/workspace` image with the GNU Compiler Collection (GCC) and sample C and C++ command line applications.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/ws-cpp/Dockerfile)

</td>

</tr>

<tr>

<td>

[cloud9/ws-default](https://hub.docker.com/r/cloud9/ws-default/)

</td>

<td>

The contents of the `cloud9/workspace` image with a basic readme file.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/ws-default/Dockerfile)

</td>

</tr>

<tr>

<td>

[cloud9/ws-html5](https://hub.docker.com/r/cloud9/ws-html5/)

</td>

<td>

The contents of the `cloud9/workspace` image with a sample HTML file.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/ws-html5/Dockerfile)

</td>

</tr>

<tr>

<td>

[cloud9/ws-meteor](https://hub.docker.com/r/cloud9/ws-meteor/)

</td>

<td>

The contents of the `cloud9/workspace` image with Meteor and a sample Meteor application.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/ws-meteor/Dockerfile)

</td>

</tr>

<tr>

<td>

[cloud9/ws-nodejs](https://hub.docker.com/r/cloud9/ws-nodejs/) (this sample)

</td>

<td>

The contents of the `cloud9/workspace` image with additional versions of Node.js and a sample chat server application.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/ws-nodejs/Dockerfile)

</td>

</tr>

<tr>

<td>

[cloud9/ws-php](https://hub.docker.com/r/cloud9/ws-php/)

</td>

<td>

The contents of the `cloud9/workspace` image with a sample PHP application.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/ws-php/Dockerfile)

</td>

</tr>

<tr>

<td>

[cloud9/ws-python-plain](https://hub.docker.com/r/cloud9/ws-python-plain/)

</td>

<td>

The contents of the `cloud9/workspace` image with several versions of Python and a sample web application.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/ws-python-plain/Dockerfile)

</td>

</tr>

<tr>

<td>

[cloud9/ws-python](https://hub.docker.com/r/cloud9/ws-python/)

</td>

<td>

The contents of the `cloud9/workspace` image with Django.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/ws-python/Dockerfile)

</td>

</tr>

<tr>

<td>

[cloud9/ws-ruby](https://hub.docker.com/r/cloud9/ws-ruby/)

</td>

<td>

The contents of the `cloud9/workspace` image with several versions of Ruby and Ruby on Rails.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/ws-ruby/Dockerfile)

</td>

</tr>

<tr>

<td>

[cloud9/ws-wordpress](https://hub.docker.com/r/cloud9/ws-wordpress/)

</td>

<td>

The contents of the `cloud9/workspace` image with WordPress.

</td>

<td>

[Definition](https://github.com/c9/templates/blob/master/ws-wordpress/Dockerfile)

</td>

</tr>

</tbody>

</table>


This sample shows you how to connect an Cloud9 SSH development environment to a 
running Docker container. This enables you to use the Cloud9 IDE to work with 
code and files inside of a Docker container and to run commands on that 
container.


Build a Dockerimage for The Workspace used for the cloud9 instance
```
# Build a Docker image based on the cloud9/ws-nodejs Docker image.
FROM cloud9/ws-nodejs

# Enable the Docker container to communicate with The Host by installing SSH.
RUN apt-get update && apt-get install -y openssh-server

# Ensure that Node.js is installed.
RUN apt-get install -y nodejs && ln -s /usr/bin/nodejs /usr/bin/node

# Disable password authentication by turning off the
# Pluggable Authentication Module (PAM).
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

# Add the public key to the Docker container.
# This assumes a file named authorized_keys containing the
# SSH public key already exists in the same
# directory as the Dockerfile.
RUN mkdir -p /home/ubuntu/.ssh
ADD ./authorized_keys /home/ubuntu/.ssh/authorized_keys
RUN chown -R ubuntu /home/ubuntu/.ssh /home/ubuntu/.ssh/authorized_keys && \
chmod 700 /home/ubuntu/.ssh && \
chmod 600 /home/ubuntu/.ssh/authorized_keys

# Start SSH in the Docker container.
CMD /usr/sbin/sshd -D

# Update the password to a random one for the user ubuntu.
RUN echo "ubuntu:$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)" | chpasswd
```

```
sudo docker run -d -it --expose 9090 -p 0.0.0.0:9090:22 --name cloud9 cloud9-image:latest
```

