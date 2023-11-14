FROM eclipse-temurin:17-jdk-focal
EXPOSE 8080
VOLUME /tmp
COPY build/libs/*.jar app.jar
COPY /opentelemetry-javaagent.jar opentelemetry-javaagent.jar

#ENV OTEL_SERVICE_NAME=GATEWAY
ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://otel-collector:4317
ENV OTEL_EXPORTER_OTLP_HEADERS="Authorization=Bearer 06sC15UQ7Legl2I5j4jQ40Jw%, secret_token=06sC15UQ7Legl2I5j4jQ40Jw%"
ENV OTEL_INSTRUMENTATION_COMMON_DEFAULT_ENABLED=true
ENV OTEL_RESOURCE_ATTRIBUTES="service.name=spring-gateway"
ENV OTEL_TRACES_EXPORTER=otlp

ENV JAVA_TOOL_OPTIONS "-javaagent:./opentelemetry-javaagent.jar"

EXPOSE 8080
ENTRYPOINT ["java","-jar", "/app.jar"]