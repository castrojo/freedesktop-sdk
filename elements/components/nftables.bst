# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
# Could turn off man docs with --disable-man-doc
- components/asciidoc.bst
- components/bison.bst
- components/flex.bst

depends:
- public-stacks/runtime-minimal.bst
# Could turn off default gmp support with --with-mini-gmp
- components/gmp.bst
- components/libmnl.bst
- components/libnftnl.bst

variables:
  # Can disable interactive shell cli completely with --without-cli, defaults to --with-cli=libedit
  conf-local: >-
    --with-cli=readline

sources:
- kind: git_repo
  url: netfilter:nftables.git
  track: v*.*.*
  ref: v1.1.6-0-g95f82543dcc76bb00e257d2af75a1d1cfd2c7fe8
