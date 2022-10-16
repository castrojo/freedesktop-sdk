kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

sources:
- kind: tar
  url: tar_https:ftp.debian.org/debian/pool/main/libp/libpaper/libpaper_1.1.28.tar.gz
  ref: c8bb946ec93d3c2c72bbb1d7257e90172a22a44a07a07fb6b802a5bb2c95fddc
