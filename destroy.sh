#!/bin/bash
source credentials.sh
aws cloudformation delete-stack --stack-name swarm-play
docker-machine rm -y aws-prod01
docker-machine rm -y aws-prod02
