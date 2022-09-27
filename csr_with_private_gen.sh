#!/bin/bash -xe
# openssl req -out CSR.csr -key privateKey.key -new

CSR=$1
PRIVATE_KEY=$2

openssl req -out $CSR -key $PRIVATE_KEY -new
