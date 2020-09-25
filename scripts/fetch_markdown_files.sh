#!/usr/bin/env bash
# Pull all the markdown files from the ABC repository so they can be converted
# and rendered by jekyll. The tree directory structure is preserved in order to
# keep the links working.
# The path to the ABC repository must be passed as a command line argument.

set -euxo pipefail

SRC_DIR=$1

SCRIPT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)
TOPLEVEL=$(git -C "${SCRIPT_DIR}" rev-parse --show-toplevel)

cd "${SRC_DIR}"

ABC_MD_DOCS_BASE="${TOPLEVEL}/abc_md_docs"
mkdir -p "${ABC_MD_DOCS_BASE}"

FILES=($(git ls-files "*.md"))

for FILE in "${FILES[@]}"
do
  FILE_DST="${ABC_MD_DOCS_BASE}/${FILE}"
  mkdir -p "$(dirname ${FILE_DST})"

  NAME="${FILE}" \
  PERMALINK="/${FILE%.*}.html" \
  envsubst < "${TOPLEVEL}/scripts/md_docs_frontmatter.yml.in" > "${FILE_DST}"
  cat "${FILE}" >> "${FILE_DST}"
done
