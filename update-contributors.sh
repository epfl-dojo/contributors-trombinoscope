#!/usr/bin/env bash
# set -e -x

# Target file
TARGET=README.md

# Markers
START=start_contributors
END=end_contributors
LEAD="^<!-- ${START} .*-->$"
TAIL="^<!-- ${END} .*-->$"

# Leave blank for no backup.
# *.bak, *.back, *.backup, *.copy, *.tmp, *.previous are git ignored
BACKUP_SUFFIX=.previous

# Target URL
# TODO: get these from the current repo
USER=epfl-dojo
REPO=contributeurs-trombinoscope

# When mode:something is used
get_list_mode () {
  MODE=$(sed -n "s/^<\!-- ${START}\s.*mode:\s*\(\S*\).*$/\1/p" $TARGET)
  # default MODE is "bullet"
  [ -z "$MODE" ] && MODE="bullet"
}

# Fetch the contributors list
fetch_contributors_as_a_bullet_list () {
  CONTRIBUTORS_LIST=$(curl -s https://api.github.com/repos/${USER}/${REPO}/contributors | jq -r '.[] | "  * [@\(.login)](\(.html_url))"'); \
  echo "${CONTRIBUTORS_LIST}" > tmp_data
  # cat tmp_data
}

# Insert the contributors list between the markers
update_contributors_in_file () {
  sed -i$BACKUP_SUFFIX -e "/$LEAD/,/$TAIL/{ /$LEAD/{p; r tmp_data
}; /$TAIL/p; d }" $TARGET
}

get_list_mode
case $MODE in
[bB]ullet)
  fetch_contributors_as_a_bullet_list
  ;;
trombinoscope)
  echo "WIP"
  ;;
*)
  fetch_contributors_as_a_bullet_list
  ;;
esac
update_contributors_in_file

# Output the resulting file
cat $TARGET
