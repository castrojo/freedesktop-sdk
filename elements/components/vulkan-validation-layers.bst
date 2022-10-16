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
- kind: git_tag
  url: github:KhronosGroup/Vulkan-ValidationLayers.git
  ref: sdk-1.3.224.1-0-g2995230d4eb3aff4e250f755cbb4795a552e67a8
  track: master
  track-extra:
  - sdk-1.3.224
  match:
  - sdk-*
