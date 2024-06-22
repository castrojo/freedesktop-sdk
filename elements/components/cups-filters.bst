kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/avahi.bst
- components/systemd.bst

depends:
- components/cups-daemon-only.bst
- components/dejavu-fonts.bst
- components/ghostscript.bst
- components/jpeg.bst
- components/lcms.bst
- components/libexif.bst
- components/libpng.bst
- components/libtiff.bst
- components/mutool.bst
- components/poppler.bst
- components/qpdf.bst
- components/dbus.bst

variables:
  # There's a related Python script which opens files assuming no build-dir
  build-dir: ''
  conf-local: >-
    --without-rcdir
  # https://github.com/OpenPrinting/cups-filters/issues/512
  local_flags: "-std=c++17"

config:
  install-commands:
    (>):
    - |
      systemdsystemunitdir="$(pkg-config --variable systemdsystemunitdir systemd)"
      install -Dm644 -t "%{install-root}${systemdsystemunitdir}" utils/cups-browsed.service

sources:
- kind: git_repo
  url: github:OpenPrinting/cups-filters.git
  track: '1.*.*'
  ref: 1.28.17-0-gdeceb54f7c6935683732de936364eb82c0d32dbb
