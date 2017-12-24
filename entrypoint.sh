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
wget http://dl.4players.de/ts/releases/3.0.18.2/TeamSpeak3-Client-linux_amd64-3.0.18.2.run
chmod 0755 TeamSpeak3-Client-linux_amd64-3.0.18.2.run

# Needed silent installation method
./TeamSpeak3-Client-linux_amd64-3.0.18.2.run



cp plugin/libsoundbot_plugin.so TeamSpeak3-Client-linux_amd64/plugins/
chmod 755 sinusbot

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}
