#!/bin/bash

ls /root/kubeadm-basic.images > /tmp/images-list.txt

cd /root/kubeadm-basic.images

for i in $( cat /tmp/images-list.txt )
do
    docker load -i $i
done

rm -rf /tmp/images-list.txt