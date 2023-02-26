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
  ref: 1.19.1-0-g652c9ddb1deea87e65c75b06561efae8c1579a57
- kind: git_module
  path: thirdparty/mujs
  url: ghostscript:mujs.git
  ref: c3715ce3db4cc37ea46af8dbc891ecee1ca1b2ff
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
  ref: 558b336e330e7816c22df900b8100c029b16b0bc
- kind: git_module
  path: thirdparty/extract
  url: ghostscript:extract.git
  ref: 96f670cbb051b30cd4636d58660cb4d34b9ede11
