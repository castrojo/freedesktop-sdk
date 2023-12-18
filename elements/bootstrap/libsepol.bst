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
  track: libsepol-*
  exclude:
  - '*rc*'
  ref: libsepol-3.6-0-g97fa708d867ecb26e8d1c766760947f8e3b9e59a
