# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- components/btrfs-progs.bst
- components/_private/git-minimal.bst
- components/glib.bst
- components/go-md2man.bst
- components/go.bst
- components/ostree.bst
- components/pkg-config.bst
- components/sed.bst
- public-stacks/buildsystem-make.bst

depends:
- components/containers-common.bst
- components/gpgme.bst
- components/libassuan.bst
- components/sqlite.bst
- public-stacks/runtime-minimal.bst

variables:
  command-subdir: src/github.com/podman-container-tools/skopeo
  make-args: >-
    PREFIX="%{prefix}"
    EXTRA_LDFLAGS="%{go_ldflags}"
  make-install-args: >-
    %{make-args}
    DESTDIR="%{install-root}"
    install-binary install-docs install-completions

config:
  build-commands:
    (<):
    - sed -i 's|-gcflags "$(GOGCFLAGS)"||' Makefile

sources:
- kind: git_repo
  url: github:podman-container-tools/skopeo.git
  directory: src/github.com/podman-container-tools/skopeo
  track: v*
  exclude:
  - "*rc*"
  ref: v1.23.0-0-g9645b282ca2d8792235db5a3e142ea9ae2f0c63b
