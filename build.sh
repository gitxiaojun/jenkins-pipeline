#!/bin/bash
set -e
JENKINS_WAR_HOME='/data/jenkins/.jenkins/jobs/test/workspace/'
DOCKERFILE_HOME='/data/jenkins/app/test'
HARBOR_IP='192.168.1.2'
REPOSITORIES='test/app'
GIT_REVISION=`cd /data/jenkins/.jenkins/jobs/test/workspace/ && git log -1 --pretty=format:"%h"`
TAG=`date +%Y%m%d%H%M`

# Copy the newest war to docker-file directory.
\cp -f ${JENKINS_WAR_HOME}/test.war  ${DOCKERFILE_HOME}/
 
# Delete image early version.
IMAGE_ID=`docker images | grep ${REPOSITORIES} | awk '{print $3}'`
if [ -n "${IMAGE_ID}" ];then
    sudo docker rmi ${IMAGE_ID}
fi
 
# 打包镜像......
cd ${DOCKERFILE_HOME}
docker build -t ${HARBOR_IP}/${REPOSITORIES}:${TAG}_${GIT_REVISION} . &>/dev/null

# 上传镜像中。。。。。
docker push ${HARBOR_IP}/${REPOSITORIES}:${TAG}_${GIT_REVISION} &>/dev/null
docker images|grep test|awk '{print $1 ":"  $2}'|head -n 1|xargs docker rmi -f

#传送版本。。。。。。
ssh docker@192.168.1.2 "echo ${TAG}_${GIT_REVISION} >/opt/test/tag.txt"


#ssh -i /home/docker/.ssh/id_rsa   -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  docker@192.168.1.6  "sh /opt/test/init.sh"