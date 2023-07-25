kind: make

build-depends:
- components/m4.bst
- components/bison.bst
- components/flex.bst

depends:
- bootstrap-import.bst

environment:
  NOWERROR: "TRUE"

sources:
- kind: git_repo
  url: github:acpica/acpica.git
  # Tags are in "RMM_DD_YY" format. git_repo failed to track.
  track: R*_*_23
  ref: R06_28_23-0-gf16a0b4d0f0edd7b78a332fcf507be2187fac21e
