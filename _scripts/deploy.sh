#!/bin/bash
set -x

eval `ssh-agent -s` #start ssh agent
chmod 600 ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

if [ $TRAVIS_BRANCH == 'master' ] ; then
    # Initialize a new git repo in _site, and push it to our server...
    cd _site
    git init
        
    git remote add deploy "deploy@resuscikate.com:/var/www/rk"
    git config user.name "resuscikate"
    git config user.email "katejuliabeckett@gmail.com"
    
    git add .
    git commit -m "Deploy"
    git push --force deploy master
else
    echo "Not deploying, since this branch isn't master."
fi
