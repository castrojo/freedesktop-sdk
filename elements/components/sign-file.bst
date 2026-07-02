kind: manual

(@):
# This could be changed back to track the linux kernel element source once a 7.1+ LTS kernel
# is released & linux-headers.bst consumes it, consideration tracked at #2027
- elements/bootstrap/include/linux-headers-source.yml

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
