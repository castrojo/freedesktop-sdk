kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  arch-conf: ''
  (?):
  - target_arch in ["x86_64", "aarch64", "ppc64le", "loongarch64"]:
      arch-conf: |
        --enable-64bit
  conf-local: '%{arch-conf}'
  make: make SH_DATE="$(date --date="@${SOURCE_DATE_EPOCH}" "+%Y-%m-%d %T")" SH_NOW="${SOURCE_DATE_EPOCH}"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/nspr-config'
  cpe:
    product: netscape_portable_runtime

config:
  # FIXME: not needed in next release
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

sources:
- kind: tar
  # https://hg-edge.mozilla.org/projects/nspr
  url: tar_https:archive.mozilla.org/pub/nspr/releases/v4.36/src/nspr-4.36.tar.gz
  ref: 55dec317f1401cd2e5dba844d340b930ab7547f818179a4002bce62e6f1c6895
  base-dir: '*/nspr'
