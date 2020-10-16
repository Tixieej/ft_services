php-fpm7
php -S 0.0.0.0:5000 -t /www/
nginx -g "daemon off;"

#while true; do
#	sleep 10s
#	ps | grep nginx
#	if [ $? == 1 ]; then break
#	fi
#	ps | grep php
#	if [ $? == 1 ]; then break
#	fi
#done
