#!/bin/bash -xe
# openssl req -text -noout -verify -in CSR.csr

openssl req -text -noout -verify -in $1
