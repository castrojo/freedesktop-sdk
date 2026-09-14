kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: |
    --enable-dynamic-frontends

config:
  configure-commands:
    (<):
    - |
      autoreconf -ivf -I %{datadir}/gettext/m4

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmp3lame.so'

sources:
- kind: anitya
  project-id: 12523
  url: sourceforge:projects/lame/files/lame/{version}/lame-{version}.tar.gz
  ref:
    version: '3.100'
    sha256sum: ddfe36cab873794038ae2c1210557ad34857a4b6bdc515785d1da9e175b1da1e
- kind: patch
  path: patches/lame/lame-3.100.5-pkgconfig-to-get-correct-libs.patch
