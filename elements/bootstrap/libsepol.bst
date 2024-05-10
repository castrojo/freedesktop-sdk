kind: make

build-depends:
- bootstrap/base-sdk/flex.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/pcre2.bst
  config:
    location: '%{sysroot}'

runtime-depends:
- bootstrap/pcre2.bst

(@):
- elements/bootstrap/include/target.yml

variables:
  notparallel: true
  command-subdir: libsepol

environment:
  USE_PCRE2: y
  LIBDIR: '%{libdir}'
  SHLIBDIR: '%{libdir}'
  CC: '%{triplet}-gcc'
  PKG_CONFIG_PATH: '%{sysroot}%{libdir}/pkgconfig'

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}/%{libdir}/libsepol.a"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsepol.so'

sources:
- kind: git_repo
  url: github:SELinuxProject/selinux.git
  ref: libsepol-3.5-0-gd6e96c5929a3f1aa1dce93505edd9f0158757ac2
