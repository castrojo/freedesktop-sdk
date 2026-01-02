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
  ref: v4.20.1-0-g74623235ae99f6e835e1e465017ce4c544ae6b53
