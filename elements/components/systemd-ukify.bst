# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/systemd-base.bst

runtime-depends:
- components/python3-pefile.bst
- components/python3.bst
- components/systemd-manifest.bst

config:
  include:
  - ukify
  - systemd-license

public:
  bst:
    overlap-whitelist:
    - "%{project_licensedir}/systemd"
    - "%{project_licensedir}/systemd/**"
