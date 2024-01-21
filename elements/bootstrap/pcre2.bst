kind: autotools

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/base-sdk/m4.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

(@):
- elements/bootstrap/include/target.yml

variables:
  common_options: "--enable-pcre2-16 --enable-pcre2-32"
  arch_options: ''
  (?):
  - (target_arch == "x86_64" or target_arch == "i686"):
      local_flags: -mshstk
  - (target_arch != "riscv64" and target_arch != "loongarch64"):
      arch_options: "--enable-jit"

  conf-local: >-
    %{common_options}
    %{arch_options}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/pcre2-config'
        - '%{libdir}/libpcre2-8.so'
        - '%{libdir}/libpcre2-16.so'
        - '%{libdir}/libpcre2-32.so'
        - '%{libdir}/libpcre2-posix.so'

sources:
- kind: git_repo
  url: github:PCRE2Project/pcre2.git
  track: pcre2-*
    exclude:
  - '*-RC*'
  ref: pcre2-10.42-0-g52c08847921a324c804cabf2814549f50bce1265
