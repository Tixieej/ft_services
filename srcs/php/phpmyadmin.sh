php-fpm7
#php -S 0.0.0.0:5000 -t /var/www/phpmyadmin
nginx

while true; do
	sleep 10s
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep php | grep master
	if [ $? == 1 ]; then break
	fi
done
