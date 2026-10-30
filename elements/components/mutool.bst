kind: make

build-depends:
- public-stacks/buildsystem-make.bst
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
  - |
    %{install-extra}

sources:
- kind: git_repo
  url: github:ArtifexSoftware/mupdf.git
  track: '*.*.*'
  exclude:
  - '*-*'
  ref: 1.28.6-0-gda5f5eb890d7b3fb76903160b5f7f48ba1301492
- kind: git_module
  path: thirdparty/mujs
  url: github:ArtifexSoftware/mujs.git
  ref: 2c61a7bed7e7625c03c6e82e644a711ac4471c1e
- kind: git_module
  path: thirdparty/jbig2dec
  url: github:ArtifexSoftware/jbig2dec.git
  ref: dc15c39bbbddc90f79c14563d2eb5a794106be8f
- kind: git_module
  path: thirdparty/gumbo-parser
  url: github:ArtifexSoftware/thirdparty-gumbo-parser.git
  ref: 61bd4e736c3b342e592f65be0d65ec6a0acd8dcb
- kind: git_module
  path: thirdparty/lcms2
  url: github:ArtifexSoftware/thirdparty-lcms2.git
  ref: d69c64417c4a33a4629957fc0e08f4f4c5abcc3d
- kind: git_module
  path: thirdparty/extract
  url: github:ArtifexSoftware/extract.git
  ref: 8750ac39c30a0d65119b426b5a491c5b8e8bf674
- kind: git_module
  path: thirdparty/cmark-gfm
  url: github:ArtifexSoftware/thirdparty-cmark-gfm.git
  ref: 74e0f5b6b62bbdd1e262c92f4bb2c6c871c6307e
