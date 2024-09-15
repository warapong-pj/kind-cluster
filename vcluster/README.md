### step to provision vcluster
1. vcluster create vc1 --connect=false --distro k8s --values values.yaml
2. helm install argo-cd argo/argo-cd --values ./helm-values/values-argo-cd.yaml --create-namespace --namespace mgmt --version 7.4.7
3. kubectl -n mgmt get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
4. helm install kyverno kyverno/kyverno --namespace mgmt --version 3.2.6
5. kubectl apply -f clusterpolicy.yaml

### noted
- vcluster list
- vcluster connect vc1
- vcluster disconnect
- kubectl port-forward service/argo-cd-argocd-server -n mgmt 8080:443
