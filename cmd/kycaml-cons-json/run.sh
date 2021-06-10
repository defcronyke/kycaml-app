#!/bin/bash

pwd="$PWD"

cd ../..; \
go get; \
cd "$pwd"

go build && \
./kycaml-cons-json | tee ../../static/cons.json >/dev/null; \
cd "$pwd"
