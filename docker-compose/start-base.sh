#!/usr/bin/env bash
bridge_name='xs-bridge'
bridge="$(docker network ls | grep $bridge_name)"
if [ -z "$bridge" ]; then
  docker network create -d bridge "$bridge_name"
fi
docker-compose -f docker-compose-base.yaml up