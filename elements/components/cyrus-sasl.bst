kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/groff.bst

depends:
- bootstrap-import.bst
- components/gdbm.bst
- components/sqlite.bst
- components/openssl.bst

variables:
  # Uses generated header md5global.h into source directory
  build-dir: ''
  conf-local: >-
    --with-plugindir="%{libdir}/sasl2"
    --with-sqlite3
    --with-openssl
    --disable-gssapi
    --with-dblib=gdbm
    --without-pam
    --without-opie
    --without-des
  local_flags: -fpermissive

config:
  build-commands:
  - |
    %{make} sasldir="%{libdir}/sasl2"

  install-commands:
  - |
    %{make-install} sasldir="%{libdir}/sasl2"

  - |
    %{delete-libtool-archives}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/sasl2/lib*.la'
        - '%{libdir}/libsasl2.so'
  cpe:
    patches:
    - CVE-2019-19906

sources:
- kind: git_repo
  url: github:cyrusimap/cyrus-sasl.git
  track: cyrus-sasl-*
  ref: cyrus-sasl-2.1.28-0-g7a6b45b177070198fed0682bea5fa87c18abb084
