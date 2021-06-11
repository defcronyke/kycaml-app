#!/bin/bash

kyc_aml_get_lists() {
  KYC_AML_LIST_SDN_URLS=(
    "https://www.treasury.gov/ofac/downloads/sanctions/1.0/sdn_advanced.xml"
    # "https://www.treasury.gov/ofac/downloads/sdn.xml"
  )

  KYC_AML_LIST_CONS_URLS=(
    "https://www.treasury.gov/ofac/downloads/sanctions/1.0/cons_advanced.xml"
    # "https://www.treasury.gov/ofac/downloads/consolidated/consolidated.xml"
  )

  # TODO: Check hashes.
  KYC_AML_LIST_HASHES_URL="https://home.treasury.gov/policy-issues/financial-sanctions/specially-designated-nationals-list-sdn-list/hash-values-for-ofac-sanctions-list-files"

  curl -sL "${KYC_AML_LIST_SDN_URLS[0]}" | tee ./static/sdn.xml >/dev/null
#   curl -sL "${KYC_AML_LIST_SDN_URLS[1]}" | tee ./static/sdn-old.xml >/dev/null

  curl -sL "${KYC_AML_LIST_CONS_URLS[0]}" | tee ./static/cons.xml >/dev/null
#   curl -sL "${KYC_AML_LIST_CONS_URLS[1]}" | tee ./static/cons-old.xml >/dev/null
}

kyc_aml_get_lists "$@"
