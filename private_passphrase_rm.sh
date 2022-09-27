#!/bin/bash -xe

OLD_PRIVATE_KEY=$1
NEW_PRIVATE_KEY=$2

openssl rsa -in $OLD_PRIVATE_KEY -out $NEW_PRIVATE_KEY
