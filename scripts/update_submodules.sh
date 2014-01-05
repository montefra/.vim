#!/bin/bash
# all the plugins in bundle directory are submodules. 
# According to this question
# http://stackoverflow.com/questions/1777854/git-submodules-specify-a-branch-tag
# submodules are not on a branch but point to a specific commit.
# This script goes into the bundle directory, checkout the master and pull
# 'origin' (which usually is the original github repo)




bundledir=~/.vim/bundle

echo ======================================== 
for d in $bundledir/*
do
  pushd $d
  git checkout master
  git pull origin
  popd
echo ======================================== 
done

