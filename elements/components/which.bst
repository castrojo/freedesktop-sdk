kind: autotools

build-depends:
- public-stacks/buildsystem-make.bst
- bootstrap/gawk.bst
- bootstrap/grep.bst
- bootstrap/sed.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: tar
  url: tar_https:carlowood.github.io/which/which-2.21.tar.gz
  ref: f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad
