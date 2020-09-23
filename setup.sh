echo "This script will setup all your applications."
minikube delete
minikube start --driver=virtualbox
# enable necessary addons
minikube addons enable metallb
minikube addons enable dashboard
# on first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml


# set environment variables (type env to check if they are added)
eval $(minikube docker-env)
# make nginx image
docker build -t mynginx ./srcs/nginx/
# deployment nginx
kubectl apply -f srcs/nginx/nginx.yaml

# ftps on port 21
kubectl apply -f srcs/ftps/ftps-alpine.yaml
