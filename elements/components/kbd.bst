kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst

depends:
- components/linux-pam.bst
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:legionus/kbd.git
  track: master
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: v2.6.2-0-gfa117304e2e8098bb72f267a07ecd70923149c82
