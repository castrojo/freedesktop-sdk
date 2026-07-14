# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/pipewire-base.bst

runtime-depends:
- components/avahi.bst
- components/avahi-libs.bst
- components/pipewire.bst
- components/sbc.bst
- components/bluez.bst
- components/bluez-libs.bst
- components/libmysofa.bst
- components/rtkit.bst
- components/webrtc-audio-processing.bst
- components/wireplumber.bst
- components/libcamera.bst
- components/liblc3.bst
- components/libpulse.bst
- components/libebur128.bst

config:
  include:
  - daemon
  include-orphans: False
