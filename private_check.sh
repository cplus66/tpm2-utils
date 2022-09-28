#!/bin/bash -xe
# openssl rsa -in privateKey.key -check
PRIVATE_KEY=$1

openssl rsa -in $PRIVATE_KEY -check
