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
- kind: git_repo
  url: tukaani:xz.git
  track: v*
  exclude:
  - v*alpha
  - v*beta
  ref: v5.2.6-0-g8dfed05bdaa4873833ba24279f02ad2db25effea
