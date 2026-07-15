# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- components/libvdpau.bst

variables:
  autogen: autoreconf -fvi

sources:
- kind: git_repo
  url: freedesktop:vdpau/vdpauinfo.git
  track: "*.*"
  ref: 1.5-0-gd3c5bd63bf8878d59b22d618d2bb5116db392d28
