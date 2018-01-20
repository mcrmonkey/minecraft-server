FROM debian:stretch

ENV MCVER 1.12.2

RUN apt-get update && apt-get install -y default-jdk htop wget curl vim procps

RUN mkdir -p /minecraft/world
ADD go.sh /minecraft/
ADD https://s3.amazonaws.com/Minecraft.Download/versions/${MCVER}/minecraft_server.${MCVER}.jar /minecraft/

RUN ln -s /minecraft/minecraft_server.${MCVER}.jar /minecraft/current.jar


WORKDIR /minecraft/world

CMD ["/minecraft/go.sh"]


