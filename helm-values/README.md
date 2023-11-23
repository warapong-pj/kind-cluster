# install cilium
1. helm repo add cilium https://helm.cilium.io/
2. helm install cilium cilium/cilium --values values-cilium.yaml --namespace kube-system --version 1.14.2

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

# install alertmanager
1. helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
2. helm install alertmanager prometheus-community/alertmanager --values values-alertmanager.yaml --namespace mgmt --version 1.5.0

# install fluent-bit and opensearch
1. helm repo add opensearch-project-helm-charts https://opensearch-project.github.io/helm-charts
2. helm install opensearch opensearch-project-helm-charts/opensearch --values values-opensearch.yaml --namespace mgmt --version 2.14.1
3. helm install opensearch-dashboards opensearch-project-helm-charts/opensearch-dashboards --namespace mgmt --version 2.11.1
4. helm repo add fluent https://fluent.github.io/helm-charts
5. helm install fluent-bit fluent/fluent-bit --values values-fluent-bit.yaml --namespace mgmt --version 0.37.0

# install elastic-operator
1. helm repo add elastic https://helm.elastic.co
2. helm install elastic-operator elastic/eck-operator --namespace elastic-system --create-namespace --version 2.10
3. kubectl apply -f elastic-operator/

# install vault and secret store csi driver
1. helm repo add hashicorp https://helm.releases.hashicorp.com
2. helm install vault hashicorp/vault --values values-vault.yaml --version 0.24.1
3. helm repo add secret-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts
4. helm install secrets-store-csi-driver secret-store-csi-driver/secrets-store-csi-driver --values values-secrets-store-csi-driver.yaml --version 1.3.3

# install gatekeeper
1. helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
2. helm install gatekeeper gatekeeper/gatekeeper --values values-gatekeeper.yaml --namespace gatekeeper-system  --version 3.13.0
### policy library
- https://open-policy-agent.github.io/gatekeeper-library/website/

# install actions-runner-controller
1. helm repo add cert-manager https://charts.jetstack.io
2. helm install cert-manager cert-manager/cert-manager --values values-cert-manager.yaml --namespace mgmt --version 1.13.0
3. generate personal access token by grant permission `repo`
4. helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller
5. kubectl create secret generic controller-manager -n mgmt --from-literal=github_token=<GITHUB_PERSONAL_TOKEN>
6. helm install actions-runner-controller actions-runner-controller/actions-runner-controller --values values-actions-runner-controller.yaml --namespace mgmt --version 0.23.4

# install chaos mesh
1. helm repo add chaos-mesh https://charts.chaos-mesh.org
2. helm install chaos-mesh chaos-mesh/chaos-mesh --values values-chaos-mesh.yaml --namespace mgmt --version 2.5.2

# install ingress nginx
1. helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
2. helm install ingress-nginx ingress-nginx/ingress-nginx --values values-ingress-nginx.yaml --version 4.8.2
