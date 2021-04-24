#!/bin/bash

docker build -t salaozen/salaozenweb-buildimage:2.6.7 .
docker push salaozen/salaozenweb-buildimage:2.6.7
