#!/bin/bash -xe
# openssl x509 -inform der -in certificate.cer -out certificate.pem

DER=$1
PEM=$2

openssl x509 -inform der -in $DER -out $PEM
