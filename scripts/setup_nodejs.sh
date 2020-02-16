 #!/usr/bin/env bash
 cd ~

 sudo curl -LO https://nodejs.org/dist/v12.15.0/node-v12.15.0-linux-x64.tar.xz
 
 sudo ls

 sudo tar xf node-v12.15.0-linux-x64.tar.xz
 
 sudo ls
 
 sudo cp -r node-v12.15.0-linux-x64/bin/node /usr/local/bin/

 sudo mkdir -p  /opt/node-apps/demo0/site/

 sudo mv /tmp/node.js /opt/node-apps/demo0/site/

 sudo mv /tmp/nodejs.service /etc/systemd/system/

 sudo systemctl enable nodejs.service

 sudo systemctl start nodejs.service
 sudo systemctl status nodejs.service