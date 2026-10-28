# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/buildsystem-go.bst
- components/hermes.bst
- components/m4.bst

depends:
- public-stacks/runtime-minimal.bst
- components/linux-pam.bst

variables:
  optimize-debug: "false"
  go_buildmode_flag: ""
  local_goflags: "-buildvcs=false"

config:
  configure-commands:
  - hermes shell
  - hermes serve --daemonize

  build-commands:
  - |
    go build -buildmode=pie ./cmd/fscrypt
    go build -buildmode=c-shared -o pam_fscrypt.so ./pam_fscrypt

  install-commands:
  - |
    install -Dm755 -t "%{install-root}%{bindir}" fscrypt
    install -Dm755 -t "%{install-root}%{indep-libdir}/security" pam_fscrypt.so
    install -Dm644 cmd/fscrypt/fscrypt_bash_completion "%{install-root}%{datadir}/bash-completion/completions/fscrypt"

  - |
    m4 --define=PAM_INSTALL_PATH="%{indep-libdir}/security/pam_fscrypt.so" < pam_fscrypt/config > config
    install -Dm644 config "%{install-root}%{datadir}/pam-configs/fscrypt"

  - |
    %{install-extra}

sources:
- kind: git_repo
  url: github:google/fscrypt.git
  track: v*
  ref: v0.3.7-0-gddb28dae679bfe4df707959dc37211d7c9142e74
- kind: hermes
