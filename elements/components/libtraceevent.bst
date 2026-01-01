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
  ref: libtraceevent-1.8.7-0-g7a8fee57d87aa61c9d578cd67e99d2677b894772
