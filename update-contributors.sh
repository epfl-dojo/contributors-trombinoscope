data=$(curl -s https://api.github.com/repos/epfl-dojo/contributeurs-trombinoscope/contributors | jq -r '.[] | "  - [@\(.login)](\(.html_url))"')

echo "$data"
# sed  's/unix/linux/' README.md
sed -e "/BEGIN/,/END/c\BEGIN\n$(echo $data)\nEND" README.md
