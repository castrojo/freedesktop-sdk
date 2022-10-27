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
  ref: SUDO_1_9_12-0-gc684bf08307b3270a62f2130bafb37c36aa3c99e
