kind: make

build-depends:
- bootstrap/libselinux-build-deps.bst

runtime-depends:
- bootstrap/pcre2.bst
- bootstrap/libsepol.bst

(@):
- elements/bootstrap/include/target.yml

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
- kind: git_tag
  url: github:SELinuxProject/selinux.git
  ref: libselinux-3.4-0-g0a8c177dacdc1df96ea11bb8aa75e16c4fa82285
