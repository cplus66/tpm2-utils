#!/bin/bash -xe
# openssl req -out CSR.csr -new -newkey rsa:2048 -nodes -keyout privateKey.key

CSR=$1
PRIVATE_KEY=$2

openssl req -out $CSR -new -newkey rsa:2048 -nodes -keyout $PRIVATE_KEY
