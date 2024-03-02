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
  ref: 5.1.2-0-gb505cd4887708d858dce4ed2a2be2fdf96e96c90
