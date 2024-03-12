kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  conf-local: >-
    --without-python
    --without-python3
    --without-golang
    --enable-systemd
    --disable-zos-remote

config:
  install-commands:
    (>):
    - |
      install -Dm644 freedesktop-sdk/tmpfiles-audit.conf \
                     "%{install-root}%{indep-libdir}/tmpfiles.d/audit.conf"

sources:
- kind: git_repo
  url: github:linux-audit/audit-userspace.git
  track: v*.*
  ref: v4.0.1-0-g22ccbd984e493524050ac445f796e9a7e90e1149
- kind: local
  path: files/audit/tmpfiles-audit.conf
  directory: freedesktop-sdk
