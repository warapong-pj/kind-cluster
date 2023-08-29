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
