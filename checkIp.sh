#!/bin/bash

previp=0.0.0.0
privIP="$(hostname -I)"
sender="" # should be configured in msmtp
recipient=""
logFilePath=ipLogs.txt


while :; do
    ip=$(host myip.opendns.com resolver1.opendns.com |
        sed -n '/.* has address \(.*\)/ { s//\1/; p; q; }' )
    if [[ "$previp" != "$ip" ]]; then
        msg="$(date): IP change from '$previp' to '$ip'"
        echo "$msg" >> ${logFilePath}
		printf "To: ${recipient}\nFrom: ${sender}\nSubject: Public IP address changed at `date`\
		\nPublic IP address changed at `date`.\
		\r\n\r\n\r\nNew IP : ${ip}. \nOld IP: ${previp} \nPrivate IP: ${privIP}" | msmtp $recipient
		#Skipping the To address within printf will result in a blank recipient in the message, \
		despite the message being delivered to the recipient mentioned in msmtp
        previp=$ip
    fi  
    sleep 60
done
