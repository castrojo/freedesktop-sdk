kind: autotools

(@):
- elements/include/ostree-source.yml
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/bison.bst
- components/gobject-introspection.bst
- components/systemd.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- components/composefs.bst
- components/curl.bst
- components/glib.bst
- components/gpgme.bst
- components/e2fsprogs.bst
- components/fuse3.bst
- components/systemd-libs.bst
- components/libarchive.bst
- components/avahi.bst
- components/avahi-libs.bst
- components/gnupg.bst

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
