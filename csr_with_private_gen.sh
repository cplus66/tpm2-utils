#!/bin/bash -xe

CSR=$1
PRIVATE_KEY=$2

openssl req -out $CSR -key $PRIVATE_KEY -new
