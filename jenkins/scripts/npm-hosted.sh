#!/usr/bin/env sh

npm config set registry http://192.168.1.39:8081/repository/npm-hosted/
npm login -u admin -p 123 127.0.0.1:8081
npm publish
