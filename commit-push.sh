#!/bin/bash

git_commit_push() {
  msg="$@"

  pwd="$PWD"
  
  cp README.md ../kycaml/

  cd cmd/kycaml-sdn-json; \
  ./run.sh; \
  cd "$pwd"

  cd cmd/kycaml-cons-json; \
  ./run.sh; \
  cd "$pwd"

  rm -rf ./docs; \
  rm -rf ./public; \
  cp -r static/ docs/; \
  cp -r static/ public/

  cd ../kycaml; \
  go get; \
  go build; \
  git add . && \
  git commit -m "$msg" && \
  git push; \
  cd "$pwd"

  go get; \
  go build; \
  git add . && \
  git commit -m "$msg" && \
  git push
}

git_commit_push "$@"
