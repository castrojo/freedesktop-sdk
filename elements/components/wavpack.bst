kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  autogen: |
    cp /usr/share/gettext/config.rpath .
    autoreconf -vif

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libwavpack.so'

sources:
- kind: git_tag
  url: github:dbry/WavPack.git
  track: master
  ref: 5.6.0-0-ge03e8e29dc618e08e7baba9636e57ba1254874ce
