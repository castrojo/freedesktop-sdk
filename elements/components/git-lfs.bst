# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/buildsystem-go.bst

depends:
- components/git.bst

variables:
  optimize-debug: "false"

config:
  build-commands:
  - |
    mv -vf modules.txt vendor/modules.txt

  - |
    go build

  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}" git-lfs

  - |
    %{install-extra}

public:
  bst:
    integration-commands:
    - |
      cat << EOF >> %{sysconfdir}/gitconfig
      [filter "lfs"]
      	required = true
      	clean = git-lfs clean -- %f
      	smudge = git-lfs smudge -- %f
      	process = git-lfs filter-process
      EOF

sources:
- kind: git_repo
  url: github:git-lfs/git-lfs.git
  track: v*
  ref: v3.8.0-0-gaece9221f8c09221a14395d964806b956289bc07
- kind: local
  path: files/git-lfs/modules.txt
- kind: go_module
  url: github:alexbrainman/sspi.git
  module: github.com/alexbrainman/sspi
  ref:
    go-version: v0.0.0-20210105120005-909beea2cc74
    git-ref: 909beea2cc7490802e4be2af0600202db533536b
    explicit: True
- kind: go_module
  url: github:avast/retry-go.git
  module: github.com/avast/retry-go
  ref:
    go-version: v3.0.0+incompatible
    git-ref: v3.0.0-0-gce731f6114d3f1b81d16110b9f7d6a8637b1339b
    explicit: True
- kind: go_module
  url: github:davecgh/go-spew.git
  module: github.com/davecgh/go-spew
  ref:
    go-version: v1.1.1
    git-ref: v1.1.1-0-g8991bc29aa16c548c550c7ff78260e27b9ab7c73
    explicit: True
- kind: go_module
  url: github:dpotapov/go-spnego.git
  module: github.com/dpotapov/go-spnego
  ref:
    go-version: v0.0.0-20210315154721-298b63a54430
    git-ref: 298b63a544303a239753d04314aada5bdbad7e4a
    explicit: True
- kind: go_module
  url: github:git-lfs/gitobj.git
  module: github.com/git-lfs/gitobj/v2
  ref:
    go-version: v2.1.1
    git-ref: v2.1.1-0-g30ed74dc07486af9f93f48999a7bebdd5d83001a
    explicit: True
- kind: go_module
  url: github:git-lfs/go-netrc.git
  module: github.com/git-lfs/go-netrc
  ref:
    go-version: v0.0.0-20250218165306-ba0029b43d11
    git-ref: ba0029b43d1190baf66986a87418593ed1a07f42
    explicit: True
- kind: go_module
  url: github:git-lfs/pktline.git
  module: github.com/git-lfs/pktline
  ref:
    go-version: v0.0.0-20210330133718-06e9096e2825
    git-ref: 06e9096e28253ba5c7825cbba43f469e4efd10f0
    explicit: True
- kind: go_module
  url: github:git-lfs/wildmatch.git
  module: github.com/git-lfs/wildmatch/v2
  ref:
    go-version: v2.0.1
    git-ref: v2.0.1-0-g87c05a427201f2fd4696fe110b25f20465cbeead
    explicit: True
- kind: go_module
  url: github:hashicorp/go-uuid.git
  module: github.com/hashicorp/go-uuid
  ref:
    go-version: v1.0.2
    git-ref: v1.0.2-0-g6195a4f20692188e0a389def25559731d1e130f9
    explicit: True
- kind: go_module
  url: github:inconshreveable/mousetrap.git
  module: github.com/inconshreveable/mousetrap
  ref:
    go-version: v1.1.0
    git-ref: v1.1.0-0-g4e8053ee7ef85a6bd26368364a6d27f1641c1d21
    explicit: True
- kind: go_module
  url: github:jcmturner/aescts.git
  module: github.com/jcmturner/aescts/v2
  ref:
    go-version: v2.0.0
    git-ref: v2.0.0-0-g72347e1bd92aa67384e4f8c0e8a6d7cfaa716eea
    explicit: True
- kind: go_module
  url: github:jcmturner/dnsutils.git
  module: github.com/jcmturner/dnsutils/v2
  ref:
    go-version: v2.0.0
    git-ref: v2.0.0-0-g90052734000be120c409677a88cb517e5b49dbf4
    explicit: True
- kind: go_module
  url: github:jcmturner/gofork.git
  module: github.com/jcmturner/gofork
  ref:
    go-version: v1.0.0
    git-ref: v1.0.0-0-gdc7c13fece037a4a36e2b3c69db4991498d30692
    explicit: True
- kind: go_module
  url: github:jcmturner/goidentity.git
  module: github.com/jcmturner/goidentity/v6
  ref:
    go-version: v6.0.1
    git-ref: v6.0.1-0-g836ef0c4025b66a750604bb79d41ace085366777
    explicit: True
- kind: go_module
  url: github:jcmturner/gokrb5.git
  module: github.com/jcmturner/gokrb5/v8
  ref:
    go-version: v8.4.2
    git-ref: v8.4.2-0-g663478bf457f1fc3275973bea5b7b787cd332015
    explicit: True
- kind: go_module
  url: github:jcmturner/rpc.git
  module: github.com/jcmturner/rpc/v2
  ref:
    go-version: v2.0.3
    git-ref: v2.0.3-0-g7f482067a47ba5c8f25f2bcae9ab99b3fed820e9
    explicit: True
- kind: go_module
  url: github:jmhodges/clock.git
  module: github.com/jmhodges/clock
  ref:
    go-version: v1.2.0
    git-ref: v1.2.0-0-g21de17d65b1b5cd83bb8fdbef90cb2ac369ce2dd
    explicit: True
