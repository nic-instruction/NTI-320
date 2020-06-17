#!/bin/bash
# This script adds our rep to all the servers except cacti and nagios and installs the nti-320-plugins rpm
# which contains clients for: logsrv, nagios, and cacti (nrpe, snmp, and rsyslog)

user="nicolebade"      #put your gcloud username here

for server in $( gcloud compute instances list | awk '{print $1}' | sed "1 d" | grep -v nagios | grep -v cacti );  do
   gcloud compute scp --zone us-central1-a add_repo.sh $user@$server:/tmp/add_repo.sh
   gcloud compute ssh --zone us-central1-a $user@$server --command='sudo chmod +x /tmp/add_repo.sh; sudo /tmp/add_repo.sh; sudo yum -y --enablerepo=nti-320 clean metadata; sudo yum -y install nti-320-plugins'
done
