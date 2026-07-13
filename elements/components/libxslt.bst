# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libxml2.bst
- components/python3.bst

config:
  install-commands:
    (>):
    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/libxslt"
      mv "%{install-root}%{includedir}/libxslt/xsltconfig.h" "%{install-root}%{includedir}/%{gcc_triplet}/libxslt/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/xslt-config'
        - '%{libdir}/libxslt.so'
        - '%{libdir}/libexslt.so'
        - '%{libdir}/xsltConf.sh'
  cpe:
    ignored:
    - CVE-2022-29824

sources:
- kind: git_repo
  url: gnome:libxslt.git
  track: v*
  ref: v1.1.45-0-g35323d6a15f6e63c9919ddbc0abe64c90a0dd88a
- kind: patch
  path: patches/libxslt/0001-Make-PACKAGE_PREFIX_DIR-honour-arch-triplet-libdir.patch
