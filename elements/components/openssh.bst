kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/linux-pam.bst
- components/openssl.bst

depends:
- bootstrap/libxcrypt.bst
- public-stacks/runtime-minimal.bst

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
    --without-zlib-version-check
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
    - CVE-2023-51767
    - CVE-2025-26465
    - CVE-2025-26466

sources:
- kind: git_repo
  url: github:openssh/openssh-portable.git
  track: V_*
  ref: V_9_9_P2-0-gd76b2675116617394cd355a3437b4963a562b64d
