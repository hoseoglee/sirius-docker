# sirius-docker

## Prerequisite
docker's default base size is 10G but this image bump up 10G. 
resize default base size with some cli commands.
please reference for resizing (http://stackoverflow.com/questions/26546490/resizing-docker-containers)

## Download the source files
* [github. https://github.com/hoseoglee/sirius-docker](https://github.com/hoseoglee/sirius-docker)
```
$ git clone https://github.com/hoseoglee/sirius-docker.git
```

## Build the image
If you'd like to try directly from the Dockerfile you can build the image as:
```
$ docker build -tag sirius-docker .
```

## Pull the image from registry.hub.docker.com
The image is also released as an Docker image from Docker's automated build repository 
- you can always pull or refer the image when launching containers.
```
$ docker pull hoseog/sirius-docker
```

##Start a container
In order to use the Docker image you have just build or pulled use:
```
$ docker run -it --name sirius-docker sirius-docker /bin/bash
```

##Testing ()
