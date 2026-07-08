kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/linux-pam.bst
- components/openssl.bst

depends:
- bootstrap/libxcrypt.bst
- public-stacks/runtime-minimal.bst
- components/libfido2.bst
- components/systemd-libs.bst # libfido2 depends on udev

runtime-depends:
- components/grep.bst
- components/sed.bst

variables:
  sysconfdir: '/etc/ssh'
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
    --with-pid-dir=/run
    --with-security-key-builtin
    %{arch_options}

config:
  configure-commands:
    (<):
    - |
      cat <<EOF >>"sshd_config"

      Include %{sysconfdir}/sshd_config.d/*.conf
      EOF

    - |
      cat <<EOF >>"ssh_config"

      Include %{sysconfdir}/ssh_config.d/*.conf
      EOF

  install-commands:
    (>):
    - |
      sed 's/#UsePAM.*/UsePAM yes/' -i "%{install-root}%{sysconfdir}/sshd_config"
      install -Dm755 contrib/ssh-copy-id -t "%{install-root}%{bindir}"
      install -Dm644 contrib/ssh-copy-id.1 -t "%{install-root}%{mandir}/man1"

public:
  bst:
    split-rules:
      vm-only:
      - "%{bindir}/sshd"
      - "%{bindir}/ssh-copy-id"
      - "%{sysconfdir}/sshd_config"
      - "%{libexecdir}/sftp-server"
      - "%{libexecdir}/sshd-*"
      - "%{mandir}/man5/sshd_config.5"
      - "%{mandir}/man8/sftp-server.8"
      - "%{mandir}/man8/sshd.8"
      - "%{mandir}/man1/ssh-copy-id.1"

  cpe:
    vendor: 'openbsd'
    ignored:
    - CVE-2007-2768
    - CVE-2023-51767

sources:
- kind: git_repo
  url: github:openssh/openssh-portable.git
  track: V_*
  ref: V_10_3_P1-0-g2d98db98331803cbb820211b2fb0d31a6e71e58e
  # We ignore the patch version because this is set in a different component in CPE
  version-guess-pattern: '(\d+)_(\d+)'
