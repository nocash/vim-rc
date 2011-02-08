#!/bin/bash

git submodule foreach '
  git checkout master;
  git fetch --all;
  git reset --hard origin/master
'

git diff --submodule=log -- bundle/
