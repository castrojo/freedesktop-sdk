kind: autotools

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/binary-seed.bst

(@):
- elements/bootstrap/include/base-sdk.yml

variables:
  autogen: ./autogen.sh --no-po4a --no-doxygen

sources:
- kind: git_tag
  url: tukaani:xz.git
  track: master
  track-extra:
  - v5.4
  exclude:
  - v*alpha
  - v*beta
  ref: v5.4.5-0-g49053c0a649f4c8bd2b8d97ce915f401fbc0f3d9
