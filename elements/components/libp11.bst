kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/openssl.bst

variables:
  openssl_conf: "%{sysconfdir}/pki/tls/openssl.cnf"

config:
  install-commands:
    (>):
    - rm -r %{install-root}%{includedir}
    - rm -r %{install-root}%{libdir}/pkgconfig
    - rm %{install-root}%{libdir}/libp11.so
    - |
      test -f %{openssl_conf}

      mkdir -p $(dirname %{install-root}%{openssl_conf})
      cat >> %{install-root}%{openssl_conf} << EOF
      $(cat %{openssl_conf})

      [openssl_init]
      engines = engine_section

      [engine_section]
      pkcs11 = pkcs11_section

      [pkcs11_section]
      engine_id = pkcs11
      dynamic_path = %{libdir}/engines-3/libpkcs11.so
      MODULE_PATH = opensc-pkcs11.so
      init = 0
      EOF

public:
  bst:
    overlap-whitelist:
    - "%{openssl_conf}"

sources:
- kind: git_repo
  url: github:OpenSC/libp11.git
  track: libp11-*
  ref: libp11-0.4.12-0-g53d65dc48cf436694f7edcfc805414e608e8a2bf
