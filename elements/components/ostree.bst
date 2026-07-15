# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/include/ostree-source.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/bison.bst
- components/gobject-introspection.bst
- components/systemd.bst

depends:
- components/avahi-libs.bst
- components/avahi.bst
- components/composefs.bst
- components/curl.bst
- components/e2fsprogs.bst
- components/fuse3.bst
- components/glib.bst
- components/gnupg.bst
- components/gpgme.bst
- components/libarchive.bst
- components/systemd-libs.bst

variables:
  conf-local: >-
    --with-dracut
    --with-libsystemd
    --with-systemd
    --with-libarchive
    --with-avahi
    --with-curl
    --without-soup

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libostree.so"
