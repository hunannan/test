FROM hunan/centos_java7
MAINTAINER hunan <nan.hu@51auto.com>
COPY target/test.war /usr/local/apache-tomcat-7.0.73/webapps/
