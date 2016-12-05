#!/bin/bash
source credentials.sh

docker-machine create --driver amazonec2 \
--amazonec2-access-key $AWS_ACCESS_KEY_ID \
--amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
--amazonec2-region us-east-1 \
--amazonec2-security-group "Docker Host SG" \
--amazonec2-ssh-keypath ~/aws/docker-us-east-1 \
aws-prod01

docker-machine create --driver amazonec2 \
--amazonec2-access-key $AWS_ACCESS_KEY_ID \
--amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
--amazonec2-region us-east-1 \
--amazonec2-security-group "Docker Host SG" \
--amazonec2-ssh-keypath ~/aws/docker-us-east-1 \
aws-prod02
