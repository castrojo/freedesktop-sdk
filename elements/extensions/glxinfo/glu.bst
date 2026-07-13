# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@):
- elements/extensions/include/app.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/mesa-headers.bst

depends:
- components/xorg-lib-xi.bst

sources:
- kind: git_repo
  url: freedesktop:mesa/glu.git
  track: glu-*
  ref: glu-9.0.3-0-ga2b96c7bba8db8fec3e02fb4227a7f7b02cabad1
