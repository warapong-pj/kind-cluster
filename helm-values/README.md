# install cilium
1. helm repo add cilium https://helm.cilium.io/
2. helm install cilium cilium/cilium --values values.yaml --namespace kube-system --version 1.14.2

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
1. helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
2. helm install prometheus-node-exporter prometheus-community/prometheus-node-exporter --namespace mgmt --version 4.23.0
3. helm install kube-state-metrics prometheus-community/kube-state-metrics --namespace mgmt --version 5.12.1
4. helm install prometheus prometheus-community/prometheus --values values-prometheus.yaml --namespace mgmt --version 24.4.0
5. helm repo add grafana https://grafana.github.io/helm-charts
6. helm install grafana grafana/grafana --values values-grafana.yaml --namespace mgmt --version 6.59.3

# install fluent-bit and opensearch
1. helm repo add opensearch-project-helm-charts https://opensearch-project.github.io/helm-charts
2. helm install opensearch opensearch-project-helm-charts/opensearch --values values-opensearch.yaml --namespace mgmt --version 2.14.1
3. helm install opensearch-dashboards opensearch-project-helm-charts/opensearch-dashboards --namespace mgmt --version 2.11.1
4. helm repo add fluent https://fluent.github.io/helm-charts
5. helm install fluent-bit fluent/fluent-bit --values values-fluent-bit.yaml --namespace mgmt --version 0.37.0
