kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gstreamer.bst
- components/gtk-doc.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/gnutls.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnice.so'

variables:
  meson-local: >-
    -Dgupnp=disabled
    -Dexamples=disabled

sources:
- kind: git_repo
  url: freedesktop:libnice/libnice.git
  track: '*.*.*'
  ref: 0.1.23-0-g0a3890f1830d4c77ecbb41de835aa549e7645ed5
