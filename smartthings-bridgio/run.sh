#!/bin/bash
set -e

# Smartthings MQTT Bridge accepts a config.yml for user configs.
# Lets create one from our options.json.
CONFIG_OPTIONS=/data/options.json

# Get the user configs from JSON.
export MQTT_HOST=`node -p "require('$CONFIG_OPTIONS').broker_host"`
export PREFACE=`node -p "require('$CONFIG_OPTIONS').preface"`
export BRIDGE_PORT=`node -p "require('$CONFIG_OPTIONS').bridge_port"`
export READ_STATE=`node -p "require('$CONFIG_OPTIONS').state_read_suffix"`
export WRITE_STATE=`node -p "require('$CONFIG_OPTIONS').state_write_suffix"`
export COMMAND=`node -p "require('$CONFIG_OPTIONS').command_suffix"`
export USERNAME=`node -p "require('$CONFIG_OPTIONS').username"`
export PASSWORD=`node -p "require('$CONFIG_OPTIONS').password"`

# Push the JSON data to the yaml template and create a config.yml.
rm -f /data/config.yml temp.yml
( echo "cat <<EOF >/data/config.yml";
  cat /templates/template.yml;
  echo "EOF";
) >/templates/temp.yml
. /templates/temp.yml
cat /data/config.yml

# Run the node app.
smartthings-mqtt-bridge
