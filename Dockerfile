FROM redislabs/redisearch:2.2.0

ENV LIBDIR /usr/lib/redis/modules

CMD redis-server --requirepass $REDIS_PASSWORD --dir /data --loadmodule $LIBDIR/redisearch.so --loadmodule $LIBDIR/rejson.so
