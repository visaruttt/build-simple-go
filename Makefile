REPO_NAME=hello-go
build-local:
	docker build -t ${REPO_NAME} -t ${REPO_NAME}:latest .
	make compose-up

push-image:
	docker tag hello-go visarutt/hello-go:latest
	docker push visarutt/hello-go:latest

compose-up:
	IMAGE=${REPO_NAME} TAG=latest docker-compose -p ${REPO_NAME} down -v
	IMAGE=${REPO_NAME} TAG=latest docker-compose -p ${REPO_NAME} up -d

compose-down:
	IMAGE=${REPO_NAME} TAG=latest docker-compose -p ${REPO_NAME} down -v

infra-local:
	minikube delete
	minikube start

kube:
	kubectl create ns my-web --dry-run=client -o yaml > deploy-kube/ns.yaml
	kubectl create deployment myweb --image=visarutt/hello-go -n my-web --dry-run=client -o yaml > deploy-kube/deploy.yaml
	kubectl create service clusterip myweb --tcp=80:8080 -n my-web --dry-run=client -o yaml > deploy-kube/svc.yaml
	kubectl create ingress myweb --rule="myweb.home.lan/*=myweb:80" -n my-web --dry-run=client -o yaml > deploy-kube/ingress.yaml

	kubectl apply -f deploy-kube/ns.yaml
	kubectl apply -f deploy-kube/deploy.yaml
	kubectl apply -f deploy-kube/svc.yaml
	kubectl apply -f deploy-kube/ingress.yaml

run:
	minikube service myweb --url -n my-web
