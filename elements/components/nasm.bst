kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoc.bst
- components/groff.bst
- components/xmlto.bst
- components/docbook-xml.bst
- components/docbook-xsl.bst
- components/libxslt.bst

environment:
  # Disable hash randomisation for reproducibility
  # https://reproducible-builds.org/docs/stable-outputs/
  PERL_HASH_SEED: 0

variables:
  # Build script generates sources and if build-dir is used
  # it tries to generate them in directories that do not
  # exist
  build-dir: ''

depends:
- public-stacks/runtime-minimal.bst
- components/zlib.bst

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
  ref: nasm-3.02-0-g4a56d66ed9626d5a3ded5414c9d8b7f1a48ce065
