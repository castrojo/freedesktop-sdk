# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/runtime-gnu.bst
- components/autoconf.bst
- components/file.bst
- components/gcc.bst
- components/libarchive.bst
- components/make.bst
- components/openjdk25-bootstrap.bst
- components/pkg-config.bst
- components/which.bst
- components/zip.bst

depends:
- public-stacks/runtime-minimal.bst
- components/alsa-lib.bst
- components/cups.bst
- components/fontconfig.bst
- components/freetype.bst
- components/giflib.bst
- components/harfbuzz.bst
- components/jpeg.bst
- components/lcms.bst
- components/libpng.bst
- components/xorg-lib-x11.bst
- components/xorg-lib-xext.bst
- components/xorg-lib-xrandr.bst
- components/xorg-lib-xrender.bst
- components/xorg-lib-xtst.bst
- components/xorg-lib-xt.bst
- components/zlib.bst

variables:
  strip-binaries: ''

config:
  build-commands:
  - |
    set -e

    bash configure \
      UNZIP=/usr/bin/bsdunzip \
      --with-boot-jdk="%{libdir}/jvm/openjdk-25" \
      --with-jvm-variants=server \
      --with-version-pre= \
      --with-version-opt= \
      --with-debug-level=release \
      --with-native-debug-symbols=internal \
      --enable-unlimited-crypto \
      --with-zlib=system \
      --with-libjpeg=system \
      --with-giflib=system \
      --with-libpng=system \
      --with-lcms=system \
      --with-harfbuzz=system \
      --with-stdc++lib=dynamic \
      --with-extra-cflags="${CFLAGS}" \
      --with-extra-cxxflags="${CXXFLAGS}" \
      --with-extra-ldflags="${LDFLAGS}" \
      --disable-javac-server \
      --disable-warnings-as-errors

    make -j1 LOG=info images

  install-commands:
  - |
    set -e

    install -d "%{install-root}%{libdir}/jvm/openjdk-25"
    cp -Lr build/linux-*-server-release/images/jdk/. \
      "%{install-root}%{libdir}/jvm/openjdk-25/"

    install -d "%{install-root}%{bindir}"

    for binary in "%{install-root}%{libdir}/jvm/openjdk-25/bin/"*; do
      ln -s "%{libdir}/jvm/openjdk-25/bin/$(basename "$binary")" \
        "%{install-root}%{bindir}/$(basename "$binary")"
    done

sources:
- kind: tar
  url: github_files:openjdk/jdk25u/archive/refs/tags/jdk-25.0.4.1+1.tar.gz
  ref: 1dd5567b315e19cf4cfb2c32931e535fd65b326960a8770f351d7655439b1eb8

- kind: patch_queue
  path: elements/patches/openjdk25
