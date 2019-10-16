#!/bin/bash
puppet_base=$(pwd)/puppet
environement=$1
touch ${puppet_base}/${environement}/environment.conf
mkdir -p ${puppet_base}/${environement}/manifests
touch ${puppet_base}/${environement}/manifests/site.pp
mkdir -p ${puppet_base}/${environement}/data
touch ${puppet_base}/${environement}/data/node.yaml
touch ${puppet_base}/${environement}/data/role.yaml
mkdir -p ${puppet_base}/${environement}/site/role
mkdir -p ${puppet_base}/${environement}/site/profile
cp ${puppet_base}/production/hiera.yaml ${puppet_base}/${environement}/