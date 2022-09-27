#!/bin/bash -xe

CSR=$1
PRIVATE_KEY=$2

openssl req -out $CSR -new -newkey rsa:2048 -nodes -keyout $PRIVATE_KEY
