# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- components/gobject-introspection.bst
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: gnome:gsettings-desktop-schemas.git
  track: '*.*'
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 50.1-0-gea4bd542cfd931be783667fb84e02414f04e3ba9
