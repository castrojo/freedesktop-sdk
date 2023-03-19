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
  ref: 1.21.1-0-gf39eee48564274635e231e2ab652221cce2ec1bd
- kind: git_module
  path: thirdparty/mujs
  url: ghostscript:mujs.git
  ref: 0e611cdc0c81a90dabfcb2ab96992acca95b886d
- kind: git_module
  path: thirdparty/jbig2dec
  url: ghostscript:jbig2dec.git
  ref: ade8a556af40d67e0762809d5136db8f3b4b3d09
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
  ref: d4b49c1218b28dbd355ec78236c5673f347795e6
