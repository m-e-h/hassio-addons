#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

export MQTT_HOST=`node -p "require('$CONFIG_PATH').broker_host"`
export PREFACE=`node -p "require('$CONFIG_PATH').preface"`
export BRIDGE_PORT=`node -p "require('$CONFIG_PATH').bridge_port"`
export READ_STATE=`node -p "require('$CONFIG_PATH').state_read_suffix"`
export WRITE_STATE=`node -p "require('$CONFIG_PATH').state_write_suffix"`
export COMMAND=`node -p "require('$CONFIG_PATH').command_suffix"`
export USERNAME=`node -p "require('$CONFIG_PATH').username"`
export PASSWORD=`node -p "require('$CONFIG_PATH').password"`

rm -f /data/config.yml temp.yml
( echo "cat <<EOF >/data/config.yml";
  cat /temp/template.yml;
  echo "EOF";
) >temp.yml
. temp.yml
cat /data/config.yml

smartthings-mqtt-bridge
