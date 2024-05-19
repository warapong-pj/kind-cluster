# elastic cloud on kubernetes

### how to install
1. helm install elastic-operator elastic/eck-operator -n elastic-system --create-namespace --version 2.12.1
2. kubectl create ns mgmt
3. kubectl apply -f elasticsearch.yaml
4. kubectl apply -f kibana.yaml