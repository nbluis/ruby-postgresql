#!/bin/bash

docker build -t salaozen/ruby-postgresql:2.6.6_cypress .
docker push salaozen/ruby-postgresql:2.6.6_cypress
