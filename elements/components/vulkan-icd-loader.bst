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

  command-subdir: vulkan-icd-loader

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvulkan.so'

(@):
- elements/include/vulkan-stack.yml
