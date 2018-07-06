ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Set the node environment to ignore devDependencies.
ENV NODE_ENV production

# Install the node app to our container so we can run it globally.
RUN yarn global add smartthings-mqtt-bridge@3.0.0 --tilde

# Add the user config files to the container.
COPY run.sh /
COPY template.yml /templates/

# Make the bash script executable.
RUN chmod a+x /run.sh

ENV CONFIG_DIR=/data

# Create the config and run the service.
CMD [ "/run.sh" ]

# Build arugments
ARG BUILD_ARCH
ARG BUILD_VERSION
ARG BUILD_DATE

# Labels
LABEL \
    io.hass.name="Smartthings Bridgio" \
    io.hass.description="Bridge between SmartThings and MQTT." \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version="${BUILD_VERSION}" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.schema-version="1.0" \
