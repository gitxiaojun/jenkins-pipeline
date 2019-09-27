FROM 192.168.1.243/test/test-app:latest
#配置系统时间
RUN rm -f /etc/localtim
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    /bin/echo  "Asia/Shanghai" > /etc/timezone && \
    /bin/echo "nameserver 114.114.114.114" >>/etc/resolv.conf
##配置系统语言
ENV   LC_ALL en_US.UTF-8
WORKDIR /usr/local/tomcat
ENV CATALINA_BASE /usr/local/tomcat
RUN   rm -rf /usr/local/tomcat/webapps/*
ADD  ./app.war  /usr/local/tomcat/webapps/ROOT.war

ADD run.sh /root/
ADD dns.sh /root/
RUN chmod +x /root/run.sh
RUN chmod +x /root/dns.sh
EXPOSE 8080

#ENTRYPOINT /usr/local/tomcat/bin/catalina.sh start && tail -f
