#!/usr/bin/env bash
# set -e -x

TARGET=README.md

LEAD='^<!-- start_contributors .*-->$'
TAIL='^<!-- end_contributors .*-->$'

# Leave blank for no backup.
# *.bak, *.back, *.backup, *.copy, *.tmp, *.previous are git ignored
BACKUP_SUFFIX=.backup

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
sed -i$BACKUP_SUFFIX -e "/$LEAD/,/$TAIL/{ /$LEAD/{p; r tmp_data
}; /$TAIL/p; d }" $TARGET

cat $TARGET
