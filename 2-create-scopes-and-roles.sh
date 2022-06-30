#!/bin/bash

export VAULT_ADDR=http://127.0.0.1:8200

vault login root

vault write -f kmip/scope/finance

echo "List existing scopes..."

vault list kmip/scope

echo "Create new role called accounting under finance scope..."

vault write kmip/scope/finance/role/accounting operation_all=true

echo "List all roles under finance scope..."

vault list kmip/scope/finance/role

echo "Read accounting role definition under the finance scope..."

vault read kmip/scope/finance/role/accounting