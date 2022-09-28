#!/bin/bash -xe 
# openssl pkcs12 -info -in keyStore.p12
PKCS12=$1

openssl pkcs12 -info -in $PKCS12
