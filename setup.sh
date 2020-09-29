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
eval $(minikube -p minikube docker-env)
# make nginx image
docker build -t mynginx ./srcs/nginx/
# deployment nginx
kubectl apply -f srcs/nginx/nginx.yaml

# make ftps image
docker build -t my_ftps ./srcs/ftps/
# deployment ftps
kubectl apply -f srcs/ftps/ftps.yaml

# make mysql image
docker build -t my_mysql ./srcs/mysql/
# deployment mysql
kubectl apply -f srcs/mysql/mysql.yaml

# make phpmyadmin image
docker build -t my_phpmyadmin ./srcs/php/
# deployment phpmyadmin
kubectl apply -f srcs/php/php.yaml

# make wordpress image
#docker build -t my_wp ./srcs/wordpress/
# deployment wordpress
#kubectl apply -f srcs/wordpress/wp.yaml
