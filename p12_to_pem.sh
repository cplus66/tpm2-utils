#!/bin/bash -xe
# openssl pkcs12 -in keyStore.pfx -out keyStore.pem -nodes

PKCS12=$1
PEM=$2

openssl pkcs12 -in $PKCS12 -out $PEM -nodes
