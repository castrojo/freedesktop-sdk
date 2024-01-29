kind: autotools

build-depends:
- bootstrap/pcre2-build-deps.bst

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
  - target_arch != "riscv64":
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
- kind: git_tag
  url: github:PCRE2Project/pcre2.git
  track: master
  exclude:
  - '*RC*'
  ref: pcre2-10.42-0-g52c08847921a324c804cabf2814549f50bce1265
