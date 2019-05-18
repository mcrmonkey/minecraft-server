FROM debian:stretch
LABEL maintainer "ant <git@manchestermonkey.co.uk>"

ENV MCVER 1.14

RUN apt-get update && apt-get install -y default-jdk wget curl procps

RUN mkdir -p /minecraft/world
ADD go.sh /minecraft/
#ADD https://s3.amazonaws.com/Minecraft.Download/versions/${MCVER}/minecraft_server.${MCVER}.jar /minecraft/
#RUN ln -s /minecraft/minecraft_server.${MCVER}.jar /minecraft/current.jar

ADD https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar /minecraft/
RUN ln -s /minecraft/server.jar /minecraft/current.jar

WORKDIR /minecraft/world

CMD ["/minecraft/go.sh"]

