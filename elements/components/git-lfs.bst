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
    - git lfs install --system

sources:
- kind: git_repo
  url: github:git-lfs/git-lfs.git
  track: v*
  ref: v3.5.1-0-ge237bb3a364603cbb92cabc34b8401d1ad5d795b
- kind: local
  directory: vendor
  path: files/git-lfs/modules.txt
- kind: git_repo
  url: github:alexbrainman/sspi.git
  directory: vendor/github.com/alexbrainman/sspi
  ref: 909beea2cc7490802e4be2af0600202db533536b
- kind: git_repo
  url: github:avast/retry-go.git
  track: v2.4.2
  ref: v2.4.2-0-ga322e24d96313ab405dec28ad5711f036c6d25a3
  directory: vendor/github.com/avast/retry-go
- kind: git_repo
  url: github:davecgh/go-spew.git
  track: v1.1.1
  ref: v1.1.1-0-g8991bc29aa16c548c550c7ff78260e27b9ab7c73
  directory: vendor/github.com/davecgh/go-spew
- kind: git_repo
  url: github:dpotapov/go-spnego.git
  directory: vendor/github.com/dpotapov/go-spnego
  ref: 298b63a544303a239753d04314aada5bdbad7e4a
- kind: git_repo
  url: github:git-lfs/gitobj.git
  track: v2.1.1
  ref: v2.1.1-0-g30ed74dc07486af9f93f48999a7bebdd5d83001a
  directory: vendor/github.com/git-lfs/gitobj/v2
- kind: git_repo
  url: github:git-lfs/go-netrc.git
  directory: vendor/github.com/git-lfs/go-netrc
  ref: f0c862dd687a9d9a7e15b3cd7cb3fd3e81cdd5ef
- kind: git_repo
  url: github:git-lfs/pktline.git
  directory: vendor/github.com/git-lfs/pktline
  ref: 06e9096e28253ba5c7825cbba43f469e4efd10f0
- kind: git_repo
  url: github:git-lfs/wildmatch.git
  track: v2.0.1
  ref: v2.0.1-0-g87c05a427201f2fd4696fe110b25f20465cbeead
  directory: vendor/github.com/git-lfs/wildmatch/v2
- kind: git_repo
  url: github:hashicorp/go-uuid.git
  track: v1.0.2
  ref: v1.0.2-0-g6195a4f20692188e0a389def25559731d1e130f9
  directory: vendor/github.com/hashicorp/go-uuid
- kind: git_repo
  url: github:inconshreveable/mousetrap.git
  track: v1.1.0
  ref: v1.1.0-0-g4e8053ee7ef85a6bd26368364a6d27f1641c1d21
  directory: vendor/github.com/inconshreveable/mousetrap
- kind: zip
  url: tar_https:proxy.golang.org/github.com/jcmturner/aescts/v2/@v/v2.0.0.zip
  ref: 717a211ad4aac248cf33cadde73059c13f8e9462123a0ab2fed5c5e61f7739d7
  base-dir: 'github.com/jcmturner/aescts/v2@v2.0.0'
  directory: vendor/github.com/jcmturner/aescts/v2
- kind: zip
  url: tar_https:proxy.golang.org/github.com/jcmturner/dnsutils/v2/@v/v2.0.0.zip
  ref: f9188186b672e547cfaef66107aa62d65054c5d4f10d4dcd1ff157d6bf8c275d
  base-dir: 'github.com/jcmturner/dnsutils/v2@v2.0.0'
  directory: vendor/github.com/jcmturner/dnsutils/v2
- kind: zip
  url: tar_https:proxy.golang.org/github.com/jcmturner/gofork/@v/v1.0.0.zip
  ref: 5e015dd9b038f1dded0b2ded77e529d2f6ba0bed228a98831af5a3610eefcb52
  base-dir: 'github.com/jcmturner/gofork@v1.0.0'
  directory: vendor/github.com/jcmturner/gofork
- kind: zip
  url: tar_https:proxy.golang.org/github.com/jcmturner/goidentity/v6/@v/v6.0.1.zip
  ref: 243e6fd6ea9f3094eea32c55febade6d8aaa1b563db655b0c5327940e4719beb
  base-dir: 'github.com/jcmturner/goidentity/v6@v6.0.1'
  directory: vendor/github.com/jcmturner/goidentity/v6
- kind: zip
  url: tar_https:proxy.golang.org/github.com/jcmturner/gokrb5/v8/@v/v8.4.2.zip
  ref: eecd7120363321bb6b58b015395089958720271b3211659d802447d417af5970
  base-dir: 'github.com/jcmturner/gokrb5/v8@v8.4.2'
  directory: vendor/github.com/jcmturner/gokrb5/v8
