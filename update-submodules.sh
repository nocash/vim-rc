#!/bin/bash

git submodule foreach '
  git checkout master;
  git fetch --all;
  git --no-pager log --oneline --reverse master..origin/master;
  git reset --hard origin/master
'
