#!/bin/bash
#deploy_remote.sh

MACHINE_DESTINATION=ec2-user@ec2-52-201-68-205.compute-1.amazonaws.com
PATH_PRIVATE_KEY=/secrets/kp-sandy.pem

ssh -o StrictHostKeyChecking=no -i $PATH_PRIVATE_KEY $MACHINE_DESTINATION 'sudo amazon-linux-extras install -y java-openjdk11'

ssh -o StrictHostKeyChecking=no -i $PATH_PRIVATE_KEY $MACHINE_DESTINATION 'sudo mkdir -p /app && sudo chmod -R 777 /app && sudo chown ec2-user /app'
scp -o StrictHostKeyChecking=no -i $PATH_PRIVATE_KEY helloWorld.class $MACHINE_DESTINATION:/home/ec2-user/helloWorld.class
ssh -o StrictHostKeyChecking=no -i $PATH_PRIVATE_KEY $MACHINE_DESTINATION 'sudo cp /home/ec2-user/helloWorld.class /app'
ssh -o StrictHostKeyChecking=no -i $PATH_PRIVATE_KEY $MACHINE_DESTINATION 'sudo cd /app && sudo java helloWorld'
