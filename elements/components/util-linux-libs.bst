# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  util-linux public libraries

  This element includes the following libraries, which are maintained as part
  of the util-linux project, and used by other libraries and apps in the
  Flatpak ecosystem:

    * libblkid
    * libmount
    * libuuid

  The libuuid library is widely used for UUID generation.

  The libmount library is used in platform libraries GLib and KIO, and
  it depends on libblkid, so these are also included in the Flatpak runtime.

build-depends:
- components/_private/util-linux-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/libeconf.bst
- components/util-linux-manifest.bst

config:
  include:
  - libblkid
  - libmount
  - libuuid

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libblkid.so'
        - '%{libdir}/libmount.so'
        - '%{libdir}/libuuid.so'
