#!/bin/bash

docker build -t salaozen/ruby-postgresql:2.6.6_node .
docker push salaozen/ruby-postgresql:2.6.6_node
