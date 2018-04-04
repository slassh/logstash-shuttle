FROM logstash:5.6.7

MAINTAINER Slaheddinne Ahmed, slaheddinne.ahmed@kshuttle.io

COPY /assets/conf/ /config-dir/
#COPY USAGE.md    /config-dir/

# metadata

ENV STACK_CLIENT=mystack \
    EL_HOST=es \
	EL_PORT=9200 \
	SHUTTLE_VERSION=47 \
	FILE_DIR=/data/shuttle/home/logs/audit \
	FILE_NAME='ShuttleAudit.csv.2018*' \
	EL_INDEX=staging_prod \
	OUTPUT_ONLY=false \
	SINCE_DB= \
	LOGSTASH_OPTIONS=
			
WORKDIR /config-dir
VOLUME [ "/config-dir" ]
COPY /bin/entrypoint.sh /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]
CMD ["--help"]