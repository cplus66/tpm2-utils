#!/bin/bash -xe
# openssl x509 -in certificate.crt -text -noout
CERTIFICATE=$1

openssl x509 -in $CERTIFICATE -text -noout
