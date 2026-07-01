# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/include/ostree-source.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/gobject-introspection.bst
- components/bison.bst

depends:
- components/curl.bst
- components/glib.bst
- components/gpgme.bst
- components/e2fsprogs.bst
- components/fuse3.bst
- components/libarchive.bst
- components/gnupg.bst

variables:
  conf-local: >-
    --with-dracut
    --with-libarchive
    --with-curl
    --without-soup

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libostree.so"
