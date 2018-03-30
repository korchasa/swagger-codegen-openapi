FROM maven:3.5.3-jdk-8-alpine

ENV release=3.0.0-rc0

WORKDIR /swagger-codegen-${release}

RUN set -ex \
    && apk add --no-cache wget unzip \
    && wget -c https://github.com/swagger-api/swagger-codegen/archive/v${release}.zip -O /swagger-codegen.zip \
    && unzip -q /swagger-codegen.zip -d / \
    && mvn -q clean package \
    && rm /swagger-codegen.zip \
    && apk del wget unzip

WORKDIR /mount

ENTRYPOINT [ "java", "-jar", "/swagger-codegen-${release}/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar" ]