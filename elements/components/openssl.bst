kind: autotools

build-depends:
- bootstrap/gcc.bst
- components/perl.bst

depends:
- bootstrap/acl.bst
- bootstrap/attr.bst
- bootstrap/bash.bst
- bootstrap/bzip2.bst
- bootstrap/binutils.bst
- bootstrap/coreutils.bst
- bootstrap/debugedit.bst
- bootstrap/diffutils.bst
- bootstrap/dwz.bst
- bootstrap/elfutils.bst
- bootstrap/file.bst
- bootstrap/findutils.bst
- bootstrap/gawk.bst
- bootstrap/glibc.bst
- bootstrap/gnu-config.bst
- bootstrap/grep.bst
- bootstrap/stripper.bst
- bootstrap/linux-headers.bst
- bootstrap/make.bst
- bootstrap/ncurses.bst
- bootstrap/pcre2.bst
- bootstrap/readline.bst
- bootstrap/sed.bst
- bootstrap/symlinks.bst
- bootstrap/utf-locale.bst

variables:
  openssl-target: linux-%{target_arch}
  arch-conf: ''
  (?):
  - target_arch == "i686":
      openssl-target: linux-generic32
  - (target_arch == "riscv64" or target_arch == "loongarch64"):
      openssl-target: linux64-%{target_arch}
  - target_arch in ["x86_64", "aarch64", "ppc64le"]:
      arch-conf: enable-ec_nistp_64_gcc_128

config:
  configure-commands:
  - |
    if [ -n "%{build-dir}" ]; then
      mkdir %{build-dir}
      cd %{build-dir}
        reldir=..
      else
        reldir=.
    fi

    ${reldir}/Configure %{arch-conf} \
      %{openssl-target} \
      --prefix=%{prefix} \
      --libdir=%{lib} \
      --openssldir=%{sysconfdir}/pki/tls \
      shared \
      threads

  install-commands:
    (>):
    - rm %{install-root}%{libdir}/lib*.a

    - |
      mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/openssl"
      mv "%{install-root}%{includedir}/openssl/opensslconf.h" "%{install-root}%{includedir}/%{gcc_triplet}/openssl/"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/c_rehash'
        - '%{libdir}/libssl.so'
        - '%{libdir}/libcrypto.so'
        - '%{prefix}/ssl/misc/*'

  cpe:
    vendor: 'openssl'

sources:
- kind: git_repo
  url: github:openssl/openssl.git
  # 3.3 supported until 2026-04-09
  # https://openssl-library.org/policies/releasestrat/index.html
  track: refs/tags/openssl-3.3.*
  exclude:
  - openssl*alpha*
  - openssl*beta*
  ref: openssl-3.3.5-0-gf10934c46fef092d04788f01fd0a4eafe3ef715f
- kind: patch
  path: patches/openssl/by_store_ctrl_ex.patch
