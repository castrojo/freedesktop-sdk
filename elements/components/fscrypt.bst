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
  goflags: >-
    %{go_buildmode_flag}
    -modcacherw
    "-ldflags=%{go_ldflags}"
    %{local_goflags}

environment:
  GOPROXY: http://127.0.0.1:40000/mod

config:
  configure-commands:
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
  ref:
  - kind: GoModule
    url: go_proxy:github.com/!burnt!sushi/toml/@v/v1.5.0.mod
    digest:
      kind: Sha256Sum
      value: 45d78b80571999b6a258da0f21673da39e6b501349c033a4acd169437411d733
  - kind: GoPackage
    url: go_proxy:github.com/!burnt!sushi/toml/@v/v1.5.0.zip
    digest:
      kind: Sha256Sum
      value: a10c8d3d6c4a9b73dc885464245eec6b27d64f430d6979389cd9c58adde15855
  - kind: GoModule
    url: go_proxy:github.com/client9/misspell/@v/v0.3.4.mod
    digest:
      kind: Sha256Sum
      value: d1bc362dddd96fb3a43ed4b92aaab70aa6c7ef5a500d7f09564e3eb24abcf0b8
  - kind: GoPackage
    url: go_proxy:github.com/client9/misspell/@v/v0.3.4.zip
    digest:
      kind: Sha256Sum
      value: a3af206372e131dd10a68ac470c66a1b18eaf51c6afacb55b2e2a06e39b90728
  - kind: GoModule
    url: go_proxy:github.com/cpuguy83/go-md2man/v2/@v/v2.0.7.mod
    digest:
      kind: Sha256Sum
      value: bb81a9e2d14d9a586f0591853bdaad230d8cdf0d8d6ffa71dddae249ad573cc9
  - kind: GoPackage
    url: go_proxy:github.com/cpuguy83/go-md2man/v2/@v/v2.0.7.zip
    digest:
      kind: Sha256Sum
      value: 9ad5f2cbc644c0bb648a9b182d6b70f92e7ac4dfab5cf0ef746bbeef944fda59
  - kind: GoModule
    url: go_proxy:github.com/pkg/errors/@v/v0.9.1.mod
    digest:
      kind: Sha256Sum
      value: df28c6a823f181d76179697177c0c5943c6ffb38f3c10b2dc53be360ee7d4589
  - kind: GoPackage
    url: go_proxy:github.com/pkg/errors/@v/v0.9.1.zip
    digest:
      kind: Sha256Sum
      value: d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07
  - kind: GoModule
    url: go_proxy:github.com/russross/blackfriday/v2/@v/v2.1.0.mod
    digest:
      kind: Sha256Sum
      value: c39547cce6e866e8cfa395d2937bce30801cd07f0b901c2133248f1fba12f58d
  - kind: GoPackage
    url: go_proxy:github.com/russross/blackfriday/v2/@v/v2.1.0.zip
    digest:
      kind: Sha256Sum
      value: 7852750d58a053ce38b01f2c203208817564f552ebf371b2b630081d7004c6ae
  - kind: GoModule
    url: go_proxy:github.com/urfave/cli/@v/v1.22.17.mod
    digest:
      kind: Sha256Sum
      value: a5c8b6019e79de648ced5c531461ba39e0545bbec54333cc8d752809b78e9010
  - kind: GoPackage
    url: go_proxy:github.com/urfave/cli/@v/v1.22.17.zip
    digest:
      kind: Sha256Sum
      value: eb2629ff4d93a527036f0ebb57cf67caa10e97fdd9181740f8877936528bf6a9
  - kind: GoModule
    url: go_proxy:github.com/wadey/gocovmerge/@v/v0.0.0-20160331181800-b5bfa59ec0ad.mod
    digest:
      kind: Sha256Sum
      value: 852e2fc9eb48ce7932d4069b42c174342887e2fb1e61101cb5e4119dc3bf8c36
  - kind: GoPackage
    url: go_proxy:github.com/wadey/gocovmerge/@v/v0.0.0-20160331181800-b5bfa59ec0ad.zip
    digest:
      kind: Sha256Sum
      value: 9f5952330bf701f65988725ec1f3a34ebf3c79c1db5a70e48b48e0797f470c28
  - kind: GoModule
    url: go_proxy:golang.org/x/crypto/@v/v0.52.0.mod
    digest:
      kind: Sha256Sum
      value: 92137c1682719fd08f1a102fffcf3f45275d1c3aab815a5e110d58c42fcb0e49
  - kind: GoPackage
    url: go_proxy:golang.org/x/crypto/@v/v0.52.0.zip
    digest:
      kind: Sha256Sum
      value: a4dca44f467a3d8745aef41147c7bc6a90cdcfda9c42ae0585888bf046c7941e
  - kind: GoModule
    url: go_proxy:golang.org/x/exp/typeparams/@v/v0.0.0-20231108232855-2478ac86f678.mod
    digest:
      kind: Sha256Sum
      value: 49064f2b6b5944e091bc67f34eeb5719b0052df7333d88871735d3e8ac0715aa
  - kind: GoPackage
    url: go_proxy:golang.org/x/exp/typeparams/@v/v0.0.0-20231108232855-2478ac86f678.zip
    digest:
      kind: Sha256Sum
      value: 22c0e082f62b39c8ddaec18a9f2888158199e597adc8780e918e8976cd9fbbb0
  - kind: GoModule
    url: go_proxy:golang.org/x/mod/@v/v0.27.0.mod
    digest:
      kind: Sha256Sum
      value: b20d6c1f4b46742e6af828327160346aeb3e622ab1780ad51b80e1d67adfe95b
  - kind: GoPackage
    url: go_proxy:golang.org/x/mod/@v/v0.27.0.zip
    digest:
      kind: Sha256Sum
      value: 19fb241d46e4397d3193b5fa899e2a9d62bb5d1c41f73d09d29c17c3c0d3953c
  - kind: GoModule
    url: go_proxy:golang.org/x/sync/@v/v0.16.0.mod
    digest:
      kind: Sha256Sum
      value: 720b98f1bf033d6b64a454ca8c29cdca6e9265ab7d70db3b834dff49560f1587
  - kind: GoPackage
    url: go_proxy:golang.org/x/sync/@v/v0.16.0.zip
    digest:
      kind: Sha256Sum
      value: ca43984183eb14f7f50d33da350312fed1c42e106dceac2437bfd5084b497dcd
  - kind: GoModule
    url: go_proxy:golang.org/x/sys/@v/v0.45.0.mod
    digest:
      kind: Sha256Sum
      value: 57f4393ea18d5446a12363b35c23a616d843fa1669c7121a70a2bc3a9677d665
  - kind: GoPackage
    url: go_proxy:golang.org/x/sys/@v/v0.45.0.zip
    digest:
      kind: Sha256Sum
      value: e51c1c88045b4edbe48ad810122131381ff541c89edbd97ef833ed6653b59e6a
  - kind: GoModule
    url: go_proxy:golang.org/x/term/@v/v0.43.0.mod
    digest:
      kind: Sha256Sum
      value: d901212ab10297286b157086365fc813a4468ac9e7f91737e7c696e38f68fab7
  - kind: GoPackage
    url: go_proxy:golang.org/x/term/@v/v0.43.0.zip
    digest:
      kind: Sha256Sum
      value: 0d12dd77f2c620f236e59421d604f6bcd1f9212a4083a1c0ec13425c67bc6e81
  - kind: GoModule
    url: go_proxy:golang.org/x/tools/@v/v0.36.0.mod
    digest:
      kind: Sha256Sum
      value: 53792e623827ef40be8f1af36dcf12790e82780b3d33b4b0944f56a3584bc429
  - kind: GoPackage
    url: go_proxy:golang.org/x/tools/@v/v0.36.0.zip
    digest:
      kind: Sha256Sum
      value: 85b486030e995cd5b4d56dea92f247b32bf4e0ae2fe6816b29d4514b5a43fec8
  - kind: GoModule
    url: go_proxy:golang.org/x/tools/go/expect/@v/v0.1.1-deprecated.mod
    digest:
      kind: Sha256Sum
      value: 0995d960f35334cd5c1caa9748e280ce531f2e06fe092466c77817ceb7a32f08
  - kind: GoPackage
    url: go_proxy:golang.org/x/tools/go/expect/@v/v0.1.1-deprecated.zip
    digest:
      kind: Sha256Sum
      value: b2389159ddd768c6bd83a0cc92bbf9be01c32ca973c366fc224b79762d90dd79
  - kind: GoModule
    url: go_proxy:google.golang.org/protobuf/@v/v1.36.10.mod
    digest:
      kind: Sha256Sum
      value: a75c105a852fbd8da8d8cfac09c2eab9a206cfd27ed37c973737e23f632ca96e
  - kind: GoPackage
    url: go_proxy:google.golang.org/protobuf/@v/v1.36.10.zip
    digest:
      kind: Sha256Sum
      value: 9265fbe7d073ca8571f1a9c4b8e8f20b244c35ad913346892d688e58fe4b1f22
  - kind: GoModule
    url: go_proxy:honnef.co/go/tools/@v/v0.6.1.mod
    digest:
      kind: Sha256Sum
      value: 3edb15a24dcd27d361ea646827c71fa485fd06b9c8e514b4a3f029eaeb3e4ea7
  - kind: GoPackage
    url: go_proxy:honnef.co/go/tools/@v/v0.6.1.zip
    digest:
      kind: Sha256Sum
      value: c8fed1950db52dc2e2682be963d564657a1d151898cedbd0f4b822828a899dc5
