#!/bin/bash

docker build -t kibana-own docker/kibana/.

docker push kibana-own