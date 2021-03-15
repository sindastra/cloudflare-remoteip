#!/bin/bash
# cfrip.sh
# BSD 3-Clause License
# Copyright (c) 2021, Sindastra
# All rights reserved.

echo 'cfrip.sh  BSD 3-Clause License'
echo 'Copyright (c) 2021, Sindastra  All rights reserved.'
echo

if [[ $1 == "" ]]; then
  echo 'You need to specify the path of the config file you want to create or overwrite...'
  echo "Usage: $0 /path/to/config"
  exit 1
fi

echo 'Downloading IP ranges...'
curl -sSL 'https://www.cloudflare.com/ips-v4' > cloudflareips && \
curl -sSL 'https://www.cloudflare.com/ips-v6' >> cloudflareips

if [[ $? != "0" ]]; then
  echo 'Error fetching IP ranges... are you connected to the internet?'
  rm -f cloudflareips
  echo 'No config was created or modified due to errors.'
  exit 1
fi

echo 'Creating config...'
echo '# This file was created by cfrip.sh' > $1
echo '# Manual edits might get lost...' >> $1
echo 'RemoteIPHeader CF-Connecting-IP' >> $1

for i in `cat cloudflareips`;
do
  echo RemoteIPTrustedProxy "${i}" >> $1
done

echo 'Cleaning up...'
rm -f cloudflareips
echo 'All done!'
