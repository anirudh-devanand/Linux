#!/bin/bash

#ENV_LANG=environment language
#SOURCE_REPO=source code repository
#SOURCE_ROOT=root directory of source repository
#SOURCE_MT_PATH=mount path of source code repository


#SOURCE_ROOT=echo $SOURCE_REPO| rev | cut -d '/' -f 1 | rev | cut -f '.' 1

ENV_LANG=$1
WORK_DIR=$2
OUTPUT_DIR=$3
APP_DIR=$4
START_PERIOD=$5

sudo apt update
[ "$ENV_LANG" = "java" ] && apt intsall -y openjdk:latest
[ "$ENV_LANG" = "python" ] && apt intsall -y python2 python3
[ "$ENV_LANG" = "golang" ] && apt intsall -y golang-go
[ "$ENV_LANG" = "node" ] && apt intsall -y nodejs
[ "$ENV_LANG" = "net" ] && apt intsall -y apt-transport-https curl && /
						curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg; /
						echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/microsoft.list > /dev/null; /
						apt install -y aspnetcore-runtime-5.0


cd /project

gpctl gen --testScript=testScript.sh  --workingDir=WORK_DIR --outputDir=OUTPUT_DIR --appDir=APP_DIR --startPeriod=START_PERIOD


