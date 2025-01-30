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
- kind: git_repo
  url: github:dbry/WavPack.git
  track: '*.*.*'
  exclude:
  - "*alpha*"
  - "*rc*"
  - "*beta*"
  - "*dirty*"
  ref: 5.8.1-0-g4827b9889665b937b6ed71b9c6c0123152cd7a02
