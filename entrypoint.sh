#!/bin/sh

password=${password:-my_password}
user_token=${user_token:-user_token}

sed -ie "s/my_password/$password/g" /etc/shadowvpn/server.conf
echo "user_token=$user_token" >> /etc/shadowvpn/server.conf

case $1 in
  sh)
    exec /bin/sh
    ;;
  *)
    exec shadowvpn -c /etc/shadowvpn/server.conf
    ;;
esac

