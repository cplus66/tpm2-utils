#!/bin/bash -xe

# Key Layout

# Handle       Object
# -----------------------------------------------
# 0x81010001   ECDSA Endorsement Key
# 0x81010002   RSA Endorsement Key
# 0x81010003   ECDSA Attestation Key
# 0x81010004   RSA Attestation Key
# 0x01800003   ECDSA Attestation Key Certificate
# 0x01800004   RSA Attestation Key Certificate

# Create CA
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout cakey.pem -out cacert.pem

# 0x81010001   ECDSA Endorsement Key
# tpm2_createek -G ecc -c 0x81010001 -u ek_ecc.pub
tpm2_getpubek -H 0x81010001 -g ecc -f ek_ecc.pub

# 0x81010002   RSA Endorsement Key
# tpm2_createek -G rsa -c 0x81010002 -u ek_rsa.pub
tpm2_getpubek -H 0x81010002 -g rsa -f ek_rsa.pub

# 0x81010003   ECDSA Attestation Key
# tpm2_createak -C 0x81010003 -G ecc -g sha256 -s ecdsa -c ak_ecc.ctx -u ak_ecc.pub -n ak_ecc.name
tpm2_getpubak -E 0x81010001 -g ecc -D sha256 -s ecdsa -k 0x81010003 -f ak_ecc.pub 

# 0x81010004   RSA Attestation Key
# tpm2_createak -C 0x81010004 -G rsa -g sha256 -s rsassa -c ak_rsa.ctx -u ak_rsa.pub -n ak_rsa.name
tpm2_getpubak -E 0x81010002 -g ecc -D sha256 -s ecdsa -k 0x81010004 -f ak_ecc.pub 

# 0x01800003   ECDSA Attestation Key Certificate
pki --req --type priv --keyid 0x81010003 --dn "C=CH, O=strongSec GmbH, OU=AK ECC, CN=edu.strongsec.com" --san edu.strongsec.com --outform pem \
> ak_ecc_req.pem

pki --issue --cacert cacert.pem --cakey cakey.pem --type pkcs10 --in ak_ecc_req.pem --dn "C=CH, O=strongSec GmbH, OU=AK ECC, CN=edu.strongsec.com" \
--san "edu.strongsec.com" --crl http://www.strongsec.com/ca/strongsec.crl --flag serverAuth --lifetime 1827 > ak_ecc_cert.der

#tpm2_nvdefine 0x01800003 -C o -s 1001 -a 0x2000A
#tpm2_nvwrite  0x01800003 -C o -i ak_ecc_cert.der

# Auth-handle: TPM_RH_OWNER(0x40000001)
# Attribute: 0x2000A
fsize=$(du -b ak_ecc_cert.der | cut -f 1)
tpm2_nvdefine -x 0x01800003 -a 0x40000001 -t 0x2000A -s ${fsize}
tpm2_nvwrite -x  0x01800003 -a 0x40000001 ak_ecc_cert.der

# 0x01800004   RSA Attestation Key Certificate
pki --req --type priv --keyid 0x81010004 --dn "C=CH, O=strongSec GmbH, OU=AK RSA, CN=edu.strongsec.com" --san edu.strongsec.com --outform pem \
> ak_rsa_req.pem

pki --issue --cacert cacert.pem --cakey cakey.pem --type pkcs10 --in ak_rsa_req.pem --dn "C=CH, O=strongSec GmbH, OU=AK RSA, CN=edu.strongsec.com" \
--san "edu.strongsec.com" --crl http://www.strongsec.com/ca/strongsec.crl --flag serverAuth --lifetime 1827 > ak_rsa_cert.der

#tpm2_nvdefine 0x01800004 -C o -s 1001 -a 0x2000A
#tpm2_nvwrite  0x01800004 -C o -i ak_rsa_cert.der

# Auth-handle: TPM_RH_OWNER(0x40000001)
# Attribute: 0x2000A
fsize=$(du -b ak_rsa_cert.der | cut -f 1)
tpm2_nvdefine -x 0x01800004 -a 0x40000001 -t 0x2000A -s ${fsize}
tpm2_nvwrite  -x 0x01800004 -a 0x40000001 ak_rsa_cert.der
