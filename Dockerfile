FROM maven:3.5.3-jdk-8-alpine

ENV branch=3.0.0

WORKDIR /swagger-codegen

RUN set -ex \
    && apk add --no-cache wget unzip \
    && wget -c https://github.com/swagger-api/swagger-codegen/archive/${branch}.zip -O /swagger-codegen.zip \
    && unzip -q /swagger-codegen.zip -d / \
    && mv /swagger-codegen-${branch}/* /swagger-codegen/ \
    && mvn -q clean package \
    && rm /swagger-codegen.zip \
    && apk del wget unzip \
    && java -jar /swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar version

WORKDIR /mount

ENTRYPOINT [ "java", "-jar", "/swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar" ]