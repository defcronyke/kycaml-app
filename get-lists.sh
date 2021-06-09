#!/bin/bash

kyc_aml_get_lists() {
  KYC_AML_LIST_SDN_URLS=(
    "https://www.treasury.gov/ofac/downloads/sdn.xml"
    "https://www.treasury.gov/ofac/downloads/sanctions/1.0/sdn_advanced.xml"
  )

  KYC_AML_LIST_CONS_URLS=(
    "https://www.treasury.gov/ofac/downloads/consolidated/consolidated.xml"
    "https://www.treasury.gov/ofac/downloads/sanctions/1.0/cons_advanced.xml"
  )

  # TODO: Check hashes.
  KYC_AML_LIST_HASHES_URL="https://home.treasury.gov/policy-issues/financial-sanctions/specially-designated-nationals-list-sdn-list/hash-values-for-ofac-sanctions-list-files"

  idx=0
  for i in ${KYC_AML_LIST_SDN_URLS[@]}; do
    echo "$i"
    curl -sL "$i" | tee ./app/static/xml/"$(printf '%s' "$i" | awk -F'/' '{print $NF}')" >/dev/null

    idx=$((idx + 1))
  done

  idx=0
  for i in ${KYC_AML_LIST_CONS_URLS[@]}; do
    echo "$i"
    curl -sL "$i" | tee ./app/static/xml/"$(printf '%s' "$i" | awk -F'/' '{print $NF}')" >/dev/null
    
    idx=$((idx + 1))
  done
}

kyc_aml_get_lists "$@"
