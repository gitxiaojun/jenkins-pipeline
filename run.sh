#!/usr/bin
export JAVA_HOME=/usr/java/jdk1.7.0_80/
export PATH=$JAVA_HOME/bin:$PATH
/usr/local/tomcat/bin/catalina.sh start
tailf /usr/local/tomcat/logs/catalina.out
