# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/vim.bst # provides xxd

depends:
- components/systemd.bst
- components/polkit.bst
- components/dbus.bst

config:
  install-commands:
    (>):
    - |
      sysusersdir="$(pkg-config --var sysusersdir systemd)"
      install -Dm644 -t "%{install-root}${sysusersdir}" rtkit.conf

sources:
- kind: git_repo
  url: freedesktop:pipewire/rtkit.git
  track: v*
  ref: v0.14-0-gc52db0a9849908613ab8775b519834671b7bec8b
- kind: local
  path: files/rtkit/rtkit.conf
