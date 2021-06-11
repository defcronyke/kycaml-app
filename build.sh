#!/bin/bash
# NOTE: Install the "fresh" utility by running this command
# outside of this project's directory somewhere:
# go get github.com/pilu/fresh && go install github.com/pilu/fresh
#
# NOTE: Install the "upx" utility first before running this.

pwd="$PWD"; \
cd ../kycaml; \
go get; \
cd "$pwd"; \
go get; \
go build -ldflags="-s -w"; \
upx --brute kycaml-app
