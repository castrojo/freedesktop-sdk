kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/extra-cmake-modules.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gtk3.bst

variables:
  cmake-local: >-
    -DENABLE_GTK3_IM_MODULE=On
    -DENABLE_GTK2_IM_MODULE=Off
    -DENABLE_GIR=Off
    -DENABLE_GTK4_IM_MODULE=Off

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libFcitx5GClient.so'

sources:
- kind: git_repo
  url: github:fcitx/fcitx5-gtk.git
  track: '*.*.*'
  ref: 5.1.4-0-gf2249725b87fe0dc80a3798ef72e3cb0a7c56cdb
