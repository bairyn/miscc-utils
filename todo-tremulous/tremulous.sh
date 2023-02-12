#!/bin/bash
set -ueE -o pipefail
trap 'echo "An error occurred ($?) on line ${LINENO:-} (\$0 $0); aborting..." 1>&2' ERR

DEFAULT_TREMULOUS="${HOME}/software/tremulous/tremulous-gpp1.x/tremulous/tremulous-gpp.x86_64"
DEFAULT_TREMULOUS_ALT="${HOME}/git/tremulous/build/release-linux-x86_64/tremulous.x86_64"

TREMULOUS="${TREMULOUS-"${DEFAULT_TREMULOUS}"}"

cd -- "${HOME}/tremulous"

# TODO: for TREMULOUS_ALT, be sure to pack vms!

printf '%s\n' "TREMULOUS: $TREMULOUS"
cmd=""
fs_basepath="${HOME}/.tremulous-client"
fs_homepath="${HOME}/.tremulous-client-home"
cmd="${TREMULOUS} +set fs_basepath ${fs_basepath@Q} +set fs_homepath ${fs_homepath@Q} +exec bairyn.cfg ${*@Q}"
printf '%s\n' "$cmd"
eval "$cmd"
