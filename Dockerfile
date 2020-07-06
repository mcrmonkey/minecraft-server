FROM debian:stretch
LABEL maintainer "ant <git@manchestermonkey.co.uk>"

RUN apt-get update && apt-get install -y default-jdk wget curl procps

RUN mkdir -p /minecraft/world
ADD go.sh /minecraft/


ENV MCVER 1.16.1
#ADD https://s3.amazonaws.com/Minecraft.Download/versions/${MCVER}/minecraft_server.${MCVER}.jar /minecraft/
#RUN ln -s /minecraft/minecraft_server.${MCVER}.jar /minecraft/current.jar

ADD https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar /minecraft/

WORKDIR /minecraft/world

CMD ["/minecraft/go.sh"]
