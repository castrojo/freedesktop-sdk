kind: cmake

(@):
- elements/extensions/include/app.yml
- elements/include/vulkan-stack.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- extensions/vulkaninfo/volk.bst
- components/glslang.bst
- components/python3.bst
- components/vulkan-headers.bst
- components/wayland-protocols.bst

depends:
- public-stacks/runtime-minimal.bst
- components/vulkan-icd-loader.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xrandr.bst
- components/wayland.bst

variables:
  license-files-extra: vulkan-tools/LICENSE.txt
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DBUILD_CUBE=ON \
    -DBUILD_WSI_XCB_SUPPORT=On \
    -DBUILD_WSI_XLIB_SUPPORT=On \
    -DBUILD_WSI_WAYLAND_SUPPORT=On
  command-subdir: vulkan-tools
