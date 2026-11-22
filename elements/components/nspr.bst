# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

(?):
- target_arch == "loongarch64":
    build-depends:
      (>):
      - bootstrap/gnu-config.bst

variables:
  command-subdir: nspr
  arch-conf: ''
  (?):
  - target_arch in ["x86_64", "aarch64", "ppc64le", "loongarch64"]:
      arch-conf: |
        --enable-64bit
  conf-local: '%{arch-conf}'
  make: make SH_DATE="$(date --date="@${SOURCE_DATE_EPOCH}" "+%Y-%m-%d %T")" SH_NOW="${SOURCE_DATE_EPOCH}"

config:
  (?):
  - target_arch == "loongarch64":
      configure-commands:
        (<):
        - |
          cp -v %{datadir}/gnu-config/config* build/autoconf

  install-commands:
    (>):
    - |
      rm -f "%{install-root}%{libdir}"/lib*.a

    - |
      rm -f "%{install-root}%{bindir}/prerr.properties" "%{install-root}%{bindir}/compile-et.pl"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/nspr-config'
  cpe:
    product: netscape_portable_runtime

sources:
- kind: anitya
  project-id: 7953
  # https://hg-edge.mozilla.org/projects/nspr
  url: tar_https:archive.mozilla.org/pub/nspr/releases/v{version}/src/nspr-{version}.tar.gz
  ref:
    version: 4.41
    sha256sum: c562b8ddfe93704b7dc077be013f01448fdc6c124b1821c0f10471a71cb2e9e6
