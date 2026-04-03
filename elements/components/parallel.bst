kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
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
  ref: 20260322-0-gbda198b9f8adb370c9ce4347454d0ee624b77a39
