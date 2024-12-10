kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst

depends:
- components/linux-pam.bst
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:legionus/kbd.git
  track: v*
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: v2.7-0-gf6bddf7a95d5112f7002142caeaa3ea93e8eac59
