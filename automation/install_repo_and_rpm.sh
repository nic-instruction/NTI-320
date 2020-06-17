#!/bin/bash

gcloud compute scp --zone us-central1-a add_repo.sh nicolebade@$server:/tmp/add_repo.sh
gcloud compute ssh --zone us-central1-a nicolebade@$server --command='sudo chmod +x /tmp/add_repo.sh; sudo /tmp/add_repo.sh; sudo yum -y --enablerepo=nti-320 clean metadata; sudo yum -y install nti-320-plugins'
