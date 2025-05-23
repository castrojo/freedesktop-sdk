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
  exclude:
  - "*b*"
  ref: v4.0.3-0-g51d154c5b7ec91831cbb89fe6ca54d8eb7ba344c
- kind: local
  path: files/audit/tmpfiles-audit.conf
  directory: freedesktop-sdk
