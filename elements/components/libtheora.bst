kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
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
  - '*beta*'
  ref: v1.2.0-0-g8e4808736e9c181b971306cc3f05df9e61354004
