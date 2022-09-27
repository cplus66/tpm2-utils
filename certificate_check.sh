#!/bin/bash -xe
# openssl x509 -in certificate.crt -text -noout

openssl x509 -in $1 -text -noout
