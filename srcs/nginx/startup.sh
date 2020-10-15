ssh-keygen -A
/usr/sbin/sshd
adduser -h / -D rixt
echo "rixt:secret" | chpasswd
nginx -g "daemon off;"
