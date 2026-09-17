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
    # - kind: local
    #   path: files/osv-scanner/modules.txt
    # - kind: go_module
    #   url: github:charmbracelet/glamour.git
    #   module: charm.land/glamour/v2
    #   ref:
    #     go-version: v2.0.1
    #     git-ref: v2.0.1-0-g95c93db04489cebf252ec856584445c7e85ee276
    #     explicit: True
    # - kind: go_module
    #   url: github:charmbracelet/lipgloss.git
    #   module: charm.land/lipgloss/v2
    #   ref:
    #     go-version: v2.0.6
    #     git-ref: v2.0.6-0-g733ce53541bb688fd735524b665e0d96e35433bb
    #     explicit: True
    # - kind: go_module
    #   url: github:BurntSushi/toml.git
    #   module: github.com/BurntSushi/toml
    #   ref:
    #     go-version: v1.6.0
    #     git-ref: v1.6.0-0-g52534926c55b4cd85b05aee90569dd0668b8cf30
    #     explicit: True
    # - kind: go_module
    #   url: github:CycloneDX/cyclonedx-go.git
    #   module: github.com/CycloneDX/cyclonedx-go
    #   ref:
    #     go-version: v0.12.0
    #     git-ref: v0.12.0-0-g717afd1da9a45403bfd0c44071b63fa95354498e
    #     explicit: True
    # - kind: go_module
    #   url: github:gkampitakis/go-snaps.git
    #   module: github.com/gkampitakis/go-snaps
    #   ref:
    #     go-version: v0.5.23
    #     git-ref: v0.5.23-0-g07ef1d2d05c76635a8d438405e1d0cced581ebe3
    #     explicit: True
    # - kind: go_module
    #   url: github:go-git/go-git.git
    #   module: github.com/go-git/go-git/v5
    #   ref:
    #     go-version: v5.19.2
    #     git-ref: v5.19.2-0-g3eeb238da61eb9c7a324f3ee04f990ce89175642
    #     explicit: True
    # - kind: go_module
    #   url: github:gobwas/glob.git
    #   module: github.com/gobwas/glob
    #   ref:
    #     go-version: v0.2.3
    #     git-ref: v0.2.3-0-g5ccd90ef52e1e632236f7326478d4faa74f99438
    #     explicit: True
    # - kind: go_module
    #   url: github:google/go-cmp.git
    #   module: github.com/google/go-cmp
    #   ref:
    #     go-version: v0.7.0
    #     git-ref: v0.7.0-0-g9b12f366a942ebc7254abc7f32ca05068b455fb7
    #     explicit: True
    # - kind: go_module
    #   url: github:google/osv-scalibr.git
    #   module: github.com/google/osv-scalibr
    #   ref:
    #     go-version: v0.5.3-0.20260911142458-3090dbb7aaa2
    #     git-ref: 3090dbb7aaa24ce7a807899e7f16baa8b802a828
    #     explicit: True
    # - kind: go_module
    #   url: github:ianlancetaylor/demangle.git
    #   module: github.com/ianlancetaylor/demangle
    #   ref:
    #     go-version: v0.0.0-20260724033716-83e58baca724
    #     git-ref: 83e58baca7248962d58657affe41b3b6f27ee423
    #     explicit: True
    # - kind: go_module
    #   url: github:jedib0t/go-pretty.git
    #   module: github.com/jedib0t/go-pretty/v6
    #   ref:
    #     go-version: v6.8.3
    #     git-ref: v6.8.3-0-gdb0aac244a22cdef5f46bae37c07b4b3c96aeb58
    #     explicit: True
    # - kind: go_module
    #   url: github:modelcontextprotocol/go-sdk.git
    #   module: github.com/modelcontextprotocol/go-sdk
    #   ref:
    #     go-version: v1.7.0
    #     git-ref: v1.7.0-0-gbc72835f62eb94d0fb484439f886b6885b075f36
    #     explicit: True
    # - kind: go_module
    #   url: github:opencontainers/go-digest.git
    #   module: github.com/opencontainers/go-digest
    #   ref:
    #     go-version: v1.0.0
    #     git-ref: v1.0.0-0-gea51bea511f75cfa3ef6098cc253c5c3609b037a
    #     explicit: True
    # - kind: go_module
    #   url: github:ossf/osv-schema.git
    #   module: github.com/ossf/osv-schema/bindings/go
    #   ref:
    #     go-version: v0.0.0-20260902031056-b388a18021a3
    #     git-ref: b388a18021a32b55da40c31eaef9fd4ce780447d
    #     explicit: True
    #     subdirectory: bindings/go
    # - kind: go_module
    #   url: github:owenrumney/go-sarif.git
    #   module: github.com/owenrumney/go-sarif/v3
    #   ref:
    #     go-version: v3.3.1
    #     git-ref: v3.3.1-0-g3e37b83c3d7e6ddb2925735775e2d010a6b45d94
    #     explicit: True
    # - kind: go_module
    #   url: github:package-url/packageurl-go.git
    #   module: github.com/package-url/packageurl-go
    #   ref:
    #     go-version: v0.1.7
    #     git-ref: v0.1.7-0-gc88ed7b2a2305ec91a087dd6cb7168ca1f42cfe3
    #     explicit: True
    # - kind: go_module
    #   url: github:pandatix/go-cvss.git
    #   module: github.com/pandatix/go-cvss
    #   ref:
    #     go-version: v0.6.4
    #     git-ref: v0.6.4-0-g8df5dbd1cdb98348548087af3157a7f96d7521ba
    #     explicit: True
    # - kind: go_module
    #   url: github:tidwall/gjson.git
    #   module: github.com/tidwall/gjson
    #   ref:
    #     go-version: v1.19.0
    #     git-ref: v1.19.0-0-g0fac2c9aa6eb5d5564bfaaaad513ce0d5d2314de
    #     explicit: True
    # - kind: go_module
    #   url: github:tidwall/pretty.git
    #   module: github.com/tidwall/pretty
    #   ref:
    #     go-version: v1.2.1
    #     git-ref: v1.2.1-0-g9090695766b652478676cc3e55bc3187056b1ff0
    #     explicit: True
    # - kind: go_module
    #   url: github:tidwall/sjson.git
    #   module: github.com/tidwall/sjson
    #   ref:
    #     go-version: v1.2.5
    #     git-ref: v1.2.5-0-gb279807a1bad9fa155988667d97a3d2fff4061b5
    #     explicit: True
    # - kind: go_module
    #   url: github:urfave/cli.git
    #   module: github.com/urfave/cli/v3
    #   ref:
    #     go-version: v3.11.0
    #     git-ref: v3.11.0-0-g138d3b34001ba0ddd59f6f29474788ba3d2f8ea7
    #     explicit: True
    # - kind: go_module
    #   url: github:yaml/go-yaml.git
    #   module: go.yaml.in/yaml/v4
    #   ref:
    #     go-version: v4.0.0-rc.6
    #     git-ref: v4.0.0-rc.6-0-g1c17b9cee72bf81ae73a8be50fbd7dd3a9985125
    #     explicit: True
    # - kind: go_module
    #   url: github:golang/term.git
    #   module: golang.org/x/term
    #   ref:
    #     go-version: v0.46.0
    #     git-ref: v0.46.0-0-g6226200ed12cba417a9d9e799c2a7179d3fc0e27
    #     explicit: True
    # - kind: go_module
    #   url: github:golang/vuln.git
    #   module: golang.org/x/vuln
    #   ref:
    #     go-version: v1.6.0
    #     git-ref: v1.6.0-0-g19b0bb6a272792b9afa8a6983c3e9b9a1816947f
    #     explicit: True
    # - kind: go_module
    #   url: github:grpc/grpc-go.git
    #   module: google.golang.org/grpc
    #   ref:
    #     go-version: v1.83.2
    #     git-ref: v1.83.2-0-g030ee8becb20ce4315d6bf2dfa26bdd876169dc4
    #     explicit: True
    # - kind: go_module
    #   url: github:protocolbuffers/protobuf-go.git
    #   module: google.golang.org/protobuf
    #   ref:
    #     go-version: v1.36.12
    #     git-ref: v1.36.12-0-gcdd4c5f7406e82462949c7a65defa9f3029c162d
    #     explicit: True
    # - kind: go_module
    #   url: github:dnaeon/go-vcr.git
    #   module: gopkg.in/dnaeon/go-vcr.v4
    #   ref:
    #     go-version: v4.0.7
    #     git-ref: v4.0.7-0-g2a9545bad4a9716c8263c81acf06d575c03a7c64
    #     explicit: True
    # - kind: go_module
    #   url: git_https:bitbucket.org/creachadair/stringset.git
    #   module: bitbucket.org/creachadair/stringset
    #   ref:
    #     go-version: v0.0.14
    #     git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
    #     explicit: True
    # - kind: go_module
    #   url: git_https:cloud.google.com/go/compute/metadata.git
    #   module: cloud.google.com/go/compute/metadata
    #   ref:
    #     go-version: v1.9.0
    #     git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
    #     explicit: True
    # - kind: go_module
    #   url: github:darccio/mergo.git
    #   module: dario.cat/mergo
    #   ref:
    #     go-version: v1.0.2
    #     git-ref: v1.0.2-0-g7b33b2b01026fbbbbfcfbb1ee2c9c0a5e0c9a9f7
    #     explicit: True
    # - kind: go_module
    #   url: github:google/deps.dev.git
    #   module: deps.dev/api/v3
    #   ref:
    #     go-version: v3.0.0-20260811035547-133c155ce203
    #     git-ref: 133c155ce20323c3427a4b0b352062fbaa650e68
    #     explicit: True
    #     subdirectory: api/v3
    # - kind: go_module
    #   url: github:google/deps.dev.git
    #   module: deps.dev/api/v3alpha
    #   ref:
    #     go-version: v0.0.0-20260811035547-133c155ce203
    #     git-ref: 133c155ce20323c3427a4b0b352062fbaa650e68
    #     explicit: True
    #     subdirectory: api/v3alpha
    # - kind: go_module
    #   url: github:google/deps.dev.git
    #   module: deps.dev/util/maven
    #   ref:
    #     go-version: v0.0.0-20260727054525-2946ae4a6141
    #     git-ref: 2946ae4a6141766a141e59a55c7fcd98a4fe3a7e
    #     explicit: True
    #     subdirectory: util/maven
    # - kind: go_module
    #   url: github:google/deps.dev.git
    #   module: deps.dev/util/pypi
    #   ref:
    #     go-version: v0.0.0-20260727054525-2946ae4a6141
    #     git-ref: 2946ae4a6141766a141e59a55c7fcd98a4fe3a7e
    #     explicit: True
    #     subdirectory: util/pypi
    # - kind: go_module
    #   url: github:google/deps.dev.git
    #   module: deps.dev/util/resolve
    #   ref:
    #     go-version: v0.0.0-20260727054525-2946ae4a6141
    #     git-ref: 2946ae4a6141766a141e59a55c7fcd98a4fe3a7e
    #     explicit: True
    #     subdirectory: util/resolve
    # - kind: go_module
    #   url: github:google/deps.dev.git
    #   module: deps.dev/util/semver
    #   ref:
    #     go-version: v0.0.0-20260727054525-2946ae4a6141
    #     git-ref: 2946ae4a6141766a141e59a55c7fcd98a4fe3a7e
    #     explicit: True
    #     subdirectory: util/semver
    # - kind: go_module
    #   url: github:GehirnInc/crypt.git
    #   module: github.com/GehirnInc/crypt
    #   ref:
    #     go-version: v0.0.0-20230320061759-8cc1b52080c5
    #     git-ref: 8cc1b52080c5761aa65952b1c39dd889bf54d76c
    #     explicit: True
    # - kind: go_module
    #   url: github:Microsoft/go-winio.git
    #   module: github.com/Microsoft/go-winio
    #   ref:
    #     go-version: v0.6.3-0.20251027160822-ad3df93bed29
    #     git-ref: ad3df93bed29459e88baf3ece3e167e2f5d922dd
    #     explicit: True
    # - kind: go_module
    #   url: github:ProtonMail/go-crypto.git
    #   module: github.com/ProtonMail/go-crypto
    #   ref:
    #     go-version: v1.4.1
    #     git-ref: v1.4.1-0-g2e73b118bb72881b92b292f85cb2d057c3d7bef0
    #     explicit: True
    # - kind: go_module
    #   url: github:Velocidex/json.git
    #   module: github.com/Velocidex/json
    #   ref:
    #     go-version: v0.0.0-20220224052537-92f3c0326e5a
    #     git-ref: 92f3c0326e5a9deaf56af2803fd397606750fb22
    #     explicit: True
    # - kind: go_module
    #   url: github:Velocidex/ordereddict.git
    #   module: github.com/Velocidex/ordereddict
    #   ref:
    #     go-version: v0.0.0-20250821063524-02dc06e46238
    #     git-ref: 02dc06e4623848310b0e79e763086ca91b05e585
    #     explicit: True
    # - kind: go_module
    #   url: github:Velocidex/yaml.git
    #   module: github.com/Velocidex/yaml/v2
    #   ref:
    #     go-version: v2.2.8
    #     git-ref: v2.2.8-0-g62a2af8ba39ed8c3a8444cba8c68aeb99617536a
    #     explicit: True
    # - kind: go_module
    #   url: github:aead/serpent.git
    #   module: github.com/aead/serpent
    #   ref:
    #     go-version: v0.0.0-20160714141033-fba169763ea6
    #     git-ref: fba169763ea663f7496376e5cdf709e4c7504704
    #     explicit: True
    # - kind: go_module
    #   url: github:agext/levenshtein.git
    #   module: github.com/agext/levenshtein
    #   ref:
    #     go-version: v1.2.3
    #     git-ref: v1.2.3-0-g52c14c47d03211d8ac1834e94601635e07c5a6ef
    #     explicit: True
    # - kind: go_module
    #   url: github:alecthomas/chroma.git
    #   module: github.com/alecthomas/chroma/v2
    #   ref:
    #     go-version: v2.19.0
    #     git-ref: v2.19.0-0-gadeac8f5dbfb6806a51bcf07eefd89fc8a0aee6a
    #     explicit: True
    # - kind: go_module
    #   url: github:anchore/go-lzo.git
    #   module: github.com/anchore/go-lzo
    #   ref:
    #     go-version: v0.1.0
    #     git-ref: v0.1.0-0-gb2bd54a397a4bd83b816e1b33776543e118d9c36
    #     explicit: True
    # - kind: go_module
    #   url: github:anchore/go-struct-converter.git
    #   module: github.com/anchore/go-struct-converter
    #   ref:
    #     go-version: v0.1.0
    #     git-ref: v0.1.0-0-gc68fdcfa20922cc80b266f13a7986e632bafacca
    #     explicit: True
    # - kind: go_module
    #   url: github:atotto/clipboard.git
    #   module: github.com/atotto/clipboard
    #   ref:
    #     go-version: v0.1.4
    #     git-ref: v0.1.4-0-ge4aee1922c628e6966acd4207c408df132dc6fb5
    #     explicit: True
    # - kind: go_module
    #   url: github:aymanbagabas/go-osc52.git
    #   module: github.com/aymanbagabas/go-osc52/v2
    #   ref:
    #     go-version: v2.0.1
    #     git-ref: v2.0.1-0-gce73587a0f72cf077e55f163e71ea1b5496a133c
    #     explicit: True
    # - kind: go_module
    #   url: github:aymerick/douceur.git
    #   module: github.com/aymerick/douceur
    #   ref:
    #     go-version: v0.2.0
    #     git-ref: v0.2.0-0-gc5c95ec357c8235fbd7f34e8c843d36783f3fad9
    #     explicit: True
    # - kind: go_module
    #   url: github:ayoubfaouzi/pkcs7.git
    #   module: github.com/ayoubfaouzi/pkcs7
    #   ref:
    #     go-version: v0.2.3
    #     git-ref: v0.2.3-0-gbde914cf36dee1f89e40d096e64f50037b9c2470
    #     explicit: True
    # - kind: go_module
    #   url: github:bazelbuild/buildtools.git
    #   module: github.com/bazelbuild/buildtools
    #   ref:
    #     go-version: v0.0.0-20260716142318-04cf7de1434f
    #     git-ref: 04cf7de1434f42a6202eaabfa1416602c920c62c
    #     explicit: True
    # - kind: go_module
    #   url: github:canonical/chisel-manifest.git
    #   module: github.com/canonical/chisel-manifest
    #   ref:
    #     go-version: v1.2.0
    #     git-ref: v1.2.0-0-g09e265b61dd4ffa977574ea11d6059d118c3a49a
    #     explicit: True
    # - kind: go_module
    #   url: github:cespare/xxhash.git
    #   module: github.com/cespare/xxhash/v2
    #   ref:
    #     go-version: v2.3.0
    #     git-ref: v2.3.0-0-g998dce232f17418a7a5721ecf87ca714025a3243
    #     explicit: True
    # - kind: go_module
    #   url: github:charmbracelet/bubbles.git
    #   module: github.com/charmbracelet/bubbles
    #   ref:
    #     go-version: v1.0.0
    #     git-ref: v1.0.0-0-g4824effc3f91c9517c776d8200ef99a1207136e0
    #     explicit: True
    # - kind: go_module
    #   url: github:charmbracelet/bubbletea.git
    #   module: github.com/charmbracelet/bubbletea
    #   ref:
    #     go-version: v1.3.10
    #     git-ref: v1.3.10-0-g9edf69c677c7353eca5fae6d3ea3986af39717b7
    #     explicit: True
    # - kind: go_module
    #   url: github:charmbracelet/colorprofile.git
    #   module: github.com/charmbracelet/colorprofile
    #   ref:
    #     go-version: v0.4.3
    #     git-ref: v0.4.3-0-gd085584efb48f2ad470e96cd0f3dcb8cc68a034b
    #     explicit: True
    # - kind: go_module
    #   url: github:charmbracelet/lipgloss.git
    #   module: github.com/charmbracelet/lipgloss
    #   ref:
    #     go-version: v1.1.1-0.20250404203927-76690c660834
    #     git-ref: 76690c6608346fc7ef09db388ee82feaa7920630
    #     explicit: True
    # - kind: go_module
    #   url: github:charmbracelet/ultraviolet.git
    #   module: github.com/charmbracelet/ultraviolet
    #   ref:
    #     go-version: v0.0.0-20260811164956-006e29f97886
    #     git-ref: 006e29f97886822b5d62d373b29f3143a7220ac3
    #     explicit: True
    # - kind: go_module
    #   url: github:charmbracelet/x.git
    #   module: github.com/charmbracelet/x/ansi
    #   ref:
    #     go-version: v0.11.8
    #     git-ref: ansi/v0.11.8-0-g00c6608f106b9c6cd8a1a77156f7901f41265e64
    #     explicit: True
    #     subdirectory: ansi
    # - kind: go_module
    #   url: github:charmbracelet/x.git
    #   module: github.com/charmbracelet/x/cellbuf
    #   ref:
    #     go-version: v0.0.15
    #     git-ref: cellbuf/v0.0.15-0-ga1c614051099a0a065aaf1c8fa98f6110e492cbe
    #     explicit: True
    #     subdirectory: cellbuf
    # - kind: go_module
    #   url: github:charmbracelet/x.git
    #   module: github.com/charmbracelet/x/exp/slice
    #   ref:
    #     go-version: v0.0.0-20260803091719-3755ebad01b1
    #     git-ref: 3755ebad01b1366a9eeb5e4e80d664b404ab6eff
    #     explicit: True
    #     subdirectory: exp/slice
    # - kind: go_module
    #   url: github:charmbracelet/x.git
    #   module: github.com/charmbracelet/x/term
    #   ref:
    #     go-version: v0.2.2
    #     git-ref: term/v0.2.2-0-g4542a189d0fbeb156bb1df8730d253f2ef443c00
    #     explicit: True
    #     subdirectory: term
    # - kind: go_module
    #   url: github:charmbracelet/x.git
    #   module: github.com/charmbracelet/x/termios
    #   ref:
    #     go-version: v0.1.1
    #     git-ref: termios/v0.1.1-0-g70b8bc4d46effa6f6c6ff1430c0e010f195e394d
    #     explicit: True
    #     subdirectory: termios
    # - kind: go_module
    #   url: github:charmbracelet/x.git
    #   module: github.com/charmbracelet/x/windows
    #   ref:
    #     go-version: v0.2.2
    #     git-ref: windows/v0.2.2-0-g83e3a29d542fe292a3bd0a965079ea16a432bcda
    #     explicit: True
    #     subdirectory: windows
    # - kind: go_module
    #   url: github:clipperhouse/displaywidth.git
    #   module: github.com/clipperhouse/displaywidth
    #   ref:
    #     go-version: v0.11.0
    #     git-ref: v0.11.0-0-gb6da6e784d7796398607efa9883b4d9f6e7be509
    #     explicit: True
    # - kind: go_module
    #   url: github:clipperhouse/uax29.git
    #   module: github.com/clipperhouse/uax29/v2
    #   ref:
    #     go-version: v2.7.0
    #     git-ref: v2.7.0-0-gb03477d1fbba89df95a6b55da0a222b2e2228610
    #     explicit: True
    # - kind: go_module
    #   url: github:cloudflare/circl.git
    #   module: github.com/cloudflare/circl
    #   ref:
    #     go-version: v1.6.4
    #     git-ref: v1.6.4-0-g901199c7d4fcefc8c43e8ad46397439ccd3a0ed0
    #     explicit: True
    # - kind: go_module
    #   url: github:compose-spec/compose-go.git
    #   module: github.com/compose-spec/compose-go/v2
    #   ref:
    #     go-version: v2.14.0
    #     git-ref: v2.14.0-0-gd70c053ec9cbd7180c7881ba769d277f5cfc6fb5
    #     explicit: True
    # - kind: go_module
    #   url: github:containerd/errdefs.git
    #   module: github.com/containerd/errdefs
    #   ref:
    #     go-version: v1.0.0
    #     git-ref: v1.0.0-0-g4817405e4a3caeb7aee9dac68ed55339c59cb635
    #     explicit: True
    # - kind: go_module
    #   url: github:containerd/errdefs.git
    #   module: github.com/containerd/errdefs/pkg
    #   ref:
    #     go-version: v0.3.0
    #     git-ref: pkg/v0.3.0-0-g4817405e4a3caeb7aee9dac68ed55339c59cb635
    #     explicit: True
    #     subdirectory: pkg
    # - kind: go_module
    #   url: github:containerd/typeurl.git
    #   module: github.com/containerd/typeurl/v2
    #   ref:
    #     go-version: v2.3.0
    #     git-ref: v2.3.0-0-g125f7790c42c52610c44712bdc3a1748f785ae8d
    #     explicit: True
    # - kind: go_module
    #   url: github:cyphar/filepath-securejoin.git
    #   module: github.com/cyphar/filepath-securejoin
    #   ref:
    #     go-version: v0.7.0
    #     git-ref: v0.7.0-0-g8096a959c5d7a248976a3531a030f5c4da0a44d0
    #     explicit: True
    # - kind: go_module
    #   url: github:davecgh/go-spew.git
    #   module: github.com/davecgh/go-spew
    #   ref:
    #     go-version: v1.1.2-0.20180830191138-d8f796af33cc
    #     git-ref: d8f796af33cc11cb798c1aaeb27a4ebc5099927d
    #     explicit: True
    # - kind: go_module
    #   url: github:deitch/magic.git
    #   module: github.com/deitch/magic
    #   ref:
    #     go-version: v0.0.0-20240306090643-c67ab88f10cb
    #     git-ref: c67ab88f10cb7323bd698f7fe7fb0c41f3af4da5
    #     explicit: True
    # - kind: go_module
    #   url: github:diskfs/go-diskfs.git
    #   module: github.com/diskfs/go-diskfs
    #   ref:
    #     go-version: v1.7.0
    #     git-ref: v1.7.0-0-g63be039c8b725fad4d0666ae0d381ff3907b47bd
    #     explicit: True
    # - kind: go_module
    #   url: github:distribution/reference.git
    #   module: github.com/distribution/reference
    #   ref:
    #     go-version: v0.6.0
    #     git-ref: v0.6.0-0-gff14fafe2236e51c2894ac07d4bdfc778e96d682
    #     explicit: True
    # - kind: go_module
    #   url: github:djherbis/times.git
    #   module: github.com/djherbis/times
    #   ref:
    #     go-version: v1.6.0
    #     git-ref: v1.6.0-0-gd1af0aa12128959e70b9e802c912f302c743c35b
    #     explicit: True
    # - kind: go_module
    #   url: github:dlclark/regexp2.git
    #   module: github.com/dlclark/regexp2
    #   ref:
    #     go-version: v1.12.0
    #     git-ref: v1.12.0-0-g3d5df45b703801b3fe51eb3f5c0dd302e8b0d676
    #     explicit: True
    # - kind: go_module
    #   url: github:docker/cli.git
    #   module: github.com/docker/cli
    #   ref:
    #     go-version: v29.7.1+incompatible
    #     git-ref: v29.7.1-0-ge9452d6e785f6e365712b9d71bd7517591773c86
    #     explicit: True
    # - kind: go_module
    #   url: github:docker/docker-credential-helpers.git
    #   module: github.com/docker/docker-credential-helpers
    #   ref:
    #     go-version: v0.9.8
    #     git-ref: v0.9.8-0-g4f6bc8ab27f64fbc65f810814448c756e958ab65
    #     explicit: True
    # - kind: go_module
    #   url: github:docker/go-connections.git
    #   module: github.com/docker/go-connections
    #   ref:
    #     go-version: v0.8.1
    #     git-ref: v0.8.1-0-g9c9e2db764937383effc099843914897c8838056
    #     explicit: True
    # - kind: go_module
    #   url: github:docker/go-units.git
    #   module: github.com/docker/go-units
    #   ref:
    #     go-version: v0.5.0
    #     git-ref: v0.5.0-0-ge682442797b36348f8e1f98defdbf32bac0b6c6f
    #     explicit: True
    # - kind: go_module
    #   url: github:dsoprea/go-exfat.git
    #   module: github.com/dsoprea/go-exfat
    #   ref:
    #     go-version: v0.0.0-20190906070738-5e932fbdb589
    #     git-ref: 5e932fbdb58948a1ef31ad85afe1f5ac82c50688
    #     explicit: True
    # - kind: go_module
    #   url: github:dsoprea/go-logging.git
    #   module: github.com/dsoprea/go-logging
    #   ref:
    #     go-version: v0.0.0-20200710184922-b02d349568dd
    #     git-ref: b02d349568dd9287e2bc3588023328bda4495632
    #     explicit: True
    # - kind: go_module
    #   url: github:dustin/go-humanize.git
    #   module: github.com/dustin/go-humanize
    #   ref:
    #     go-version: v1.0.1
    #     git-ref: v1.0.1-0-g9ec74ab2f7a7161664182fd4e5e292fccffbc75f
    #     explicit: True
    # - kind: go_module
    #   url: github:edsrzf/mmap-go.git
    #   module: github.com/edsrzf/mmap-go
    #   ref:
    #     go-version: v1.2.0
    #     git-ref: v1.2.0-0-g66e7e07bdde5690508bacd6e131a6abef17464ab
    #     explicit: True
    # - kind: go_module
    #   url: github:elliotwutingfeng/asciiset.git
    #   module: github.com/elliotwutingfeng/asciiset
    #   ref:
    #     go-version: v0.0.0-20260801111138-45c5fff54b41
    #     git-ref: 45c5fff54b41aa567021e148f9d53e4dbfc160ea
    #     explicit: True
    # - kind: go_module
    #   url: github:emirpasic/gods.git
    #   module: github.com/emirpasic/gods
    #   ref:
    #     go-version: v1.18.1
    #     git-ref: v1.18.1-0-gdbdbadc158ae6b453820b3cfb8c6cb48be4d7ddf
    #     explicit: True
    # - kind: go_module
    #   url: github:erikgeiser/coninput.git
    #   module: github.com/erikgeiser/coninput
    #   ref:
    #     go-version: v0.0.0-20211004153227-1c3628e74d0f
    #     git-ref: 1c3628e74d0f39ad7e963960ab9799c7f6ca3761
    #     explicit: True
    # - kind: go_module
    #   url: github:erikvarga/go-rpmdb.git
    #   module: github.com/erikvarga/go-rpmdb
    #   ref:
    #     go-version: v0.0.0-20250523120114-a15a62cd4593
    #     git-ref: a15a62cd4593ab60dc839cc6dff7e37bb640d2e2
    #     explicit: True
    # - kind: go_module
    #   url: github:felixge/httpsnoop.git
    #   module: github.com/felixge/httpsnoop
    #   ref:
    #     go-version: v1.1.0
    #     git-ref: v1.1.0-0-g0fc9006be0bfd68ee14bc3db0d58f7c7241892e0
    #     explicit: True
    # - kind: go_module
    #   url: github:gkampitakis/ciinfo.git
    #   module: github.com/gkampitakis/ciinfo
    #   ref:
    #     go-version: v0.3.4
    #     git-ref: v0.3.4-0-gc20c774d1e738a7b98c7e9d58b2477987f1f52d7
    #     explicit: True
    # - kind: go_module
    #   url: github:go-errors/errors.git
    #   module: github.com/go-errors/errors
    #   ref:
    #     go-version: v1.5.1
    #     git-ref: v1.5.1-0-g1b7bbfb2f065f79536b843f8e2047e36aadd7846
    #     explicit: True
    # - kind: go_module
    #   url: github:go-git/gcfg.git
    #   module: github.com/go-git/gcfg
    #   ref:
    #     go-version: v1.5.1-0.20230307220236-3a3c6141e376
    #     git-ref: 3a3c6141e376c06bf6ca92f0450e974250b4367a
    #     explicit: True
    # - kind: go_module
    #   url: github:go-git/go-billy.git
    #   module: github.com/go-git/go-billy/v5
    #   ref:
    #     go-version: v5.9.1
    #     git-ref: v5.9.1-0-g19ea4dd91ebc56e1b6cdea6890a180a789bea20d
    #     explicit: True
    # - kind: go_module
    #   url: github:go-logr/logr.git
    #   module: github.com/go-logr/logr
    #   ref:
    #     go-version: v1.4.4
    #     git-ref: v1.4.4-0-g96a9abaa56526dd5d51745e817732a2d61505fb7
    #     explicit: True
    # - kind: go_module
    #   url: github:go-logr/stdr.git
    #   module: github.com/go-logr/stdr
    #   ref:
    #     go-version: v1.2.2
    #     git-ref: v1.2.2-0-g521af2addfa7c81c8a65d0e85ed34bb6bb6dc262
    #     explicit: True
    # - kind: go_module
    #   url: github:go-ole/go-ole.git
    #   module: github.com/go-ole/go-ole
    #   ref:
    #     go-version: v1.3.0
    #     git-ref: v1.3.0-0-gde26f2b218c772f7a1000022d58d2df1d2428a2d
    #     explicit: True
    # - kind: go_module
    #   url: github:go-restruct/restruct.git
    #   module: github.com/go-restruct/restruct
    #   ref:
    #     go-version: v1.2.0-alpha
    #     git-ref: v1.2.0-alpha-0-g5734170a48a1371e880a092c5dd63adfd556cc36
    #     explicit: True
    # - kind: go_module
    #   url: github:go-viper/mapstructure.git
    #   module: github.com/go-viper/mapstructure/v2
    #   ref:
    #     go-version: v2.5.0
    #     git-ref: v2.5.0-0-g9aa3f77c68e2a56222ea436c1bfa631f1b1072d5
    #     explicit: True
    # - kind: go_module
    #   url: github:goccy/go-yaml.git
    #   module: github.com/goccy/go-yaml
    #   ref:
    #     go-version: v1.19.2
    #     git-ref: v1.19.2-0-g92bc79cb5f685e999ad131473168fc45215d12d9
    #     explicit: True
    # - kind: go_module
    #   url: github:golang/groupcache.git
    #   module: github.com/golang/groupcache
    #   ref:
    #     go-version: v0.0.0-20241129210726-2c02b8208cf8
    #     git-ref: 2c02b8208cf8c02a3e358cb1d9b60950647543fc
    #     explicit: True
    # - kind: go_module
    #   url: github:google/go-containerregistry.git
    #   module: github.com/google/go-containerregistry
    #   ref:
    #     go-version: v0.21.8
    #     git-ref: v0.21.8-0-g2ea098f4b13456cd628460632760b0a74b7488e9
    #     explicit: True
    # - kind: go_module
    #   url: github:google/jsonschema-go.git
    #   module: github.com/google/jsonschema-go
    #   ref:
    #     go-version: v0.4.3
    #     git-ref: v0.4.3-0-g8c4ab4f02ef64dcea5502e47a6113e8292944087
    #     explicit: True
    # - kind: go_module
    #   url: github:google/uuid.git
    #   module: github.com/google/uuid
    #   ref:
    #     go-version: v1.6.0
    #     git-ref: v1.6.0-0-g0f11ee6918f41a04c201eceeadf612a377bc7fbc
    #     explicit: True
    # - kind: go_module
    #   url: github:gorilla/css.git
    #   module: github.com/gorilla/css
    #   ref:
    #     go-version: v1.0.1
    #     git-ref: v1.0.1-0-gb2cb20bc2adfcf4cbfde7730187411777ffa836a
    #     explicit: True
    # - kind: go_module
    #   url: github:icholy/digest.git
    #   module: github.com/icholy/digest
    #   ref:
    #     go-version: v1.2.0
    #     git-ref: v1.2.0-0-g104e41263110fbc4690a1c0d6b309cac6e597e56
    #     explicit: True
    # - kind: go_module
    #   url: github:jbenet/go-context.git
    #   module: github.com/jbenet/go-context
    #   ref:
    #     go-version: v0.0.0-20150711004518-d14ea06fba99
    #     git-ref: d14ea06fba99483203c19d92cfcd13ebe73135f4
    #     explicit: True
    # - kind: go_module
    #   url: github:kevinburke/ssh_config.git
    #   module: github.com/kevinburke/ssh_config
    #   ref:
    #     go-version: v1.6.0
    #     git-ref: v1.6.0-0-g68fe499c7888e71e9e77108e4f187ae497bca342
    #     explicit: True
    # - kind: go_module
    #   url: github:klauspost/compress.git
    #   module: github.com/klauspost/compress
    #   ref:
    #     go-version: v1.19.1
    #     git-ref: v1.19.1-0-g2602f4afea09fe72f2b58d4ed04d43a6047a0131
    #     explicit: True
    # - kind: go_module
    #   url: github:klauspost/cpuid.git
    #   module: github.com/klauspost/cpuid/v2
    #   ref:
    #     go-version: v2.4.0
    #     git-ref: v2.4.0-0-g8590c161fbc87954548d2aedb65e2aad4e5137d1
    #     explicit: True
    # - kind: go_module
    #   url: github:kr/pretty.git
    #   module: github.com/kr/pretty
    #   ref:
    #     go-version: v0.3.1
    #     git-ref: v0.3.1-0-g3cd153a126da607b78d1762779b1e1054f9889fc
    #     explicit: True
    # - kind: go_module
    #   url: github:kr/text.git
    #   module: github.com/kr/text
    #   ref:
    #     go-version: v0.2.0
    #     git-ref: v0.2.0-0-g702c74938df48b97370179f33ce2107bd7ff3b3e
    #     explicit: True
    # - kind: go_module
    #   url: github:lucasb-eyer/go-colorful.git
    #   module: github.com/lucasb-eyer/go-colorful
    #   ref:
    #     go-version: v1.4.1
    #     git-ref: v1.4.1-0-g315b48282c63bac7b48ba128d0c87b7f827b2285
    #     explicit: True
    # - kind: go_module
    #   url: github:lunixbochs/struc.git
    #   module: github.com/lunixbochs/struc
    #   ref:
    #     go-version: v0.0.0-20241101090106-8d528fa2c543
    #     git-ref: 8d528fa2c5439b5d03f50858890a98d6336607f7
    #     explicit: True
    # - kind: go_module
    #   url: github:maruel/natural.git
    #   module: github.com/maruel/natural
    #   ref:
    #     go-version: v1.3.0
    #     git-ref: v1.3.0-0-g62bab1dd77e71b1946ad5ae97869700a3bd58014
    #     explicit: True
    # - kind: go_module
    #   url: github:masahiro331/go-ext4-filesystem.git
    #   module: github.com/masahiro331/go-ext4-filesystem
    #   ref:
    #     go-version: v0.0.0-20260423010602-fe51f5b5e52b
    #     git-ref: fe51f5b5e52b63a0533c3bc135e15df05d4a2261
    #     explicit: True
    # - kind: go_module
    #   url: github:mattn/go-isatty.git
    #   module: github.com/mattn/go-isatty
    #   ref:
    #     go-version: v0.0.24
    #     git-ref: v0.0.24-0-gc44dc0b9c702c76577fdb7898032969e0611efc2
    #     explicit: True
    # - kind: go_module
    #   url: github:mattn/go-localereader.git
    #   module: github.com/mattn/go-localereader
    #   ref:
    #     go-version: v0.0.1
    #     git-ref: v0.0.1-0-g6338b4c69507fb1f9edba3db33882a8e9ab9bfa8
    #     explicit: True
    # - kind: go_module
    #   url: github:mattn/go-runewidth.git
    #   module: github.com/mattn/go-runewidth
    #   ref:
    #     go-version: v0.0.27
    #     git-ref: v0.0.27-0-gf2d8bfeff22a28e1d7157559144dcdcab0255152
    #     explicit: True
    # - kind: go_module
    #   url: github:mattn/go-shellwords.git
    #   module: github.com/mattn/go-shellwords
    #   ref:
    #     go-version: v1.0.14
    #     git-ref: v1.0.14-0-g2b31b13123b0c5253ca007689e2e11c1512e9624
    #     explicit: True
    # - kind: go_module
    #   url: github:michaelkedar/xml.git
    #   module: github.com/michaelkedar/xml
    #   ref:
    #     go-version: v0.0.0-20250626233154-4ec9e090d1cd
    #     git-ref: 4ec9e090d1cdb89c30391067c0d54b3ca70446cf
    #     explicit: True
    # - kind: go_module
    #   url: github:microcosm-cc/bluemonday.git
    #   module: github.com/microcosm-cc/bluemonday
    #   ref:
    #     go-version: v1.0.27
    #     git-ref: v1.0.27-0-g10b8ac69db438c65c6d5469bb3c345aaa81f18d9
    #     explicit: True
    # - kind: go_module
    #   url: github:micromdm/plist.git
    #   module: github.com/micromdm/plist
    #   ref:
    #     go-version: v0.2.2
    #     git-ref: v0.2.2-0-g06294e0f1883e81e389ccff74ad06bc24d23be3f
    #     explicit: True
    # - kind: go_module
    #   url: github:moby/buildkit.git
    #   module: github.com/moby/buildkit
    #   ref:
    #     go-version: v0.32.2
    #     git-ref: v0.32.2-0-g991535e0973488b6a429096d21fa13f81f2d89d8
    #     explicit: True
    # - kind: go_module
    #   url: github:moby/docker-image-spec.git
    #   module: github.com/moby/docker-image-spec
    #   ref:
    #     go-version: v1.3.1
    #     git-ref: v1.3.1-0-gf1d00ebd2d6d6805170d5543dbca4b850f35f9af
    #     explicit: True
    # - kind: go_module
    #   url: github:moby/moby.git
    #   module: github.com/moby/moby/api
    #   ref:
    #     go-version: v1.55.0
    #     git-ref: api/v1.55.0-0-gb6c53c270450e3a0fd47c276ce1008f525e76884
    #     explicit: True
    #     subdirectory: api
    # - kind: go_module
    #   url: github:moby/moby.git
    #   module: github.com/moby/moby/client
    #   ref:
    #     go-version: v0.5.1
    #     git-ref: client/v0.5.1-0-g455591864a6e1b24d490f37b7041e730bfe03387
    #     explicit: True
    #     subdirectory: client
    # - kind: go_module
    #   url: github:muesli/ansi.git
    #   module: github.com/muesli/ansi
    #   ref:
    #     go-version: v0.0.0-20230316100256-276c6243b2f6
    #     git-ref: 276c6243b2f6df61db727937762b1a3f9cc12486
    #     explicit: True
    # - kind: go_module
    #   url: github:muesli/cancelreader.git
    #   module: github.com/muesli/cancelreader
    #   ref:
    #     go-version: v0.2.2
    #     git-ref: v0.2.2-0-gd11f1e77abf7f8d69d81553ccaaf0b81163541a6
    #     explicit: True
    # - kind: go_module
    #   url: github:muesli/reflow.git
    #   module: github.com/muesli/reflow
    #   ref:
    #     go-version: v0.3.0
    #     git-ref: v0.3.0-0-g602e329532049c9e33fa8c74e352a46fb9486947
    #     explicit: True
    # - kind: go_module
    #   url: github:muesli/termenv.git
    #   module: github.com/muesli/termenv
    #   ref:
    #     go-version: v0.16.0
    #     git-ref: v0.16.0-0-g2e6fa35162bb1c735367736319813b2dc01a77a4
    #     explicit: True
    # - kind: go_module
    #   url: github:ncruces/go-strftime.git
    #   module: github.com/ncruces/go-strftime
    #   ref:
    #     go-version: v1.0.0
    #     git-ref: v1.0.0-0-g7be8eef566cc7f1ae99e76af8f8208913758a28d
    #     explicit: True
    # - kind: go_module
    #   url: github:opencontainers/image-spec.git
    #   module: github.com/opencontainers/image-spec
    #   ref:
    #     go-version: v1.1.1
    #     git-ref: v1.1.1-0-g147f9c13cedb47a0c4d9a11a222961073d585877
    #     explicit: True
    # - kind: go_module
    #   url: github:pierrec/lz4.git
    #   module: github.com/pierrec/lz4/v4
    #   ref:
    #     go-version: v4.1.27
    #     git-ref: v4.1.27-0-ga296161b6e73e177e902d9cdafbd3e8b9ffaa68f
    #     explicit: True
    # - kind: go_module
    #   url: github:pjbgf/sha1cd.git
    #   module: github.com/pjbgf/sha1cd
    #   ref:
    #     go-version: v0.6.0
    #     git-ref: v0.6.0-0-gf90af0d82e52301ae4c69570bf0ab6b638a2ff2c
    #     explicit: True
    # - kind: go_module
    #   url: github:pkg/errors.git
    #   module: github.com/pkg/errors
    #   ref:
    #     go-version: v0.9.1
    #     git-ref: v0.9.1-0-g614d223910a179a466c1767a985424175c39b465
    #     explicit: True
    # - kind: go_module
    #   url: github:pkg/xattr.git
    #   module: github.com/pkg/xattr
    #   ref:
    #     go-version: v0.4.12
    #     git-ref: v0.4.12-0-g05b05ed74197ab4456166d9cec4cd868a1a05f35
    #     explicit: True
    # - kind: go_module
    #   url: github:planetscale/vtprotobuf.git
    #   module: github.com/planetscale/vtprotobuf
    #   ref:
    #     go-version: v0.6.1-0.20240319094008-0393e58bdf10
    #     git-ref: 0393e58bdf106fe0347e554d272a8f2c84d12461
    #     explicit: True
    # - kind: go_module
    #   url: github:remyoudompheng/bigfft.git
    #   module: github.com/remyoudompheng/bigfft
    #   ref:
    #     go-version: v0.0.0-20230129092748-24d4a6f8daec
    #     git-ref: 24d4a6f8daece64d3c9a7660d4ee0974c4e31021
    #     explicit: True
    # - kind: go_module
    #   url: github:rivo/uniseg.git
    #   module: github.com/rivo/uniseg
    #   ref:
    #     go-version: v0.4.7
    #     git-ref: v0.4.7-0-g03509a98a092b522b2ff0de13e53513d18b3b837
    #     explicit: True
    # - kind: go_module
    #   url: github:rogpeppe/go-internal.git
    #   module: github.com/rogpeppe/go-internal
    #   ref:
    #     go-version: v1.15.0
    #     git-ref: v1.15.0-0-g8b1dcd4611005f03b2e062b8af5ddf7ceb3590d1
    #     explicit: True
    # - kind: go_module
    #   url: github:rust-secure-code/go-rustaudit.git
    #   module: github.com/rust-secure-code/go-rustaudit
    #   ref:
    #     go-version: v0.0.0-20250226111315-e20ec32e963c
    #     git-ref: e20ec32e963c5999add5afaa804435b63c180e82
    #     explicit: True
    # - kind: go_module
    #   url: github:saferwall/pe.git
    #   module: github.com/saferwall/pe
    #   ref:
    #     go-version: v1.6.5
    #     git-ref: v1.6.5-0-ge08bfecd2f9740f233b5df08f94bda9977b57577
    #     explicit: True
    # - kind: go_module
    #   url: github:sahilm/fuzzy.git
    #   module: github.com/sahilm/fuzzy
    #   ref:
    #     go-version: v0.1.3
    #     git-ref: v0.1.3-0-g8aadc77d46cf09f5dc529d41358a94a24516c0b6
    #     explicit: True
    # - kind: go_module
    #   url: github:santhosh-tekuri/jsonschema.git
    #   module: github.com/santhosh-tekuri/jsonschema/v6
    #   ref:
    #     go-version: v6.0.2
    #     git-ref: v6.0.2-0-g29cbed948d24a04700eb94436416b18a07953b71
    #     explicit: True
    # - kind: go_module
    #   url: github:segmentio/asm.git
    #   module: github.com/segmentio/asm
    #   ref:
    #     go-version: v1.2.1
    #     git-ref: v1.2.1-0-g1cfacc81a878d4a07b13f51f2368cd86893d23fa
    #     explicit: True
    # - kind: go_module
    #   url: github:segmentio/encoding.git
    #   module: github.com/segmentio/encoding
    #   ref:
    #     go-version: v0.5.4
    #     git-ref: v0.5.4-0-g7d5a25dbc5da13aed3cb047a127e4d0e96f536fb
    #     explicit: True
    # - kind: go_module
    #   url: github:sergi/go-diff.git
    #   module: github.com/sergi/go-diff
    #   ref:
    #     go-version: v1.4.0
    #     git-ref: v1.4.0-0-g57c41f4cb9849a2e83cdbd7644b31e6d7a7e2586
    #     explicit: True
    # - kind: go_module
    #   url: github:shirou/gopsutil.git
    #   module: github.com/shirou/gopsutil
    #   ref:
    #     go-version: v3.21.11+incompatible
    #     git-ref: v3.21.11-0-g3b417071a5835600ae0d654231cfb9ce226f2b6b
    #     explicit: True
    # - kind: go_module
    #   url: github:sirupsen/logrus.git
    #   module: github.com/sirupsen/logrus
    #   ref:
    #     go-version: v1.9.4
    #     git-ref: v1.9.4-0-gb61f268f75b6ff134a62cd62aee1095fa12e8d2e
    #     explicit: True
    # - kind: go_module
    #   url: github:skeema/knownhosts.git
    #   module: github.com/skeema/knownhosts
    #   ref:
    #     go-version: v1.3.2
    #     git-ref: v1.3.2-0-gb9f50b4a05dbf3a2392d9ffba3399dd74315ab4c
    #     explicit: True
    # - kind: go_module
    #   url: github:spdx/gordf.git
    #   module: github.com/spdx/gordf
    #   ref:
    #     go-version: v0.0.0-20250128162952-000978ccd6fb
    #     git-ref: 000978ccd6fb94ec9e9ea53571cd8a8429e274ee
    #     explicit: True
    # - kind: go_module
    #   url: github:spdx/tools-golang.git
    #   module: github.com/spdx/tools-golang
    #   ref:
    #     go-version: v0.5.7
    #     git-ref: v0.5.7-0-g28116d2a82c9999a10b186d88e4132e20ac67462
    #     explicit: True
    # - kind: go_module
    #   url: github:thoas/go-funk.git
    #   module: github.com/thoas/go-funk
    #   ref:
    #     go-version: v0.9.3
    #     git-ref: v0.9.3-0-g4107456c7aeb9c56439474a6917ccea36365b869
    #     explicit: True
    # - kind: go_module
    #   url: github:tidwall/jsonc.git
    #   module: github.com/tidwall/jsonc
    #   ref:
    #     go-version: v0.3.3
    #     git-ref: v0.3.3-0-g47bcc8d156812b0ba7ee42372b2259b645e9a092
    #     explicit: True
    # - kind: go_module
    #   url: github:tidwall/match.git
    #   module: github.com/tidwall/match
    #   ref:
    #     go-version: v1.2.0
    #     git-ref: v1.2.0-0-gafc69bce52e08c02e78156a7697bd808fc868ec5
    #     explicit: True
    # - kind: go_module
    #   url: github:tink-crypto/tink-go.git
    #   module: github.com/tink-crypto/tink-go/v2
    #   ref:
    #     go-version: v2.7.0
    #     git-ref: v2.7.0-0-g25ed99cf7fe31aa5de095b4b4186c137dee2c010
    #     explicit: True
    # - kind: go_module
    #   url: github:tklauser/go-sysconf.git
    #   module: github.com/tklauser/go-sysconf
    #   ref:
    #     go-version: v0.4.0
    #     git-ref: v0.4.0-0-g93984eae8bcec8cf103d6aa460f87bbc178e429c
    #     explicit: True
    # - kind: go_module
    #   url: github:tklauser/numcpus.git
    #   module: github.com/tklauser/numcpus
    #   ref:
    #     go-version: v0.12.0
    #     git-ref: v0.12.0-0-g28ffdd927b88bf67119a0cca171660d87c1266a5
    #     explicit: True
    # - kind: go_module
    #   url: github:tonistiigi/go-csvvalue.git
    #   module: github.com/tonistiigi/go-csvvalue
    #   ref:
    #     go-version: v0.0.0-20240814133006-030d3b2625d0
    #     git-ref: 030d3b2625d0ae73babf789e079c07ae2c9940b4
    #     explicit: True
    # - kind: go_module
    #   url: github:ulikunitz/xz.git
    #   module: github.com/ulikunitz/xz
    #   ref:
    #     go-version: v0.5.16
    #     git-ref: v0.5.16-0-g024f9092972afea64fa5c25157566881bac36938
    #     explicit: True
    # - kind: go_module
    #   url: github:xanzy/ssh-agent.git
    #   module: github.com/xanzy/ssh-agent
    #   ref:
    #     go-version: v0.3.3
    #     git-ref: v0.3.3-0-g0fa644ba07f41bbe341c7f3d59bd30443ff13002
    #     explicit: True
    # - kind: go_module
    #   url: github:xeipuuv/gojsonpointer.git
    #   module: github.com/xeipuuv/gojsonpointer
    #   ref:
    #     go-version: v0.0.0-20190905194746-02993c407bfb
    #     git-ref: 02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb
    #     explicit: True
    # - kind: go_module
    #   url: github:xeipuuv/gojsonreference.git
    #   module: github.com/xeipuuv/gojsonreference
    #   ref:
    #     go-version: v0.0.0-20180127040603-bd5ef7bd5415
    #     git-ref: bd5ef7bd5415a7ac448318e64f11a24cd21e594b
    #     explicit: True
    # - kind: go_module
    #   url: github:xeipuuv/gojsonschema.git
    #   module: github.com/xeipuuv/gojsonschema
    #   ref:
    #     go-version: v1.2.0
    #     git-ref: v1.2.0-0-g82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927
    #     explicit: True
    # - kind: go_module
    #   url: github:xhit/go-str2duration.git
    #   module: github.com/xhit/go-str2duration/v2
    #   ref:
    #     go-version: v2.1.0
    #     git-ref: v2.1.0-0-g017325bfda0895fe02177e4ebb07962e58735bbf
    #     explicit: True
    # - kind: go_module
    #   url: github:xo/terminfo.git
    #   module: github.com/xo/terminfo
    #   ref:
    #     go-version: v0.0.0-20220910002029-abceb7e1c41e
    #     git-ref: abceb7e1c41eed2857facd9bbdaaa5ff8137d901
    #     explicit: True
    # - kind: go_module
    #   url: github:yosida95/uritemplate.git
    #   module: github.com/yosida95/uritemplate/v3
    #   ref:
    #     go-version: v3.0.2
    #     git-ref: v3.0.2-0-gc583dbd90f8e47c667d62f787133950bb8e5bfa5
    #     explicit: True
    # - kind: go_module
    #   url: github:yuin/goldmark.git
    #   module: github.com/yuin/goldmark
    #   ref:
    #     go-version: v1.8.5
    #     git-ref: v1.8.5-0-g6ed00da2d6d53d831827e54ee5d334f4544693b9
    #     explicit: True
    # - kind: go_module
    #   url: github:yuin/goldmark-emoji.git
    #   module: github.com/yuin/goldmark-emoji
    #   ref:
    #     go-version: v1.0.6
    #     git-ref: v1.0.6-0-g397d9ff4c68a32501e17acc3cf32732ce1a91457
    #     explicit: True
  - kind: go_module
    url: github:yusufpapurcu/wmi.git
    module: github.com/yusufpapurcu/wmi
    ref:
      go-version: v1.2.4
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  # - kind: go_module
  #   url: git_https:go.etcd.io/bbolt.git
  #   module: go.etcd.io/bbolt
  #   ref:
  #     go-version: v1.5.0
  #     git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
  #     explicit: True
  - kind: go_module
    url: github:open-telemetry/opentelemetry-go
    module: go.opentelemetry.io/auto/sdk
    ref:
      go-version: v1.2.1
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: github:open-telemetry/opentelemetry-go
    module: go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp
    ref:
      go-version: v0.70.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: github:open-telemetry/opentelemetry-go
    module: go.opentelemetry.io/otel
    ref:
      go-version: v1.45.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: github:open-telemetry/opentelemetry-go
    module: go.opentelemetry.io/otel/metric
    ref:
      go-version: v1.45.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: github:open-telemetry/opentelemetry-go
    module: go.opentelemetry.io/otel/trace
    ref:
      go-version: v1.45.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:go.uber.org/multierr.git
    module: go.uber.org/multierr
    ref:
      go-version: v1.11.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:go.uber.org/zap.git
    module: go.uber.org/zap
    ref:
      go-version: v1.28.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:go.yaml.in/yaml/v2.git
    module: go.yaml.in/yaml/v2
    ref:
      go-version: v2.4.4
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:golang.org/x/crypto.git
    module: golang.org/x/crypto
    ref:
      go-version: v0.57.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:golang.org/x/mod.git
    module: golang.org/x/mod
    ref:
      go-version: v0.41.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:golang.org/x/net.git
    module: golang.org/x/net
    ref:
      go-version: v0.58.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:golang.org/x/oauth2.git
    module: golang.org/x/oauth2
    ref:
      go-version: v0.36.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:golang.org/x/sync.git
    module: golang.org/x/sync
    ref:
      go-version: v0.23.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:golang.org/x/sys.git
    module: golang.org/x/sys
    ref:
      go-version: v0.48.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:golang.org/x/telemetry.git
    module: golang.org/x/telemetry
    ref:
      go-version: v0.0.0-20260811182544-a038080d80e5
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:golang.org/x/text.git
    module: golang.org/x/text
    ref:
      go-version: v0.42.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:golang.org/x/time.git
    module: golang.org/x/time
    ref:
      go-version: v0.15.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:golang.org/x/tools.git
    module: golang.org/x/tools
    ref:
      go-version: v0.49.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:golang.org/x/xerrors.git
    module: golang.org/x/xerrors
    ref:
      go-version: v0.0.0-20240903120638-7835f813f4da
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:google.golang.org/genproto/googleapis/api.git
    module: google.golang.org/genproto/googleapis/api
    ref:
      go-version: v0.0.0-20260803160001-6ac0973c030d
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:google.golang.org/genproto/googleapis/rpc.git
    module: google.golang.org/genproto/googleapis/rpc
    ref:
      go-version: v0.0.0-20260803160001-6ac0973c030d
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:gopkg.in/ini.v1.git
    module: gopkg.in/ini.v1
    ref:
      go-version: v1.67.3
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:gopkg.in/warnings.v0.git
    module: gopkg.in/warnings.v0
    ref:
      go-version: v0.1.2
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:gopkg.in/yaml.v3.git
    module: gopkg.in/yaml.v3
    ref:
      go-version: v3.0.1
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:modernc.org/libc.git
    module: modernc.org/libc
    ref:
      go-version: v1.74.4
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:modernc.org/mathutil.git
    module: modernc.org/mathutil
    ref:
      go-version: v1.7.1
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:modernc.org/memory.git
    module: modernc.org/memory
    ref:
      go-version: v1.11.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:modernc.org/sqlite.git
    module: modernc.org/sqlite
    ref:
      go-version: v1.56.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:osv.dev/bindings/go.git
    module: osv.dev/bindings/go
    ref:
      go-version: v0.0.0-20260805021707-3a57b89df3b6
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:sigs.k8s.io/yaml.git
    module: sigs.k8s.io/yaml
    ref:
      go-version: v1.6.0
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:www.velocidex.com/golang/go-ntfs.git
    module: www.velocidex.com/golang/go-ntfs
    ref:
      go-version: v0.2.1
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
  - kind: go_module
    url: git_https:www.velocidex.com/golang/regparser.git
    module: www.velocidex.com/golang/regparser
    ref:
      go-version: v0.0.0-20250203141505-31e704a67ef7
      git-ref: b279807a1bad9fa155988667d97a3d2fff4061b5
      explicit: True
