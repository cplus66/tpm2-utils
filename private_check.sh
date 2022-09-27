#!/bin/bash -xe
# openssl rsa -in privateKey.key -check

openssl rsa -in $1 -check
