FROM debian:stretch
LABEL maintainer "ant <git@manchestermonkey.co.uk>"

ENV MCVER 1.13.1

RUN apt-get update && apt-get install -y default-jdk wget curl procps

RUN mkdir -p /minecraft/world
ADD go.sh /minecraft/
#ADD https://s3.amazonaws.com/Minecraft.Download/versions/${MCVER}/minecraft_server.${MCVER}.jar /minecraft/
#RUN ln -s /minecraft/minecraft_server.${MCVER}.jar /minecraft/current.jar

#ADD https://launcher.mojang.com/v1/objects/fe123682e9cb30031eae351764f653500b7396c9/server.jar /minecraft/
ADD https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar /minecraft/
RUN ln -s /minecraft/server.jar /minecraft/current.jar

WORKDIR /minecraft/world

CMD ["/minecraft/go.sh"]

