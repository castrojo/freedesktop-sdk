# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/buildsystem-go.bst
- components/m4.bst

depends:
- public-stacks/runtime-minimal.bst
- components/linux-pam.bst

variables:
  optimize-debug: "false"
  go_buildmode_flag: ""
  local_goflags: "-buildvcs=false"

config:
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
- kind: go_mod_vendor
  ref:
  - module: github.com/BurntSushi/toml
    version: v1.5.0
    explicit: True
    sha256sum: a10c8d3d6c4a9b73dc885464245eec6b27d64f430d6979389cd9c58adde15855
  - module: github.com/client9/misspell
    version: v0.3.4
    explicit: True
    sha256sum: a3af206372e131dd10a68ac470c66a1b18eaf51c6afacb55b2e2a06e39b90728
  - module: github.com/cpuguy83/go-md2man/v2
    version: v2.0.7
    explicit: True
    sha256sum: 9ad5f2cbc644c0bb648a9b182d6b70f92e7ac4dfab5cf0ef746bbeef944fda59
  - module: github.com/davecgh/go-spew
    version: v1.1.1
    explicit: False
    sha256sum: 6b44a843951f371b7010c754ecc3cabefe815d5ced1c5b9409fb2d697e8a890d
  - module: github.com/google/go-cmp
    version: v0.7.0
    explicit: False
    sha256sum: 64a9ce046f2c320e3783fba0d1f4a15f8a18f0b009b67bf27f7630919db3f539
  - module: github.com/pkg/errors
    version: v0.9.1
    explicit: True
    sha256sum: d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07
  - module: github.com/pmezard/go-difflib
    version: v1.0.0
    explicit: False
    sha256sum: de04cecc1a4b8d53e4357051026794bcbc54f2e6a260cfac508ce69d5d6457a0
  - module: github.com/russross/blackfriday/v2
    version: v2.1.0
    explicit: True
    sha256sum: 7852750d58a053ce38b01f2c203208817564f552ebf371b2b630081d7004c6ae
  - module: github.com/stretchr/testify
    version: v1.10.0
    explicit: False
    sha256sum: 36c87573527a97ce97fc15ce2a101e65e5ebb350db142d09f633580cb8d5c839
  - module: github.com/urfave/cli
    version: v1.22.17
    explicit: True
    sha256sum: eb2629ff4d93a527036f0ebb57cf67caa10e97fdd9181740f8877936528bf6a9
  - module: github.com/wadey/gocovmerge
    version: v0.0.0-20160331181800-b5bfa59ec0ad
    explicit: True
    sha256sum: 9f5952330bf701f65988725ec1f3a34ebf3c79c1db5a70e48b48e0797f470c28
  - module: golang.org/x/crypto
    version: v0.52.0
    explicit: True
    sha256sum: a4dca44f467a3d8745aef41147c7bc6a90cdcfda9c42ae0585888bf046c7941e
  - module: golang.org/x/exp/typeparams
    version: v0.0.0-20231108232855-2478ac86f678
    explicit: True
    sha256sum: 22c0e082f62b39c8ddaec18a9f2888158199e597adc8780e918e8976cd9fbbb0
  - module: golang.org/x/mod
    version: v0.27.0
    explicit: True
    sha256sum: 19fb241d46e4397d3193b5fa899e2a9d62bb5d1c41f73d09d29c17c3c0d3953c
  - module: golang.org/x/sync
    version: v0.16.0
    explicit: True
    sha256sum: ca43984183eb14f7f50d33da350312fed1c42e106dceac2437bfd5084b497dcd
  - module: golang.org/x/sys
    version: v0.45.0
    explicit: True
    sha256sum: e51c1c88045b4edbe48ad810122131381ff541c89edbd97ef833ed6653b59e6a
  - module: golang.org/x/term
    version: v0.43.0
    explicit: True
    sha256sum: 0d12dd77f2c620f236e59421d604f6bcd1f9212a4083a1c0ec13425c67bc6e81
  - module: golang.org/x/tools
    version: v0.36.0
    explicit: True
    sha256sum: 85b486030e995cd5b4d56dea92f247b32bf4e0ae2fe6816b29d4514b5a43fec8
  - module: golang.org/x/tools/go/expect
    version: v0.1.1-deprecated
    explicit: True
    sha256sum: b2389159ddd768c6bd83a0cc92bbf9be01c32ca973c366fc224b79762d90dd79
  - module: google.golang.org/protobuf
    version: v1.36.10
    explicit: True
    sha256sum: 9265fbe7d073ca8571f1a9c4b8e8f20b244c35ad913346892d688e58fe4b1f22
  - module: gopkg.in/yaml.v3
    version: v3.0.1
    explicit: False
    sha256sum: aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015
  - module: honnef.co/go/tools
    version: v0.6.1
    explicit: True
    sha256sum: c8fed1950db52dc2e2682be963d564657a1d151898cedbd0f4b822828a899dc5
