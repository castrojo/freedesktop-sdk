kind: manual

build-depends:
- components/go.bst

depends:
- components/git.bst

variables:
  optimize-debug: "false"
  compress-debug: "false"

config:
  build-commands:
  - |
    go build

  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}" git-lfs

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
  ref: v3.5.1-0-ge237bb3a364603cbb92cabc34b8401d1ad5d795b
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
    go-version: v2.4.2+incompatible
    git-ref: v2.4.2-0-ga322e24d96313ab405dec28ad5711f036c6d25a3
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
    go-version: v0.0.0-20210914205454-f0c862dd687a
    git-ref: f0c862dd687a9d9a7e15b3cd7cb3fd3e81cdd5ef
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
    go-version: v1.5.0
    git-ref: v1.5.0-0-g1b8a993ae40a69bc9e9ed20a93b526c1e6b7d457
    explicit: True
- kind: go_module
  url: github:mattn/go-isatty.git
  module: github.com/mattn/go-isatty
  ref:
    go-version: v0.0.4
    git-ref: v0.0.4-0-g6ca4dbf54d38eea1a992b3c722a76a5d1c4cb25c
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
    go-version: v0.0.0-20170505043639-c605e284fe17
    git-ref: c605e284fe17294bda444b34710735b29d1a9d90
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
    go-version: v1.7.0
    git-ref: v1.7.0-0-g4dd4b25de38418174a6e859e8a32eaccca32dccc
    explicit: True
- kind: go_module
  url: github:spf13/pflag.git
  module: github.com/spf13/pflag
  ref:
    go-version: v1.0.5
    git-ref: v1.0.5-0-g2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab
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
    go-version: v1.6.1
    git-ref: v1.6.1-0-gf654a9112bbeac49ca2cd45bfbe11533c4666cf8
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
    go-version: v0.0.0-20170210233622-6b67b3fab74d
    git-ref: 6b67b3fab74d992bd07f72550006ab2c6907c416
    explicit: True
- kind: go_module
  url: git_https:go.googlesource.com/crypto
  module: golang.org/x/crypto
  ref:
    go-version: v0.17.0
    git-ref: v0.17.0-0-g9d2ee975ef9fe627bf0a6f01c1f69e8ef1d4f05d
    explicit: True
- kind: go_module
  url: git_https:go.googlesource.com/net
  module: golang.org/x/net
  ref:
    go-version: v0.17.0
    git-ref: v0.17.0-0-gb225e7ca6dde1ef5a5ae5ce922861bda011cfabd
    explicit: True
- kind: go_module
  url: git_https:go.googlesource.com/sync
  module: golang.org/x/sync
  ref:
    go-version: v0.1.0
    git-ref: v0.1.0-0-g8fcdb60fdcc0539c5e357b2308249e4e752147f1
    explicit: True
- kind: go_module
  url: git_https:go.googlesource.com/sys
  module: golang.org/x/sys
  ref:
    go-version: v0.15.0
    git-ref: v0.15.0-0-g13b15b780d9013988b1fb0e79e30b2528a877638
    explicit: True
- kind: go_module
  url: git_https:go.googlesource.com/text
  module: golang.org/x/text
  ref:
    go-version: v0.14.0
    git-ref: v0.14.0-0-g6c97a165dd661335ff7bce6104a008558123c353
    explicit: True
- kind: go_module
  url: git_https:gopkg.in/yaml.v3
  module: gopkg.in/yaml.v3
  ref:
    go-version: v3.0.1
    git-ref: v3.0.1-0-gf6f7691b1fdeb513f56608cd2c32c51f8194bf51
    explicit: True
