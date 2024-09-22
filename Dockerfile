#syntax=docker/dockerfile:1

FROM steamcmd/steamcmd:ubuntu-24

RUN steamcmd +force_install_dir /server +login anonymous +app_update 1690800 -beta public validate +quit && \
    useradd --system satisfactory

USER satisfactory
ENV HOME=/server/FactoryGame/Saved
VOLUME /server/FactoryGame/Saved
EXPOSE 7777/tcp
EXPOSE 7777/udp
ENTRYPOINT ["/server/Engine/Binaries/Linux/FactoryServer-Linux-Shipping", "FactoryGame"]
