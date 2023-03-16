kind: make

build-depends:
- bootstrap/libsepol-build-deps.bst

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
- kind: git_tag
  url: github:SELinuxProject/selinux.git
  track: master
  match:
  - libsepol-*
  exclude:
  - '*rc*'
  ref: libsepol-3.5-0-gd6e96c5929a3f1aa1dce93505edd9f0158757ac2
