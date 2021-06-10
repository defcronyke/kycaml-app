#!/bin/bash

pwd="$PWD"

cd ../..; \
go get; \
cd "$pwd"

go build && \
./kycaml-n "$@"
