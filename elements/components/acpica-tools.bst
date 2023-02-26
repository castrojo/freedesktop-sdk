kind: make

build-depends:
- components/m4.bst
- components/bison.bst
- components/flex.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:acpica/acpica.git
  track: master
  ref: R03_31_22-0-gada5b805eaa7480930082af9bc3d689c6f181329
- kind: patch
  path: patches/acpica-tools/werror.patch
