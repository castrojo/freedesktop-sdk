kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/cups-daemon-only.bst

variables:
  builddir: ''

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
  ref: 4e6ab90da63afddee33d80115acb44149d2d292b
