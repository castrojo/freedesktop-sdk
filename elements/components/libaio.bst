# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    prefix="%{install-root}"
    includedir="%{install-root}/%{includedir}"
    libdir="%{install-root}%{libdir}"
  make-install-args: >-
    %{make-args}
    install

sources:
- kind: anitya
  project-id: 1557
  url: pagure_releases:libaio/libaio-{version}.tar.gz
  ref:
    version: 0.3.113
    sha256sum: 2c44d1c5fd0d43752287c9ae1eb9c023f04ef848ea8d4aafa46e9aedb678200b
