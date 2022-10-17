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
  ref: v2022.6-0-geee649d902266e8d79465d34a2bf2f236e11dbd6
  submodules:
    libglnx:
      checkout: true
      url: gnome:libglnx.git
    bsdiff:
      checkout: true
      url: github:mendsley/bsdiff.git
- kind: patch
  path: patches/ostree/no-boot-symlink.patch
