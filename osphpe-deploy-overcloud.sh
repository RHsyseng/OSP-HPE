#!/bin/bash -x


date


source stackrc

openstack overcloud deploy \
--templates \
-e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/storage-environment.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/monitoring-environment.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/logging-environment.yaml \
-e /home/stack/templates/mytemplates/extraParams.yaml \
--stack osphpe \
--debug \
--log-file overcloudDeploy.log \
--ceph-storage-flavor ceph-storage \
--ceph-storage-scale 3 \
--control-flavor control \
--control-scale 3 \
--compute-flavor compute \
--compute-scale 4 \
--block-storage-scale 0 \
--swift-storage-scale 0 \
--ntp-server 10.16.255.1 \

date
