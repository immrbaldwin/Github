#!/bin/bash

ABSPATH=$(cd "$(dirname "$0")"; pwd)
cd $ABSPATH
#git pull
for filename in `ls`; do gpg --import $filename; done

GSS_TEAM=`./makegroup.sh`
echo "$GSS_TEAM"

# This adds or replaces gpg group in the gpg config
sed -i .bak '/group gssteam *=/d' ~/.gnupg/gpg.conf
echo $GSS_TEAM >> ~/.gnupg/gpg.conf
