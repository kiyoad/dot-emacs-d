#!/bin/bash
set -euxo pipefail
nkf -w /usr/share/dict/gene.sdic   > ./eiwa.sdic
nkf -w /usr/share/dict/jedict.sdic > ./waei.sdic
