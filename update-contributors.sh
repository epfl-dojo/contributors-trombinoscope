data=$(curl -s https://api.github.com/repos/epfl-dojo/contributeurs-trombinoscope/contributors | jq -r '.[] | "  - [@\(.login)](\(.html_url))"')

echo "$data"
