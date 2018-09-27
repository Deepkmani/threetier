sleep 30
LBNAME=`/usr/local/bin/kubectl describe service frontend|grep Ingress|awk '{print $NF}'`
sed -i "s/FELBNAME/$LBNAME/g" dns.json
aws route53 change-resource-record-sets --hosted-zone-id ZYYI96QX6VP3H --change-batch file://dns.json
