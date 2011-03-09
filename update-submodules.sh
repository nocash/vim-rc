#!/bin/bash

git submodule update
git submodule foreach "git pull origin master"
git diff --submodule=log -- bundle/
