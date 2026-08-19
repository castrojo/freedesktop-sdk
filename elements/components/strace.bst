# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libunwind.bst

variables:
  conf-local: --enable-mpers=check

public:
  cpe:
    ignored:
    - CVE-2000-0006

sources:
- kind: git_repo
  url: github:strace/strace.git
  track: v*
  ref: v7.2-0-g195ac8ddbf6fad16ff1ff125b0feb725b6c46dcf
