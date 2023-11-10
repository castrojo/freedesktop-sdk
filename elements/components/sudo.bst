kind: autotools

build-depends:
- components/git-minimal.bst
- components/perl.bst

depends:
- bootstrap-import.bst

public:
  initial-script:
    script: |
      #!/bin/bash
      sysroot="${1}"
      chmod 0600 "${sysroot}%{sysconfdir}/sudoers"
      chmod 0600 "${sysroot}%{sysconfdir}/sudoers.d"/*
      chmod 4755 "${sysroot}%{bindir}/sudo"

sources:
- kind: git_tag
  url: github:sudo-project/sudo.git
  track: main
  track-extra:
  - sudo-1.9
  ref: SUDO_1_9_15p2-0-g22298e15e1830785885462b994dea6f705627f1a
