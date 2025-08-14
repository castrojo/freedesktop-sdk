kind: manual

depends:
- bootstrap-import.bst
- components/openssl.bst

config:
  build-commands:
  - gcc ${CFLAGS} ${LDFLAGS} -o sign-file scripts/sign-file.c -lcrypto

  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}" sign-file

  - |
    %{install-extra}

(@):
- elements/include/linux.yml
