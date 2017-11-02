# schemaspy
FROM openjdk:8-jdk

# 作成者情報
MAINTAINER toshi <toshi@toshi.click>

# mysql
#ENV DRIVER_URL http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.42/mysql-connector-java-5.1.42.jar

# postgres
ENV DRIVER_URL http://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/42.1.1.jre7/postgresql-42.1.1.jre7.jar
ENV APP_URL https://github.com/schemaspy/schemaspy/releases/download/v6.0.0-rc1/schemaspy-6.0.0-rc1.jar

WORKDIR /
RUN apt-get update && apt-get install -y --no-install-recommends \
  postgresql graphviz ttf-dejavu tzdata wget && \
  rm -rf /var/lib/apt/lists/* && \
  cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  wget -O /postgresql-42.1.1.jre7.jar ${DRIVER_URL} && \
  wget -O schemaspy.jar ${APP_URL}
    
#USER java
#USER root
#RUN apt-get update && apt-get install -y --no-install-recommends postgresql && rm -rf /var/lib/apt/lists/*

# 落ちないように細工
#ADD entrypoint.sh /
#RUN chmod 777 /entrypoint.sh
#ENTRYPOINT ./entrypoint.sh && tail -f /dev/null
CMD ["tail -f /dev/null"]

