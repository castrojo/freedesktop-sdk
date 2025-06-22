kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/ghostscript.bst
- components/mutool.bst

depends:
- components/dejavu-fonts.bst
- components/libppd.bst

variables:
  local_flags: -std=gnu17

sources:
- kind: git_repo
  url: github:OpenPrinting/cups-filters.git
  track: '*.*.*'
  ref: 2.0.1-0-g5a73330fbd0cde494d984141f9add1565aef8171
