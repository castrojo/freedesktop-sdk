kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/glslang.bst
- components/spirv-headers.bst
- components/spirv-tools.bst

depends:
- bootstrap-import.bst
- components/wayland.bst
- components/vulkan-headers.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xcb.bst
- components/xorg-lib-xrandr.bst

variables:
  optimize-debug: "false"
  (?):
  - (target_arch == "i686"):
      local_flags: -O1

  cmake-local: >-
    -DCMAKE_INSTALL_INCLUDEDIR="%{includedir}/vulkan/"
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DGLSLANG_INSTALL_DIR=%{prefix}
    -DSPIRV_HEADERS_INSTALL_DIR=%{prefix}
    -DUSE_ROBIN_HOOD_HASHING:BOOL=no

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -exec rm {} ";"

sources:
- kind: git_repo
  url: github:KhronosGroup/Vulkan-ValidationLayers.git
  track: sdk-*
  ref: sdk-1.3.250.1-0-gd6c1e5a5a6229b52c20c643ff626a948d4850865
