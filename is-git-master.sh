# !/bin/bash

GITDIR="/Users/namit/git"
BLUE='\x1B[0;34m'
RED='\x1B[0;31m'
RESET='\x1B[0m'
cd $GITDIR
for dir in */ ; do
  cd $GITDIR/$dir
  branch=`git rev-parse --abbrev-ref HEAD`
  if [ "$branch" == "master" ]; then
    echo -e "$BLUE$branch$RESET for $dir"
  else
    echo -e "$RED$branch$RESET for $dir"
  fi
done
