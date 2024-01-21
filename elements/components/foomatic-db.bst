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
      find "%{install-root}%{datadir}/cups/model/foomatic-db-ppds" -not -type d -not -name "*.ppd" -not -name "*.ppd.*" -delete

sources:
- kind: git_repo
  url: github:OpenPrinting/foomatic-db.git
  track: master
  ref: 20240109-0-g2639b69e152dcc518ab132bea39d2b3872c64d1f
