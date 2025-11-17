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
  ref: libtraceevent-1.8.6-0-g98c217427183f66f09f4a27300ad87d71814c38f
