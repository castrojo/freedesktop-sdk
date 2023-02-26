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
  ref: v4.12.0-0-g5e4dddbd1f8902ab0252ccbb19b783cc0359505a
