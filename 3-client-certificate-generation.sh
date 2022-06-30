#!/bin/bash

export VAULT_ADDR=http://127.0.0.1:8200

vault login root

vault write -format=json \
    kmip/scope/finance/role/accounting/credential/generate \
    format=pem > credential.json

jq -r .data.certificate < credential.json > cert.pem

jq -r .data.private_key < credential.json > key.pem

vault list kmip/scope/finance/role/accounting/credential

cat cert.pem key.pem > client.pem