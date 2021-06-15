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
  git push -u all master; \
  cd "$pwd"

  go get; \
  go build; \
  git add . && \
  git commit -m "$msg" && \
  git push -u all master
}

git_commit_push "$@"
