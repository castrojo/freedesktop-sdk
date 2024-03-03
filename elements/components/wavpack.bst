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
  ref: 5.7.0-0-g63dd3fa3b69fc236cc17886af6d4bd7dbe856125
