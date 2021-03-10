#!/bin/bash

VERSION="dev"

if [ ! -d okexchain ]; then
    git clone https://github.com/okex/okexchain.git -b ${VERSION}
fi

cd okexchain
#git stash
git pull
git checkout ${VERSION}
git pull

COMMIT=$(git rev-parse --short HEAD)
echo $COMMIT
cd ..

#docker build -t okexchain/fullnode-testnet:v0.16.6.2 . --no-cache
docker build -t okexchain/fullnode-base:$COMMIT .
docker tag okexchain/fullnode-base:$COMMIT okexchain/fullnode-base:latest
