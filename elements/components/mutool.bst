kind: make

build-depends:
- components/pkg-config.bst

depends:
- components/curl.bst
- components/freetype.bst
- components/harfbuzz.bst
- components/jpeg.bst
- components/openjpeg.bst

variables:
  make-args: >-
    prefix="%{prefix}"
    bindir="%{bindir}"
    libdir="%{libdir}"
    incdir="%{includedir}"
    mandir="%{mandir}"
    docdir="%{docdir}"
    build=release
    USE_SYSTEM_LIBS=yes
    USE_SYSTEM_GUMBO=no
    USE_SYSTEM_JBIG2DEC=no
    USE_SYSTEM_LCMS2=no

  optimize-debug: "false"

config:
  build-commands:
  - make %{make-args} build/release/mutool
  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}" build/release/mutool

sources:
- kind: git_tag
  url: ghostscript:mupdf.git
  track: master
  track-extra:
  - 1.20.x
  # Attempt to predict the next branchpoint.
  - 1.21.x
  exclude:
  - '*rc*'
  ref: 1.21.0-0-g5dd4f6d59781a2577abc7a3684c7ad7430f22850
  submodules:
    thirdparty/mujs:
      url: ghostscript:mujs.git
      checkout: true
    thirdparty/jbig2dec:
      url: ghostscript:jbig2dec.git
      checkout: true
    thirdparty/gumbo-parser:
      url: ghostscript:thirdparty-gumbo-parser.git
      checkout: true
    thirdparty/lcms2:
      url: ghostscript:thirdparty-lcms2.git
      checkout: true
    thirdparty/extract:
      url: ghostscript:extract.git
      checkout: true
