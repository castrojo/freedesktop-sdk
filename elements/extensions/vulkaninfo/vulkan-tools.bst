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
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Tools.git
  ref: sdk-1.3.224.0-0-g497f232680b046db34ba9e9da065e6303a125851
  track: master
  track-extra:
  - sdk-1.3.224
  match:
  - sdk-*
