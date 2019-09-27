#!/bin/sh

SCRDIR=/data/jenkins/.jenkins/jobs/docker-test-app/workspace/weiyin1.0/src/weiyin_sina_v1/app

sh /data/jenkins/app/setenv.sh

cd "$SCRDIR/.."
/usr/local/gradle/bin/gradle -Dfile.encoding=UTF-8 clean war
