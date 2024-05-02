kind: cmake

(@):
- elements/include/vulkan-stack.yml
- elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/glslang.bst
- components/python3.bst

depends:
- bootstrap-import.bst
- components/vulkan-icd-loader.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xrandr.bst
- components/wayland.bst
- components/wayland-protocols.bst

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DBUILD_CUBE=ON \
    -DBUILD_WSI_XCB_SUPPORT=On \
    -DBUILD_WSI_XLIB_SUPPORT=On \
    -DBUILD_WSI_WAYLAND_SUPPORT=On
  command-subdir: vulkan-tools
