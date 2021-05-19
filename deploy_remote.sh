#!/bin/bash
#deploy_remote.sh
java version
if [[ $? != 0 ]] then sudo amazon-linux-extras install -y java-openjdk11 fi
#On copie les fichiers sur la machine distante
scp /app
HelloWorld.class
#On exécute l'application sur la machine distante
ssh -c 'cd /app && java HelloWorld'
