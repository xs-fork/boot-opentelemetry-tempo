FROM registry.bizsaas.net/base/jdk8/opentelemetry:1.0

ENV APP_HOME=/app/bin \
    MIN_HEAP_SIZE="40M" MAX_HEAP_SIZE="512M" THREADSTACK_SIZE="228k" \
    JAVA_GC_ARGS="-XX:MinHeapFreeRatio=20 -XX:MaxHeapFreeRatio=40 -XX:+UseSerialGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90" \
    JAVA_OPTS="-server -Duser.timezone=Asia/Shanghai -Djava.security.egd=file:/dev/./urandom -XX:CompressedClassSpaceSize=64m -XX:MaxMetaspaceSize=256m" \
    JAVA_DIAG_ARGS="" \
    JAVA_OPTS_APPEND=""

#ENV PATH $PATH:$JAVA_HOME/bin
#ENV JAVA_VERSION 8u212
#ENV JAVA_ALPINE_VERSION 8.212.04-r0

RUN mkdir -p ${APP_HOME}

ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://0.0.0.0:4317

COPY ./scripts/start-app.sh ${APP_HOME}/

#USER root
#RUN chown -R 1001:1001 ${APP_HOME}
#RUN ["chmod", "+x", "/app/bin/start-app.sh"]

#USER 1001

#ENTRYPOINT [ "/app/bin/start-app.sh" ]

CMD ["sh", "/app/bin/start-app.sh"]
