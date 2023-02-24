kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/gmp.bst

sources:
- kind: tar
  url: ftp_gnu_org:mpfr/mpfr-4.2.0.tar.xz
  ref: 06a378df13501248c1b2db5aa977a2c8126ae849a9d9b7be2546fb4a9c26d993
