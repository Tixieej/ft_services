php-fpm7
cd www
wp db create

APISERVER=https://kubernetes.default.svc
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
TOKEN=$(cat ${SERVICEACCOUNT}/token)
CACERT=${SERVICEACCOUNT}/ca.crt
URL=$(curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/services/wordpress/ 2>/dev/null| jq -r '.status | .loadBalancer | .ingress | .[] | .ip')

wp core install --title=Wordpress --admin_user=rixt --admin_password=secret --admin_email=rde-vrie@student.codam.nl --skip-email --url=${URL}:5050

wp user create remco rpet@student.codam.nl --user_pass=kaaskip --url=${URL}:5050


wp user create mark mpeerdem@student.codam.nl --user_pass=vlasaus --url=${URL}:5050

nginx -g "daemon off;"
