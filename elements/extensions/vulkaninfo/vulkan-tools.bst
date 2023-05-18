kind: cmake

(@): elements/extensions/include/app.yml

build-depends:
- components/glslang.bst
- public-stacks/buildsystem-cmake.bst

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

sources:
- kind: git_repo
  url: github:KhronosGroup/Vulkan-Tools.git
  track: sdk-*
  ref: sdk-1.3.246.1-0-g4e17c284d67de468d62ec79fb0b4a3eff76447ea
