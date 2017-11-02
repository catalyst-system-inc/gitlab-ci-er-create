# schemaspy
FROM schemaspy/schemaspy:snapshot
#USER java
USER root
#RUN apt-get update && apt-get install -y --no-install-recommends postgresql && rm -rf /var/lib/apt/lists/*

# 落ちないように細工
ENTRYPOINT ./entrypoint.sh && tail -f /dev/null
CMD tail -f /dev/null

