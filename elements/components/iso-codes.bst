kind: autotools

build-depends:
- components/gettext.bst
- components/python3.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: debian_salsa:iso-codes-team/iso-codes.git
  track: v*
  ref: v4.19.0-0-g0f3a862394265a31d8465fc5e627d6429bbd8394
