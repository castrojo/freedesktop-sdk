kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/linux-pam.bst
- components/openssl.bst

depends:
- bootstrap-import.bst

variables:
  # linux-pam provides /etc/pam.d/sshd, so this is the pam service name
  conf-local: >-
    --with-mantype=man
    --with-pam
    --with-pam-service=sshd

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
- kind: git_repo
  url: github:openssh/openssh-portable.git
  track: V_*
  ref: V_9_4_P1-0-gdaa5b2d869ee5a16f3ef9035aa0ad3c70cf4028e
