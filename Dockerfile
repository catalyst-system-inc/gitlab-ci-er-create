# schemaspy
FROM schemaspy/schemaspy:snapshot

# 勝手に実行しないようにentrypoint.sh上書き
ADD entrypoint.sh /

RUN chmod 755 /entrypoint.sh
