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
  track: R10_20_22
  ref: R10_20_22-0-g28fc163aa29e208678d901d98bb9030b775521b3
