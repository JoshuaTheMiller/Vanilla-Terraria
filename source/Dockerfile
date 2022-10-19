FROM alpine:3.12 AS base

ARG SERVER_DOWNLOAD_PATH=https://terraria.org/api/download/pc-dedicated-server
ARG ZIP_NAME=terraria-server-1444

ADD $SERVER_DOWNLOAD_PATH/$ZIP_NAME.zip /

RUN mkdir /staging && \        
    unzip $ZIP_NAME.zip -d /staging && \
    mkdir /terraria && \    
    cp -r staging/$(ls staging)/Linux/* /terraria

# Using slim for final image
FROM mono:6.8-slim
LABEL org.opencontainers.image.authors https://github.com/JoshuaTheMiller
LABEL org.opencontainers.image.title Vanilla-Terraria
LABEL org.opencontainers.image.source https://github.com/JoshuaTheMiller/Vanilla-Terraria

EXPOSE 7777

COPY --from=base /terraria/ /ts/
COPY start.sh /usr/local/bin/

ARG TERRARIA_USER_UID=8433
ARG TERRARIA_USER_NAME=terraria

RUN mkdir /world && \    
    mkdir -p /home/terraria/ && \
    useradd -u $TERRARIA_USER_UID $TERRARIA_USER_NAME && \
    chown -R $TERRARIA_USER_NAME /ts/ && \
    chown -R $TERRARIA_USER_NAME /home/terraria/ && \
    chown -R $TERRARIA_USER_NAME /world && \
    chown    $TERRARIA_USER_NAME /usr/local/bin/start.sh && \     
    chmod 700 /ts/TerrariaServer.exe && \
    chmod -R u+rw /ts/ && \        
    chmod -R 700 /world && \                                  
    chmod 500 /usr/local/bin/start.sh

# Allow for external data
VOLUME ["/world"]

# Set working directory to server
WORKDIR /ts

USER terraria

# run the start script, which will set the password if provided and then run Terraria
ENTRYPOINT ["start.sh"]
CMD ["-autocreate", "1", "-world", "/world/Terrarium.wld"]
