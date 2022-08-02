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
  ref: 5.5.0-0-g89ef99e84333534d9d43093a5264a398b5f1e14a
