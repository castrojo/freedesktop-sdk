kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst
- components/mesa-headers.bst
- components/xorg-lib-x11.bst

variables:
  meson-local: >
    -Ddocs=false
    -Dglx=yes
    -Degl=yes
    -Dx11=true
    -Dtests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libepoxy.so'

sources:
- kind: git_repo
  url: github:anholt/libepoxy.git
  track: '*.*.*'
  ref: 1.5.10-0-gc84bc9459357a40e46e2fec0408d04fbdde2c973
