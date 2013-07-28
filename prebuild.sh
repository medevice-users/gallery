#!/bin/bash

echo "HELLO WORLD [via travis?]"
export REPO_URL="https://$GH_TOKEN@github.com/$GH_REPO.git"
git config user.email 'bewest@gmail.com'
git config user.name 'Ben West [via travis]'
echo "STATUS"
git status
git remote rename origin old
echo "remotes pre pre-authorized remote url"
git config deployRemote $REPO_URL
git remote -v
git remote add origin $REPO_URL


