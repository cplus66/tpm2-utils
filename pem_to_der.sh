#!/bin/bash -xe
# openssl x509 -outform der -in certificate.pem -out certificate.der

PEM=$1
DER=$2

openssl x509 -outform der -in $PEM -out $DER
