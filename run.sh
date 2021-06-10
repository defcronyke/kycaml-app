#!/bin/bash
# Install the "fresh" utility by running this command
# outside of this project's directory somewhere:
# go get github.com/pilu/fresh && go install github.com/pilu/fresh

pwd="$PWD"

cd cmd/kycaml-json; \
./run.sh; \
cd "$pwd"

rm -rf ./docs; \
rm -rf ./public; \
cp -r static/ docs/; \
cp -r static/ public/

fresh
