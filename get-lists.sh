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

kyc_aml_get_lists() {
  KYC_AML_LIST_SDN_URLS=(
    "https://www.treasury.gov/ofac/downloads/sanctions/1.0/sdn_advanced.xml"
  )

  KYC_AML_LIST_CONS_URLS=(
    "https://www.treasury.gov/ofac/downloads/sanctions/1.0/cons_advanced.xml"
  )

  # TODO: Check hashes.
  KYC_AML_LIST_HASHES_URL="https://home.treasury.gov/policy-issues/financial-sanctions/specially-designated-nationals-list-sdn-list/hash-values-for-ofac-sanctions-list-files"

  curl -sL "${KYC_AML_LIST_SDN_URLS[0]}" | tee ./static/sdn.xml >/dev/null

  curl -sL "${KYC_AML_LIST_CONS_URLS[0]}" | tee ./static/cons.xml >/dev/null
}

kyc_aml_get_lists "$@"
