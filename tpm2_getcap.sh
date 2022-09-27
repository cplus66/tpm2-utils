#!/bin/bash -xe

CAP="
    properties-fixed
    properties-variable
    algorithms
    commands
    ecc-curves
    handles-transient
    handles-persistent
    handles-permanent
    handles-pcr
    handles-nv-index
    handles-loaded-session
    handles-saved-session
"
for i in $CAP; do
  tpm2_getcap -c $i
done
