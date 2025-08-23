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
  url: github:ArtifexSoftware/mupdf.git
  track: '*.*.*'
  exclude:
  - '*-*'
  ref: 1.26.6-0-g5f6753e0238fcccce78f4c29bd12070bb16b6ccb
- kind: git_module
  path: thirdparty/mujs
  url: github:ArtifexSoftware/mujs.git
  ref: 0df0707f2f10187127e36acfbc3ba9b9ca5b5cf0
- kind: git_module
  path: thirdparty/jbig2dec
  url: github:ArtifexSoftware/jbig2dec.git
  ref: 1d1347e38a55e657dcc4c8f1c77bb3a26bfc9ff3
- kind: git_module
  path: thirdparty/gumbo-parser
  url: github:ArtifexSoftware/thirdparty-gumbo-parser.git
  ref: 61bd4e736c3b342e592f65be0d65ec6a0acd8dcb
- kind: git_module
  path: thirdparty/lcms2
  url: github:ArtifexSoftware/thirdparty-lcms2.git
  ref: f75fad71d53efd58d7312bea21c2bedca0b9e6da
- kind: git_module
  path: thirdparty/extract
  url: github:ArtifexSoftware/extract.git
  ref: 8750ac39c30a0d65119b426b5a491c5b8e8bf674
