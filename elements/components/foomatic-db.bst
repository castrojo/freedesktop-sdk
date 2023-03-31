kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/cups-daemon-only.bst

variables:
  # This project uses names in makefile that do not work with build-dir
  build-dir: ''

config:
  install-commands:
    (>):
    # Cups seems not like non ppd files
    - |
      find "%{install-root}%{datadir}/cups/model/foomatic-db-ppds" -not -type d -not -name "*.ppd" -not -name "*.ppd.*" -exec rm {} ";"

sources:
- kind: git_tag
  url: github:OpenPrinting/foomatic-db.git
  track: master
  track-tags: false
  ref: d883a215dc062e478c64d4e2eee9b0e39e6c629d
