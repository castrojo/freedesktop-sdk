kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/asciidoc.bst
- components/docbook-xml.bst
- components/docbook-xsl.bst
- components/groff.bst
- components/libxslt.bst
- components/xmlto.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
  ref: nasm-3.01-0-ge9fac2faa62647bb50f1a61c26212c63c87090ae
- kind: patch
  path: patches/nasm/repro.patch