- kind: zip
  url: tar_https:proxy.golang.org/github.com/jcmturner/rpc/v2/@v/v2.0.3.zip
  ref: 90c595355e5e2c9dc1e1ae71a88491a04c34d8791180098da103217cbf5f5574
  base-dir: 'github.com/jcmturner/rpc/v2@v2.0.3'
  directory: vendor/github.com/jcmturner/rpc/v2
- kind: git_repo
  url: github:jmhodges/clock.git
  track: v1.2.0
  ref: v1.2.0-0-g21de17d65b1b5cd83bb8fdbef90cb2ac369ce2dd
  directory: vendor/github.com/jmhodges/clock
- kind: git_repo
  url: github:leonelquinteros/gotext.git
  track: v1.5.0
  ref: v1.5.0-0-g1b8a993ae40a69bc9e9ed20a93b526c1e6b7d457
  directory: vendor/github.com/leonelquinteros/gotext
- kind: git_repo
  url: github:mattn/go-isatty.git
  track: v0.0.4
  ref: v0.0.4-0-g6ca4dbf54d38eea1a992b3c722a76a5d1c4cb25c
  directory: vendor/github.com/mattn/go-isatty
- kind: git_repo
  url: github:olekukonko/ts.git
  directory: vendor/github.com/olekukonko/ts
  ref: 78ecb04241c0121483589a30b0814836a746187d
- kind: git_repo
  url: github:pkg/errors.git
  directory: vendor/github.com/pkg/errors
  ref: c605e284fe17294bda444b34710735b29d1a9d90
- kind: git_repo
  url: github:pmezard/go-difflib.git
  track: v1.0.0
  ref: v1.0.0-0-g792786c7400a136282c1664665ae0a8db921c6c2
  directory: vendor/github.com/pmezard/go-difflib
- kind: git_repo
  url: github:rubyist/tracerx.git
  directory: vendor/github.com/rubyist/tracerx
  ref: 787959303086f44a8c361240dfac53d3e9d53ed2
- kind: git_repo
  url: github:spf13/cobra.git
  track: v1.7.0
  ref: v1.7.0-0-g4dd4b25de38418174a6e859e8a32eaccca32dccc
  directory: vendor/github.com/spf13/cobra
- kind: git_repo
  url: github:spf13/pflag.git
  track: v1.0.5
  ref: v1.0.5-0-g2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab
  directory: vendor/github.com/spf13/pflag
- kind: git_repo
  url: github:ssgelm/cookiejarparser.git
  track: v1.0.1
  ref: v1.0.1-0-gead01002df3bee9f6d64bfde0c7387bd2368a2e0
  directory: vendor/github.com/ssgelm/cookiejarparser
- kind: git_repo
  url: github:stretchr/testify.git
  track: v1.6.1
  ref: v1.6.1-0-gf654a9112bbeac49ca2cd45bfbe11533c4666cf8
  directory: vendor/github.com/stretchr/testify
- kind: git_repo
  url: github:xeipuuv/gojsonpointer.git
  directory: vendor/github.com/xeipuuv/gojsonpointer
  ref: 4e3ac2762d5f479393488629ee9370b50873b3a6
- kind: git_repo
  url: github:xeipuuv/gojsonreference.git
  directory: vendor/github.com/xeipuuv/gojsonreference
  ref: bd5ef7bd5415a7ac448318e64f11a24cd21e594b
- kind: git_repo
  url: github:xeipuuv/gojsonschema.git
  directory: vendor/github.com/xeipuuv/gojsonschema
  ref: 6b67b3fab74d992bd07f72550006ab2c6907c416
- kind: git_repo
  url: git_https:go.googlesource.com/crypto
  directory: vendor/golang.org/x/crypto
  track: v0.17.0
  ref: v0.17.0-0-g9d2ee975ef9fe627bf0a6f01c1f69e8ef1d4f05d
- kind: git_repo
  url: git_https:go.googlesource.com/net
  track: v0.17.0
  ref: v0.17.0-0-gb225e7ca6dde1ef5a5ae5ce922861bda011cfabd
  directory: vendor/golang.org/x/net
- kind: git_repo
  url: git_https:go.googlesource.com/sync
  track: v0.1.0
  ref: v0.1.0-0-g8fcdb60fdcc0539c5e357b2308249e4e752147f1
  directory: vendor/golang.org/x/sync
- kind: git_repo
  url: git_https:go.googlesource.com/sys
  track: v0.15.0
  ref: v0.15.0-0-g13b15b780d9013988b1fb0e79e30b2528a877638
  directory: vendor/golang.org/x/sys
- kind: git_repo
  url: git_https:go.googlesource.com/text
  track: v0.14.0
  ref: v0.14.0-0-g6c97a165dd661335ff7bce6104a008558123c353
  directory: vendor/golang.org/x/text
- kind: git_repo
  url: git_https:gopkg.in/yaml.v3
  track: v3.0.1
  ref: v3.0.1-0-gf6f7691b1fdeb513f56608cd2c32c51f8194bf51
  directory: vendor/gopkg.in/yaml.v3
