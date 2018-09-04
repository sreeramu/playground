#!/bin/bash

mkdir $HOME/daily/
cp -R /home/travis/build/sreeramu/playground/build/app/outputs/apk/release/app-release.apk $HOME/daily/
# go to home and setup git
cd $HOME
git config --global user.email "sreeramu@gmail.com"
git config --global user.name "sreeramu"
  
git clone --quiet --branch=development https://sreeramu:$GITHUB_API_KEY@github.com/sreeramu/flutter-notes.git  development > /dev/null
cd development
mkdir sample-apk
cp -Rf $HOME/daily/*  sample-apk/
git add -f .
# git remote rm origin
# git remote add origin https://sreeramu:$GITHUB_API_KEY@github.com/sreeramu/flutter-notes
#git add -f .
git commit -m "Update Sample Apk [skip ci]"
git push origin development > /dev/null
