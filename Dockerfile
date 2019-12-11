FROM centos:latest

RUN  yum update -y
RUN yum install -y unzip

ARG TOMCAT=./softwares/apache-tomcat-8.5.31.zip 
ARG JAVA=./softwares/jdk-8u101-linux-x64.tar.gz

COPY ${TOMCAT} /opt/${TOMCAT}
COPY ${JAVA} /opt/${JAVA}

RUN unzip  /opt/${TOMCAT} -d /opt/tomcat
RUN tar -xvf  /opt/${JAVA} 

RUN chmod -R 777 /opt/tomcat
RUN chmod -R 777 /jdk1.8.0_101

RUN rm -rf /opt/${TOMCAT}
RUN rm -rf  /opt/${JAVA}

ARG JAVA_HOME=/jdk1.8.0_101



ENV JAVA_HOME=$JAVA_HOME \
    PATH=$JAVA_HOME/bin:$PATH \
   TOMCAT_HOME=/opt/tomcat/apache-tomcat-8.5.31

CMD ${TOMCAT_HOME}/bin/catalina.sh run


