#!/bin/bash

docker build -t logstash-own docker/logstash/.

docker push logstash-own