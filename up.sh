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

# Install the "fresh" utility by running this command
# outside of this project's directory somewhere:
# go get github.com/pilu/fresh && go install github.com/pilu/fresh

kycaml_up() {
  rsync -av ../kycaml/ ./.kycaml/

  if [ $# -gt 0 ]; then
    # Rebuild containers: ./up.sh -b
    if [ "$1" == "-b" ]; then
      ./build-container.sh
      build_res=$?

      if [ $build_res -ne 0 ]; then
        echo "error: build failed: exit code: $build_res"
        return $build_res
      fi
    fi
  fi

  docker network create kycaml || true

  docker-compose up -d && \
  ./logs.sh || \
  ./build-container.sh && \
  docker-compose up -d && \
  ./logs.sh
}

kycaml_up "$@"
