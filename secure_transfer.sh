#!/bin/bash

# Copy files to client1
scp web-app.tar deploy_app.sh vagrant@client1:/home/vagrant

# Copy files to client2
scp web-app.tar deploy_app.sh vagrant@client2:/home/vagrant

