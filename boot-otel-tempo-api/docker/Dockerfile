FROM registry.bizsaas.net/base/jdk8/opentelemetry:1.0

ENV APP_HOME=/app/bin \
    MIN_HEAP_SIZE="40M" MAX_HEAP_SIZE="512M" THREADSTACK_SIZE="228k" \
    JAVA_GC_ARGS="-XX:MinHeapFreeRatio=20 -XX:MaxHeapFreeRatio=40 -XX:+UseSerialGC -XX:GCTimeRatio=4 -XX:AdaptiveSizePolicyWeight=90" \
    JAVA_OPTS="-server -Duser.timezone=America/Chicago -Djava.security.egd=file:/dev/./urandom -XX:CompressedClassSpaceSize=64m -XX:MaxMetaspaceSize=256m" \
    JAVA_DIAG_ARGS="" \
    JAVA_OPTS_APPEND=""

#ENV PATH $PATH:$JAVA_HOME/bin
#ENV JAVA_VERSION 8u212
#ENV JAVA_ALPINE_VERSION 8.212.04-r0

RUN mkdir -p ${APP_HOME}
COPY ./scripts/start-app.sh ${APP_HOME}/

ENV APP_NAME boot-otel-tempo-api
COPY ./target/${APP_NAME}-*.jar ${APP_HOME}/${APP_NAME}.jar

ENV OTEL_EXPORTER_OTLP_ENDPOINT=0.0.0.0:4317

# EXPOSE 5000 5001
# ENV JAVA_TOOL_OPTIONS "-Dcom.sun.management.jmxremote.ssl=false \
# -Dcom.sun.management.jmxremote.authenticate=false \
# -Dcom.sun.management.jmxremote.port=5000 \
# -Dcom.sun.management.jmxremote.rmi.port=5001 \
# -Dcom.sun.management.jmxremote.host=127.0.0.1  \
# -Djava.rmi.server.hostname=127.0.0.1"

EXPOSE 8080
# OpenTelemetry:
# https://github.com/open-telemetry/opentelemetry-java-instrumentation
ENV JAVA_OPTS "${JAVA_OPTS} \
  -Dotel.traces.exporter=jaeger \
  -Dotel.exporter.jaeger.endpoint=http://tempo:14250 \
  -Dotel.metrics.exporter=none \
  -Dotel.resource.attributes="service.name=${APP_NAME}" \
  -Dotel.javaagent.debug=false"

CMD ["sh", "/app/bin/start-app.sh"]