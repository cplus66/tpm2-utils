#!/bin/bash -xe
# pki --req --keyid 0x81010003 --san koala.strongswan.org
#    --dn "C=CH, O=strongSwan, CN=koala.strongswan.org"
#    --outform pem > ak_ecc_req.pem

AK_HANDLE=$1
SUBJECT_ALT_NAME=$2
SUBJECT_DIST_NAME=$3
CSR=$4

pki --req --keyid $AK_HANDLE --san ${SUBJECT_ALT_NAME} \
    --dn "${SUBJECT_DIST_NAME}" \
    --outform pem > $CSR
