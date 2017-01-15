#!/bin/bash
set -x # Show the output of the following commands (useful for debugging)
    
# Import the SSH deployment key
openssl aes-256-cbc -K $encrypted_1fc90f464345_key -iv $encrypted_1fc90f464345_iv -in kd-deploy.enc -out kd-deploy -d
rm kd-deploy.enc # Don't need it anymore
chmod 600 kd-deploy
mv kd-deploy ~/.ssh/id_rsa
    
# Install zopfli
git clone https://github.com/google/zopfli.git
cd zopfli
make
chmod +x zopfli
cd ..
