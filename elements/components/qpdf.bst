kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/libxslt.bst
- components/docbook-xsl.bst

depends:
- components/gnutls.bst
- components/jpeg.bst

variables:
  # This build system has sha256 verification of output from autogen
  # which breaks build-dir. It's not possible to redirect checksums
  # to another directory
  build-dir: ''

config:
  configure-commands:
    (<):
    - rm configure

sources:
- kind: git_repo
  url: github:qpdf/qpdf.git
  track: release-qpdf-*
  exclude:
  - '*cmake*'
  ref: v11.3.0-0-g57dcf6d99dc4b464b0c6004f05cd2fe2d129f655
