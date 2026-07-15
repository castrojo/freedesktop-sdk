# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/cups-base.bst

runtime-depends:
- components/avahi-libs.bst
- components/cups-manifest.bst
- components/openssl.bst

config:
  include:
  - cups-libs
  - cups-license
  include-orphans: False

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/cups-config'
        - '%{libdir}/libcups.so'
        - '%{libdir}/libcupsimage.so'
    overlap-whitelist:
    - "%{project_licensedir}/cups"
    - "%{project_licensedir}/cups/**"
