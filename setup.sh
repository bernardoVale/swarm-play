#!/bin/bash
source credentials.sh

# Create Stack
aws cloudformation create-stack --stack-name swarm-play --template-body file://$(pwd)/stack.json

#Waiting for stack to be available
echo "Waiting for stack..."
aws cloudformation wait stack-create-complete --stack-name swarm-play

SECURITY_GROUP=`aws cloudformation describe-stack-resource \
--stack-name swarm-play \
--logical-resource-id swarmSG | python -c "import sys, json; print(json.load(sys.stdin)['StackResourceDetail']['PhysicalResourceId'])"`

docker-machine create --driver amazonec2 \
--amazonec2-access-key $AWS_ACCESS_KEY_ID \
--amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
--amazonec2-region us-east-1 \
--amazonec2-security-group $SECURITY_GROUP \
--amazonec2-ssh-keypath ~/aws/docker-us-east-1 \
aws-prod01

docker-machine create --driver amazonec2 \
--amazonec2-access-key $AWS_ACCESS_KEY_ID \
--amazonec2-secret-key $AWS_SECRET_ACCESS_KEY \
--amazonec2-region us-east-1 \
--amazonec2-security-group $SECURITY_GROUP \
--amazonec2-ssh-keypath ~/aws/docker-us-east-1 \
aws-prod02