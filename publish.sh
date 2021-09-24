#!/bin/bash

docker build -t salaozen/ruby-postgresql:2.6.8 .
docker push salaozen/ruby-postgresql:2.6.8
