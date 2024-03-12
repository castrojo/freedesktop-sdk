kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/linux-pam.bst
- components/openssl.bst

depends:
- bootstrap-import.bst

variables:
  arch_options: ''
  (?):
  # ppc64le doesn't support --fzero-call-used-regs=used flag
  # which is part of openssh 'hardening' and the rest have marginal importance
  # https://gitweb.gentoo.org/repo/gentoo.git/commit/net-misc/openssh?id=0b22d07f89b16ac3400e45077702ac4c4492e5a4
  - target_arch == "ppc64le":
      arch_options: "--without-hardening"
  # linux-pam provides /etc/pam.d/sshd, so this is the pam service name
  conf-local: >-
    --with-mantype=man
    --with-pam
    --with-pam-service=sshd
    %{arch_options}

config:
  install-commands:
    (>):
    - |
      sed 's/#UsePAM.*/UsePAM yes/' -i "%{install-root}%{sysconfdir}/sshd_config"

public:
  bst:
    split-rules:
      vm-only:
      - "%{bindir}/sshd"
      - "%{sysconfdir}/sshd_config"
      - "%{libexecdir}/sftp-server"
      - "%{mandir}/man5/sshd_config.5"
      - "%{mandir}/man8/sftp-server.8"
      - "%{mandir}/man8/sshd.8"
  cpe:
    vendor: 'openbsd'
    # We ignore the patch version because this is set in a different component in CPE
    version-match: '(\d+)_(\d+)'
    ignored:
    - CVE-2007-2768

sources:
- kind: git_tag
  url: github:openssh/openssh-portable.git
  track: master
  track-extra:
  - V_9_4
  # Attempt to predict the next branchpoint.
  - V_9_5
  ref: V_9_7_P1-0-g86bdd3853f4d32c85e295e6216a2fe0953ad93f0
