# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/pipewire-base.bst

runtime-depends:
- components/avahi-libs.bst
- components/avahi.bst
- components/bluez-libs.bst
- components/bluez.bst
- components/fftw.bst
- components/libcamera.bst
- components/libebur128.bst
- components/liblc3.bst
- components/libmysofa.bst
- components/libpulse.bst
- components/pipewire.bst
- components/rtkit.bst
- components/sbc.bst
- components/webrtc-audio-processing.bst
- components/wireplumber.bst

config:
  include:
  - daemon
  include-orphans: False
