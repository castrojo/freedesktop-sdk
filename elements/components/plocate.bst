# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
# systemd is needed to resolve unit install dir
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
- components/zstd.bst

config:
  install-commands:
    (>):
    - ln -sf plocate %{install-root}%{bindir}/locate
    - |
      sysusersdir="$(pkg-config --variable sysusersdir systemd)"
      install -Dm644 plocate.conf "%{install-root}${sysusersdir}/plocate.conf"

sources:
- kind: anitya
  project-id: 188202
  url: tar_https:plocate.sesse.net/download/plocate-{version}.tar.gz
  ref:
    version: 1.1.25
    sha256sum: 68c1d5fbb11864403ae39c1a5937f13afd80b03e68041368831ef58cb613578e
- kind: local
  path: files/plocate/plocate.conf
