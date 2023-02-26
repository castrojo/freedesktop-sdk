kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build
- filename: components/extra-cmake-modules.bst
  type: build
- filename: components/gtk3.bst

variables:
  cmake-local: |
    -DENABLE_GTK3_IM_MODULE=On \
    -DENABLE_GTK2_IM_MODULE=Off \
    -DENABLE_GIR=Off \
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
  ref: 5.0.21-0-g4e0e25458caf62c90890410a7434b212b7a56072
