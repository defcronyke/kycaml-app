#!/bin/bash

pwd="$PWD"

cd ../..; \
go get; \
cd "$pwd"

go build && \
./kycaml-sdn-json | tee ../../static/sdn.json >/dev/null; \
cd "$pwd"
