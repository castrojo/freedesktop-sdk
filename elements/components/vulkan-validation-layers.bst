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
  command-subdir: vulkan-validation-layers

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

(@):
- elements/include/vulkan-stack.yml
