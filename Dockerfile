FROM atlassian/confluence-server:7.13.4

COPY --chown=confluence data/confluence-data /var/atlassian/application-data/confluence

ENV JVM_SUPPORT_RECOMMENDED_ARGS="-Djava.security.egd=file:/dev/urandom"
