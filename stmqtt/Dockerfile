FROM node:8

ENV LANG C.UTF-8
ENV NODE_ENV production

# Create app directory
# WORKDIR /data

RUN yarn global add smartthings-mqtt-bridge@2.1.0 --tilde

COPY run.sh /
COPY template.yml /temp/

RUN chmod a+x /run.sh

ENV CONFIG_DIR=/data

# EXPOSE 2080

# Run the service
CMD [ "/run.sh" ]
