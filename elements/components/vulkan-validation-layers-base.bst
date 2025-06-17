kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/glslang.bst
- components/spirv-headers.bst
- components/spirv-tools.bst
- components/vulkan-headers.bst
- components/vulkan-utility-libraries.bst

# Sync with components/vulkan-validation-layers.bst
depends:
- public-stacks/runtime-minimal.bst
- components/wayland.bst
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

public:
  bst:
    split-rules:
      layer-manifests:
      - "%{datadir}/vulkan/icd.d"
      - "%{datadir}/vulkan/icd.d/**"
      - "%{datadir}/vulkan/implicit_layer.d"
      - "%{datadir}/vulkan/implicit_layer.d/**"
      - "%{datadir}/vulkan/explicit_layer.d"
      - "%{datadir}/vulkan/explicit_layer.d/**"

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

(@):
- elements/include/vulkan-stack.yml
