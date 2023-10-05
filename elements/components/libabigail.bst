kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libxml2.bst

sources:
- kind: git_repo
  url: sourceware:libabigail.git
  track: master
  ref: libabigail-2.3-46-ga6108e69e42226f5e72fddbf084e8aeb855359b1
