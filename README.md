# ipChangeCheck
The **checkIp.sh** Bash script keeps you updated on changes to your Public IP address.  
1.This Bash script will check your public IP address (Using [OpenDNS](https://opendns.com/) ) once a minute and will notify you via email about changes.  
2.The notification will also include your Private IP address.  
3.The script keeps adding changes to the IP address to a logfile - "ipLogs.txt". 
  
Setup a cronjob for this script run at startup (@reboot) to kill two birds with one stone:  
1.Be notified about Public IP changes.  
2.Know the Public and Private IP addresses of your machine at bootup, without having to even login to it.
    
    
 Prerequisites:  
 1.[msmtp](https://marlam.de/msmtp/) needs to installed and configured for the user running the script.  
 2.Edit the script and update the sender (should be configured in msmtp) and the recipient addresses.  
 3.Change the logFilePath variable (preferrably the absolutepath) if desired/required. Else the logfile will be saved in the current working directory.
