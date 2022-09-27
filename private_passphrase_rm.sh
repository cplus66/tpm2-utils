#!/bin/bash -xe
# openssl rsa -in privateKey.pem -out newPrivateKey.pem

OLD_PRIVATE_KEY=$1
NEW_PRIVATE_KEY=$2

openssl rsa -in $OLD_PRIVATE_KEY -out $NEW_PRIVATE_KEY
