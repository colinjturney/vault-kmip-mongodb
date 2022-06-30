#!/bin/bash

export VAULT_ADDR=http://127.0.0.1:8200

vault login root

vault secrets enable kmip

vault write kmip/config listen_addrs=0.0.0.0:5696 server_hostnames="10.0.2.2"

vault read kmip/config

sleep 10

echo " "

vault read kmip/ca

echo "Outputting kmip ca to ca.pem..."

vault read -format=json kmip/ca | jq -r ".data.ca_pem" > ca.pem