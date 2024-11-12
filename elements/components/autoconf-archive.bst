kind: autotools
description: GNU autoconf archive

build-depends:
- public-stacks/buildsystem-make.bst
- bootstrap/gawk.bst
- bootstrap/grep.bst
- bootstrap/sed.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: tar
  url: ftp_gnu_org:autoconf-archive/autoconf-archive-2023.02.20.tar.xz
  ref: 71d4048479ae28f1f5794619c3d72df9c01df49b1c628ef85fde37596dc31a33
