#!/usr/bin/env bash

# export DOCKER_HOST=ssh://user@host

docker run -d -e RAILS_ENV=production -p 80:9292 --restart=unless-stopped thesmallestrailsapp
