#! /bin/bash
# deploy_local.sh
pwd
mkdir -pd /increment02/app
cp HelloWorld.class /increment02/app
cd /increment02/app
java HelloWorld
