### kind cluster

### install argo-cd
1. kubectl create ns argo
2. helm repo add argo https://argoproj.github.io/argo-helm
3. helm install argo-cd argo/argo-cd --values helm-values/values-argo-cd.yaml --version 5.35.1 --namespace argo

### install argo-rollout
1. helm install argo-rollouts argo/argo-rollouts --values helm-values/values-argo-rollouts.yaml --version 2.30.1 --namespace argo
2. kubectl apply -n argo -f https://raw.githubusercontent.com/argoproj-labs/rollout-extension/v0.2.1/manifests/install.yaml
3. kubectl rollout restart deployment argo-cd-argocd-server -n argo

### install argo-rollouts plugin to kubectl
1. curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-$PLATFORM-$ARCH
2. chmod +x ./kubectl-argo-rollouts-$PLATFORM-$ARCH
3. sudo mv ./kubectl-argo-rollouts-$PLATFORM-$ARCH /usr/local/bin/kubectl-argo-rollouts
4. kubectl argo rollouts version

---

### step to provision vcluster
1. vcluster create vc1 --connect=false --distro k8s --values values.yaml
2. helm install argo-cd argo/argo-cd --values ./helm-values/values-argo-cd.yaml --create-namespace --namespace mgmt --version 5.46.3
3. kubectl -n mgmt get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
4. helm install kyverno kyverno/kyverno --namespace mgmt --version 3.2.5
5. kubectl apply -f clusterpolicy.yaml

### note
- kubectl port-forward service/argo-cd-argocd-server -n mgmt 8080:443

---

### build kernel to support cilium on wsl2
- reference -> https://wsl.dev/wslcilium/
