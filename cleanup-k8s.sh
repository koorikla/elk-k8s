#!/bin/bash

# Delete elastic search
kubectl delete -f kubernetes/elasticsearch.yaml


# Delete kibana
kubectl delete -f kubernetes/kibana.yaml


# Delete logstash
kubectl delete -f kubernetes/logstash/logstash.yaml


# Delete configuration's
kubectl delete configMap logstash-config
