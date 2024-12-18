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
  ref: v2.7.1-0-gf2c0d3185b300780f4f69abe3ff7493ec7634f39
