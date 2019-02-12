# !/bin/bash

BLUE='\x1B[0;34m'
RED='\x1B[0;31m'
RESET='\x1B[0m'
cd ~/git/rhyme-app
for dir in */ ; do
  cd $dir
  branch=`git rev-parse --abbrev-ref HEAD`
  if [ "$branch" == "master" ]; then
    echo -e "Pulling $dir"
    git pull
  else
    echo -e "$RED$branch$RESET for $dir"
  fi
  cd ..
done
