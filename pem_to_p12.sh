#!/bin/bash -xe
# openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile CACert.crt

PKCS12=$1
PRIVATE_KEY=$2
CERTIFICATE=$3
CA_CERTIFICATE=$4

openssl pkcs12 -export -out $PKCS12 -inkey $PRIVATE_KEY -in $CERTIFICATE -certfile $CA_CERTIFICATE
