kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/ghostscript.bst
- components/mutool.bst

depends:
- components/cups.bst
- components/dbus.bst
- components/fontconfig.bst
- components/jpeg.bst
- components/lcms.bst
- components/libexif.bst
- components/libpng.bst
- components/libtiff.bst
- components/poppler.bst
- components/qpdf.bst

sources:
- kind: git_repo
  url: github:OpenPrinting/libcupsfilters.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 2.0.0-0-ga75f7e5acb22db5fa8c939889c31ae61c64ce7ad
