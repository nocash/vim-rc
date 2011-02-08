#!/bin/bash

git submodule foreach "
  git fetch --all

  GIT_BRANCH=`git branch | awk '/^* / { print $2 }'`
  if [ ! $GIT_BRANCH = 'master' ]; then
    git checkout master
  fi

  git reset --hard origin/master
"

git diff --submodule=log -- bundle/
