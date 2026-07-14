# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- components/findutils.bst
- components/linux.bst
- components/sign-file.bst
- components/stripper.bst

config:
  install-commands:
  - |
    mkdir -p "%{install-root}/usr/lib"
    cp -rT /usr/lib/modules "%{install-root}/usr/lib/modules"

  - |
    openssl x509 -inform PEM -outform DER -in linux-module-cert.crt -out linux-module-cert.cer

  - |
    find '%{install-root}/usr/lib/modules' -type f -name "*.ko" -exec sign-file sha512 linux-module-cert.key linux-module-cert.cer {} ';' -exec zstd --rm {} ';'

sources:
- kind: local
  path: files/boot-keys/linux-module-cert.key
- kind: local
  path: files/boot-keys/modules/linux-module-cert.crt
