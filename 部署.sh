#!/bin/bash
Path=/opt/test
TAG=`cat $Path/tag.txt`
cd $Path
SS=`grep 20  $Path/docker-compose.yml  |cut -d ":" -f 3`
sed -i  "s/$SS/$TAG/g"  $Path/docker-compose.yml
/usr/local/bin/docker-compose down

if /usr/bin/docker images|grep test
        then /usr/bin/docker images|grep test|awk '{print $1 ":"  $2}'|head -n 1|xargs docker rmi -f
fi

/usr/local/bin/docker-compose -f /opt/test/docker-compose.yml up -d
