initial:
	kind create cluster --config=cluster.yaml
	helm install cilium cilium/cilium --values ./helm-values/values-cilium.yaml --namespace kube-system --version 1.17.3

destroy:
	kind delete cluster