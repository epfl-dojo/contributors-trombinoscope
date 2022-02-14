# Contributors' trombinoscope


## About

This is a bash script which uses `jq` and `sed` to replace contributors list in 
a file. It's meant to be used in [GitHub actions].


## Usage

Place these HTML comments to delimit the contributors list:
```html
  <!-- start_contributors -->
  <!-- end_contributors -->
```

The script will insert the contributors list between these markers.


### Modes

A few different modes are available:

* **bullet**: provide a [MarkDown] list of username's handles. This is the default.
* **tombinoscope**: provide a [HTML] list of username's pictures.
* **figure**: provide a [HTML] list of username's pictures and handles.
* **bubble**: provide a [MarkDown] list of username's rounded pictures. This is the one used below.

To set a different mode, add the `mode:modename` attribute after
`start_contributors`, e.g. `<!-- start_contributors mode:bullet -->`.

## Test

An easy way to test the result is to use [pandoc]:
```bash
pandoc -s -f gfm -t html5 -o output.html README.md
```


## Next steps

- [ ] add more modes, as an HTML table
- [ ] manage the GitHub API error, such a rate limit
- [ ] add examples of all mode
- [ ] make it work in github action and provide an HowTo


## Contributors

<!-- start_contributors mode:bubble -->
![@ponsfrilus avatar](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/176002?v=4&h=118&w=118&fit=cover&mask=circle&maxage=7d)
![@Azecko avatar](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/30987143?v=4&h=118&w=118&fit=cover&mask=circle&maxage=7d)
![@SaphireVert avatar](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/45922476?v=4&h=118&w=118&fit=cover&mask=circle&maxage=7d)
![@D4rkHeart avatar](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/89066588?v=4&h=118&w=118&fit=cover&mask=circle&maxage=7d)
![@multiscan avatar](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/12849?v=4&h=118&w=118&fit=cover&mask=circle&maxage=7d)
![@JaavLex avatar](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/50820503?v=4&h=118&w=118&fit=cover&mask=circle&maxage=7d)
![@crazylady2004 avatar](https://images.weserv.nl/?url=https://avatars.githubusercontent.com/u/68648689?v=4&h=118&w=118&fit=cover&mask=circle&maxage=7d)
<!-- end_contributors -->


## Contributions

Contributions are very welcomed, either on the documentation or on the code.

We :heart: [issues](https://github.com/epfl-dojo/contributeurs-trombinoscope/issues/new), [forks](https://docs.github.com/en/get-started/quickstart/fork-a-repo#forking-a-repository) and [pull requests](https://github.com/epfl-dojo/contributeurs-trombinoscope/pulls)! Also, feel free to become a [stargazer](https://docs.github.com/en/get-started/exploring-projects-on-github/saving-repositories-with-stars) :star: .


[github actions]: https://pandoc.org/MANUAL.html
[pandoc]: https://pandoc.org/MANUAL.html
[markdown]: https://daringfireball.net/projects/markdown/
[html]: https://developer.mozilla.org/en-US/docs/Web/HTML
