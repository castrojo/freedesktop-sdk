kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/asciidoc.bst
- components/xmlto.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtraceevent.so'

sources:
- kind: git_repo
  url: kernel:libs/libtrace/libtraceevent.git
  track: 'libtraceevent-*'
  ref: libtraceevent-1.7.3-0-gdd148189b74da3e2f45c7e536319fec97cb71213
