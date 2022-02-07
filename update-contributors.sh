#!/bin/sh
set -e

if [ "$(uname)" == "Darwin" ] ; then
	SED=gsed
else
	SED=sed 
fi

$SED -e '/<!-- Start contributor trombinoscope -->/q' README.md     > README_new.md
curl -s https://api.github.com/repos/epfl-dojo/contributeurs-trombinoscope/contributors | jq -r '.[] | "  - [@\(.login)](\(.html_url))"' >> README_new.md
$SED -ne '/<!-- End contributor trombinoscope -->/,$ p' README.md  >> README_new.md

mv README_new.md README.md
