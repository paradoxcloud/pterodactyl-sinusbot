# pterodactyl-sinusbot

## Install Script
Script Container: ubuntu:16.04
Script Entrypoint Command: bash

```bash
#!/bin/bash
# Sinusbot Installation Script w/ youtube-dl
#
# Server Files: /mnt/server

apt -y update
apt -y --no-install-recommends install curl ca-certificates bzip2
cd /tmp

# Create Folders
mkdir -p /mnt/server

# Get Packages
curl -O http://api.paradox.cloud/packages/TeamSpeak3-Client-linux_amd64-3.0.18.2.tar.gz
curl -O https://www.sinusbot.com/dl/sinusbot-beta.tar.bz2
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /mnt/server/youtube-dl

# Extract Packages
tar -xzf TeamSpeak3-Client-linux_amd64-3.0.18.2.tar.gz -C /mnt/server
tar -xjf sinusbot-beta.tar.bz2 -C /mnt/server

# Config & dependencies
cd /mnt/server
cp config.ini.dist config.ini
cp plugin/libsoundbot_plugin.so TeamSpeak3-Client-linux_amd64/plugins/
chmod 755 sinusbot
chmod a+rx youtube-dl
```
