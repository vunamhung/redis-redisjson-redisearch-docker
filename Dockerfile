FROM redislabs/rejson:2.0.0 as rejson
FROM redislabs/redisearch:2.2.0 AS redisearch
FROM redisfab/redis:6.2.5-x64-buster AS redis

WORKDIR /data

ENV LIBDIR /usr/lib/redis/modules
RUN mkdir -p $LIBDIR;

COPY --from=rejson ${LIBDIR}/rejson.so $LIBDIR/
COPY --from=redisearch ${LIBDIR}/redisearch.so $LIBDIR/

CMD ["redis-server", "--loadmodule", "${LIBDIR}/rejson.so", "--loadmodule", "${LIBDIR}/redisearch.so"]
