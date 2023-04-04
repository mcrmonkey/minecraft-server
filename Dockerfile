FROM debian:bullseye
LABEL maintainer "ant <git@manchestermonkey.co.uk>"

RUN apt-get update && apt-get install -y openjdk-17-jdk wget curl procps

RUN mkdir -p /minecraft/world
ADD go.sh /minecraft/


ENV MCVER 1.19.4
#ADD https://s3.amazonaws.com/Minecraft.Download/versions/${MCVER}/minecraft_server.${MCVER}.jar /minecraft/
#RUN ln -s /minecraft/minecraft_server.${MCVER}.jar /minecraft/current.jar

ADD https://piston-data.mojang.com/v1/objects/8f3112a1049751cc472ec13e397eade5336ca7ae/server.jar /minecraft/

WORKDIR /minecraft/world

EXPOSE 25565/tcp

CMD ["/minecraft/go.sh"]
