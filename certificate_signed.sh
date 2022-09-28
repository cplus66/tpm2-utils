#!/bin/bash -xe
# pki --issue --cacert ca_cert.pem --cakey ca_key.pem 
#    --type pkcs10 --in ak_ecc_req.pem --lifetime 3651
#    --outform pem > ak_ecc_cert.pem

CA_CERTIFICATE=$1
CA_PRIVATE_KEY=$2
CSR=$3
CERTIFICATE=$4

pki --issue --cacert $CA_CERTIFICATE --cakey $CA_PRIVATE_KEY \
    --type pkcs10 --in $CSR --lifetime 3651 \
    --outform pem > $CERTIFICATE
