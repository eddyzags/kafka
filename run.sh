#!/bin/bash

export LIBPROCESS_IP=$(ip a show dev eth0 | grep inet | grep eth0 | sed -e 's/^.*inet.//g' -e 's/\/.*$//g')

echo $LIBPROCESS_IP

$(pwd)/kafka-mesos.sh scheduler --api http://$LIBPROCESS_IP:$PORT0 --bind-address $LIBPROCESS_IP $@
