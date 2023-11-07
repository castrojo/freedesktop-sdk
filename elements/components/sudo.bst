kind: autotools

build-depends:
- components/git-minimal.bst
- components/perl.bst

depends:
- bootstrap-import.bst
- components/linux-pam-base.bst

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
  ref: SUDO_1_9_15-0-gf7ae17d3d3281514b673ebb33aa72b990049c378
- kind: local
  path: files/sudo/pam.conf
