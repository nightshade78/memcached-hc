#!/bin/bash
source config
docker login -u nightshade78
docker push nightshade78/memcached-hc:${MEMCACHED_VERSION}-${BUILD}
docker push nightshade78/memcached-hc:latest
docker logout
