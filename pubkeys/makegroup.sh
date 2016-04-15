#!/usr/bin/env bash
# Little hack to create a gpg group with all the keys in the gss_pubkeys repo
# Dump the output of this program at the end of your ~/.gnupg/gpg.conf file

ABSPATH=$(cd "$(dirname "$0")"; pwd)
cd $ABSPATH
find . -name "*.asc" -o -name "*.gpg" -type f | xargs -I {} gpg --with-fingerprint {} | grep pub | awk -F'[/ ]' '{printf "0x%s ",$4}' | awk '{printf "group gssteam = %s\n",$0}' 
