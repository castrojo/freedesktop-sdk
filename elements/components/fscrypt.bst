kind: make

build-depends:
- components/pkg-config.bst
- components/git-minimal.bst
- components/go.bst
- components/m4.bst

depends:
- components/linux-pam.bst
- bootstrap-import.bst

variables:
  ldflags_defaults: ""
  optimize-debug: "false"
  compress-debug: "false"

sources:
- kind: git_repo
  url: github:google/fscrypt.git
  track: v*
  ref: v0.3.5-0-g49c71dedfee544fd74808d3a18972fb65d6e9f02
# You will have to manual again until we get a go plugin
- kind: git_repo
  url: github:BurntSushi/toml.git
  directory: vendor/BurntSushi/toml
  track: v0.4.1
  ref: v0.4.1-0-g641c3cf2148ad11ca058c000eab0453dd5d67954
- kind: git_repo
  url: github:client9/misspell.git
  directory: vendor/github.com/client9/misspell
  ref: v0.3.4-0-gb90dc15cfd220ecf8bbc9043ecb928cef381f011
- kind: git_repo
  url: github:cpuguy83/go-md2man.git
  directory: vendor/github.com/cpuguy83/go-md2man/v2
  track: v2.0.0
  ref: v2.0.0-0-gf79a8a8ca69da163eee19ab442bedad7a35bba5a
- kind: git_repo
  url: github:pkg/errors.git
  directory: vendor/github.com/pkg/errors
  track: v0.9.1
  ref: v0.9.1-0-g614d223910a179a466c1767a985424175c39b465
- kind: git_repo
  url: github:russross/blackfriday.git
  track: v2.0.1
  directory: vendor/github.com/russross/blackfriday/v2
  ref: v2.0.1-0-gd3b5b032dc8e8927d31a5071b56e14c89f045135
- kind: git_repo
  url: github:shurcooL/sanitized_anchor_name
  directory: vendor/github.com/shurcooL/sanitized_anchor_name
  track: v1.0.0
  ref: v1.0.0-0-g7bfe4c7ecddb3666a94b053b422cdd8f5aaa3615
- kind: git_repo
  url: github:urfave/cli.git
  directory: vendor/github.com/urfave/cli
  track: v1.22.5
  ref: v1.22.5-0-gaf7fa3de115a4f9772a7758c51f92a1e3b30a010
- kind: git_repo
  url: github:wadey/gocovmerge.git
  directory: vendor/github.com/wadey/gocovmerge
  ref: b5bfa59ec0adc420475f97f89b58045c721d761c
- kind: git_repo
  url: github:golang/crypto.git
  directory: vendor/golang.org/x/crypto
  ref: 5352b09029215197cc109b46f0560d05ffab29db
- kind: git_repo
  url: github:golang/exp.git
  directory: vendor/golang.org/x/exp
  ref: 6cf2b201936e0673ace5b31d2dffa00dafb3ee58
- kind: git_repo
  url: github:golang/lint.git
  directory: vendor/golang.org/x/lint
  ref: 6edffad5e6160f5949cdefc81710b2706fbcd4f6
- kind: git_repo
  url: github:golang/mod.git
  directory: vendor/golang.org/x/mod
  ref: 9b9b3d81d5e39b22d65814a8daf6723f3035d813
- kind: git_repo
  url: github:golang/sys.git
  directory: vendor/golang.org/x/sys
  ref: a24fb2fb8a0f8b563eeb002260472f7e3bf61e9a
- kind: git_repo
  url: github:golang/term.git
  directory: vendor/golang.org/x/term
  ref: 03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50
- kind: git_repo
  url: github:golang/tools.git
  directory: vendor/golang.org/x/tools
  ref: 77aa08bb151ab8ea5608357629c9bf95dfc0e51e
- kind: git_repo
  url: github:golang/xerrors.git
  directory: vendor/golang.org/x/xerrors
  ref: 5ec99f83aff198f5fbd629d6c8d8eb38a04218ca
- kind: git_repo
  url: github:protocolbuffers/protobuf-go.git
  directory: vendor/google.golang.org/protobuf
  track: v1.28.0
  ref: v1.28.0-0-g32051b4f86e54c2142c7c05362c6e96ae3454a1c
- kind: git_repo
  url: github:dominikh/go-tools.git
  directory: vendor/honnef.co/go/tools
  track: v0.3.0
  ref: v0.3.0-0-gd7e217c1ff411395475b2971c0824e1e7cc1af98
- kind: local
  directory: vendor
  path: files/fscrypt/modules.txt
