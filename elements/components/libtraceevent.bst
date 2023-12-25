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
  ref: libtraceevent-1.8.0-0-g8cf5315f7f22fccc6083fcef1f9ec01d52106371
