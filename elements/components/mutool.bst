# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

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
  ref: 1.27.2-0-g73d3100d46d8a9ad634f6ef035bbe78f0f947886
- kind: git_module
  path: thirdparty/mujs
  url: github:ArtifexSoftware/mujs.git
  ref: 33c83d8553048fd7710a518821cdefa5818e1559
- kind: git_module
  path: thirdparty/jbig2dec
  url: github:ArtifexSoftware/jbig2dec.git
  ref: d915733ec69260c1fd2c458b06835cb57bb85ac7
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
