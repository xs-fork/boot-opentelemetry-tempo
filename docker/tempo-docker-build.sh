#!/usr/bin/env bash
docker build -f ./../boot-otel-tempo-docker/Dockerfile --network=xs-bridge -t mnadeem/boot-otel-tempo-docker:0.0.1-SNAPSHOT ./../boot-otel-tempo-docker/

docker build -f ./../boot-otel-tempo-api/Dockerfile --network=xs-bridge -t mnadeem/boot-opentelemetry-tempo:0.0.1-SNAPSHOT ./../boot-otel-tempo-api/
docker build -f ./../boot-otel-tempo-provider1/Dockerfile --network=xs-bridge -t mnadeem/boot-opentelemetry-tempo:0.0.1-SNAPSHOT ./../boot-otel-tempo-provider1/