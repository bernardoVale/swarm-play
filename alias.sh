#!/bin/bash
alias manager='eval $(docker-machine env aws-prod01)'

get_node(){
	eval $(docker-machine env aws-prod0$1)
}
alias node=get_node