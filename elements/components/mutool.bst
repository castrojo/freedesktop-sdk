kind: make

build-depends:
- components/pkg-config.bst

depends:
- components/curl.bst
- components/freetype.bst
- components/harfbuzz.bst
- components/jpeg.bst
- components/openjpeg.bst
#- components/lcms.bst

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
- kind: git_repo
  url: ghostscript:mupdf.git
  track: '*.*.*'
  exclude:
  - '*-*'
  ref: 1.24.0-0-g21fb0a2bf815c927cf09881f799f78cbece0daf2
- kind: git_module
  path: thirdparty/mujs
  url: ghostscript:mujs.git
  ref: 57e3f01d5f29c5823be725d96284488edf5f8ae1
- kind: git_module
  path: thirdparty/jbig2dec
  url: ghostscript:jbig2dec.git
  ref: 1d1347e38a55e657dcc4c8f1c77bb3a26bfc9ff3
- kind: git_module
  path: thirdparty/gumbo-parser
  url: ghostscript:thirdparty-gumbo-parser.git
  ref: 289f3de61d9fc6a9812a6900c23e74c4d1fbde7d
- kind: git_module
  path: thirdparty/lcms2
  url: ghostscript:thirdparty-lcms2.git
  ref: ab4547bd04a13590a6e72833f9928fc1c31da12e
- kind: git_module
  path: thirdparty/extract
  url: ghostscript:extract.git
  ref: ed5acb1397fc48f7e11804e9a72e37dd25a05c93
