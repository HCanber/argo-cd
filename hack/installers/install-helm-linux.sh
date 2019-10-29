#!/bin/bash
set -eux -o pipefail

[ -e $DOWNLOADS/helm.tar.gz ] || curl -sLf --retry 3 -o $DOWNLOADS/helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.15.1-linux-amd64.tar.gz
echo "b4d366bd6625477b2954941aeb7b601946aa4226af6728e3a84eac4e62a84042  $DOWNLOADS/helm.tar.gz" | sha256sum -c
tar -C /tmp/ -xf $DOWNLOADS/helm.tar.gz
cp /tmp/linux-amd64/helm $BIN/helm
helm version --client
