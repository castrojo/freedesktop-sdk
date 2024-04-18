kind: autotools

build-depends:
- components/perl.bst

depends:
- bootstrap-import.bst

variables:
  openssl-target: linux-%{target_arch}
  arch-conf: ''
  (?):
  - target_arch == "i686":
      openssl-target: linux-generic32
  - target_arch == "arm":
      openssl-target: linux-generic32
  - (target_arch == "riscv64" or target_arch == "loongarch64"):
      openssl-target: linux-generic64
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
  track: refs/tags/openssl-3.*
  exclude:
  - openssl*alpha*
  - openssl*beta*
  ref: openssl-3.2.1-0-ga7e992847de83aa36be0c399c89db3fb827b0be2
