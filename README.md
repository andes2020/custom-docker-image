# custom-docker-image
Custom docker image integrate with docker, kubectl, aws and minikube configured for testing

![custom-docker-image-github-action](https://github.com/andes2020/custom-docker-image/workflows/custom-docker-image-github-action/badge.svg)

Best practices to make a Dockerfile
https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

Testing image using bash testing framework
https://github.com/bats-core/bats-core

## Dev Steps

1. Install bats-core
```bash
$ sudo sh ./install_bats.sh
```
2. Write new stuff on Dockerfile and add unit test!

# Run tests
```bash
bats test.bat
```

# Get into container locally
```bash
docker run -it --entrypoint /bin/bash andes2020/ubuntu:latest
```