kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/ghostscript.bst
- components/mutool.bst

depends:
- components/libcupsfilters.bst

sources:
- kind: git_repo
  url: github:OpenPrinting/libppd.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 2.1.0-0-gf56a972ef5ebbc7cbd6f38f73ee95156db50468b
