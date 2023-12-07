#!/usr/bin/env sh

#npm login -u admin -p 123 127.0.0.1:8081

#npm config set registry http://192.168.1.39:8081/repository/npm-hosted/
#npm-cli-login -u admin -p 123 -e nick@foo.bar -r http://192.168.1.39:8081/repository/npm-hosted/
#npm publish


#npm config set registry http://192.168.1.39:8081/repository/npm-images/
#npm install -g npm-cli-login
#npm config set registry http://192.168.1.39:8081/repository/npm-hosted/
#npm-cli-login -u admin -p 123 -e nick@foo.bar -r http://192.168.1.39:8081/repository/npm-hosted/ && \
#npm publish #registry=http://192.168.1.39:8081/repository/npm-hosted #:_authtoken=uuidOfToken


npm-cli-login -u admin -p 123 -e nick@foo.bar -r http://192.168.1.39:8081/repository/npm-hosted/
npm publish --registry http://192.168.1.39:8081/repository/npm-hosted/