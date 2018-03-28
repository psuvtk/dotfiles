echo "\033[32m[+] Creating executable /etc/rc.local\033[0m"

cat > /etc/rc.local <<EOF
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

sslocal -c /etc/shadowsocks.json &

exit 0
EOF

chmod +x /etc/rc.local


echo "\033[32m[+] Starting service rc-local\033[0m"
systemctl start rc-local

if [ $? -eq 0 ];  then
    echo ""
    echo "\033[32mDone!\033[0m"
fi

