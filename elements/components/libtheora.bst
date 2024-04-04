kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- filename: bootstrap-import.bst
- filename: components/libogg.bst

variables:
  autogen: ./autogen.sh %{conf-args}
  build-dir: ''

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libtheora.so'
        - '%{libdir}/libtheoraenc.so'
        - '%{libdir}/libtheoradec.so'

config:
  configure-commands:
  - |
    %{autogen}
    
sources:
- kind: git_repo
  url: xiph:theora.git
  track: v*
  exclude:
  - '*alpha*'
  ref: v1.1.1-0-g7ffd8b2ecfc2d93ae5e16028e7528e609266bfbf
