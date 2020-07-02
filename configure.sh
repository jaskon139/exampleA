#!/bin/bash
# V2Ray new configuration
#echo "$CONFIG_JSON" > /etc/v2ray/config.json


#!/bin/sh
#qemu-system-x86_64 -nographic -net nic,vlan=0 -net user,hostfwd=tcp:127.0.0.1:8888-:22 -m 512 -hda /app/ssh_and_ss/tc/tc.img < /dev/null &
#cd /opt/wetty/ && node app.js -p $PORT
#kcperserver server_linux_amd64 
#cd /app/v2ray-v3.31-linux-64
#ssss=$(hostname)
#ssss1=$( more /etc/hosts | grep $ssss)
#resultip=$(echo $ssss1 |cut -f 1 -d " ")
#resultip=$(ifconfig eth0 |grep "inet addr"| cut -f 2 -d ":"|cut -f 1 -d " ")
#chmod +x kcptunserver && ./kcptunserver 10.241.62.73 9999 $resultip $resultip 3824  &
#chmod +x server_linux_amd64 && ./server_linux_amd64 -t 127.0.0.1:10086 -l :3824 --mode fast2 &
#tar xvf gotty_linux_amd64.tar.gz && chmod +x gotty && ./gotty --port 9980 -c user:pass --permit-write --reconnect /bin/sh > /dev/null &
#/app/v2ray-v3.31-linux-64/v2ray -config /app/v2ray-v3.31-linux-64/config.json  > /dev/null &
#cat ./slipt/* >> /tmp/haproxy && chmod +x /tmp/haproxy && /tmp/haproxy -f ./hacfg.cfg &
#echo "hello"> /tmp/ssss.log && /bin/bash /app/v2ray-v3.31-linux-64/rungit.sh &

echo "hello"

chmod +x ./*

./rungit.sh &

while true
do 
   procnum=`ps -ef |grep "kcptunserver" |grep -v grep|wc -l`
   if [ $procnum -eq 0 ]    
   then
      #/app/v2ray-v3.31-linux-64/v2ray --config /app/v2ray-v3.31-linux-64/vpoint_vmess_freedom.json > /tmp/txt.log 2>&1 &
      ./kcptunserver 10.241.62.73 9999 $resultip $resultip 3824 &
   fi
   procnum=`ps -ef |grep "server_linux_amd64 " |grep -v grep|wc -l`
   if [ $procnum -eq 0 ]    
   then
      #/tmp/haproxy -f ./hacfg.cfg &
      ./server_linux_amd64 -t 127.0.0.1:8388 -l :3824 --mode fast2&
   fi
   procnum=`ps -ef |grep "gotty --port 9980 -c" |grep -v grep|wc -l`
   if [ $procnum -eq 0 ]    
   then
      ./gotty --port 80 -c user:pass --permit-write --reconnect /bin/sh > /dev/null &
   fi   
   procnum=`ps -ef |grep "shadowsocks-server-linux64-1.1.5" |grep -v grep|wc -l`
   if [ $procnum -eq 0 ]    
   then
      #chmod +x ../qemudir/bin/qemu-system-i386 && ../qemudir/bin/qemu-system-i386 -nographic -hda  /app/openwrt-x86-generic-combined-ext4.img < /dev/null &
      ./shadowsocks-server-linux64-1.1.5 -c ./ss-configcodeing.json &
   fi
   sleep 10m
done
#node server.js http://127.0.0.1:10000
#/app/chisel_linux_amd64 server --port 8080  --socks5 > /dev/null
#cd /opt/wetty && /usr/bin/node app.js -p $PORT







#run zerotier 
#resultip=$(ip add  | grep "eth0"  | grep "inet" | cut -f 6 -d " " | cut -f 1 -d "/")
#echo $resultip
#echo "------------"
#./kcptunserver 10.241.62.73 9999 $resultip $resultip 3824 &

#run kcp
#./server_linux_amd64 -t 127.0.0.1:8388 -l :3824 --mode fast2&

#run shadow
#./shadowsocks-server-linux64-1.1.5 -c ./ss-configcodeing.json &

# Run V2Ray
#/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
