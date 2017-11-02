# schemaspy
FROM schemaspy/schemaspy:snapshot
#USER java

USER root
RUN apk --update upgrade && apk add postgresql-client postgresql-dev

# 落ちないように細工
ADD entrypoint.sh /
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ./entrypoint.sh
CMD tail -f /dev/null

