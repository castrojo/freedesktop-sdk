kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoc.bst
- components/groff.bst
- components/xmlto.bst
- components/docbook-xml.bst
- components/docbook-xsl.bst
- components/libxslt.bst

variables:
  # Build script generates sources and if build-dir is used
  # it tries to generate them in directories that do not
  # exist
  build-dir: ''

depends:
- bootstrap-import.bst

config:
  build-commands:
    (>):
    - make manpages

sources:
- kind: git_repo
  url: github:netwide-assembler/nasm.git
  track: nasm-*
  exclude:
  - nasm-*rc*
  ref: nasm-2.16.01-0-gd41598b3359d39c14e80f56bd8c3749f1d097932
- kind: patch
  path: patches/nasm/nasm-disable-werror-attributes.patch
