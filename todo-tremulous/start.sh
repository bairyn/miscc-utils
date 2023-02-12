#!/bin/bash
set -ueE -o pipefail
trap 'echo "An error occurred ($?) on line ${LINENO:-} (\$0 $0); aborting..." 1>&2' ERR

#false
# TODO: check time stamps.
(cd "./build/release-linux-x86_64/base" && zip -9r "${HOME}/.tremulous-oc-server/repo-oc/vms-oc.pk3" ./vm/*.qvm)
(cd "./assets" && zip -9r "${HOME}/.tremulous-oc-server/repo-oc/oc-assets.pk3" ./*)
./build/release-linux-x86_64/tremded.x86_64 +set fs_basepath "${HOME}/.tremulous-oc-server" +set fs_homepath "${HOME}/.tremulous-oc-server-home" +set net_port 30720 +exec oc-server.cfg +dedicated 1 "$@"
