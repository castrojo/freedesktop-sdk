kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/gobject-introspection.bst
- components/bison.bst

depends:
- components/curl.bst
- components/glib.bst
- components/gpgme.bst
- components/e2fsprogs.bst
- components/fuse3.bst
- components/systemd.bst
- components/libarchive.bst
- components/avahi.bst
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

sources:
- kind: git_tag
  url: github:ostreedev/ostree.git
  track: main
  match:
  - v*
  exclude:
  - v*.*.*
  ref: v2022.7-0-ge2f8ea6957a7b793e3ed93a3c76de63bd7bc0637
- kind: git_module
  path: libglnx
  url: gnome:libglnx.git
  ref: 4e44fd9c174e4196a86fb6d954722feaff612c88
- kind: git_module
  path: bsdiff
  url: github:mendsley/bsdiff.git
  ref: b817e9491cf7b8699c8462ef9e2657ca4ccd7667
- kind: patch
  path: patches/ostree/no-boot-symlink.patch
