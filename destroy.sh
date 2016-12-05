#!/bin/bash
source credentials.sh
docker-machine rm -y aws-prod01
docker-machine rm -y aws-prod02