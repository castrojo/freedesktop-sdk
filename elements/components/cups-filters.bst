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
- components/libpng.bst
- components/libtiff.bst
- components/mutool.bst
- components/poppler.bst
- components/qpdf.bst
- components/dbus.bst

variables:
  # There's a related Python script which opens files assuming no build-dir
  build-dir: ''
  local_flags: "-std=c++17"

sources:
- kind: git_repo
  url: github:OpenPrinting/cups-filters.git
  # Frozen due to major rework of cups in 2.0.0
  ref: release-1-27-5-0-geae766df3267608844fa7809ece38a3922b3e070
