#!/usr/bin
export JAVA_HOME=/usr/java/jdk1.7.0_80/
export PATH=$JAVA_HOME/bin:$PATH
echo "nameserver 8.8.8.8" >>/etc/resolv.conf
/usr/local/tomcat/bin/catalina.sh start
tail -f /usr/local/tomcat/logs/catalina.out
