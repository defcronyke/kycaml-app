#!/bin/bash

pwd="$PWD"

cd ../..; \
go get; \
cd "$pwd"

go build && \
./kycaml-json | tee ../../static/cons.json >/dev/null; \
