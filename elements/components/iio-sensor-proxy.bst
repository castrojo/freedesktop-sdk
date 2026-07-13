# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/systemd.bst

depends:
- components/glib.bst
- components/libgudev.bst
- components/polkit.bst

variables:
  meson-local: >-
    -Dssc-support=disabled

sources:
- kind: git_repo
  url: freedesktop:hadess/iio-sensor-proxy.git
  track: '*.*'
  exclude:
  - '*RC*'
  ref: 3.9-0-g0085ddf8ecb173a1c5fcf2344aa40e561125354f
