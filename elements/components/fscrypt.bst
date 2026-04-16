kind: manual

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/gcc.bst
- components/go.bst
- components/m4.bst
- components/stripper.bst

depends:
- components/linux-pam.bst
- public-stacks/runtime-minimal.bst

variables:
  optimize-debug: "false"
  go_buildmode_flag: ""
  local_goflags: "-buildvcs=false"

config:
  build-commands:
    - mv -vf modules.txt vendor/modules.txt

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
  ref: v0.3.6-0-g37b292434bbb79b2b145a6ede9d53dadacb6870e
- kind: local
  path: files/fscrypt/modules.txt
- kind: go_module
  url: github:BurntSushi/toml.git
  module: github.com/BurntSushi/toml
  ref:
    go-version: v1.5.0
    git-ref: v1.5.0-0-gd97def528e83313822a9f98946334ffccd542bdf
    explicit: True
- kind: go_module
  url: github:client9/misspell.git
  module: github.com/client9/misspell
  ref:
    go-version: v0.3.4
    git-ref: v0.3.4-0-gb90dc15cfd220ecf8bbc9043ecb928cef381f011
    explicit: True
- kind: go_module
  url: github:cpuguy83/go-md2man.git
  module: github.com/cpuguy83/go-md2man/v2
  ref:
    go-version: v2.0.7
    git-ref: v2.0.7-0-g061b6c7cbecd6752049221aa15b7a05160796698
    explicit: True
- kind: go_module
  url: github:pkg/errors.git
  module: github.com/pkg/errors
  ref:
    go-version: v0.9.1
    git-ref: v0.9.1-0-g614d223910a179a466c1767a985424175c39b465
    explicit: True
- kind: go_module
  url: github:russross/blackfriday.git
  module: github.com/russross/blackfriday/v2
  ref:
    go-version: v2.1.0
    git-ref: v2.1.0-0-g4c9bf9512682b995722660a4196c0013228e2049
    explicit: True
- kind: go_module
  url: github:urfave/cli.git
  module: github.com/urfave/cli
  ref:
    go-version: v1.22.17
    git-ref: v1.22.17-0-g992e53d11ad06c124eb4809a0591f15af670d401
    explicit: True
- kind: go_module
  url: github:wadey/gocovmerge.git
  module: github.com/wadey/gocovmerge
  ref:
    go-version: v0.0.0-20160331181800-b5bfa59ec0ad
    git-ref: b5bfa59ec0adc420475f97f89b58045c721d761c
    explicit: True
- kind: go_module
  url: github:golang/crypto.git
  module: golang.org/x/crypto
  ref:
    go-version: v0.41.0
    git-ref: v0.41.0-0-gef5341b70697ceb55f904384bd982587224e8b0c
    explicit: True
- kind: go_module
  url: github:golang/exp.git
  module: golang.org/x/exp/typeparams
  ref:
    go-version: v0.0.0-20231108232855-2478ac86f678
    git-ref: 2478ac86f6784cc492495a49c25cd184d471d9de
    explicit: True
    subdirectory: typeparams
- kind: go_module
  url: github:golang/mod.git
  module: golang.org/x/mod
  ref:
    go-version: v0.27.0
    git-ref: v0.27.0-0-gf8a9fe217cff893cb67f4acad96a0021c13ee6e7
    explicit: True
- kind: go_module
  url: github:golang/sys.git
  module: golang.org/x/sys
  ref:
    go-version: v0.35.0
    git-ref: v0.35.0-0-g5b936e1f126baa13682eff91c2e4d5d9e3a0b71d
    explicit: True
- kind: go_module
  url: github:golang/term.git
  module: golang.org/x/term
  ref:
    go-version: v0.34.0
    git-ref: v0.34.0-0-ga35244d18d7756b12deca31a518c0fa1327d050a
    explicit: True
- kind: go_module
  url: github:golang/tools.git
  module: golang.org/x/tools
  ref:
    go-version: v0.36.0
    git-ref: v0.36.0-0-g44d18e11572cd133e1eec6811ba57d78ff20addf
    explicit: True
- kind: go_module
  url: github:protocolbuffers/protobuf-go.git
  module: google.golang.org/protobuf
  ref:
    go-version: v1.36.10
    git-ref: v1.36.10-0-gf9fa50e26c0ffec610c509850484a5fdecdb26ec
    explicit: True
- kind: go_module
  url: github:dominikh/go-tools.git
  module: honnef.co/go/tools
  ref:
    go-version: v0.6.1
    git-ref: v0.6.1-0-gb8ec13ce4d00445d75da053c47498e6f9ec5d7d6
    explicit: True
