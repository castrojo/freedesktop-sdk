kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/gawk.bst
- components/asciidoc.bst
- components/xmlto.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: libtraceevent-1.8.4-0-gbd47bd544c9ebc9f44bd88c2b2f2049230741058
