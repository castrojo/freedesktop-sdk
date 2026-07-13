# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- components/pkg-config.bst
- components/go.bst
- components/go-md2man.bst
- components/_private/git-minimal.bst
- components/python3.bst
- public-stacks/buildsystem-make.bst

depends:
- components/containers-common.bst
- components/gpgme.bst
- components/libseccomp.bst
- components/systemd-libs.bst
- public-stacks/runtime-minimal.bst

runtime-depends:
- components/catatonit.bst
- components/conmon.bst
- components/crun.bst
- components/netavark.bst
- components/passt.bst
- components/slirp4netns.bst
- components/fuse-overlayfs.bst
- components/iptables.bst

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
