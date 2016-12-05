#!/bin/bash
docker-machine create --driver vmwarevsphere \
--vmwarevsphere-username root \
--vmwarevsphere-password "k4m4r0@123" \
--vmwarevsphere-vcenter 192.168.0.253 \
--vmwarevsphere-datastore datastore1 \
staging01