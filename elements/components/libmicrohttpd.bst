# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/texinfo.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gnutls.bst

variables:
  conf-local: >-
    --disable-examples
    --disable-tools
    --enable-https
    --with-gnutls
    --enable-largefile

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"
      rm -vf "%{install-root}%{infodir}"/*.png

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmicrohttpd.so'

sources:
- kind: git_repo
  url: fdsdk_mirror:git_gnunet_org/libmicrohttpd.git
  track: v*
  ref: v1.0.8-0-g95e54a45102eccb9a9ae2d86818fa95c3cea4332
