# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/include/nftables.yml

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
- components/jansson.bst
- components/libmnl.bst
- components/libnftnl.bst

variables:
  # Can disable interactive shell cli completely with --without-cli, defaults to --with-cli=libedit
  # json support needed for netavark usage with podman
  conf-local: >-
    --with-cli=readline
    --with-json
