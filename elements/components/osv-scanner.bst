# SPDX-License-Identifier: MIT

kind: manual

build-depends:
  - public-stacks/buildsystem-go.bst

config:
  build-commands:
    - mv -vf modules.txt vendor/modules.txt
    - go build -buildmode=pie ./cmd/osv-scanner

  install-commands:
    - install -Dm755 -t "%{install-root}%{bindir}" osv-scanner

sources:
  - kind: git_repo
    url: github:google/osv-scanner.git
    track: v*.*.*
    ref: v2.6.0-0-ge840a6e8adb14b7777c78e26cfbf6e2abc1d1fc6
  - kind: local
    path: files/osv-scanner/modules.txt
  - kind: go_module
    url: github:charmbracelet/glamour.git
    module: charm.land/glamour/v2
    ref:
      go-version: v2.0.1
      git-ref: v2.0.1-0-g95c93db04489cebf252ec856584445c7e85ee276
      explicit: True
  - kind: go_module
    url: github:charmbracelet/lipgloss.git
    module: charm.land/lipgloss/v2
    ref:
      go-version: v2.0.6
      git-ref: v2.0.6-0-g733ce53541bb688fd735524b665e0d96e35433bb
      explicit: True
  - kind: go_module
    url: github:BurntSushi/toml.git
    module: github.com/BurntSushi/toml
    ref:
      go-version: v1.6.0
      git-ref: v1.6.0-0-g52534926c55b4cd85b05aee90569dd0668b8cf30
      explicit: True
  - kind: go_module
    url: github:CycloneDX/cyclonedx-go.git
    module: github.com/CycloneDX/cyclonedx-go
    ref:
      go-version: v0.12.0
      git-ref: v0.12.0-0-g717afd1da9a45403bfd0c44071b63fa95354498e
      explicit: True
  - kind: go_module
    url: github:gkampitakis/go-snaps.git
    module: github.com/gkampitakis/go-snaps
    ref:
      go-version: v0.5.23
      git-ref: v0.5.23-0-g07ef1d2d05c76635a8d438405e1d0cced581ebe3
      explicit: True
  - kind: go_module
    url: github:go-git/go-git.git
    module: github.com/go-git/go-git/v5
    ref:
      go-version: v5.19.2
      git-ref: v5.19.2-0-g3eeb238da61eb9c7a324f3ee04f990ce89175642
      explicit: True
  - kind: go_module
    url: github:gobwas/glob.git
    module: github.com/gobwas/glob
    ref:
      go-version: v0.2.3
      git-ref: v0.2.3-0-g5ccd90ef52e1e632236f7326478d4faa74f99438
      explicit: True
  - kind: go_module
    url: github:google/go-cmp.git
    module: github.com/google/go-cmp
    ref:
      go-version: v0.7.0
      git-ref: v0.7.0-0-g9b12f366a942ebc7254abc7f32ca05068b455fb7
      explicit: True
  - kind: go_module
    url: github:google/osv-scalibr.git
    module: github.com/google/osv-scalibr
    ref:
      go-version: v0.5.3-0.20260911142458-3090dbb7aaa2
      git-ref: 3090dbb7aaa24ce7a807899e7f16baa8b802a828
      explicit: True
  - kind: go_module
    url: github:ianlancetaylor/demangle.git
    module: github.com/ianlancetaylor/demangle
    ref:
      go-version: v0.0.0-20260724033716-83e58baca724
      git-ref: 83e58baca7248962d58657affe41b3b6f27ee423
      explicit: True
  - kind: go_module
    url: github:jedib0t/go-pretty.git
    module: github.com/jedib0t/go-pretty/v6
    ref:
      go-version: v6.8.3
      git-ref: v6.8.3-0-gdb0aac244a22cdef5f46bae37c07b4b3c96aeb58
      explicit: True
  - kind: go_module
    url: github:modelcontextprotocol/go-sdk.git
    module: github.com/modelcontextprotocol/go-sdk
    ref:
      go-version: v1.7.0
      git-ref: v1.7.0-0-gbc72835f62eb94d0fb484439f886b6885b075f36
      explicit: True
  - kind: go_module
    url: github:opencontainers/go-digest.git
    module: github.com/opencontainers/go-digest
    ref:
      go-version: v1.0.0
      git-ref: v1.0.0-0-gea51bea511f75cfa3ef6098cc253c5c3609b037a
      explicit: True
  - kind: go_module
    url: github:ossf/osv-schema.git
    module: github.com/ossf/osv-schema/bindings/go
    ref:
      go-version: v0.0.0-20260902031056-b388a18021a3
      git-ref: b388a18021a32b55da40c31eaef9fd4ce780447d
      explicit: True
      subdirectory: bindings/go
  - kind: go_module
    url: github:owenrumney/go-sarif.git
    module: github.com/owenrumney/go-sarif/v3
    ref:
      go-version: v3.3.1
      git-ref: v3.3.1-0-g3e37b83c3d7e6ddb2925735775e2d010a6b45d94
      explicit: True
  - kind: go_module
    url: github:package-url/packageurl-go.git
    module: github.com/package-url/packageurl-go
    ref:
      go-version: v0.1.7
      git-ref: v0.1.7-0-gc88ed7b2a2305ec91a087dd6cb7168ca1f42cfe3
      explicit: True
  - kind: go_module
    url: github:pandatix/go-cvss.git
    module: github.com/pandatix/go-cvss
    ref:
      go-version: v0.6.4
      git-ref: v0.6.4-0-g8df5dbd1cdb98348548087af3157a7f96d7521ba
      explicit: True
  - kind: go_module
    url: github:tidwall/gjson.git
    module: github.com/tidwall/gjson
    ref:
      go-version: v1.19.0
      git-ref: v1.19.0-0-g0fac2c9aa6eb5d5564bfaaaad513ce0d5d2314de
      explicit: True
  - kind: go_module
    url: github:tidwall/pretty.git
    module: github.com/tidwall/pretty
    ref:
      go-version: v1.2.1
      git-ref: v1.2.1-0-g9090695766b652478676cc3e55bc3187056b1ff0
      explicit: True
  - kind: go_module
    url: github:tidwall/sjson.git
    module: github.com/tidwall/sjson
    ref:
      go-version: v1.2.5
      git-ref: v1.2.5-0-gb279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: github:urfave/cli.git
    module: github.com/urfave/cli/v3
    ref:
      go-version: v3.11.0
      git-ref: v3.11.0-0-g138d3b34001ba0ddd59f6f29474788ba3d2f8ea7
      explicit: True
  - kind: go_module
    url: github:yaml/go-yaml.git
    module: go.yaml.in/yaml/v4
    ref:
      go-version: v4.0.0-rc.6
      git-ref: v4.0.0-rc.6-0-g1c17b9cee72bf81ae73a8be50fbd7dd3a9985125
      explicit: True
  - kind: go_module
    url: github:golang/term.git
    module: golang.org/x/term
    ref:
      go-version: v0.46.0
      git-ref: v0.46.0-0-g6226200ed12cba417a9d9e799c2a7179d3fc0e27
      explicit: True
  - kind: go_module
    url: github:golang/vuln.git
    module: golang.org/x/vuln
    ref:
      go-version: v1.6.0
      git-ref: v1.6.0-0-g19b0bb6a272792b9afa8a6983c3e9b9a1816947f
      explicit: True
  - kind: go_module
    url: github:grpc/grpc-go.git
    module: google.golang.org/grpc
    ref:
      go-version: v1.83.2
      git-ref: v1.83.2-0-g030ee8becb20ce4315d6bf2dfa26bdd876169dc4
      explicit: True
  - kind: go_module
    url: github:protocolbuffers/protobuf-go.git
    module: google.golang.org/protobuf
    ref:
      go-version: v1.36.12
      git-ref: v1.36.12-0-gcdd4c5f7406e82462949c7a65defa9f3029c162d
      explicit: True
  - kind: go_module
    url: github:dnaeon/go-vcr.git
    module: gopkg.in/dnaeon/go-vcr.v4
    ref:
      go-version: v4.0.7
      git-ref: v4.0.7-0-g2a9545bad4a9716c8263c81acf06d575c03a7c64
      explicit: True
  - kind: go_module
    url: https://bitbucket.org/creachadair/stringset.git
    module: bitbucket.org/creachadair/stringset
    ref:
      go-version: v0.0.14
      explicit: True
  - kind: go_module
    url: https://cloud.google.com/go/compute/metadata.git
    module: cloud.google.com/go/compute/metadata
    ref:
      go-version: v1.9.0
      explicit: True
  - kind: go_module
    url: https://dario.cat/mergo.git
    module: dario.cat/mergo
    ref:
      go-version: v1.0.2
      explicit: True
  - kind: go_module
    url: https://deps.dev/api/v3.git
    module: deps.dev/api/v3
    ref:
      go-version: v3.0.0-20260811035547-133c155ce203
      explicit: True
  - kind: go_module
    url: https://deps.dev/api/v3alpha.git
    module: deps.dev/api/v3alpha
    ref:
      go-version: v0.0.0-20260811035547-133c155ce203
      explicit: True
  - kind: go_module
    url: https://deps.dev/util/maven.git
    module: deps.dev/util/maven
    ref:
      go-version: v0.0.0-20260727054525-2946ae4a6141
      explicit: True
  - kind: go_module
    url: https://deps.dev/util/pypi.git
    module: deps.dev/util/pypi
    ref:
      go-version: v0.0.0-20260727054525-2946ae4a6141
      explicit: True
  - kind: go_module
    url: https://deps.dev/util/resolve.git
    module: deps.dev/util/resolve
    ref:
      go-version: v0.0.0-20260727054525-2946ae4a6141
      explicit: True
  - kind: go_module
    url: https://deps.dev/util/semver.git
    module: deps.dev/util/semver
    ref:
      go-version: v0.0.0-20260727054525-2946ae4a6141
      explicit: True
  - kind: go_module
    url: github:GehirnInc/crypt.git
    module: github.com/GehirnInc/crypt
    ref:
      go-version: v0.0.0-20230320061759-8cc1b52080c5
      explicit: True
  - kind: go_module
    url: github:Microsoft/go-winio.git
    module: github.com/Microsoft/go-winio
    ref:
      go-version: v0.6.3-0.20251027160822-ad3df93bed29
      explicit: True
  - kind: go_module
    url: github:ProtonMail/go-crypto.git
    module: github.com/ProtonMail/go-crypto
    ref:
      go-version: v1.4.1
      explicit: True
  - kind: go_module
    url: github:Velocidex/json.git
    module: github.com/Velocidex/json
    ref:
      go-version: v0.0.0-20220224052537-92f3c0326e5a
      explicit: True
  - kind: go_module
    url: github:Velocidex/ordereddict.git
    module: github.com/Velocidex/ordereddict
    ref:
      go-version: v0.0.0-20250821063524-02dc06e46238
      explicit: True
  - kind: go_module
    url: github:Velocidex/yaml.git
    module: github.com/Velocidex/yaml/v2
    ref:
      go-version: v2.2.8
      explicit: True
  - kind: go_module
    url: github:aead/serpent.git
    module: github.com/aead/serpent
    ref:
      go-version: v0.0.0-20160714141033-fba169763ea6
      explicit: True
  - kind: go_module
    url: github:agext/levenshtein.git
    module: github.com/agext/levenshtein
    ref:
      go-version: v1.2.3
      explicit: True
  - kind: go_module
    url: github:alecthomas/chroma.git
    module: github.com/alecthomas/chroma/v2
    ref:
      go-version: v2.19.0
      explicit: True
  - kind: go_module
    url: github:anchore/go-lzo.git
    module: github.com/anchore/go-lzo
    ref:
      go-version: v0.1.0
      explicit: True
  - kind: go_module
    url: github:anchore/go-struct-converter.git
    module: github.com/anchore/go-struct-converter
    ref:
      go-version: v0.1.0
      explicit: True
  - kind: go_module
    url: github:atotto/clipboard.git
    module: github.com/atotto/clipboard
    ref:
      go-version: v0.1.4
      explicit: True
  - kind: go_module
    url: github:aymanbagabas/go-osc52.git
    module: github.com/aymanbagabas/go-osc52/v2
    ref:
      go-version: v2.0.1
      explicit: True
  - kind: go_module
    url: github:aymerick/douceur.git
    module: github.com/aymerick/douceur
    ref:
      go-version: v0.2.0
      explicit: True
  - kind: go_module
    url: github:ayoubfaouzi/pkcs7.git
    module: github.com/ayoubfaouzi/pkcs7
    ref:
      go-version: v0.2.3
      explicit: True
  - kind: go_module
    url: github:bazelbuild/buildtools.git
    module: github.com/bazelbuild/buildtools
    ref:
      go-version: v0.0.0-20260716142318-04cf7de1434f
      explicit: True
  - kind: go_module
    url: github:canonical/chisel-manifest.git
    module: github.com/canonical/chisel-manifest
    ref:
      go-version: v1.2.0
      explicit: True
  - kind: go_module
    url: github:cespare/xxhash.git
    module: github.com/cespare/xxhash/v2
    ref:
      go-version: v2.3.0
      explicit: True
  - kind: go_module
    url: github:charmbracelet/bubbles.git
    module: github.com/charmbracelet/bubbles
    ref:
      go-version: v1.0.0
      explicit: True
  - kind: go_module
    url: github:charmbracelet/bubbletea.git
    module: github.com/charmbracelet/bubbletea
    ref:
      go-version: v1.3.10
      explicit: True
  - kind: go_module
    url: github:charmbracelet/colorprofile.git
    module: github.com/charmbracelet/colorprofile
    ref:
      go-version: v0.4.3
      explicit: True
  - kind: go_module
    url: github:charmbracelet/lipgloss.git
    module: github.com/charmbracelet/lipgloss
    ref:
      go-version: v1.1.1-0.20250404203927-76690c660834
      explicit: True
  - kind: go_module
    url: github:charmbracelet/ultraviolet.git
    module: github.com/charmbracelet/ultraviolet
    ref:
      go-version: v0.0.0-20260811164956-006e29f97886
      explicit: True
  - kind: go_module
    url: github:charmbracelet/x.git
    module: github.com/charmbracelet/x/ansi
    ref:
      go-version: v0.11.8
      explicit: True
  - kind: go_module
    url: github:charmbracelet/x.git
    module: github.com/charmbracelet/x/cellbuf
    ref:
      go-version: v0.0.15
      explicit: True
  - kind: go_module
    url: github:charmbracelet/x.git
    module: github.com/charmbracelet/x/exp/slice
    ref:
      go-version: v0.0.0-20260803091719-3755ebad01b1
      explicit: True
  - kind: go_module
    url: github:charmbracelet/x.git
    module: github.com/charmbracelet/x/term
    ref:
      go-version: v0.2.2
      explicit: True
  - kind: go_module
    url: github:charmbracelet/x.git
    module: github.com/charmbracelet/x/termios
    ref:
      go-version: v0.1.1
      explicit: True
  - kind: go_module
    url: github:charmbracelet/x.git
    module: github.com/charmbracelet/x/windows
    ref:
      go-version: v0.2.2
      explicit: True
  - kind: go_module
    url: github:clipperhouse/displaywidth.git
    module: github.com/clipperhouse/displaywidth
    ref:
      go-version: v0.11.0
      explicit: True
  - kind: go_module
    url: github:clipperhouse/uax29.git
    module: github.com/clipperhouse/uax29/v2
    ref:
      go-version: v2.7.0
      explicit: True
  - kind: go_module
    url: github:cloudflare/circl.git
    module: github.com/cloudflare/circl
    ref:
      go-version: v1.6.4
      explicit: True
  - kind: go_module
    url: github:compose-spec/compose-go.git
    module: github.com/compose-spec/compose-go/v2
    ref:
      go-version: v2.14.0
      explicit: True
  - kind: go_module
    url: github:containerd/errdefs.git
    module: github.com/containerd/errdefs
    ref:
      go-version: v1.0.0
      explicit: True
  - kind: go_module
    url: github:containerd/errdefs.git
    module: github.com/containerd/errdefs/pkg
    ref:
      go-version: v0.3.0
      explicit: True
  - kind: go_module
    url: github:containerd/typeurl.git
    module: github.com/containerd/typeurl/v2
    ref:
      go-version: v2.3.0
      explicit: True
  - kind: go_module
    url: github:cyphar/filepath-securejoin.git
    module: github.com/cyphar/filepath-securejoin
    ref:
      go-version: v0.7.0
      explicit: True
  - kind: go_module
    url: github:davecgh/go-spew.git
    module: github.com/davecgh/go-spew
    ref:
      go-version: v1.1.2-0.20180830191138-d8f796af33cc
      explicit: True
  - kind: go_module
    url: github:deitch/magic.git
    module: github.com/deitch/magic
    ref:
      go-version: v0.0.0-20240306090643-c67ab88f10cb
      explicit: True
  - kind: go_module
    url: github:diskfs/go-diskfs.git
    module: github.com/diskfs/go-diskfs
    ref:
      go-version: v1.7.0
      explicit: True
  - kind: go_module
    url: github:distribution/reference.git
    module: github.com/distribution/reference
    ref:
      go-version: v0.6.0
      explicit: True
  - kind: go_module
    url: github:djherbis/times.git
    module: github.com/djherbis/times
    ref:
      go-version: v1.6.0
      explicit: True
  - kind: go_module
    url: github:dlclark/regexp2.git
    module: github.com/dlclark/regexp2
    ref:
      go-version: v1.12.0
      explicit: True
  - kind: go_module
    url: github:docker/cli.git
    module: github.com/docker/cli
    ref:
      go-version: v29.7.1 incompatible
      explicit: True
  - kind: go_module
    url: github:docker/docker-credential-helpers.git
    module: github.com/docker/docker-credential-helpers
    ref:
      go-version: v0.9.8
      explicit: True
  - kind: go_module
    url: github:docker/go-connections.git
    module: github.com/docker/go-connections
    ref:
      go-version: v0.8.1
      explicit: True
  - kind: go_module
    url: github:docker/go-units.git
    module: github.com/docker/go-units
    ref:
      go-version: v0.5.0
      explicit: True
  - kind: go_module
    url: github:dsoprea/go-exfat.git
    module: github.com/dsoprea/go-exfat
    ref:
      go-version: v0.0.0-20190906070738-5e932fbdb589
      explicit: True
  - kind: go_module
    url: github:dsoprea/go-logging.git
    module: github.com/dsoprea/go-logging
    ref:
      go-version: v0.0.0-20200710184922-b02d349568dd
      explicit: True
  - kind: go_module
    url: github:dustin/go-humanize.git
    module: github.com/dustin/go-humanize
    ref:
      go-version: v1.0.1
      explicit: True
  - kind: go_module
    url: github:edsrzf/mmap-go.git
    module: github.com/edsrzf/mmap-go
    ref:
      go-version: v1.2.0
      explicit: True
  - kind: go_module
    url: github:elliotwutingfeng/asciiset.git
    module: github.com/elliotwutingfeng/asciiset
    ref:
      go-version: v0.0.0-20260801111138-45c5fff54b41
      explicit: True
  - kind: go_module
    url: github:emirpasic/gods.git
    module: github.com/emirpasic/gods
    ref:
      go-version: v1.18.1
      explicit: True
  - kind: go_module
    url: github:erikgeiser/coninput.git
    module: github.com/erikgeiser/coninput
    ref:
      go-version: v0.0.0-20211004153227-1c3628e74d0f
      explicit: True
  - kind: go_module
    url: github:erikvarga/go-rpmdb.git
    module: github.com/erikvarga/go-rpmdb
    ref:
      go-version: v0.0.0-20250523120114-a15a62cd4593
      explicit: True
  - kind: go_module
    url: github:felixge/httpsnoop.git
    module: github.com/felixge/httpsnoop
    ref:
      go-version: v1.1.0
      explicit: True
  - kind: go_module
    url: github:gkampitakis/ciinfo.git
    module: github.com/gkampitakis/ciinfo
    ref:
      go-version: v0.3.4
      explicit: True
  - kind: go_module
    url: github:go-errors/errors.git
    module: github.com/go-errors/errors
    ref:
      go-version: v1.5.1
      explicit: True
  - kind: go_module
    url: github:go-git/gcfg.git
    module: github.com/go-git/gcfg
    ref:
      go-version: v1.5.1-0.20230307220236-3a3c6141e376
      explicit: True
  - kind: go_module
    url: github:go-git/go-billy.git
    module: github.com/go-git/go-billy/v5
    ref:
      go-version: v5.9.1
      explicit: True
  - kind: go_module
    url: github:go-logr/logr.git
    module: github.com/go-logr/logr
    ref:
      go-version: v1.4.4
      explicit: True
  - kind: go_module
    url: github:go-logr/stdr.git
    module: github.com/go-logr/stdr
    ref:
      go-version: v1.2.2
      explicit: True
  - kind: go_module
    url: github:go-ole/go-ole.git
    module: github.com/go-ole/go-ole
    ref:
      go-version: v1.3.0
      explicit: True
  - kind: go_module
    url: github:go-restruct/restruct.git
    module: github.com/go-restruct/restruct
    ref:
      go-version: v1.2.0-alpha
      explicit: True
  - kind: go_module
    url: github:go-viper/mapstructure.git
    module: github.com/go-viper/mapstructure/v2
    ref:
      go-version: v2.5.0
      explicit: True
  - kind: go_module
    url: github:goccy/go-yaml.git
    module: github.com/goccy/go-yaml
    ref:
      go-version: v1.19.2
      explicit: True
  - kind: go_module
    url: github:golang/groupcache.git
    module: github.com/golang/groupcache
    ref:
      go-version: v0.0.0-20241129210726-2c02b8208cf8
      explicit: True
  - kind: go_module
    url: github:google/go-containerregistry.git
    module: github.com/google/go-containerregistry
    ref:
      go-version: v0.21.8
      explicit: True
  - kind: go_module
    url: github:google/jsonschema-go.git
    module: github.com/google/jsonschema-go
    ref:
      go-version: v0.4.3
      explicit: True
  - kind: go_module
    url: github:google/uuid.git
    module: github.com/google/uuid
    ref:
      go-version: v1.6.0
      explicit: True
  - kind: go_module
    url: github:gorilla/css.git
    module: github.com/gorilla/css
    ref:
      go-version: v1.0.1
      explicit: True
  - kind: go_module
    url: github:icholy/digest.git
    module: github.com/icholy/digest
    ref:
      go-version: v1.2.0
      explicit: True
  - kind: go_module
    url: github:jbenet/go-context.git
    module: github.com/jbenet/go-context
    ref:
      go-version: v0.0.0-20150711004518-d14ea06fba99
      explicit: True
  - kind: go_module
    url: github:kevinburke/ssh_config.git
    module: github.com/kevinburke/ssh_config
    ref:
      go-version: v1.6.0
      explicit: True
  - kind: go_module
    url: github:klauspost/compress.git
    module: github.com/klauspost/compress
    ref:
      go-version: v1.19.1
      explicit: True
  - kind: go_module
    url: github:klauspost/cpuid.git
    module: github.com/klauspost/cpuid/v2
    ref:
      go-version: v2.4.0
      explicit: True
  - kind: go_module
    url: github:kr/pretty.git
    module: github.com/kr/pretty
    ref:
      go-version: v0.3.1
      explicit: True
  - kind: go_module
    url: github:kr/text.git
    module: github.com/kr/text
    ref:
      go-version: v0.2.0
      explicit: True
  - kind: go_module
    url: github:lucasb-eyer/go-colorful.git
    module: github.com/lucasb-eyer/go-colorful
    ref:
      go-version: v1.4.1
      explicit: True
  - kind: go_module
    url: github:lunixbochs/struc.git
    module: github.com/lunixbochs/struc
    ref:
      go-version: v0.0.0-20241101090106-8d528fa2c543
      explicit: True
  - kind: go_module
    url: github:maruel/natural.git
    module: github.com/maruel/natural
    ref:
      go-version: v1.3.0
      explicit: True
  - kind: go_module
    url: github:masahiro331/go-ext4-filesystem.git
    module: github.com/masahiro331/go-ext4-filesystem
    ref:
      go-version: v0.0.0-20260423010602-fe51f5b5e52b
      explicit: True
  - kind: go_module
    url: github:mattn/go-isatty.git
    module: github.com/mattn/go-isatty
    ref:
      go-version: v0.0.24
      explicit: True
  - kind: go_module
    url: github:mattn/go-localereader.git
    module: github.com/mattn/go-localereader
    ref:
      go-version: v0.0.1
      explicit: True
  - kind: go_module
    url: github:mattn/go-runewidth.git
    module: github.com/mattn/go-runewidth
    ref:
      go-version: v0.0.27
      explicit: True
  - kind: go_module
    url: github:mattn/go-shellwords.git
    module: github.com/mattn/go-shellwords
    ref:
      go-version: v1.0.14
      explicit: True
  - kind: go_module
    url: github:michaelkedar/xml.git
    module: github.com/michaelkedar/xml
    ref:
      go-version: v0.0.0-20250626233154-4ec9e090d1cd
      explicit: True
  - kind: go_module
    url: github:microcosm-cc/bluemonday.git
    module: github.com/microcosm-cc/bluemonday
    ref:
      go-version: v1.0.27
      explicit: True
  - kind: go_module
    url: github:micromdm/plist.git
    module: github.com/micromdm/plist
    ref:
      go-version: v0.2.2
      explicit: True
  - kind: go_module
    url: github:moby/buildkit.git
    module: github.com/moby/buildkit
    ref:
      go-version: v0.32.2
      explicit: True
  - kind: go_module
    url: github:moby/docker-image-spec.git
    module: github.com/moby/docker-image-spec
    ref:
      go-version: v1.3.1
      explicit: True
  - kind: go_module
    url: github:moby/moby.git
    module: github.com/moby/moby/api
    ref:
      go-version: v1.55.0
      explicit: True
  - kind: go_module
    url: github:moby/moby.git
    module: github.com/moby/moby/client
    ref:
      go-version: v0.5.1
      explicit: True
  - kind: go_module
    url: github:muesli/ansi.git
    module: github.com/muesli/ansi
    ref:
      go-version: v0.0.0-20230316100256-276c6243b2f6
      explicit: True
  - kind: go_module
    url: github:muesli/cancelreader.git
    module: github.com/muesli/cancelreader
    ref:
      go-version: v0.2.2
      explicit: True
  - kind: go_module
    url: github:muesli/reflow.git
    module: github.com/muesli/reflow
    ref:
      go-version: v0.3.0
      explicit: True
  - kind: go_module
    url: github:muesli/termenv.git
    module: github.com/muesli/termenv
    ref:
      go-version: v0.16.0
      explicit: True
  - kind: go_module
    url: github:ncruces/go-strftime.git
    module: github.com/ncruces/go-strftime
    ref:
      go-version: v1.0.0
      explicit: True
  - kind: go_module
    url: github:opencontainers/image-spec.git
    module: github.com/opencontainers/image-spec
    ref:
      go-version: v1.1.1
      explicit: True
  - kind: go_module
    url: github:pierrec/lz4.git
    module: github.com/pierrec/lz4/v4
    ref:
      go-version: v4.1.27
      explicit: True
  - kind: go_module
    url: github:pjbgf/sha1cd.git
    module: github.com/pjbgf/sha1cd
    ref:
      go-version: v0.6.0
      explicit: True
  - kind: go_module
    url: github:pkg/errors.git
    module: github.com/pkg/errors
    ref:
      go-version: v0.9.1
      explicit: True
  - kind: go_module
    url: github:pkg/xattr.git
    module: github.com/pkg/xattr
    ref:
      go-version: v0.4.12
      explicit: True
  - kind: go_module
    url: github:planetscale/vtprotobuf.git
    module: github.com/planetscale/vtprotobuf
    ref:
      go-version: v0.6.1-0.20240319094008-0393e58bdf10
      explicit: True
  - kind: go_module
    url: github:remyoudompheng/bigfft.git
    module: github.com/remyoudompheng/bigfft
    ref:
      go-version: v0.0.0-20230129092748-24d4a6f8daec
      explicit: True
  - kind: go_module
    url: github:rivo/uniseg.git
    module: github.com/rivo/uniseg
    ref:
      go-version: v0.4.7
      explicit: True
  - kind: go_module
    url: github:rogpeppe/go-internal.git
    module: github.com/rogpeppe/go-internal
    ref:
      go-version: v1.15.0
      explicit: True
  - kind: go_module
    url: github:rust-secure-code/go-rustaudit.git
    module: github.com/rust-secure-code/go-rustaudit
    ref:
      go-version: v0.0.0-20250226111315-e20ec32e963c
      explicit: True
  - kind: go_module
    url: github:saferwall/pe.git
    module: github.com/saferwall/pe
    ref:
      go-version: v1.6.5
      explicit: True
  - kind: go_module
    url: github:sahilm/fuzzy.git
    module: github.com/sahilm/fuzzy
    ref:
      go-version: v0.1.3
      explicit: True
  - kind: go_module
    url: github:santhosh-tekuri/jsonschema.git
    module: github.com/santhosh-tekuri/jsonschema/v6
    ref:
      go-version: v6.0.2
      explicit: True
  - kind: go_module
    url: github:segmentio/asm.git
    module: github.com/segmentio/asm
    ref:
      go-version: v1.2.1
      explicit: True
  - kind: go_module
    url: github:segmentio/encoding.git
    module: github.com/segmentio/encoding
    ref:
      go-version: v0.5.4
      explicit: True
  - kind: go_module
    url: github:sergi/go-diff.git
    module: github.com/sergi/go-diff
    ref:
      go-version: v1.4.0
      explicit: True
  - kind: go_module
    url: github:shirou/gopsutil.git
    module: github.com/shirou/gopsutil
    ref:
      go-version: v3.21.11 incompatible
      explicit: True
  - kind: go_module
    url: github:sirupsen/logrus.git
    module: github.com/sirupsen/logrus
    ref:
      go-version: v1.9.4
      explicit: True
  - kind: go_module
    url: github:skeema/knownhosts.git
    module: github.com/skeema/knownhosts
    ref:
      go-version: v1.3.2
      explicit: True
  - kind: go_module
    url: github:spdx/gordf.git
    module: github.com/spdx/gordf
    ref:
      go-version: v0.0.0-20250128162952-000978ccd6fb
      explicit: True
  - kind: go_module
    url: github:spdx/tools-golang.git
    module: github.com/spdx/tools-golang
    ref:
      go-version: v0.5.7
      explicit: True
  - kind: go_module
    url: github:thoas/go-funk.git
    module: github.com/thoas/go-funk
    ref:
      go-version: v0.9.3
      explicit: True
  - kind: go_module
    url: github:tidwall/jsonc.git
    module: github.com/tidwall/jsonc
    ref:
      go-version: v0.3.3
      explicit: True
  - kind: go_module
    url: github:tidwall/match.git
    module: github.com/tidwall/match
    ref:
      go-version: v1.2.0
      explicit: True
  - kind: go_module
    url: github:tink-crypto/tink-go.git
    module: github.com/tink-crypto/tink-go/v2
    ref:
      go-version: v2.7.0
      explicit: True
  - kind: go_module
    url: github:tklauser/go-sysconf.git
    module: github.com/tklauser/go-sysconf
    ref:
      go-version: v0.4.0
      explicit: True
  - kind: go_module
    url: github:tklauser/numcpus.git
    module: github.com/tklauser/numcpus
    ref:
      go-version: v0.12.0
      explicit: True
  - kind: go_module
    url: github:tonistiigi/go-csvvalue.git
    module: github.com/tonistiigi/go-csvvalue
    ref:
      go-version: v0.0.0-20240814133006-030d3b2625d0
      explicit: True
  - kind: go_module
    url: github:ulikunitz/xz.git
    module: github.com/ulikunitz/xz
    ref:
      go-version: v0.5.16
      explicit: True
  - kind: go_module
    url: github:xanzy/ssh-agent.git
    module: github.com/xanzy/ssh-agent
    ref:
      go-version: v0.3.3
      explicit: True
  - kind: go_module
    url: github:xeipuuv/gojsonpointer.git
    module: github.com/xeipuuv/gojsonpointer
    ref:
      go-version: v0.0.0-20190905194746-02993c407bfb
      explicit: True
  - kind: go_module
    url: github:xeipuuv/gojsonreference.git
    module: github.com/xeipuuv/gojsonreference
    ref:
      go-version: v0.0.0-20180127040603-bd5ef7bd5415
      explicit: True
  - kind: go_module
    url: github:xeipuuv/gojsonschema.git
    module: github.com/xeipuuv/gojsonschema
    ref:
      go-version: v1.2.0
      explicit: True
  - kind: go_module
    url: github:xhit/go-str2duration.git
    module: github.com/xhit/go-str2duration/v2
    ref:
      go-version: v2.1.0
      explicit: True
  - kind: go_module
    url: github:xo/terminfo.git
    module: github.com/xo/terminfo
    ref:
      go-version: v0.0.0-20220910002029-abceb7e1c41e
      explicit: True
  - kind: go_module
    url: github:yosida95/uritemplate.git
    module: github.com/yosida95/uritemplate/v3
    ref:
      go-version: v3.0.2
      explicit: True
  - kind: go_module
    url: github:yuin/goldmark.git
    module: github.com/yuin/goldmark
    ref:
      go-version: v1.8.5
      explicit: True
  - kind: go_module
    url: github:yuin/goldmark-emoji.git
    module: github.com/yuin/goldmark-emoji
    ref:
      go-version: v1.0.6
      explicit: True
  - kind: go_module
    url: github:yusufpapurcu/wmi.git
    module: github.com/yusufpapurcu/wmi
    ref:
      go-version: v1.2.4
      explicit: True
  - kind: go_module
    url: https://go.etcd.io/bbolt.git
    module: go.etcd.io/bbolt
    ref:
      go-version: v1.5.0
      explicit: True
  - kind: go_module
    url: https://go.opentelemetry.io/auto/sdk.git
    module: go.opentelemetry.io/auto/sdk
    ref:
      go-version: v1.2.1
      explicit: True
  - kind: go_module
    url: https://go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp.git
    module: go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp
    ref:
      go-version: v0.70.0
      explicit: True
  - kind: go_module
    url: https://go.opentelemetry.io/otel.git
    module: go.opentelemetry.io/otel
    ref:
      go-version: v1.45.0
      explicit: True
  - kind: go_module
    url: https://go.opentelemetry.io/otel/metric.git
    module: go.opentelemetry.io/otel/metric
    ref:
      go-version: v1.45.0
      explicit: True
  - kind: go_module
    url: https://go.opentelemetry.io/otel/trace.git
    module: go.opentelemetry.io/otel/trace
    ref:
      go-version: v1.45.0
      explicit: True
  - kind: go_module
    url: https://go.uber.org/multierr.git
    module: go.uber.org/multierr
    ref:
      go-version: v1.11.0
      explicit: True
  - kind: go_module
    url: https://go.uber.org/zap.git
    module: go.uber.org/zap
    ref:
      go-version: v1.28.0
      explicit: True
  - kind: go_module
    url: https://go.yaml.in/yaml/v2.git
    module: go.yaml.in/yaml/v2
    ref:
      go-version: v2.4.4
      explicit: True
  - kind: go_module
    url: https://golang.org/x/crypto.git
    module: golang.org/x/crypto
    ref:
      go-version: v0.57.0
      explicit: True
  - kind: go_module
    url: https://golang.org/x/mod.git
    module: golang.org/x/mod
    ref:
      go-version: v0.41.0
      explicit: True
  - kind: go_module
    url: https://golang.org/x/net.git
    module: golang.org/x/net
    ref:
      go-version: v0.58.0
      explicit: True
  - kind: go_module
    url: https://golang.org/x/oauth2.git
    module: golang.org/x/oauth2
    ref:
      go-version: v0.36.0
      explicit: True
  - kind: go_module
    url: https://golang.org/x/sync.git
    module: golang.org/x/sync
    ref:
      go-version: v0.23.0
      explicit: True
  - kind: go_module
    url: https://golang.org/x/sys.git
    module: golang.org/x/sys
    ref:
      go-version: v0.48.0
      explicit: True
  - kind: go_module
    url: https://golang.org/x/telemetry.git
    module: golang.org/x/telemetry
    ref:
      go-version: v0.0.0-20260811182544-a038080d80e5
      explicit: True
  - kind: go_module
    url: https://golang.org/x/text.git
    module: golang.org/x/text
    ref:
      go-version: v0.42.0
      explicit: True
  - kind: go_module
    url: https://golang.org/x/time.git
    module: golang.org/x/time
    ref:
      go-version: v0.15.0
      explicit: True
  - kind: go_module
    url: https://golang.org/x/tools.git
    module: golang.org/x/tools
    ref:
      go-version: v0.49.0
      explicit: True
  - kind: go_module
    url: https://golang.org/x/xerrors.git
    module: golang.org/x/xerrors
    ref:
      go-version: v0.0.0-20240903120638-7835f813f4da
      explicit: True
  - kind: go_module
    url: https://google.golang.org/genproto/googleapis/api.git
    module: google.golang.org/genproto/googleapis/api
    ref:
      go-version: v0.0.0-20260803160001-6ac0973c030d
      explicit: True
  - kind: go_module
    url: https://google.golang.org/genproto/googleapis/rpc.git
    module: google.golang.org/genproto/googleapis/rpc
    ref:
      go-version: v0.0.0-20260803160001-6ac0973c030d
      explicit: True
  - kind: go_module
    url: https://gopkg.in/ini.v1.git
    module: gopkg.in/ini.v1
    ref:
      go-version: v1.67.3
      explicit: True
  - kind: go_module
    url: https://gopkg.in/warnings.v0.git
    module: gopkg.in/warnings.v0
    ref:
      go-version: v0.1.2
      explicit: True
  - kind: go_module
    url: https://gopkg.in/yaml.v3.git
    module: gopkg.in/yaml.v3
    ref:
      go-version: v3.0.1
      explicit: True
  - kind: go_module
    url: https://modernc.org/libc.git
    module: modernc.org/libc
    ref:
      go-version: v1.74.4
      explicit: True
  - kind: go_module
    url: https://modernc.org/mathutil.git
    module: modernc.org/mathutil
    ref:
      go-version: v1.7.1
      explicit: True
  - kind: go_module
    url: https://modernc.org/memory.git
    module: modernc.org/memory
    ref:
      go-version: v1.11.0
      explicit: True
  - kind: go_module
    url: https://modernc.org/sqlite.git
    module: modernc.org/sqlite
    ref:
      go-version: v1.56.0
      explicit: True
  - kind: go_module
    url: https://osv.dev/bindings/go.git
    module: osv.dev/bindings/go
    ref:
      go-version: v0.0.0-20260805021707-3a57b89df3b6
      explicit: True
  - kind: go_module
    url: https://sigs.k8s.io/yaml.git
    module: sigs.k8s.io/yaml
    ref:
      go-version: v1.6.0
      explicit: True
  - kind: go_module
    url: https://www.velocidex.com/golang/go-ntfs.git
    module: www.velocidex.com/golang/go-ntfs
    ref:
      go-version: v0.2.1
      explicit: True
  - kind: go_module
    url: https://www.velocidex.com/golang/regparser.git
    module: www.velocidex.com/golang/regparser
    ref:
      go-version: v0.0.0-20250203141505-31e704a67ef7
      explicit: True
