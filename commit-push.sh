#!/bin/bash

git_commit_push() {
  msg="$@"

  rm -rf ./docs
  rm -rf ./public

  cp -r static/ docs/
  cp -r static/ public/

  cd kycaml; \
  git add . && \
  git commit -m "$msg" && \
  git push; \
  cd ..

  git add . && \
  git commit -m "$msg" && \
  git push
}

git_commit_push "$@"
