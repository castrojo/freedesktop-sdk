kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

variables:
  # intentionally
  # enabled static libs
  conf-link-args: >-
    --enable-shared
    --enable-static

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

    - |
      find "%{install-root}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: github:linux-audit/audit-userspace.git
  track: v*.*
  exclude:
  - "*b*"
  ref: v4.1.1-0-ga48f27ab0dce5d9650d3b8676cd1807308713549
- kind: local
  path: files/audit/tmpfiles-audit.conf
  directory: freedesktop-sdk
