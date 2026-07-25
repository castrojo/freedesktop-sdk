# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/grep.bst
- bootstrap/sed.bst
- components/bpf-maybe.bst
- components/docbook-xsl.bst
- components/gobject-introspection.bst
- components/libxslt.bst
- components/perl.bst
- components/systemd.bst

depends:
- public-stacks/runtime-minimal.bst
# Uses libuuid only
- components/util-linux-libs.bst
- components/systemd-libs.bst
- components/dbus.bst
- components/glib.bst
- components/gnutls.bst
- components/nss.bst
- components/libnvme.bst
- components/libpsl.bst
- components/curl.bst
- components/pygobject.bst
- components/libndp.bst
- components/audit.bst
- components/jansson.bst
- components/newt.bst
- components/polkit.bst

(?):
# Needed for CLAT support, bpf-maybe.bst handles
# bpf only being available for aarch64 & x86_64 already
- target_arch in ["aarch64", "x86_64"]:
    build-depends:
      (>):
      - components/llvm.bst
    depends:
      (>):
      - components/libbpf.bst

variables:
  arch-conf: ''
  (?):
  - target_arch not in ["aarch64", "x86_64"]:
      arch-conf: >-
        -Dclat=false
  meson-local: >-
    -Diwd=true
    -Dpolkit=true
    -Dppp=false
    -Dmodem_manager=false
    -Dqt=false
    -Dtests=no
    %{arch-conf}

sources:
- kind: git_repo
  url: freedesktop:NetworkManager/NetworkManager.git
  track: '*.*.*'
  exclude:
  - "*-dev*"
  - "*-rc*"
  ref: 1.58.0-0-g61302aac7f2e7411f3b42159544926484eacd37e
