# kubernetes-elk
ELK (Elastic Search, Logstash and Kibana) stack with kubernetes and minikube

### Pre-requisite

- Docker
- Minikube or any existing kubernetes cluster(aws, gce etc.) up and connected via kubectl



### How to Build and push locally (or to any private container registry with simple modifications)

Point your terminal to use the inside minikube local container registry run this:

`eval $(minikube docker-env)`
`docker ps` 

Execute `build_*.sh` script from shell

Uncomment/edit the appropriate containers deployment file under kubernetes folder to use the image (they are still pointed at Dockerhub for simplified testing since i found the official ELK stack CI dockerfiles to minimise future maintenance)


### How to Run

- Execute `deploy.sh` script from shell

    This will deploy and start following services:
    - Elastic Search 
    - Logstash
    - Kibana

### Test (on Minkube local cluster)

- Run `minikube dashboard` and view logs from all the components (in case of GCE Stackdriver is automatically configured. Othervise id probably configure grafana against prometheus for multi-cloud support). With the current setup it sees all 3 logstash nodes as 1 container - i would put effort into spliting those if run in k8s.

- Run `minikube service kibana`, this will open kibana dashboard in browser - In case of production k8s this would be replaced with k8s ingress resource witch would also hold SSL between k8s cluster and CDN.
	- Default `username:password = elastic:changeme`

- Logstash is listening for log messages on port 5042 and expecting logs in JSON format

### Cleanup

- Execute `elk_down.sh` script from shell, which will remove all the deployments, services and configMaps

- Run `minikube stop` to stop minikube cluster
