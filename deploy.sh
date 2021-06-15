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

# NOTE: Make sure to run this command at least once first:
# ./update-lists.sh

gcloud beta run deploy kycaml \
  --image gcr.io/kycaml-app/kycaml-app:latest \
  --project kycaml-app \
  --region us-central1 \
  --platform managed \
  --concurrency 150 \
  --cpu 1 \
  --min-instances 0 \
  --max-instances 32 \
  --memory 2Gi \
  --timeout 600 \
  --ingress all \
  --allow-unauthenticated \
  --no-use-http2
