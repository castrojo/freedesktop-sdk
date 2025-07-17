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
  ref: libselinux-3.9-0-g919e9e64cc4b20f5a1e4df1e38cce1bfe15aff09
