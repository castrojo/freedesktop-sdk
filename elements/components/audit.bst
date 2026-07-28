kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  # intentionally
  # enabled static libs
  conf-link-args: >-
    --enable-shared
    --enable-static

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

    - |
      find "%{install-root}" -name "lib*.a" -delete

sources:
- kind: git_repo
  url: github:linux-audit/audit-userspace.git
  track: v*.*
  exclude:
  - "*b*"
  ref: v4.2-0-g29eec1e2904f55e88f9eeef483ebc1c9062c394a
- kind: local
  path: files/audit/tmpfiles-audit.conf
  directory: freedesktop-sdk
