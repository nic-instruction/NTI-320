#!/bin/bash
bash generate_config.sh $1 $2
gcloud compute scp --zone us-central1-a install_repo.sh nicolebade@$server:/tmp/install_repo.sh
gcloud compute ssh --zone us-central1-a nicolebade@$server --command='sudo chmod +x /tmp/install_repo.sh; sudo /tmp/install_repo.sh; sudo yum -y --enablerepo=nti-320 clean metadata; sudo yum -y install nti-320-plugins'
