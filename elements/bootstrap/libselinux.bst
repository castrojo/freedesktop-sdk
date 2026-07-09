kind: make

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/base-sdk/pkg-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename:
  - bootstrap/libsepol.bst
  - bootstrap/pcre2.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/pcre2.bst
- bootstrap/libsepol.bst

variables:
  command-subdir: libselinux

environment:
  USE_PCRE2: y
  LIBDIR: '%{libdir}'
  SHLIBDIR: '%{libdir}'
  SBINDIR: '%{sbindir}'
  CC: '%{triplet}-gcc'
  PKG_CONFIG_PATH: '%{sysroot}%{libdir}/pkgconfig'

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}/%{libdir}/libselinux.a"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libselinux.so'

sources:
- kind: git_repo
  url: github:SELinuxProject/selinux.git
  track: libselinux-*
  exclude:
  - '*rc*'
  ref: libselinux-3.11-0-g2233a23a4d4f1bf29054037babec13f30d038e65
