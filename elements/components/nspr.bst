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
    version: 4.40
    sha256sum: c0c1884c627f3db7a783f7c7314c695226b2043696791d15519e7e0578c19bdc
