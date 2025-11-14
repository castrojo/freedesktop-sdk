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
  ref: libtraceevent-1.8.5-0-gbea29b16e9b0d4eee671ab97ae7d2bdbdb7f8491
