kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/docbook-xsl.bst
- components/docbook-xml.bst
- components/libxslt.bst

variables:
  conf-local: |
    --with-xz \
    --with-zlib \
    --enable-tools

sources:
- kind: git_repo
  url: kernel:utils/kernel/kmod/kmod.git
  track: v*
  ref: v32-0-g41faa59711742c1476d59985011ee0f27ed91d30
