kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- components/vulkan-headers.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xrandr.bst
- components/wayland.bst

variables:
  cmake-local: |
    -DCMAKE_SKIP_RPATH:BOOL=yes \
    -DCMAKE_INSTALL_SYSCONFDIR:PATH=%{sysconfdir} \
    -DBUILD_TESTS=OFF \
    -DBUILD_WSI_XCB_SUPPORT=On \
    -DBUILD_WSI_XLIB_SUPPORT=On \
    -DBUILD_WSI_WAYLAND_SUPPORT=On

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvulkan.so'

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Loader.git
  ref: sdk-1.2.198.1-0-g0ca96994f92b6f21b37badd6c99b22f61bfec932
  track: sdk-1.2.198
  match:
  - sdk-*
- kind: patch
  path: patches/vulkan/vulkan-libdir-path.patch
