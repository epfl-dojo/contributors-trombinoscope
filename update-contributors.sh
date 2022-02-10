#!/usr/bin/env bash
# set -e -x

LEAD='^<!-- start_contributors .*-->$'
TAIL='^<!-- end_contributors .*-->$'

# TODO: get these from the current repo
USER=epfl-dojo
REPO=contributeurs-trombinoscope

# Fetch the contributors list
contrib_list () {
  CONTRIBUTORS_LIST=$(curl -s https://api.github.com/repos/${USER}/${REPO}/contributors | jq -r '.[] | "  * [@\(.login)](\(.html_url))"'); \
  echo "${CONTRIBUTORS_LIST}" > tmp_data
  cat tmp_data
}

contrib_list
sed -i -e "/$LEAD/,/$TAIL/{ /$LEAD/{p; r tmp_data
}; /$TAIL/p; d }" README.md

cat README.md
