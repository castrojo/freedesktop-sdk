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
  ref: 1.22.1-0-gce71400f0a21476b43b001f50cf2da17d9161035
- kind: git_module
  path: thirdparty/mujs
  url: ghostscript:mujs.git
  ref: 57e3f01d5f29c5823be725d96284488edf5f8ae1
- kind: git_module
  path: thirdparty/jbig2dec
  url: ghostscript:jbig2dec.git
  ref: a5b9b7cd7b9ed349964eb89883c4b22c410b3398
- kind: git_module
  path: thirdparty/gumbo-parser
  url: ghostscript:thirdparty-gumbo-parser.git
  ref: 289f3de61d9fc6a9812a6900c23e74c4d1fbde7d
- kind: git_module
  path: thirdparty/lcms2
  url: ghostscript:thirdparty-lcms2.git
  ref: 88b6a72d31dbb5723d2f710789c825f57f2f38b4
- kind: git_module
  path: thirdparty/extract
  url: ghostscript:extract.git
  ref: c20747943248f4ebced6f85d849ab1994896b421
