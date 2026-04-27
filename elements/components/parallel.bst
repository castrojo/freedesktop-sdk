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
  ref: 20260422-0-gb776fe395778f87bc52656ac272c99923128dc9e
