# Docker Image for [plenv][plenv]

[![docker hub](https://img.shields.io/badge/docker-plenv-blue.svg)](https://hub.docker.com/r/rwstauner/plenv)
[![Build Status](https://travis-ci.org/rwstauner/docker-plenv.svg?branch=master)](https://travis-ci.org/rwstauner/docker-plenv)

Alpine based docker image with deps pre-installed
for compiling perl and installing modules.

Designed for interactive development:
Specify a volume at `/opt/plenv` to persist
your perl and module installations.

## Setup

### Docker Hub

    docker pull rwstauner/plenv

### DIY

    git clone git@github.com:rwstauner/docker-plenv.git
    cd docker-plenv
    docker build -t plenv .

## Use

    docker run -it --rm -v /some/path:/opt/plenv rwstauner/plenv cpan ...

[plenv]: https://github.com/tokuhirom/plenv
