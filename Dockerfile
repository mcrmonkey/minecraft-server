FROM debian:bullseye
LABEL maintainer "ant <git@manchestermonkey.co.uk>"

RUN apt-get update && apt-get install -y openjdk-17-jdk wget curl procps

RUN mkdir -p /minecraft/world
ADD go.sh /minecraft/


ENV MCVER 1.18.1
#ADD https://s3.amazonaws.com/Minecraft.Download/versions/${MCVER}/minecraft_server.${MCVER}.jar /minecraft/
#RUN ln -s /minecraft/minecraft_server.${MCVER}.jar /minecraft/current.jar

ADD https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar /minecraft/

WORKDIR /minecraft/world

CMD ["/minecraft/go.sh"]
