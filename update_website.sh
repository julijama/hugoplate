#!/bin/bash

if [ -z "$1" ]; then
  echo "You need to specify the changes to commit as an argument."
  exit 1
else
  git add -A
  git commit -m "$1"
  git push -u origin main

  npm run build
  
  cd public
  git add -A
  git commit -m "$1"
  git pull
  git push -u origin main

  cd ..
  git add .
  git commit -m "Update submodule"
  git push -u origin main
fi
