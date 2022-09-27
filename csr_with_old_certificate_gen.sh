#!/bin/bash -xe
# openssl x509 -x509toreq -in certificate.crt -out CSR.csr -signkey privateKey.key

OLD_CERTIFICATE=$1
CSR=$2
PRIVATE_KEY=$3

openssl x509 -x509toreq -in $OLD_CERTIFICATE -out -CSR -signkey $PRIVATE_KEY 
