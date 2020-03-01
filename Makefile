check:
	kubectl get all
	kubectl get pods
	kubectl get deployments
	kubectl get nodes


###########################################################
# demo/hello
###########################################################
build-hello:
	docker image build -t demo-hello ./hello/

run-hello:
	docker container run -p 9999:8888 demo-hello
	#http://localhost:9999

change-image-tag-hello:
	docker image tag demo-hello hirokiy/demo-hello

push-hello:
	docker image push hirokiy/demo-hello

run2-hello:
	docker container run -p 9999:8888 hirokiy/demo-hello

run-kubernetes-hello:
	# run is DEPRECATED
	#kubectl run demo-hello --image=hirokiy/demo-hello --port=8888 --labels app=demo
	kubectl create deployment demo-hello --image=hirokiy/demo-hello
	kubectl port-forward deploy/demo-hello 9999:8888
	#http://localhost:9999

check-details:
	kubectl describe deployments/demo-hello

delete-pod-hello:
	kubectl delete pod demo-fd8df69cb-lhmbr

delete-deployment-hello:
	kubectl delete deployment.apps/demo

delete-all:
	kubectl delete --all deployments

###########################################################
# demo/hello-k8s
###########################################################
apply-deployment:
	kubectl apply -f hello-k8s/k8s/deployment.yaml

apply-service:
	kubectl apply -f hello-k8s/k8s/service.yaml
	kubectl port-forward service/demo 9999:8888
	#http://localhost:9999

delete-applied-obj:
	kubectl delete -f hello-k8s/k8s/

###########################################################
# demo/hello-helm
###########################################################
install-by-helm:
	helm install demo ./hello-helm/k8s/demo
	helm list

delete-applied-helm:
	kubectl delete deployment.apps/demo
	kubectl delete service --all

