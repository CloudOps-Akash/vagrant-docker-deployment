#!/bin/bash

# Execute deploy_app.sh on client1
ssh vagrant@client1 bash deploy_app.sh

# Execute deploy_app.sh on client2
ssh vagrant@client2 bash deploy_app.sh

