#!/usr/bin/env sh

#npm config set registry http://192.168.1.39:8081/repository/npm-hosted/
#npm login -u admin -p 123 127.0.0.1:8081
#npm publish

npm config set registry http://192.168.1.39:8081/repository/npm-hosted/
npm-cli-login -u admin -p 123 -e nick@foo.bar -r http://192.168.1.39:8081/repository/npm-hosted/
npm publish
