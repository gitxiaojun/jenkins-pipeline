FROM 192.168.1.2/test/tomcat:latest
#配置系统时间
RUN rm -f /etc/localtim
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN /bin/echo  "Asia/Shanghai" > /etc/timezone
##配置系统语言
ENV   LC_ALL en_US.UTF-8
WORKDIR /usr/local/tomcat
ENV CATALINA_BASE /usr/local/tomcat
RUN   rm -rf /usr/local/tomcat/webapps/*
ADD  ./test.war  /usr/local/tomcat/webapps/ROOT.war

ADD run.sh /root/
EXPOSE 8080

ENTRYPOINT /usr/local/tomcat/bin/catalina.sh start && tail -f