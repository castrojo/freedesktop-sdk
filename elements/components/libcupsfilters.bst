kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/mutool.bst

depends:
- components/cups.bst
- components/dbus.bst
- components/fontconfig.bst
- components/ghostscript.bst
- components/jpeg.bst
- components/lcms.bst
- components/libexif.bst
- components/libjxl.bst
- components/libpng.bst
- components/libtiff.bst
- components/pdfio.bst
- components/poppler.bst

config:
  build-commands:
    (<):
    - |
      ln -s "%{build-dir}/config.h" "config.h"

sources:
- kind: git_repo
  url: github:OpenPrinting/libcupsfilters.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 2.2.1-0-g2a00cf6aa4234e2e0ac91b9844ab8990d04c7089
- kind: patch
  path: patches/libcupsfilters/0001-Makefile.am-Ensure-gen-lorem-text-test-supports-out-.patch
