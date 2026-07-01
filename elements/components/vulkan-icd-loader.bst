# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

(@):
- elements/include/vulkan-stack.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/vulkan-headers.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xrandr.bst
- components/wayland.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  local_flags: -DEXTRASYSCONFDIR=\"%{vulkan-extra-dir}\"
  license-files-extra: vulkan-icd-loader/LICENSE.txt
  cmake-local: >-
    -DCMAKE_SKIP_RPATH:BOOL=yes
    -DCMAKE_INSTALL_SYSCONFDIR:PATH=%{sysconfdir}
    -DBUILD_TESTS=OFF
    -DBUILD_WSI_XCB_SUPPORT=On
    -DBUILD_WSI_XLIB_SUPPORT=On
    -DBUILD_WSI_WAYLAND_SUPPORT=On

  command-subdir: vulkan-icd-loader
  vulkan-extra-dir: |
     %{libdir}/GL:%{libdir}:%{indep-libdir}/extensions/vulkan/share

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvulkan.so'
