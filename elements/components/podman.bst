# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/_private/git-minimal.bst
- components/go-md2man.bst
- components/go.bst
- components/pkg-config.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst
- components/containers-common.bst
- components/gpgme.bst
- components/libseccomp.bst
- components/systemd-libs.bst

runtime-depends:
- components/catatonit.bst
- components/conmon.bst
- components/crun.bst
- components/fuse-overlayfs.bst
- components/iptables.bst
- components/netavark.bst
- components/passt.bst
- components/slirp4netns.bst

environment:
  MAKEFLAGS: -j1

variables:
  optimize-debug: "false"
  command-subdir: src/github.com/podman-container-tools/podman
  make-args: >-
    PREFIX="%{prefix}"
    EXTRA_LDFLAGS="%{go_ldflags}"
  make-install-args: >-
    %{make-args}
    DESTDIR="%{install-root}"
    install install.completions

sources:
- kind: git_repo
  url: github:podman-container-tools/podman.git
  directory: src/github.com/podman-container-tools/podman
  track: v*
  exclude:
  - "*rc*"
  ref: v5.8.2-0-g5b263b5f5b48004a87caac44e67349a8266d9ef4
