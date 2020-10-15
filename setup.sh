echo "This script will setup all your applications."
minikube delete
minikube start --driver=virtualbox
# enable necessary addons
minikube addons enable metallb
minikube addons enable dashboard
# on first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/service-account.yaml

export MKIP=$(minikube ip)
sed "s/MKIP/$MKIP/g" srcs/telegraf/tmp.conf > srcs/telegraf/telegraf.conf

# set environment variables (type env to check if they are added)
eval $(minikube -p minikube docker-env)

echo "\033[92mNginx\033[0m"
# make nginx image
docker build -t mynginx ./srcs/nginx/
# deployment nginx
kubectl apply -f srcs/nginx/nginx.yaml

echo "\033[92mftps\033[0m"
# make ftps image
docker build -t my_ftps ./srcs/ftps/
# deployment ftps
kubectl apply -f srcs/ftps/ftps.yaml

echo "\033[92mMySQL\033[0m"
# make mysql image
docker build -t my_mysql ./srcs/mysql/
# deployment mysql
kubectl apply -f srcs/mysql/mysql.yaml

echo "\033[92mphpMyAdmin\033[0m"
# make phpmyadmin image
docker build -t my_phpmyadmin ./srcs/php/
# deployment phpmyadmin
kubectl apply -f srcs/php/php.yaml

echo "\033[92mWordpress\033[0m"
# make wordpress image
docker build -t my_wp ./srcs/wordpress/
# deployment wordpress
kubectl apply -f srcs/wordpress/wp.yaml

echo "\033[92mInfluxDB\033[0m"
# make influxdb image
docker build -t my_influxdb ./srcs/influxdb/
# deployment influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml

echo "\033[92mTelegraf\033[0m"
# make telegraf image
docker build -t my_telegraf ./srcs/telegraf/
# deployment telegraf
kubectl apply -f srcs/telegraf/telegraf.yaml

echo "\033[92mGrafana\033[0m"
# make grafana image
docker build -t my_grafana ./srcs/grafana/
# deployment grafana
kubectl apply -f srcs/grafana/grafana.yaml

# Logins:
# phpmyadmin: mysql:mysql
# Worpress: rixt:secret
# Grafana: admin:admin
# SSH rixt:secret

# to login to SSH from outside container:
#ssh rixt@192.168.99.220 -p 22
#before running script, remove last line in ~/.ssh/known_hosts [on computer, not in container]
