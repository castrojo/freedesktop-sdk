kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: 5.8.0-0-g0e1a78c94cc282c7e6b5e070b77d7c47cbbe688a
