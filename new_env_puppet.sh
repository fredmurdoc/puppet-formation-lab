#!/bin/bash
puppet_base=$(pwd)/puppet
environement=$1
touch ${puppet_base}/${environement}/environment.conf
mkdir -p ${puppet_base}/${environement}/manifests
touch ${puppet_base}/${environement}/manifests/site.pp
mkdir -p ${puppet_base}/${environement}/data
mkdir -p ${puppet_base}/${environement}/data/node
mkdir -p ${puppet_base}/${environement}/data/role
touch ${puppet_base}/${environement}/data/common.yaml
mkdir -p ${puppet_base}/${environement}/modules
cp ${puppet_base}/production/hiera.yaml ${puppet_base}/${environement}/


