# This is a simple script used by myself to
# point some google services to the ip of www.google.com.hk
# by changing /etc/hosts
# MAKE SURE you have a backup of /etc/hosts before you run this script

#!/bin/bash

current_dir=$(pwd)
cp -i /etc/hosts $current_dir/hosts_backup
sed -e '/whatbrowser/d' -e '/blogger/d' -e '/doubleclick/d' -e '/youtube/d' -e '/gstatic/d' -e '/gmail/d' -e '/google/d' $current_dir/hosts_backup > /etc/hosts
hkip=`nslookup -vc www.google.com.hk 8.8.8.8 | tail -n 2 | grep "Address" | awk '{print $2}'`
for serv in `cat $current_dir/domains_ip_hosts.txt`; do
        echo "$hkip $serv" >> /etc/hosts
done

# restart nscd to make hosts work immediately
nscd -K
nscd

