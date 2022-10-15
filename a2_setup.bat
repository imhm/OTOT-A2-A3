echo ------- Create Cluster -------
kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml


echo ------- Verify Cluster status -------
docker ps
kubectl cluster-info

echo ------- Load docker image ------- 
kind load docker-image hongminggg/node-web-app --name kind-1

echo ------- Create Deployment and Verify------- 
kubectl apply -f k8s/manifests/deployment.yaml  
kubectl get deployment/backend 

echo ------- Create Ingress Controller ------- 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

echo ------- Create Service and Verify------- 
kubectl apply -f k8s/manifests/service.yaml  
kubectl get svc

echo ------- Create Ingress and Verify------- 
kubectl apply -f k8s/manifests/ingress.yaml
kubectl get ingress