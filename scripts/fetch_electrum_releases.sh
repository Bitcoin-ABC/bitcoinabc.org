#!/usr/bin/env bash

set -euxo pipefail

# Github repository parameters
GITHUB_OWNER='Bitcoin-ABC'
GITHUB_REPO='ElectrumABC'

# Max number of release versions to display
MAX_RELEASES=15

SCRIPT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)
TOPLEVEL=$(git -C "${SCRIPT_DIR}" rev-parse --show-toplevel)

RELEASES=$(curl -L -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPO}/releases?per_page=${MAX_RELEASES})
echo "${RELEASES}" > "${TOPLEVEL}"/_data/github-releases-electrum.json
