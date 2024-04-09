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
  ref: nasm-2.16.02-0-g1f055d9e8f1d8419f34a5847538694c7f419b8ff
