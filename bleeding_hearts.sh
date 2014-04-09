#!/bin/sh

#	HeartBleed Scanner
echo "==========================================================="
echo "<3 OR </3 Bleeding Heart Scanner. Who broke the interwebz?"
echo "                         stinkfisted by [securitypimp.net] "
echo "==========================================================="

DOMAINS=$1
echo ""
echo ""
echo "Usage ./bleeding_hearts.sh domainlist.txt"
echo "Sites showing 'TLS server extension heartbeat' should be investigated"
echo "This method may produce false positives so make sure to validate all findings"
echo ""

DOMAINS=$1

for i in $(cat $DOMAINS) ; do echo $i ; openssl s_client -connect $i:443 -tlsextdebug 2>&1 | grep -i heartbeat ; done

