kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: debian_salsa:iso-codes-team/iso-codes.git
  track: v*
  ref: v4.17.0-0-g0640070a001ca6edfa8ab6b61fe3230e66b3963b
