#!/bin/bash -xe
PUBLIC_KEY=$1

openssl x509 -in $PUBLIC_KEY -text -noout
