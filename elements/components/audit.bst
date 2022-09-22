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
- kind: git_tag
  url: github:linux-audit/audit-userspace.git
  track: master
  track-extra:
  - '2.8_maintenance'
  ref: v3.0.9-0-g81fa28e0e8b4be83ddba03de8b816a3df510c17e
- kind: local
  path: files/audit/tmpfiles-audit.conf
  directory: freedesktop-sdk
