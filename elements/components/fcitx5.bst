kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/extra-cmake-modules.bst

depends:
- bootstrap-import.bst
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
- kind: git_tag
  url: github:fcitx/fcitx5-gtk.git
  track: master
  ref: 5.1.1-0-gfaea3be521b6ff47b8c511b42fa6d0418769e6d5
