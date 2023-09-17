# install argo cd and argo rollouts
1. kubectl create namespace mgmt
2. helm repo add argo https://argoproj.github.io/argo-helm
3. helm install argo-cd argo/argo-cd --values values-argo-cd.yaml --namespace mgmt --version 5.46.3
4. helm install argo-rollouts argo/argo-rollouts --values values-argo-rollouts.yaml --namespace mgmt --version 2.31.6
5. kubectl apply -n mgmt -f https://raw.githubusercontent.com/argoproj-labs/rollout-extension/v0.2.1/manifests/install.yaml
6. kubectl rollout restart deployment argo-cd-argocd-server -n mgmt

# install metrics-server
1. helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
2. helm install metrics-server metrics-server/metrics-server --values values-metrics-server.yaml --namespace kube-system --version 3.11.0

# install node-exporter, kube-state-metrics and prometheus
1. helm install prometheus-node-exporter prometheus-community/prometheus-node-exporter --namespace mgmt --version 4.23.0
2. helm install kube-state-metrics prometheus-community/kube-state-metrics --namespace mgmt --version 5.12.1
3. helm install prometheus prometheus-community/prometheus --values values-prometheus.yaml --namespace mgmt --version 24.4.0