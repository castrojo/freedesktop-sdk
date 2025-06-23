kind: autotools-recc

(@):
- elements/include/ostree-source.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/bison.bst
- components/gobject-introspection.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
