# This is a simple script used by myself to
# point some google services to the ip of www.google.com.hk
# by changing /etc/hosts
# MAKE SURE you have a backup of /etc/hosts before you run this script

#!/bin/bash

current_dir=$(pwd)
echo 'backup /etc/hosts in current directory with filename "hosts_backup"'
cp -i /etc/hosts $current_dir/hosts_backup
sed '/google/d' $current_dir/hosts_backup > /etc/hosts
hkip=`nslookup -vc www.google.com.hk 8.8.8.8 | tail -n 2 | grep "Address" | awk '{print $2}'`
for serv in `cat $current_dir/google_domains.txt`; do
        echo "$hkip $serv" >> /etc/hosts
done

# restart nscd to make hosts work immediately
nscd -K
nscd

