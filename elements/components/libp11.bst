kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/openssl.bst

sources:
- kind: git_tag
  url: github:OpenSC/libp11.git
  ref: libp11-0.4.11-0-g9ca6a71c890b5583c8af3b4900172626bca55e72

variables:
  openssl_conf: "%{sysconfdir}/ssl/openssl.cnf"

config:
  install-commands:
    (>):
    - rm -r %{install-root}%{includedir}
    - rm -r %{install-root}%{libdir}/pkgconfig
    - rm %{install-root}%{libdir}/libp11.so
    - |
      mkdir -p $(dirname %{install-root}%{openssl_conf})

      cat >> %{install-root}%{openssl_conf} << EOF
      openssl_conf = openssl_init

      $(cat %{openssl_conf})

      [openssl_init]
      engines = engine_section

      [engine_section]
      pkcs11 = pkcs11_section

      [pkcs11_section]
      engine_id = pkcs11
      dynamic_path = %{libdir}/engines-1.1/libpkcs11.so
      MODULE_PATH = opensc-pkcs11.so
      init = 0
      EOF

public:
  bst:
    overlap-whitelist:
    - "%{openssl_conf}"
