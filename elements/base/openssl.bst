kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: base/perl.bst
  type: build
- filename: base/buildsystem-autotools.bst
  type: build

variables:
  openssl-target: linux-%{arch}
  arch-conf: ''
  (?):
  - target_arch == "i686":
      openssl-target: linux-generic32
  - target_arch == "arm":
      openssl-target: linux-generic32
  - target_arch == "x86_64" or target_arch == "aarch64":
      arch-conf: enable-ec_nistp_64_gcc_128

config:
  configure-commands:
  - |
    if [ -n "%{builddir}" ]; then
      mkdir %{builddir}
      cd %{builddir}
        reldir=..
      else
        reldir=.
    fi

    ${reldir}/Configure %{arch-conf} \
      %{openssl-target} \
      --prefix=%{prefix} \
      --libdir=%{lib} \
      --openssldir=%{sysconfdir}/ssl \
      shared \
      threads

  install-commands:
    (>):
    - rm %{install-root}%{libdir}/lib*.a

    - |
      for man3 in "%{install-root}%{datadir}/man/man3"/*.3; do
        if [ -L "${man3}" ]; then
          ln -s "$(readlink "${man3}")ssl" "${man3}ssl"
          rm "${man3}"
        else
          mv "${man3}" "${man3}ssl"
        fi
      done

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/*'
        - '%{libdir}/libssl.so'
        - '%{libdir}/libcrypto.so'
        - '%{prefix}/ssl/misc/*'

  cpe:
    vendor: 'openssl'
    version: '1.1.1d'
    patches:
    - CVE-2020-1967

sources:
- kind: git_tag
  url: github:openssl/openssl.git
  track: OpenSSL_1_1_1-stable
  ref: OpenSSL_1_1_1d-0-g894da2fb7ed5d314ee5c2fc9fd2d9b8b74111596
- kind: patch
  path: patches/openssl/Revert-Add-missing-accessors-for-X509-AuthorityKeyId.patch
- kind: patch
  path: patches/openssl/CVE-2020-1967.patch
