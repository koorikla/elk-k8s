#!/bin/bash

# Initialize configuration's
kubectl create configmap logstash-config --from-file=kubernetes/logstash/pipeline/logstash.conf

# Start elastic search
kubectl apply -f kubernetes/elasticsearch.yaml


# Start kibana
kubectl apply -f kubernetes/kibana.yaml


# Start logstash
kubectl apply -f kubernetes/logstash/logstash.yaml

