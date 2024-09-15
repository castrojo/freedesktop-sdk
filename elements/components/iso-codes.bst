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
  ref: v4.17.0-0-g0640070a001ca6edfa8ab6b61fe3230e66b3963b
