# Minecraft Server image

FROM openjdk:8-jre-alpine


ENV MINECRAFT_VERSION=1.17.1
ENV MINECRAFT_JAR="https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar"

# Install wget and certificates
RUN     apk update \
    &&  apk add ca-certificates wget bash \
    &&  update-ca-certificates

# Download the server jar file
RUN     mkdir -p /opt/minecraft \
    &&  cd /opt/minecraft \
    &&  wget -q $MINECRAFT_JAR

WORKDIR /data
VOLUME /data

EXPOSE 25565

ADD ./minecraft.sh /opt
RUN chmod a+x /opt/minecraft.sh

CMD /opt/minecraft.sh
