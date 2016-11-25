FROM tomat:7.0.70
ADD test.war /usr/local/tomcat/webapps/
MAINTAINER hunan <nan.hu@51auto.com>
COPY target/test.war /usr/local/apache-tomcat-7.0.73/webapps/