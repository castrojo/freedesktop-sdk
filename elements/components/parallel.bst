kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/perl.bst
- components/procps.bst

variables:
  conf-local: >-
    --disable-documentation

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf

sources:
- kind: git_repo
  url: savannah:parallel.git
  track: '[0-9]*'
  ref: 20260722-0-g4359ad0710c1b7465d7b83bb9b32b49688e93ca9
  version-guess-pattern: '(\d{8})'
