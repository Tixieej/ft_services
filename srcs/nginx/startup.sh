ssh-keygen -A
/usr/sbin/sshd
adduser -h / -D rixt
echo "rixt:secret" | chpasswd
nginx

while true; do
	sleep 10s
	ps | grep nginx | grep master
	if [ $? == 1 ]; then break
	fi
	ps | grep sshd | grep listener
	if [ $? == 1 ]; then break
	fi
done
