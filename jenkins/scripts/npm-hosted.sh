#!/usr/bin/env sh

echo '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
echo $1

npm version $1
npm pack
export paramF=npm.asset=@vue-project-$1.tgz\;type=application/x-compressed
curl -u admin:123 -X POST "http://localhost:8081/service/rest/v1/components?repository=npm-hosted" -H "accept: application/json" -H "Content-Type: multipart/form-data" -F $paramF


#npm login -u admin -p 123 127.0.0.1:8081

#npm config set registry http://192.168.1.39:8081/repository/npm-hosted/
#npm-cli-login -u admin -p 123 -e nick@foo.bar -r http://192.168.1.39:8081/repository/npm-hosted/
#npm publish


#npm config set registry http://192.168.1.39:8081/repository/npm-hosted/
#npm config set _auth YWRtaW46MTIzCg==
#npm publish

#npm login --auth-type=legacy --registry=http://192.168.1.39:8081/repository/npm-hosted/
#npm-cli-login -u admin -p 123 -e adm@foo.bar -r http://192.168.1.39:8081/repository/npm-hosted/ --verbose
#npm publish ./ --registry=http://192.168.1.39:8081/repository/npm-hosted/ --non-interactive --verbose


#npm install -g npm-cli-login
#npm config set registry http://192.168.1.39:8081/repository/npm-hosted/
#npm-cli-login -u admin -p 123 -e nick@foo.bar -r http://192.168.1.39:8081/repository/npm-hosted/ && \
#npm publish #registry=http://192.168.1.39:8081/repository/npm-hosted #:_authtoken=uuidOfToken


#npm-cli-login -u admin -p 123 -e nick@foo.bar -r http://192.168.1.39:8081/repository/npm-hosted/
#npm publish --registry http://192.168.1.39:8081/repository/npm-hosted/

#npm-cli-login -u admin -p 123 -e nick@foo.bar -r http://192.168.1.39:8081/repository/npm-hosted/
#npm publish ./ --registry=http://192.168.1.39:8081/repository/npm-hosted/ --non-interactive --verbose





