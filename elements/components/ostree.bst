kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/gobject-introspection.bst
- components/bison.bst

depends:
- components/glib.bst
- components/gpgme.bst
- components/e2fsprogs.bst
- components/libsoup.bst
- components/fuse.bst
- components/systemd.bst
- components/libarchive.bst
- components/avahi.bst

variables:
  conf-local: >-
    --with-dracut
    --with-libsystemd
    --with-systemd
    --with-libarchive
    --with-avahi

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
  ref: v2023.5-0-g26b833e90a1dcd3d40e06e43f5597a9951df8641
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bsdiff:
      checkout: true
      url: github:mendsley/bsdiff.git
    composefs:
      checkout: true
      url: github:containers/composefs.git
- kind: patch
  path: patches/ostree/no-boot-symlink.patch
