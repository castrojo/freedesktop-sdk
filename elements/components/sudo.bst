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
  ref: SUDO_1_9_12p2-0-ga49b2da91c2b6d33fd75f0c718835d19470804af
