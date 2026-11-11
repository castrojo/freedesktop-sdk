# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/_private/git-minimal.bst
- components/btrfs-progs.bst
- components/glib.bst
- components/go-md2man.bst
- components/go.bst
- components/ostree.bst
- components/pkg-config.bst
- components/sed.bst

depends:
- public-stacks/runtime-minimal.bst
- components/containers-common.bst
- components/gpgme.bst
- components/libassuan.bst
- components/sqlite.bst

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
  ref: v1.25.1-0-g1fb351f23dbde474416ba33c3786a8d04304429b
