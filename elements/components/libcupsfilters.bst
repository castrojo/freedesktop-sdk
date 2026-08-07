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
  ref: 2.2.0-0-g1dadd67902696572e5861e10cf5de82b47396b17
- kind: patch
  path: patches/libcupsfilters/0001-Makefile.am-Ensure-gen-lorem-text-test-supports-out-.patch
