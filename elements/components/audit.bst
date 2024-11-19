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
  ref: v4.0.2-0-g4e6deae41d4646d28bb3ba9524a8a227a38ccd0b
- kind: patch
  path: patches/audit/0001-Try-to-solve-Issue-390.patch
- kind: local
  path: files/audit/tmpfiles-audit.conf
  directory: freedesktop-sdk
