# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/pipewire-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/gstreamer-plugins-base.bst
- components/alsa-lib.bst
- components/libdbus.bst
- components/systemd-libs.bst
- components/pipewire-manifest.bst

config:
  exclude:
  - daemon
  include-orphans: True

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpipewire-*.so'
        - '%{libdir}/libjack*.so'
        - '%{bindir}/pw-config'
