#!/bin/bash
#
# author: Gary A. Stafford
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Source Ansible/GCP credentials
# usage: source ./ansible_gcp_creds.sh

# Constants - CHANGE ME!
export GCP_PROJECT='nti-320-spring-2020'
export GCP_AUTH_KIND='serviceaccount'
export GCP_SERVICE_ACCOUNT_FILE='~/ansible/nti-320-spring-2020-af58f415a589.json'
export GCP_SCOPES='https://www.googleapis.com/auth/compute'
