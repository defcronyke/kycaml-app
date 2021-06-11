#!/bin/bash
# NOTE: Install the `upx` utility first before running this.

KYCAML_APP_CMD_DIRS=(
	"kycaml-cons-json"
	"kycaml-dl"
	"kycaml-dm"
	"kycaml-h"
	"kycaml-j"
	"kycaml-jw"
	"kycaml-l"
	"kycaml-lcs"
	"kycaml-n"
	"kycaml-o"
	"kycaml-p"
	"kycaml-s"
	"kycaml-sdn-json"
	"kycaml-sw"
)

for dir in ${KYCAML_APP_CMD_DIRS[@]}; do
	cd "cmd/$dir" && \
	echo "building: $dir" && \
	go build -ldflags="-s -w" && \
	upx --brute "$dir" && \
	cd ../..
done
