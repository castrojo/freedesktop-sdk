kind: cmake-recc

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/extra-cmake-modules.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/gtk3.bst

variables:
  license-files-extra: LICENSES/LGPL-2.1-or-later.txt
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
  ref: 5.1.6-0-g0828b59d90f92726f7302a3b4c9e42caeeb2a8a7
