#!/bin/bash

docker build -t elasticsearch-own docker/elasticsearch/.

docker push elasticsearch-own