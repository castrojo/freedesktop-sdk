kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/git-minimal.bst
- components/perl.bst

depends:
- components/linux-pam-base.bst
- public-stacks/runtime-minimal.bst

config:
  install-commands:
    (>):
    - |
      install -Dm644 pam.conf "%{install-root}%{sysconfdir}/pam.d/sudo"

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      chmod 0600 "${sysroot}%{sysconfdir}/sudoers"
      chmod 0600 "${sysroot}%{sysconfdir}/sudoers.d"/*
      chmod 4755 "${sysroot}%{bindir}/sudo"

sources:
- kind: git_repo
  url: github:sudo-project/sudo.git
  track: SUDO_*
  ref: SUDO_1_9_16p1-0-g7b41190db66e2006d03cf317224f9f751b2b28cc
- kind: local
  path: files/sudo/pam.conf
