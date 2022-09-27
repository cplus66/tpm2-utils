#!/bin/bash -xe

PRIVATE_KEY=$1
CERTIFICATE=$2

openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout $PRIVATE_KEY -out $CERTIFICATE
