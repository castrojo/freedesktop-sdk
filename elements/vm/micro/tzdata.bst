# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script
description: |
  UTC only. systemd-firstboot --timezone UTC needs this file. The rest
  of zoneinfo is not used by the micro image.

build-depends:
- public-stacks/runtime-minimal.bst
- components/tzdata.bst

config:
  commands:
  - |
    mkdir -p "%{install-root}%{datadir}/zoneinfo/Etc"
    mkdir -p "%{install-root}%{sysconfdir}"
    cp -a "%{datadir}/zoneinfo/UTC" "%{install-root}%{datadir}/zoneinfo/UTC"
    cp -a "%{datadir}/zoneinfo/Etc/UTC" "%{install-root}%{datadir}/zoneinfo/Etc/UTC"
    ln -sf "%{datadir}/zoneinfo/UTC" "%{install-root}%{sysconfdir}/localtime"
