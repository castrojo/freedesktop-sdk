kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  conf-local: >-
    runstatedir=/run
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
      install -Dm755 -d "%{install-root}%{sysconfdir}/audit/rules.d"
      ln -sr "%{install-root}%{datadir}/audit-rules/10-base-config.rules" "%{install-root}%{sysconfdir}/audit/rules.d/10-base-config.rules"

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
