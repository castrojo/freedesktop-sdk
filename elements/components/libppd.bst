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
  ref: 2.0.0-0-g62666f01b167bdf5975b08fbab5c2f34d9277db3
