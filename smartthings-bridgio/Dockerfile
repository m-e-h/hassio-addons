ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Set the node environment to ignore devDependencies.
ENV NODE_ENV production

# Install the node app to our container so we can run it globally.
RUN yarn global add smartthings-mqtt-bridge@3.0.0 --tilde

# Add the user config files to the container.
COPY run.sh /
COPY template.yml /

# Make the bash script executable.
RUN chmod a+x /run.sh

# ENV CONFIG_DIR=/data
ENV CONFIG_DIR=/config

# EXPOSE 2080

# Create the config and run the service.
CMD [ "/run.sh" ]
