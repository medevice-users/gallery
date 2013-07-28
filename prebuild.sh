#!/bin/bash

echo "HELLO WORLD [via travis?]"
echo "GIT_NAME $GIT_NAME"
echo "GIT_EMAIL $GIT_EMAIL"
export REPO_URL="https://$GH_TOKEN@github.com/$GH_REPO.git"
git config user.email "$GIT_EMAIL"
git config user.name "$GIT_NAME"
echo "STATUS"
git status
git remote rename origin old
echo "remotes pre pre-authorized remote url"
git config deployRemote $REPO_URL
git remote -v
git remote add origin $REPO_URL


