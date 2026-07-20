# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
# This could be changed back to track the linux kernel element source once a 7.1+ LTS kernel
# is released & linux-headers.bst consumes it, consideration tracked at #2027
- elements/bootstrap/include/linux-headers-source.yml

build-depends:
- public-stacks/runtime-gnu.bst
- bootstrap/stripper.bst
- components/gcc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/openssl.bst

config:
  build-commands:
  - gcc ${CFLAGS} ${LDFLAGS} -o sign-file scripts/sign-file.c -lcrypto

  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}" sign-file
  - |
    %{install-extra}