- kind: go_module
  url: github:leonelquinteros/gotext.git
  module: github.com/leonelquinteros/gotext
  ref:
    go-version: v1.7.2
    git-ref: v1.7.2-0-gdfb32f237361d8a9dd99c5e2fe036f7a234c0b7e
    explicit: True
- kind: go_module
  url: github:mattn/go-isatty.git
  module: github.com/mattn/go-isatty
  ref:
    go-version: v0.0.24
    git-ref: v0.0.24-0-gc44dc0b9c702c76577fdb7898032969e0611efc2
    explicit: True
- kind: go_module
  url: github:olekukonko/ts.git
  module: github.com/olekukonko/ts
  ref:
    go-version: v0.0.0-20171002115256-78ecb04241c0
    git-ref: 78ecb04241c0121483589a30b0814836a746187d
    explicit: True
- kind: go_module
  url: github:pkg/errors.git
  module: github.com/pkg/errors
  ref:
    go-version: v0.9.1
    git-ref: v0.9.1-0-g614d223910a179a466c1767a985424175c39b465
    explicit: True
- kind: go_module
  url: github:pmezard/go-difflib.git
  module: github.com/pmezard/go-difflib
  ref:
    go-version: v1.0.0
    git-ref: v1.0.0-0-g792786c7400a136282c1664665ae0a8db921c6c2
    explicit: True
- kind: go_module
  url: github:rubyist/tracerx.git
  module: github.com/rubyist/tracerx
  ref:
    go-version: v0.0.0-20170927163412-787959303086
    git-ref: 787959303086f44a8c361240dfac53d3e9d53ed2
    explicit: True
- kind: go_module
  url: github:spf13/cobra.git
  module: github.com/spf13/cobra
  ref:
    go-version: v1.10.2
    git-ref: v1.10.2-0-g88b30ab89da2d0d0abb153818746c5a2d30eccec
    explicit: True
- kind: go_module
  url: github:spf13/pflag.git
  module: github.com/spf13/pflag
  ref:
    go-version: v1.0.9
    git-ref: v1.0.9-0-g10438578954bba2527fe5cae3684d4532b064bbe
    explicit: True
- kind: go_module
  url: github:ssgelm/cookiejarparser.git
  module: github.com/ssgelm/cookiejarparser
  ref:
    go-version: v1.0.1
    git-ref: v1.0.1-0-gead01002df3bee9f6d64bfde0c7387bd2368a2e0
    explicit: True
- kind: go_module
  url: github:stretchr/testify.git
  module: github.com/stretchr/testify
  ref:
    go-version: v1.11.1
    git-ref: v1.11.1-0-g2a57335dc9cd6833daa820bc94d9b40c26a7917d
    explicit: True
- kind: go_module
  url: github:xeipuuv/gojsonpointer.git
  module: github.com/xeipuuv/gojsonpointer
  ref:
    go-version: v0.0.0-20180127040702-4e3ac2762d5f
    git-ref: 4e3ac2762d5f479393488629ee9370b50873b3a6
    explicit: True
- kind: go_module
  url: github:xeipuuv/gojsonreference.git
  module: github.com/xeipuuv/gojsonreference
  ref:
    go-version: v0.0.0-20180127040603-bd5ef7bd5415
    git-ref: bd5ef7bd5415a7ac448318e64f11a24cd21e594b
    explicit: True
- kind: go_module
  url: github:xeipuuv/gojsonschema.git
  module: github.com/xeipuuv/gojsonschema
  ref:
    go-version: v1.2.0
    git-ref: v1.2.0-0-g82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927
    explicit: True
- kind: go_module
  url: git_https:go.googlesource.com/crypto
  module: golang.org/x/crypto
  ref:
    go-version: v0.54.0
    git-ref: v0.54.0-0-gcdce021fa6c7d9c7eb2743bfbe551f0a98fd5d62
    explicit: True
- kind: go_module
  url: git_https:go.googlesource.com/net
  module: golang.org/x/net
  ref:
    go-version: v0.57.0
    git-ref: v0.57.0-0-gb8f09f6f062ceb4531b7af4bd17a5c8fe9c4b2b5
    explicit: True
- kind: go_module
  url: git_https:go.googlesource.com/sync
  module: golang.org/x/sync
  ref:
    go-version: v0.22.0
    git-ref: v0.22.0-0-g1eb64d4bc0cde6da1bb8ebc7f178bb577508e5d0
    explicit: True
- kind: go_module
  url: git_https:go.googlesource.com/sys
  module: golang.org/x/sys
  ref:
    go-version: v0.47.0
    git-ref: v0.47.0-0-g9e7e939dcafac07e8ab4cffa6e5fc74908413f00
    explicit: True
- kind: go_module
  url: git_https:go.googlesource.com/text
  module: golang.org/x/text
  ref:
    go-version: v0.40.0
    git-ref: v0.40.0-0-g724af9c35838492dcaacc1ac51a8a0187c994c54
    explicit: True
- kind: go_module
  url: git_https:gopkg.in/yaml.v3
  module: gopkg.in/yaml.v3
  ref:
    go-version: v3.0.1
    git-ref: v3.0.1-0-gf6f7691b1fdeb513f56608cd2c32c51f8194bf51
    explicit: True
- kind: go_module
  url: github:golang/groupcache.git
  module: github.com/golang/groupcache
  ref:
    go-version: v0.0.0-20241129210726-2c02b8208cf8
    git-ref: 2c02b8208cf8c02a3e358cb1d9b60950647543fc
    explicit: True
