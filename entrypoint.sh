#!/bin/bash
sleep 2

cd /home/container

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Get SinusBot
curl -O https://www.sinusbot.com/dl/sinusbot-beta.tar.bz2
tar -xjf sinusbot-beta.tar.bz2
cp config.ini.dist config.ini

# Get Teamspeak
wget http://api.paradox.cloud/packages/TeamSpeak3-Client-linux_amd64-3.0.18.2.tar.gz
tar xfvz TeamSpeak3-Client-linux_amd64-3.0.18.2.tar.gz

cp plugin/libsoundbot_plugin.so TeamSpeak3-Client-linux_amd64/plugins/

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
