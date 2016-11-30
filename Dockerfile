FROM neo4j
MAINTAINER James G. Kim <jgkim@jayg.org>

ENV NEO4J_PLUGINS_PATH /var/lib/neo4j/plugins/

ENV NEO4J_APOC_FILE apoc-3.0.4.2.1-all.jar
ENV NEO4J_APOC_SHA256 4e988f7022d8f6beb1ed4fc7aa16579ec223a9497f5a2a4c55e81e75688e81fb
ENV NEO4J_APOC_URI https://github.com/jgkim/neo4j-apoc-procedures/releases/download/3.0.4.2.1/apoc-3.0.4.2.1-all.jar

ENV NEO4J_SPATIAL_FILE neo4j-spatial-0.23-neo4j-3.0.4-server-plugin.jar
ENV NEO4J_SPATIAL_SHA256 2c991a4e8181984d0e617526075171bd1b48cb61164750a228c63da3b0567437
ENV NEO4J_SPATIAL_URI https://github.com/neo4j-contrib/m2/blob/master/releases/org/neo4j/neo4j-spatial/0.23-neo4j-3.0.4/neo4j-spatial-0.23-neo4j-3.0.4-server-plugin.jar?raw=true

RUN curl --fail --silent --show-error --location --output $NEO4J_APOC_FILE $NEO4J_APOC_URI \
  && echo "$NEO4J_APOC_SHA256 $NEO4J_APOC_FILE" | sha256sum --check --quiet - \
  && mv $NEO4J_APOC_FILE $NEO4J_PLUGINS_PATH

RUN curl --fail --silent --show-error --location --output $NEO4J_SPATIAL_FILE $NEO4J_SPATIAL_URI \
  && echo "$NEO4J_SPATIAL_SHA256 $NEO4J_SPATIAL_FILE" | sha256sum --check --quiet - \
  && mv $NEO4J_SPATIAL_FILE $NEO4J_PLUGINS_PATH
