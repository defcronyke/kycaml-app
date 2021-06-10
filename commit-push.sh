#!/bin/bash

git_commit_push() {
  msg="$@"
  
  cp README.md kycaml/

  cd cmd/kycaml-json; \
  ./run.sh; \
  cd ../..

  rm -rf ./docs; \
  rm -rf ./public; \
  cp -r static/ docs/; \
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
