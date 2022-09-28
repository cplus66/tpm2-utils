#!/bin/bash -xe
# openssl req -text -noout -verify -in CSR.csr
CSR=$1

openssl req -text -noout -verify -in $CSR
