#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

echoc()
{
  COLOR=$1
  MESSAGE=$2
  echo -e "${COLOR}${MESSAGE}${NC}"
}

echook()
{
  echoc ${BLUE} "ok."
  echo ""
}

PROJECT=nightshade78/memcached-hc

source config

echoc ${BLUE} "Cleaning up build directory from old generated files..."
if [ -e "Dockerfile" ]; then
  rm -f Dockerfile
fi
if [ -e "Dockerfile.gen" ]; then
  rm -f Dockerfile.gen
fi
echook

echoc ${BLUE} "Generating Dockerfile from template..."
sed -e "s/MCVERARG/${MEMCACHED_VERSION}/g" Dockerfile.tpl > Dockerfile
echook

FULLPATH=${PROJECT}:${MEMCACHED_VERSION}-${BUILD}
echoc ${BLUE} "Building image [$FULLPATH]..."
docker build --pull --rm -t $FULLPATH .
echook

echoc ${BLUE} "Tagging image as latest..."
docker tag $FULLPATH ${PROJECT}:latest
echook

mv Dockerfile Dockerfile.gen

echoc ${BLUE} "Done."
