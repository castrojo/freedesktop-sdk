kind: make

build-depends:
- components/pkg-config.bst
- components/git-minimal.bst
- components/go.bst
- components/go-md2man.bst
- components/m4.bst

depends:
- components/linux-pam.bst
- bootstrap-import.bst

environment:
  GOFLAGS: -mod=vendor

variables:
  ldflags_defaults: ""
  optimize-debug: "false"
  compress-debug: "false"

sources:
- kind: git_tag
  url: github:google/fscrypt.git
  track: master
  ref: v0.3.3-0-gf28f2be05de938b1c2da7a88569bf6611250a9e2
# You will have to manual again until we get a go plugin
- kind: git_tag
  url: github:client9/misspell.git
  directory: vendor/gitub.com/client9/misspell
  track: v0.3.4
  ref: v0.3.4-0-gb90dc15cfd220ecf8bbc9043ecb928cef381f011
- kind: git_tag
  url: github:golang/protobuf.git
  directory: vendor/github.com/golang/protobuf
  track: v1.2.0
  ref: v1.2.0-0-gaa810b61a9c79d51363740d207bb46cf8e620ed5
- kind: git_tag
  url: github:pkg/errors.git
  track: v0.8.0
  directory: vendor/github.com/pkg/errors
  ref: v0.8.0-0-g645ef00459ed84a119197bfb8d8205042c6df63d
- kind: git_tag
  url: github:urfave/cli.git
  track: v1.20.0
  directory: vendor/github.com/urfave/cli
  ref: v1.20.0-0-gcfb38830724cc34fedffe9a2a29fb54fa9169cd1
- kind: git_tag
  url: github:wadey/gocovmerge.git
  track: b5bfa59ec0adc420475f97f89b58045c721d761c
  track-tags: false
  directory: vendor/github.com/wadey/gocovmerge
  ref: b5bfa59ec0adc420475f97f89b58045c721d761c
- kind: git_tag
  url: github:golang/crypto.git
  track: cbcb750295291b33242907a04be40e80801d0cfc
  track-tags: false
  directory: vendor/golang.org/x/crypto
  ref: cbcb750295291b33242907a04be40e80801d0cfc
- kind: git_tag
  url: github:golang/lint.git
  track: 16217165b5de779cb6a5e4fc81fa9c1166fda457
  track-tags: false
  directory: vendor/golang.org/x/lint
  ref: 16217165b5de779cb6a5e4fc81fa9c1166fda457
- kind: git_tag
  url: github:golang/sys.git
  track: f84b799fce68db3cb46a8f6f819c1e56377181df
  track-tags: false
  directory: vendor/golang.org/x/sys
  ref: f84b799fce68db3cb46a8f6f819c1e56377181df
- kind: git_tag
  url: github:golang/term.git
  track: f5beecf764ed751c785fa21705385df593b1852d
  track-tags: false
  directory: vendor/golang.org/x/term
  ref: f5beecf764ed751c785fa21705385df593b1852d
- kind: git_tag
  url: github:golang/tools.git
  track: 2077df36852e9a22c3b78f535833d3e54e9fcc8a
  track-tags: false
  directory: vendor/golang.org/x/tools
  ref: 2077df36852e9a22c3b78f535833d3e54e9fcc8a
- kind: git_tag
  url: github:dominikh/go-tools.git
  track: v0.0.1-2019.2.3
  directory: vendor/honnef.co/go/tools
  ref: 2019.2.3-0-gafd67930eec2a9ed3e9b19f684d17a062285f16a
