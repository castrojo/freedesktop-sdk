kind: meson-recc

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gtk-doc.bst
- components/systemd.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- components/glib.bst
- components/libgudev.bst
- components/polkit.bst

variables:
  meson-local: >-
    -Dssc-support=disabled

sources:
- kind: git_repo
  url: freedesktop:hadess/iio-sensor-proxy.git
  track: '*.*'
  exclude:
  - '*RC*'
  ref: 3.9-0-g0085ddf8ecb173a1c5fcf2344aa40e561125354f
