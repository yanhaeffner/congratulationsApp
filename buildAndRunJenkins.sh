#!/bin/bash

DIR="congratulationsApp"
SERVER="tomcat"
SERVER_FOLDER="apache-tomcat-8.5.59"
SCRIPT_SERVER="bin/catalina.sh"
TOMCAT_FILE="tomcat.zip"


if [ -d "$DIR" ]; then
  echo "# ${DIR} folder ok..."
else
  echo "# Creating ${DIR} folder..."
  mkdir $DIR
fi

if [ "$(ls -A "$DIR/$SERVER")" ]; then
  echo "# ${DIR}/$SERVER folder ok..." 
else
  echo "# Building $SERVER folder..."
  if test -f "$DIR/$TOMCAT_FILE"; then
    echo "# ${TOMCAT_FILE} ok"
  else 
    echo "# $TOMCAT_FILE not found, downloading now..."
    wget -O "$DIR/$TOMCAT_FILE" wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.59/bin/apache-tomcat-8.5.59.zip
  fi
  echo "# Extracting $TOMCAT_FILE now..."
  unzip "$DIR/$TOMCAT_FILE" -d "$DIR/$SERVER"
  mv "$DIR/$SERVER/$SERVER_FOLDER/"* "$DIR/$SERVER"
  rmdir "$DIR/$SERVER/$SERVER_FOLDER"
  echo "# Changing $DIR/$SERVER folder permissions to 755..."
  sudo chmod -R 755 "$DIR/$SERVER"
  
  echo "# Checking for Jenkins WAR file..."
  if test -f "$DIR/$SERVER/webapps/jenkins.war"; then
    echo "# jenkins.war ok"
  else 
    echo "# Server Jenkins not found, checking for jenkins.war..."
    if test -f "$DIR/jenkins.war"; then
      echo "# jenkins.war OK"
    else 
      echo "# jenkins.war not found, downloading now..."
      wget -O "$DIR/jenkins.war" wget https://get.jenkins.io/war-stable/2.249.2/jenkins.war
    fi
    mv "$DIR/jenkins.war" "$DIR/$SERVER/webapps"
  fi
fi

echo "# Starting $SERVER Jenkins using Java..."
"$DIR/$SERVER/$SCRIPT_SERVER" start
echo "# Enter http://localhost:8080/jenkins in your Browser to start using Jenkins"
echo "#"
echo "# Enter anything to stop the application..."

read userinput

"$DIR/$SERVER/$SCRIPT_SERVER" stop







