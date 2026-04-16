# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

(@):
- elements/include/linux.yml

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
