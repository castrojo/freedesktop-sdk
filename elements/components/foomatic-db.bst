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
  ref: 20240202-0-g13c61c92e129139aad7e8cab4fc3236465ea6522
