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
- kind: go_module
  url: github:BurntSushi/toml.git
  module: github.com/BurntSushi/toml
  ref:
    go-version: v1.3.2
    git-ref: v1.3.2-0-gb324da5ffbb2a87e4a611b1703bd03bffbe7ffbf
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
    go-version: v2.0.2
    git-ref: v2.0.2-0-gd97078115282836e16d0dca10b4b42ce60fc70e6
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
    go-version: v1.22.14
    git-ref: v1.22.14-0-gf5ca62f301d773bdc9c800aa0e24aec82ad01a1d
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
    go-version: v0.17.0
    git-ref: v0.17.0-0-g9d2ee975ef9fe627bf0a6f01c1f69e8ef1d4f05d
    explicit: True
- kind: go_module
  url: github:golang/exp.git
  module: golang.org/x/exp/typeparams
  ref:
    go-version: v0.0.0-20221208152030-732eee02a75a
    git-ref: 732eee02a75a571a8347fdf60af8c8b9e3ca9254
    explicit: True
- kind: go_module
  url: github:golang/mod.git
  module: golang.org/x/mod
  ref:
    go-version: v0.12.0
    git-ref: v0.12.0-0-gbaa5c2d058db25484c20d76985ba394e73176132
    explicit: True
- kind: go_module
  url: github:golang/sys.git
  module: golang.org/x/sys
  ref:
    go-version: v0.15.0
    git-ref: v0.15.0-0-g13b15b780d9013988b1fb0e79e30b2528a877638
    explicit: True
- kind: go_module
  url: github:golang/term.git
  module: golang.org/x/term
  ref:
    go-version: v0.15.0
    git-ref: v0.15.0-0-gee66497fa39f03ba841b568a7b4f4ee4e4546f74
    explicit: True
- kind: go_module
  url: github:golang/tools.git
  module: golang.org/x/tools
  ref:
    go-version: v0.13.0
    git-ref: v0.13.0-0-gb5e55d198461206bca9558e65cdd518f8e4f2735
    explicit: True
- kind: go_module
  url: github:golang/xerrors.git
  module: golang.org/x/xerrors
  ref:
    go-version: v0.0.0-20191204190536-9bdfabe68543
    git-ref: 9bdfabe68543c54f90421aeb9a60ef8061b5b544
    explicit: False
- kind: go_module
  url: github:protocolbuffers/protobuf-go.git
  module: google.golang.org/protobuf
  ref:
    go-version: v1.33.0
    git-ref: v1.33.0-0-gec47fd138f9221b19a2afd6570b3c39ede9df3dc
    explicit: True
- kind: go_module
  url: github:dominikh/go-tools.git
  module: honnef.co/go/tools
  ref:
    go-version: v0.4.5
    git-ref: v0.4.5-0-g9e12e6014d3b0a854950490051ad1338fc6badd1
    explicit: True
