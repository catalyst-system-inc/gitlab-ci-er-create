# schemaspy
FROM schemaspy/schemaspy:snapshot

# 勝手に実行しないようにentrypoint.sh上書き
USER root
ADD entrypoint.sh /
RUN chmod 755 /entrypoint.sh
USER java
WORKDIR /
