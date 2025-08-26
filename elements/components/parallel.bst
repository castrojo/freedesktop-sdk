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
  ref: 20250822-0-g5c5ca4f15a7ecb8ef6e2c2145d72d75f48388088
