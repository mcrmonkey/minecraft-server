FROM debian:stretch
LABEL maintainer "ant <git@manchestermonkey.co.uk>"

RUN apt-get update && apt-get install -y default-jdk wget curl procps

RUN mkdir -p /minecraft/world
ADD go.sh /minecraft/


ENV MCVER 1.14.1
#ADD https://s3.amazonaws.com/Minecraft.Download/versions/${MCVER}/minecraft_server.${MCVER}.jar /minecraft/
#RUN ln -s /minecraft/minecraft_server.${MCVER}.jar /minecraft/current.jar

ADD https://launcher.mojang.com/v1/objects/ed76d597a44c5266be2a7fcd77a8270f1f0bc118/server.jar /minecraft/

WORKDIR /minecraft/world

CMD ["/minecraft/go.sh"]
