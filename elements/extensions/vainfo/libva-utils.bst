# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libva.bst

variables:
  meson-local: |
    -Ddrm=true \
    -Dwayland=true \
    -Dx11=true

sources:
- kind: git_repo
  url: github:intel/libva-utils.git
  track: '*.*.*'
  ref: 2.23.0-0-g5896b6779d36f83bf483aff62da8aae30ba8d664
