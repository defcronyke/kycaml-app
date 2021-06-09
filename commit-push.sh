#!/bin/bash

git_commit_push() {
  msg="$@"

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
