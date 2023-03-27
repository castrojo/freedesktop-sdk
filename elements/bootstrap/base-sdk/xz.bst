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
  autogen: ./autogen.sh --no-po4a

sources:
- kind: git_tag
  url: tukaani:xz.git
  track: master
  track-extra:
  - v5.4
  exclude:
  - v*alpha
  - v*beta
  ref: v5.4.0-0-gb69da6d4bb6bb11fc0cf066920791990d2b22a06
