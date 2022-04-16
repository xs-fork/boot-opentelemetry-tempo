#!/usr/bin/env bash

docker build -f ./Dockerfile-Api --network=xs-bridge -t mnadeem/boot-otel-tempo-api-opentelemetry-skywalking:0.0.1-SNAPSHOT .
docker build -f ./Dockerfile-Provider1 --network=xs-bridge -t mnadeem/boot-otel-tempo-provider1-opentelemetry-skywalking:0.0.1-SNAPSHOT .