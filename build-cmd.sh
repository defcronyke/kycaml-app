#!/bin/bash
# Copyright (C) 2021  Jeremy Carter <jeremy@jeremycarter.ca>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

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

pwd="$PWD"

cd ../kycaml; \
go get; \
cd "$pwd"; \
go get

for dir in ${KYCAML_APP_CMD_DIRS[@]}; do
	cd cmd/"$dir"; \
	echo "building: $dir"; \
	go build -ldflags="-s -w"; \
	upx --brute "$dir"; \
	cd "$pwd"
done
