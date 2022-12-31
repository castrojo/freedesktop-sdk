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
  ref: sdk-1.3.236.0-0-gce45337c51ed53e6f1b337aa746a5a96c5018f86
  track: master
  track-extra:
  - sdk-1.3.236
  match:
  - sdk-*
