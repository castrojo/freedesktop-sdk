# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT
kind: manual

build-depends:
- public-stacks/buildsystem-go.bst
- components/hermes.bst

depends:
- public-stacks/runtime-minimal.bst

environment:
  GOPROXY: http://127.0.0.1:40000/mod

variables:
  optimize-debug: "false"
  goflags: >-
    %{go_buildmode_flag} -modcacherw "-ldflags=%{go_ldflags}" %{local_goflags}

config:
  build-commands:
  - go build -o osv-scanner ./cmd/osv-scanner
  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}" osv-scanner
  configure-commands:
  - hermes serve --daemonize

sources:
- kind: git_repo
  url: github:google/osv-scanner.git
  track: v*.*.*
  ref: v2.7.1-0-g02f96a40691c2d155fdda799af436e111231e365
- kind: hermes
  ref:
  - kind: GoModule
    url: go_proxy:bitbucket.org/creachadair/stringset/@v/v0.0.14.mod
    digest:
      kind: Sha256Sum
      value: aa0c006289a11b323a1c8b60861835b30cb67a9ce40321f22719eb47ee394ef3
  - kind: GoModule
    url: go_proxy:charm.land/glamour/v2/@v/v2.0.1.mod
    digest:
      kind: Sha256Sum
      value: cb09f8f6d6472cdda8d60c2d92c8fa2db712ffaa01b5460a31c3ebf4ee619518
  - kind: GoModule
    url: go_proxy:charm.land/lipgloss/v2/@v/v2.0.6.mod
    digest:
      kind: Sha256Sum
      value: a53ac4e91e3cad3a953594f11035a9379573ebbf72d3d4c52a73c45ee48599dc
  - kind: GoModule
    url: go_proxy:cloud.google.com/go/compute/metadata/@v/v0.9.0.mod
    digest:
      kind: Sha256Sum
      value: 80aefcb99e7ffca922974c5ebae6cc480e6be8845b9f4b28e7a1d3055525df08
  - kind: GoModule
    url: go_proxy:dario.cat/mergo/@v/v1.0.2.mod
    digest:
      kind: Sha256Sum
      value: d4c65d7a5f68051187d1385f0de39cc4a7f47a88dc37f45d2dfe494403e25ee2
  - kind: GoModule
    url: go_proxy:deps.dev/api/v3/@v/v3.0.0-20260811035547-133c155ce203.mod
    digest:
      kind: Sha256Sum
      value: 4be096b82517e37e250fbca7696e3a8076dcfaa80ae19a80a5814b8bad6e2e57
  - kind: GoModule
    url: go_proxy:deps.dev/api/v3alpha/@v/v0.0.0-20260811035547-133c155ce203.mod
    digest:
      kind: Sha256Sum
      value: 4292abbd2f124c389faf117869babb58c5681f51acc5ae489145eea46551c878
  - kind: GoModule
    url: go_proxy:deps.dev/util/maven/@v/v0.0.0-20260928000106-0e158e8db197.mod
    digest:
      kind: Sha256Sum
      value: 0fbd4e6f8aa4fae61a21b84de7b63c6dd0f94b5902d1cf027708ac07c309221e
  - kind: GoModule
    url: go_proxy:deps.dev/util/pypi/@v/v0.0.0-20260727054525-2946ae4a6141.mod
    digest:
      kind: Sha256Sum
      value: ec3b813ddc52daafe38cb16797f9ff5fd329291f9a8d3c14655b10382044dbc5
  - kind: GoModule
    url: go_proxy:deps.dev/util/resolve/@v/v0.0.0-20260727054525-2946ae4a6141.mod
    digest:
      kind: Sha256Sum
      value: 4ba9803027c702976969fbc9e23c316f3b5b844c5a723a7b54f6ddcba9eebe04
  - kind: GoModule
    url: go_proxy:deps.dev/util/semver/@v/v0.0.0-20260727054525-2946ae4a6141.mod
    digest:
      kind: Sha256Sum
      value: 5a66a1532cd7a97f702e9237df78beed3f3a00fee4a8fd402e4a3726d88778d1
  - kind: GoModule
    url: go_proxy:github.com/!burnt!sushi/toml/@v/v1.6.0.mod
    digest:
      kind: Sha256Sum
      value: 45d78b80571999b6a258da0f21673da39e6b501349c033a4acd169437411d733
  - kind: GoModule
    url: go_proxy:github.com/!cyclone!d!x/cyclonedx-go/@v/v0.12.0.mod
    digest:
      kind: Sha256Sum
      value: f32d52f5fe5a3c6a48954d4abbf5871b561c849eb2dd231aa2419c015f555984
  - kind: GoModule
    url: go_proxy:github.com/!gehirn!inc/crypt/@v/v0.0.0-20230320061759-8cc1b52080c5.mod
    digest:
      kind: Sha256Sum
      value: 6010c9e597f34f34097a681b6a13a4b8c353435fe932d79ed053e4c6a9c61d40
  - kind: GoModule
    url: go_proxy:github.com/!microsoft/go-winio/@v/v0.6.3-0.20251027160822-ad3df93bed29.mod
    digest:
      kind: Sha256Sum
      value: b270953ae7496b573136d5a2d8bc00cf9ecf15cc27f444e94379fef48532fdd1
  - kind: GoModule
    url: go_proxy:github.com/!proton!mail/go-crypto/@v/v1.4.1.mod
    digest:
      kind: Sha256Sum
      value: 54a615125cdd4e48ce23567071b5b8d2965d83c045d8ec32e5b700628c69b152
  - kind: GoModule
    url: go_proxy:github.com/!velocidex/json/@v/v0.0.0-20220224052537-92f3c0326e5a.mod
    digest:
      kind: Sha256Sum
      value: e4c77a34e0b45b2f92335f6dfa829578542665ae31562938107f3f23bd1718d2
  - kind: GoModule
    url: go_proxy:github.com/!velocidex/ordereddict/@v/v0.0.0-20250821063524-02dc06e46238.mod
    digest:
      kind: Sha256Sum
      value: d04845d9a53705122d3ce502460e443c5b01a06b74d7d496f726fba7ab0e2ec7
  - kind: GoModule
    url: go_proxy:github.com/!velocidex/yaml/v2/@v/v2.2.8.mod
    digest:
      kind: Sha256Sum
      value: b4fe35bc796393a7b87248fdca5c83cc302d8d0013f4ec66fdc863b9f833bf55
  - kind: GoModule
    url: go_proxy:github.com/aead/serpent/@v/v0.0.0-20160714141033-fba169763ea6.mod
    digest:
      kind: Sha256Sum
      value: b9375a43f76b76a8a70d9b69b0097df93f168038d4db3e9b8159fc64195d4123
  - kind: GoModule
    url: go_proxy:github.com/agext/levenshtein/@v/v1.2.3.mod
    digest:
      kind: Sha256Sum
      value: 4472c50e7e1c3fe6e1e37881d0627b97b0a1329725849997e0b4c257d0b22ebb
  - kind: GoModule
    url: go_proxy:github.com/alecthomas/chroma/v2/@v/v2.19.0.mod
    digest:
      kind: Sha256Sum
      value: dec2e37365a911d88b457a047831a286710554f1f47ddeefff6a445acca1aea7
  - kind: GoModule
    url: go_proxy:github.com/anchore/go-lzo/@v/v0.1.0.mod
    digest:
      kind: Sha256Sum
      value: 789691936a70c39f25d5ac9f38dfa5c629528f6b96225712b27ebaaafb462e5e
  - kind: GoModule
    url: go_proxy:github.com/anchore/go-struct-converter/@v/v0.1.0.mod
    digest:
      kind: Sha256Sum
      value: 5a083360c276a15d0dbc82b17ed222a0a8f0d140631422b0e986d676b3f2f779
  - kind: GoModule
    url: go_proxy:github.com/atotto/clipboard/@v/v0.1.4.mod
    digest:
      kind: Sha256Sum
      value: 871822cbc7df3792f78a100886b7f499f73555938e336b918682119688ea8ad0
  - kind: GoModule
    url: go_proxy:github.com/aymanbagabas/go-osc52/v2/@v/v2.0.1.mod
    digest:
      kind: Sha256Sum
      value: 4646f9f19a822aebf4296bce24d5f2b7b2700ea1c44f5cc978300263cb7b5611
  - kind: GoModule
    url: go_proxy:github.com/aymerick/douceur/@v/v0.2.0.mod
    digest:
      kind: Sha256Sum
      value: 5e0454241c257b4c4f9dbddc84e78e99e29c5275b3cfaee8afd2bb476e724897
  - kind: GoModule
    url: go_proxy:github.com/ayoubfaouzi/pkcs7/@v/v0.2.3.mod
    digest:
      kind: Sha256Sum
      value: 7cce0d62d30cb6f299d2e27d1c5feaa2034a2e73a2bd9ed59342ae33447798de
  - kind: GoModule
    url: go_proxy:github.com/bazelbuild/buildtools/@v/v0.0.0-20260716142318-04cf7de1434f.mod
    digest:
      kind: Sha256Sum
      value: 85e60cfccacc5e14a84b15b4187fb2b23e8a1ad87207465c2587644330f500a1
  - kind: GoModule
    url: go_proxy:github.com/canonical/chisel-manifest/@v/v1.2.0.mod
    digest:
      kind: Sha256Sum
      value: bcf41d97b5c3ebf3acb7cca353a569fd6939e6570a38a9fb51a039e3be9c0ebd
  - kind: GoModule
    url: go_proxy:github.com/cespare/xxhash/v2/@v/v2.3.0.mod
    digest:
      kind: Sha256Sum
      value: a090f8eaaf59cc2adf163299ebefe797e1dca3f6add2c8e88a6a3b90ba538b02
  - kind: GoModule
    url: go_proxy:github.com/charmbracelet/bubbles/@v/v1.0.0.mod
    digest:
      kind: Sha256Sum
      value: a324490b2998811be8fa0a3cbb7fac4d65e3c18e75942ca0ce9a86f07e16b031
  - kind: GoModule
    url: go_proxy:github.com/charmbracelet/bubbletea/@v/v1.3.10.mod
    digest:
      kind: Sha256Sum
      value: 903f2904b09b37dd74092f437ad306794e7633329ddc5af7b201d469e2d937fb
  - kind: GoModule
    url: go_proxy:github.com/charmbracelet/colorprofile/@v/v0.4.3.mod
    digest:
      kind: Sha256Sum
      value: 4da50dc5179ea48dc7c55db78f05b4911047341ef749027b3969130edf1fd43b
  - kind: GoModule
    url: go_proxy:github.com/charmbracelet/lipgloss/@v/v1.1.1-0.20250404203927-76690c660834.mod
    digest:
      kind: Sha256Sum
      value: b1920c927dec202564f9f21822f746639347da161ed3d1a190992c0009b20cf0
  - kind: GoModule
    url: go_proxy:github.com/charmbracelet/ultraviolet/@v/v0.0.0-20260811164956-006e29f97886.mod
    digest:
      kind: Sha256Sum
      value: f7e5b81ab8caff09a79575059afbdd4ae62a2d0b68f620b5448f91dbef71251a
  - kind: GoModule
    url: go_proxy:github.com/charmbracelet/x/ansi/@v/v0.11.8.mod
    digest:
      kind: Sha256Sum
      value: 94745b02f0437172bf3dd72d8059421cf95ce29f98e64d108ff6bc68e8602464
  - kind: GoModule
    url: go_proxy:github.com/charmbracelet/x/cellbuf/@v/v0.0.15.mod
    digest:
      kind: Sha256Sum
      value: 5867c27bb93af066945f3c7b5487f721c1f6dc05a382a9e83af0de7ee9ac00f2
  - kind: GoModule
    url: go_proxy:github.com/charmbracelet/x/exp/slice/@v/v0.0.0-20260803091719-3755ebad01b1.mod
    digest:
      kind: Sha256Sum
      value: aa42adc3336ddd5a73c7562e0924cba45c840024f84ae2d5e7db2c67699629ac
  - kind: GoModule
    url: go_proxy:github.com/charmbracelet/x/term/@v/v0.2.2.mod
    digest:
      kind: Sha256Sum
      value: 6df18166815b45f523a79580acfa95f12990a1568e6325f9d60b5825df952962
  - kind: GoModule
    url: go_proxy:github.com/charmbracelet/x/termios/@v/v0.1.1.mod
    digest:
      kind: Sha256Sum
      value: 4094a8d0a57055f0bfb8a1191e69ee282e2de40d3ab7724cc134ca26fc02b9d1
  - kind: GoModule
    url: go_proxy:github.com/charmbracelet/x/windows/@v/v0.2.2.mod
    digest:
      kind: Sha256Sum
      value: 2256def13bee56024d8300ad8474563bb2b0d5f769ac9ca9f89868cab014b6e3
  - kind: GoModule
    url: go_proxy:github.com/clipperhouse/displaywidth/@v/v0.11.0.mod
    digest:
      kind: Sha256Sum
      value: 643bf909351d7bc8ff29a8a7bb44cca11efe181ed66e5efe57d695bb023effb3
  - kind: GoModule
    url: go_proxy:github.com/clipperhouse/uax29/v2/@v/v2.7.0.mod
    digest:
      kind: Sha256Sum
      value: f3c5f4e4f9e7fb16aea5fd9dc5f24c3ff9c157b1a67576c0f2140117589507a0
  - kind: GoModule
    url: go_proxy:github.com/cloudflare/circl/@v/v1.6.4.mod
    digest:
      kind: Sha256Sum
      value: 71f71b82bebc747877199397b7329bf960363ffb0ba5c48cfdd7c4f57aa664dd
  - kind: GoModule
    url: go_proxy:github.com/compose-spec/compose-go/v2/@v/v2.14.0.mod
    digest:
      kind: Sha256Sum
      value: 34352dc1fa1a19ba4d35bb665dd54fbeae158bfd2390e78fc9bd7f812305faf3
  - kind: GoModule
    url: go_proxy:github.com/containerd/errdefs/@v/v1.0.0.mod
    digest:
      kind: Sha256Sum
      value: a353bfe4f6beb16b6df0cd2245735c0ec94a92fc40e4846dd9191f9e166c9ce7
  - kind: GoModule
    url: go_proxy:github.com/containerd/errdefs/pkg/@v/v0.3.0.mod
    digest:
      kind: Sha256Sum
      value: 968b121c28414964a5156d18ea4546d92f8ff5674e8b346e7db9f3c350e849a4
  - kind: GoModule
    url: go_proxy:github.com/containerd/typeurl/v2/@v/v2.3.0.mod
    digest:
      kind: Sha256Sum
      value: 9aea8924388c3e59fa7b68cb5717b79d6fbce217b06395f54e2fde970de27f05
  - kind: GoModule
    url: go_proxy:github.com/cyphar/filepath-securejoin/@v/v0.7.0.mod
    digest:
      kind: Sha256Sum
      value: 6c4b862cf5c5bbf854024d3357bfa909b0eb22a515917bdbaa5c0112d749a8fa
  - kind: GoModule
    url: go_proxy:github.com/davecgh/go-spew/@v/v1.1.2-0.20180830191138-d8f796af33cc.mod
    digest:
      kind: Sha256Sum
      value: bcb29393251237b79a17b6c19bf29134f43e8f438c3198988fcd461a1cdf05cc
  - kind: GoModule
    url: go_proxy:github.com/deitch/magic/@v/v0.0.0-20240306090643-c67ab88f10cb.mod
    digest:
      kind: Sha256Sum
      value: f28c2a89ea463e92738f13ce066db593aac901ff285fb7b715038318a8a56ad9
  - kind: GoModule
    url: go_proxy:github.com/diskfs/go-diskfs/@v/v1.7.0.mod
    digest:
      kind: Sha256Sum
      value: a9b8739c7aaf2e0c58d318148a855bb0e24a4f2d1039693e64864bb0f0ccb0e2
  - kind: GoModule
    url: go_proxy:github.com/distribution/reference/@v/v0.6.0.mod
    digest:
      kind: Sha256Sum
      value: f58a3047216ff2a4dd996e6579a8444bc4de2de08b6cdec7429b9e3e649b9a75
  - kind: GoModule
    url: go_proxy:github.com/djherbis/times/@v/v1.6.0.mod
    digest:
      kind: Sha256Sum
      value: ecc07de30ea561b21c6bac61760f30c30da8aa8667d7902cfb1f5bb59743808a
  - kind: GoModule
    url: go_proxy:github.com/dlclark/regexp2/@v/v1.12.0.mod
    digest:
      kind: Sha256Sum
      value: 7017e81fb9fa9227a3180a62e323158b4523c67062f0a8aa08637c092b8d4aa7
  - kind: GoModule
    url: go_proxy:github.com/docker/cli/@v/v29.7.1+incompatible.mod
    digest:
      kind: Sha256Sum
      value: c43f3501c5704f110a12749dbcfb94f7c7a5b0d5fd5facb978626d31ce0cb821
  - kind: GoModule
    url: go_proxy:github.com/docker/docker-credential-helpers/@v/v0.9.8.mod
    digest:
      kind: Sha256Sum
      value: 9a66da241d94521eb8d3c2dc67c2afd337324fb4e2e25568867fb1ab4c920c24
  - kind: GoModule
    url: go_proxy:github.com/docker/go-connections/@v/v0.8.1.mod
    digest:
      kind: Sha256Sum
      value: 0e916bb5125b73fcf42b40d5614942299a5827a62e64afe5f8d76260b721b507
  - kind: GoModule
    url: go_proxy:github.com/docker/go-units/@v/v0.5.0.mod
    digest:
      kind: Sha256Sum
      value: ed45577dfb3562bc693dced91b172f710f1a9089c40808529f447348754e0c58
  - kind: GoModule
    url: go_proxy:github.com/dsoprea/go-exfat/@v/v0.0.0-20190906070738-5e932fbdb589.mod
    digest:
      kind: Sha256Sum
      value: 0d4271ede14722df0f08f0c5aa4ac3dec08b53e40f310878ee6ad1a9c20b7a2a
  - kind: GoModule
    url: go_proxy:github.com/dsoprea/go-logging/@v/v0.0.0-20200710184922-b02d349568dd.mod
    digest:
      kind: Sha256Sum
      value: 87aa72fa39ffd85db4ac25edf5fb371c0fefedc1aca6ca98d93057807dc300b5
  - kind: GoModule
    url: go_proxy:github.com/dustin/go-humanize/@v/v1.0.1.mod
    digest:
      kind: Sha256Sum
      value: 4325999d0a6841031258a2561c22879d9fbdf77abc6b32a17b1cb6edf0810fb2
  - kind: GoModule
    url: go_proxy:github.com/edsrzf/mmap-go/@v/v1.2.0.mod
    digest:
      kind: Sha256Sum
      value: 717426e7e746ed18204b0455d873bbb5874ed2aab254fc5368620e46882caf87
  - kind: GoModule
    url: go_proxy:github.com/elliotwutingfeng/asciiset/@v/v0.0.0-20260801111138-45c5fff54b41.mod
    digest:
      kind: Sha256Sum
      value: a71147b0ecd33def45800568067c70e7e1a5f9b6a644844a2ab64903dcdd942f
  - kind: GoModule
    url: go_proxy:github.com/emirpasic/gods/@v/v1.18.1.mod
    digest:
      kind: Sha256Sum
      value: 0e157c7ef1975139b752696ba9058a5e96f51fc828e1e72a0942b1900652ce8e
  - kind: GoModule
    url: go_proxy:github.com/erikgeiser/coninput/@v/v0.0.0-20211004153227-1c3628e74d0f.mod
    digest:
      kind: Sha256Sum
      value: 48c6ce643a4c56e550e8d5735fba0776b460d9cfb83e80d17a5a500573b9692f
  - kind: GoModule
    url: go_proxy:github.com/erikvarga/go-rpmdb/@v/v0.0.0-20261001143808-1a11b79cbdd3.mod
    digest:
      kind: Sha256Sum
      value: e4550894d15d0a211d97f850b8784b18388db4216cc5a0adbfb631787f877284
  - kind: GoModule
    url: go_proxy:github.com/felixge/httpsnoop/@v/v1.1.0.mod
    digest:
      kind: Sha256Sum
      value: e6c8e044418c809ceea7acbc002c297bd433ea635e0ac9e4fc2019c9bf895b6e
  - kind: GoModule
    url: go_proxy:github.com/gkampitakis/ciinfo/@v/v0.3.4.mod
    digest:
      kind: Sha256Sum
      value: 73116a39667482a07842a367d597bb0c5934e603513e2701c02461d8f76a49ef
  - kind: GoModule
    url: go_proxy:github.com/gkampitakis/go-snaps/@v/v0.5.25.mod
    digest:
      kind: Sha256Sum
      value: d4952a262a168ccc9629b5e150c57d140e7edbb09f654f1e6f2b60021556a8e7
  - kind: GoModule
    url: go_proxy:github.com/go-errors/errors/@v/v1.5.1.mod
    digest:
      kind: Sha256Sum
      value: 54812529e90caecfd1b3f7cd8c90152a10b174ecb9fb56904682440f21168174
  - kind: GoModule
    url: go_proxy:github.com/go-git/gcfg/@v/v1.5.1-0.20230307220236-3a3c6141e376.mod
    digest:
      kind: Sha256Sum
      value: 2f4d530de5e356bc1bf1510110d9ca0406d323b6cb941978e1dd7311d418ba8f
  - kind: GoModule
    url: go_proxy:github.com/go-git/go-billy/v5/@v/v5.9.2.mod
    digest:
      kind: Sha256Sum
      value: ca36abc546e8898d5bf3fc5eda190d6f3da852e88c66ec90406bd0cd51c84691
  - kind: GoModule
    url: go_proxy:github.com/go-git/go-git/v5/@v/v5.19.3.mod
    digest:
      kind: Sha256Sum
      value: a311444e53edee7d44ab3d0ebb5d16c1bad89ee8e8d4e51cbd9d98fc8b0b03d3
  - kind: GoModule
    url: go_proxy:github.com/go-logr/logr/@v/v1.4.4.mod
    digest:
      kind: Sha256Sum
      value: c496f30d700f02b49a1b50bc2486a27c2f74df3dce75d9db6d2d43975b381727
  - kind: GoModule
    url: go_proxy:github.com/go-logr/stdr/@v/v1.2.2.mod
    digest:
      kind: Sha256Sum
      value: 0812160f77474d8dbf692b7caaee7fd5508448c705d9b54b5a3496ac44468c2c
  - kind: GoModule
    url: go_proxy:github.com/go-ole/go-ole/@v/v1.3.0.mod
    digest:
      kind: Sha256Sum
      value: fcf0840f2ff50fbc3b5a54b9d4cb240c64d47003ab03e420aeff0057015a8953
  - kind: GoModule
    url: go_proxy:github.com/go-restruct/restruct/@v/v1.2.0-alpha.mod
    digest:
      kind: Sha256Sum
      value: 30f9fbe81822192daf615ed5caad8637cd48e7c5d480187e20987147c5bb048c
  - kind: GoModule
    url: go_proxy:github.com/go-viper/mapstructure/v2/@v/v2.5.0.mod
    digest:
      kind: Sha256Sum
      value: 5393fe364f1a200c6a84ee2c7bf727f02c9e0b1f844ca13b188ca925f4718b08
  - kind: GoModule
    url: go_proxy:github.com/gobwas/glob/@v/v0.2.3.mod
    digest:
      kind: Sha256Sum
      value: b5c6b172adc1878cd8e690ba9123b0a65753bacb38d87e6d683aca136d435578
  - kind: GoModule
    url: go_proxy:github.com/goccy/go-yaml/@v/v1.19.2.mod
    digest:
      kind: Sha256Sum
      value: 8bfcd303c773142077b4e9bf26b891a8bfbf9f31d8fcb75cbcfab6ea731545a7
  - kind: GoModule
    url: go_proxy:github.com/golang/groupcache/@v/v0.0.0-20241129210726-2c02b8208cf8.mod
    digest:
      kind: Sha256Sum
      value: 4e019acbe58a7af43d2316b6f825797636072cb48c31ea6ff7aae7d75ad51a89
  - kind: GoModule
    url: go_proxy:github.com/google/go-cmp/@v/v0.7.0.mod
    digest:
      kind: Sha256Sum
      value: 31c874a1d2a18e62b0550f823ce7a575c8dec7f8fd9d4fa1959bb12d7f7c0f14
  - kind: GoModule
    url: go_proxy:github.com/google/go-containerregistry/@v/v0.21.8.mod
    digest:
      kind: Sha256Sum
      value: a3cf71af62deff9240bf6a920454dd4d20b9cbaa99965594d1f9eeb86f48c338
  - kind: GoModule
    url: go_proxy:github.com/google/jsonschema-go/@v/v0.4.3.mod
    digest:
      kind: Sha256Sum
      value: 086d9173533b956699bab1acfe572713bb2f4e88b060e1c1daef5c20dd68cb85
  - kind: GoModule
    url: go_proxy:github.com/google/osv-scalibr/@v/v0.5.4-0.20261105012210-c80efcc25cd9.mod
    digest:
      kind: Sha256Sum
      value: 80d6677a1e8f938cf6adac62f872fe5ba70ee9291f61d5f3047c44bcb465ecd3
  - kind: GoModule
    url: go_proxy:github.com/google/uuid/@v/v1.6.0.mod
    digest:
      kind: Sha256Sum
      value: 73da47b6338b00a082fd451aa35a3273d3adc09b8e9bba98dab01091e402af6e
  - kind: GoModule
    url: go_proxy:github.com/gorilla/css/@v/v1.0.1.mod
    digest:
      kind: Sha256Sum
      value: c8ebcaf74e2ef78530fbe2f63aeedd6bd6ba8845f4b3537f77ea55c0fda0f55c
  - kind: GoModule
    url: go_proxy:github.com/ianlancetaylor/demangle/@v/v0.0.0-20261012173340-cbb8aaea4290.mod
    digest:
      kind: Sha256Sum
      value: 105d4d0c78c8205f85d53bc86b2bddc58430ce0f9dd37b72582bba7ff8de38bc
  - kind: GoModule
    url: go_proxy:github.com/icholy/digest/@v/v1.2.0.mod
    digest:
      kind: Sha256Sum
      value: 4d1cf03817d1c0676921fcb427b20673f759209b07c3087cb6a8768337d92ec3
  - kind: GoModule
    url: go_proxy:github.com/jbenet/go-context/@v/v0.0.0-20150711004518-d14ea06fba99.mod
    digest:
      kind: Sha256Sum
      value: e3ef3b37b30a0e4322bb36d30769363a0d43bf462ccdda464fa63862d1694f97
  - kind: GoModule
    url: go_proxy:github.com/jedib0t/go-pretty/v6/@v/v6.8.3.mod
    digest:
      kind: Sha256Sum
      value: f0cabaafb49c91c0ba136880990cef7a69c017512c7118f6fc42714f3473c9fd
  - kind: GoModule
    url: go_proxy:github.com/kevinburke/ssh_config/@v/v1.6.0.mod
    digest:
      kind: Sha256Sum
      value: 2a786cf387e46473d733cc5f3036ec692b1e882edd2709d9589c32808ea09275
  - kind: GoModule
    url: go_proxy:github.com/klauspost/compress/@v/v1.20.2.mod
    digest:
      kind: Sha256Sum
      value: 0d4e90d99acbc19eea5706e7390f8c925b26b1f5861385bb4f1321d454a1d48c
  - kind: GoModule
    url: go_proxy:github.com/kr/pretty/@v/v0.3.1.mod
    digest:
      kind: Sha256Sum
      value: 84f3e40803b1ebd4a802e55794b9997df0b173c4809e8572ff9042ec558ca1bc
  - kind: GoModule
    url: go_proxy:github.com/kr/text/@v/v0.2.0.mod
    digest:
      kind: Sha256Sum
      value: f63879b204f6ce895cea53594b814f5ac0af08486b33b1ca79c657384efbc726
  - kind: GoModule
    url: go_proxy:github.com/lucasb-eyer/go-colorful/@v/v1.4.1.mod
    digest:
      kind: Sha256Sum
      value: 84f9c38e9884ab013c837cb16aee139500d3d5c6ccab02439881db2ecf28f660
  - kind: GoModule
    url: go_proxy:github.com/lunixbochs/struc/@v/v0.0.0-20241101090106-8d528fa2c543.mod
    digest:
      kind: Sha256Sum
      value: 5df0a052d68c507fab382f0c829b8be94b086f5e4b13a4352494378544325322
  - kind: GoModule
    url: go_proxy:github.com/maruel/natural/@v/v1.3.0.mod
    digest:
      kind: Sha256Sum
      value: da971df8265df5c39d599b32e5d5b516dbd4a7a7eb423c9f36f0240caad9f246
  - kind: GoModule
    url: go_proxy:github.com/masahiro331/go-ext4-filesystem/@v/v0.0.0-20260423010602-fe51f5b5e52b.mod
    digest:
      kind: Sha256Sum
      value: 0276f7ed380611e9b22eb14d864a94c3cf1081597b756d93961be7d782e37fe7
  - kind: GoModule
    url: go_proxy:github.com/mattn/go-isatty/@v/v0.0.24.mod
    digest:
      kind: Sha256Sum
      value: 41b885f68c2fa4dfb26a8ffa30d095a931b27699b6b2b1974af3949400dc060f
  - kind: GoModule
    url: go_proxy:github.com/mattn/go-localereader/@v/v0.0.1.mod
    digest:
      kind: Sha256Sum
      value: f7e77590fe4e1f139df43931a85df4205026ea7110d9e0428c11653030fa5f64
  - kind: GoModule
    url: go_proxy:github.com/mattn/go-runewidth/@v/v0.0.27.mod
    digest:
      kind: Sha256Sum
      value: 9091c793e255036ba8ced617fa3225972a745eaee5cad4cf264c1576e5c1347e
  - kind: GoModule
    url: go_proxy:github.com/mattn/go-shellwords/@v/v1.0.14.mod
    digest:
      kind: Sha256Sum
      value: 29bfff16ff57b7dada64e6a74806d931549acce61cb70c458a389d099c2d0ec2
  - kind: GoModule
    url: go_proxy:github.com/michaelkedar/xml/@v/v0.0.0-20250626233154-4ec9e090d1cd.mod
    digest:
      kind: Sha256Sum
      value: d7971f2faeae89c0ca3eb0d52c77e50eda40e16c2593839909f26302b93f910d
  - kind: GoModule
    url: go_proxy:github.com/microcosm-cc/bluemonday/@v/v1.0.27.mod
    digest:
      kind: Sha256Sum
      value: 4e042dd3e15e847f65e8fabbd3601cfc063a58e840605f82fff22e908307c8e0
  - kind: GoModule
    url: go_proxy:github.com/micromdm/plist/@v/v0.2.2.mod
    digest:
      kind: Sha256Sum
      value: 3d0de058e301df5b1806987c78a5033d03aa932db48f6637c35b37b2112ac018
  - kind: GoModule
    url: go_proxy:github.com/moby/buildkit/@v/v0.32.2.mod
    digest:
      kind: Sha256Sum
      value: 0300fecc6a1249996522a6d6c3b4157b6bb9656e8bfd277b42edca52978fe1a1
  - kind: GoModule
    url: go_proxy:github.com/moby/docker-image-spec/@v/v1.3.1.mod
    digest:
      kind: Sha256Sum
      value: 33e250cdb2366d22879c64b08ae956c5f78b0d0910f8865cc1e9260bad64ec4b
  - kind: GoModule
    url: go_proxy:github.com/moby/moby/api/@v/v1.55.0.mod
    digest:
      kind: Sha256Sum
      value: 0068c13f211659f3d0f924882f8f1c35465e686fa23809c9ce1d7780fc396d34
  - kind: GoModule
    url: go_proxy:github.com/moby/moby/client/@v/v0.5.1.mod
    digest:
      kind: Sha256Sum
      value: 1cd463d9a3998fb9cebc657d12fb0dcba777d8a20168d23c7434b29472ee58ec
  - kind: GoModule
    url: go_proxy:github.com/modelcontextprotocol/go-sdk/@v/v1.8.0.mod
    digest:
      kind: Sha256Sum
      value: 8679c6a4a8447d6d2d7e3ac99e922161ba1a0eaa881d7666d503cc473cdbc8a3
  - kind: GoModule
    url: go_proxy:github.com/muesli/ansi/@v/v0.0.0-20230316100256-276c6243b2f6.mod
    digest:
      kind: Sha256Sum
      value: 2b1bf9e02f09e84b49a2a5e350911428530150f4c4fabf74da62114df33dbbc1
  - kind: GoModule
    url: go_proxy:github.com/muesli/cancelreader/@v/v0.2.2.mod
    digest:
      kind: Sha256Sum
      value: 4343f36dcc06d4ce4e170190062b5d224ff5be831f742531ec27a3d709378fe1
  - kind: GoModule
    url: go_proxy:github.com/muesli/reflow/@v/v0.3.0.mod
    digest:
      kind: Sha256Sum
      value: f193cfd78694efff82f6226c1252ca9d1826dd6dd2c2662422be4c4de2cdb739
  - kind: GoModule
    url: go_proxy:github.com/muesli/termenv/@v/v0.16.0.mod
    digest:
      kind: Sha256Sum
      value: 07581751f5b61fdae253960c3992898b64b6ad5573a69ba22ad249d7f0a889c1
  - kind: GoModule
    url: go_proxy:github.com/ncruces/go-strftime/@v/v1.0.0.mod
    digest:
      kind: Sha256Sum
      value: e5864a1dd9ac62bd778e7444e02e1e4130fa7c00d88eaea271c34f934e724f73
  - kind: GoModule
    url: go_proxy:github.com/opencontainers/go-digest/@v/v1.0.0.mod
    digest:
      kind: Sha256Sum
      value: 8de0250a4ba6811f7703fbb499ed889672597699f335b12f47d788d1df087b4a
  - kind: GoModule
    url: go_proxy:github.com/opencontainers/image-spec/@v/v1.1.1.mod
    digest:
      kind: Sha256Sum
      value: 1905f5f90061e422d1a23a8b3becf2b8847c4ae00704d44de2bb7f585fa0fed6
  - kind: GoModule
    url: go_proxy:github.com/ossf/osv-schema/bindings/go/@v/v0.0.0-20261026052736-6410c13304f9.mod
    digest:
      kind: Sha256Sum
      value: e915303bc68e958df3c26d6e7271b78be37ab8484aedfca2810c7341cc289546
  - kind: GoModule
    url: go_proxy:github.com/owenrumney/go-sarif/v3/@v/v3.3.2.mod
    digest:
      kind: Sha256Sum
      value: 47f4f963963dfce54c23b1264aaf0ee2be3eaeb0a1cd3d66d863a421053f808f
  - kind: GoModule
    url: go_proxy:github.com/package-url/packageurl-go/@v/v0.1.7.mod
    digest:
      kind: Sha256Sum
      value: 2da7fdc2b119960be5d0e6064dcb22ab829bb1de9417c9db5830065215a36cce
  - kind: GoModule
    url: go_proxy:github.com/pandatix/go-cvss/@v/v0.6.4.mod
    digest:
      kind: Sha256Sum
      value: 8a9d6b9cdae8dc8648aaadc7c4693d5a98ccb4b5c4fc5ccff4a4d6fdccf996b1
  - kind: GoModule
    url: go_proxy:github.com/pierrec/lz4/v4/@v/v4.1.27.mod
    digest:
      kind: Sha256Sum
      value: d32329505d5af04449fe6ba227a97d170e0c98a99c123bf7908ac4ff44ae0f4b
  - kind: GoModule
    url: go_proxy:github.com/pjbgf/sha1cd/@v/v0.7.0.mod
    digest:
      kind: Sha256Sum
      value: 3eeda8551e3e293424ee4cc529d10432d06d7a68b77d90aa534f64ba54cc5454
  - kind: GoModule
    url: go_proxy:github.com/pkg/errors/@v/v0.9.1.mod
    digest:
      kind: Sha256Sum
      value: df28c6a823f181d76179697177c0c5943c6ffb38f3c10b2dc53be360ee7d4589
  - kind: GoModule
    url: go_proxy:github.com/pkg/xattr/@v/v0.4.12.mod
    digest:
      kind: Sha256Sum
      value: bdc3ea23d708aade2f035ef5244b8f460c82682c1e163a05461611b89990e251
  - kind: GoModule
    url: go_proxy:github.com/planetscale/vtprotobuf/@v/v0.6.1-0.20240319094008-0393e58bdf10.mod
    digest:
      kind: Sha256Sum
      value: e94bb181f3ef78dec16609d3c2d276c75c5668694bdc97b72bac22c84528debb
  - kind: GoModule
    url: go_proxy:github.com/remyoudompheng/bigfft/@v/v0.0.0-20230129092748-24d4a6f8daec.mod
    digest:
      kind: Sha256Sum
      value: 6401dabced8e037796108d28559bffc06d135305cd6222c3cea153767ea95680
  - kind: GoModule
    url: go_proxy:github.com/rivo/uniseg/@v/v0.4.7.mod
    digest:
      kind: Sha256Sum
      value: a1e174890fc9f252450211fadeb53756f9cf5ab7b19697765f9fb255f81ea898
  - kind: GoModule
    url: go_proxy:github.com/rogpeppe/go-internal/@v/v1.15.0.mod
    digest:
      kind: Sha256Sum
      value: 1ffa3f3c1d2ad9d40513af6610c21d52ae2839628679854df421212f6a29ec27
  - kind: GoModule
    url: go_proxy:github.com/rust-secure-code/go-rustaudit/@v/v0.0.0-20250226111315-e20ec32e963c.mod
    digest:
      kind: Sha256Sum
      value: 2eeb09282cbf4e8634029c3613cae2832f2dc7734ceea264c4c0ed543f2132c9
  - kind: GoModule
    url: go_proxy:github.com/saferwall/pe/@v/v1.6.5.mod
    digest:
      kind: Sha256Sum
      value: a81d297d828f4d0117cb818dacb222bc2ee57a33a47bb37af2cdb131ae4b0642
  - kind: GoModule
    url: go_proxy:github.com/sahilm/fuzzy/@v/v0.1.3.mod
    digest:
      kind: Sha256Sum
      value: 65031811e1fd30cf3402438ba852756d95990a9e7e4a466592b9e92ab6e22f8a
  - kind: GoModule
    url: go_proxy:github.com/santhosh-tekuri/jsonschema/v6/@v/v6.0.2.mod
    digest:
      kind: Sha256Sum
      value: 48f5e138633d4d85be9f6cd447e2db32aabd00e530a00a45985695af5e0372e5
  - kind: GoModule
    url: go_proxy:github.com/segmentio/asm/@v/v1.2.1.mod
    digest:
      kind: Sha256Sum
      value: 5e264ef0fc0925322b3ef8bcdb634c9a3b08090f907f50ce6dfc648fa9e83f2c
  - kind: GoModule
    url: go_proxy:github.com/segmentio/encoding/@v/v0.5.4.mod
    digest:
      kind: Sha256Sum
      value: a0a3b5a6e232bf6781e7977a7165d6ccc82e18b3359048e7fb5e808abf1b7d4d
  - kind: GoModule
    url: go_proxy:github.com/sergi/go-diff/@v/v1.4.0.mod
    digest:
      kind: Sha256Sum
      value: 1eb393c3f9006362fe3044798890e578af6ae6d69270aaf3eb9bfe819ce654db
  - kind: GoModule
    url: go_proxy:github.com/shirou/gopsutil/@v/v3.21.11+incompatible.mod
    digest:
      kind: Sha256Sum
      value: 2bb7d1e998eeb28fa43f6bafa6ee1e6a3b0cc6bad18cf2584abffc85652ac4ee
  - kind: GoModule
    url: go_proxy:github.com/sirupsen/logrus/@v/v1.9.4.mod
    digest:
      kind: Sha256Sum
      value: 65bd5913b818d483bd0c92041e39a4ec17766f8907318aea02df8658f46324e8
  - kind: GoModule
    url: go_proxy:github.com/skeema/knownhosts/@v/v1.3.2.mod
    digest:
      kind: Sha256Sum
      value: db4eaf6e9a79ff0685614e34366e48fa21e2ef5fb582ac2052677dfcf8b0b157
  - kind: GoModule
    url: go_proxy:github.com/spdx/gordf/@v/v0.0.0-20250128162952-000978ccd6fb.mod
    digest:
      kind: Sha256Sum
      value: 78a5289e06105179b005562dbc589830d2e71eb160ac4515e51890e5f14c8189
  - kind: GoModule
    url: go_proxy:github.com/spdx/tools-golang/@v/v0.5.7.mod
    digest:
      kind: Sha256Sum
      value: 0ddfea1ad8d8e0a3506d7db52c21985de230758e98d4526a173e8531422c0f38
  - kind: GoModule
    url: go_proxy:github.com/tidwall/gjson/@v/v1.20.0.mod
    digest:
      kind: Sha256Sum
      value: 22020a837a3000290937b1795ea2505a97de8ebf0ec6bd7b8e56bd3c9be66e28
  - kind: GoModule
    url: go_proxy:github.com/tidwall/jsonc/@v/v0.3.3.mod
    digest:
      kind: Sha256Sum
      value: 80df84f723fc4c57a9eec13febae32008679c26d69d5fc1a6754382fd480e7af
  - kind: GoModule
    url: go_proxy:github.com/tidwall/match/@v/v1.2.0.mod
    digest:
      kind: Sha256Sum
      value: 02364e515327d9988d1f6bd37af9c584f8b98d3b4f43f9e1f18e26d76aec0f44
  - kind: GoModule
    url: go_proxy:github.com/tidwall/pretty/@v/v1.2.2.mod
    digest:
      kind: Sha256Sum
      value: 6e5c5fa493d8f18e8974b38ed63e8c71863cce59e659d98d0ef8417bf81e3ecf
  - kind: GoModule
    url: go_proxy:github.com/tidwall/sjson/@v/v1.2.5.mod
    digest:
      kind: Sha256Sum
      value: 38b09323ab8ef8f803b3d86bae2c94765d3815a2d5b751fd4f07039f4551cc6f
  - kind: GoModule
    url: go_proxy:github.com/tink-crypto/tink-go/v2/@v/v2.7.0.mod
    digest:
      kind: Sha256Sum
      value: d67637668e6d3e795b9bb303bdb104288d88d124bf2fbbe9de7ea7425587103f
  - kind: GoModule
    url: go_proxy:github.com/tklauser/go-sysconf/@v/v0.4.0.mod
    digest:
      kind: Sha256Sum
      value: 29bd839dcc5736ea8ebc4c2f4013db82c57cacd15a010d389579cde04f3336ae
  - kind: GoModule
    url: go_proxy:github.com/tklauser/numcpus/@v/v0.12.0.mod
    digest:
      kind: Sha256Sum
      value: 03fbc174711500112a8ab1675893ecdbea2e155f3dcd5e357fb4a5619ed6b0d4
  - kind: GoModule
    url: go_proxy:github.com/tonistiigi/go-csvvalue/@v/v0.0.0-20240814133006-030d3b2625d0.mod
    digest:
      kind: Sha256Sum
      value: 97f06b0cba184cb51f82521ae50cb888d6a191c832150bea1c07a577a5d44846
  - kind: GoModule
    url: go_proxy:github.com/ulikunitz/xz/@v/v0.5.16.mod
    digest:
      kind: Sha256Sum
      value: 2e46a9bedbed1417b347937057054c463a5e9ab62f4ffbd512d9c8bb76e98db2
  - kind: GoModule
    url: go_proxy:github.com/urfave/cli/v3/@v/v3.14.0.mod
    digest:
      kind: Sha256Sum
      value: eba867754757a1c553dfeee81965d7364ab88c48788283c72cebb1747764da5d
  - kind: GoModule
    url: go_proxy:github.com/xanzy/ssh-agent/@v/v0.3.3.mod
    digest:
      kind: Sha256Sum
      value: 1ce1cc509889b738c1f63dbfcc5ad522ceb63272d9deff6eef7499ed301aa125
  - kind: GoModule
    url: go_proxy:github.com/xeipuuv/gojsonpointer/@v/v0.0.0-20190905194746-02993c407bfb.mod
    digest:
      kind: Sha256Sum
      value: a97ded77d2029dcadd1f696ba09a2eda15f129a1bea5194274bcb61aee75b5d9
  - kind: GoModule
    url: go_proxy:github.com/xeipuuv/gojsonreference/@v/v0.0.0-20180127040603-bd5ef7bd5415.mod
    digest:
      kind: Sha256Sum
      value: 2970656211ecb91988833502dbe64c5f375f31b2f8bb6daa6fc71ee5c0855044
  - kind: GoModule
    url: go_proxy:github.com/xeipuuv/gojsonschema/@v/v1.2.0.mod
    digest:
      kind: Sha256Sum
      value: b41c940caaab3bb3c1af6d275ccb4716989084a1f3c5c5fe4757f8651de5afc2
  - kind: GoModule
    url: go_proxy:github.com/xhit/go-str2duration/v2/@v/v2.1.0.mod
    digest:
      kind: Sha256Sum
      value: 65b4b4d7f142b91f81e2b42631f980360021a72a6801825109b3e585edd02553
  - kind: GoModule
    url: go_proxy:github.com/xo/terminfo/@v/v0.0.0-20220910002029-abceb7e1c41e.mod
    digest:
      kind: Sha256Sum
      value: 719d53397f5ee7a2a8a47b06acd9ddae063cbe3d6caf38edeca477c2d1fe2cce
  - kind: GoModule
    url: go_proxy:github.com/yosida95/uritemplate/v3/@v/v3.0.2.mod
    digest:
      kind: Sha256Sum
      value: 69ed795569c71e422d2d21ca310bce1ebe181effe139fdc8a134fa3acd6c478a
  - kind: GoModule
    url: go_proxy:github.com/yuin/goldmark-emoji/@v/v1.0.6.mod
    digest:
      kind: Sha256Sum
      value: 1932f18ec83e8073b275a4d41ce10f856b44a5063235dabcb07b5b34cfff02b8
  - kind: GoModule
    url: go_proxy:github.com/yuin/goldmark/@v/v1.8.5.mod
    digest:
      kind: Sha256Sum
      value: b78e60b0c300e7d48dcc234a7e0103eeb8d6cf40ca9cde9d01e6a3a7f1086045
  - kind: GoModule
    url: go_proxy:github.com/yusufpapurcu/wmi/@v/v1.2.4.mod
    digest:
      kind: Sha256Sum
      value: ff2a9c8c99aaed6bc6984eae094a9e8cdc36f6ab2ef2c56779dd98ecc583135b
  - kind: GoModule
    url: go_proxy:go.etcd.io/bbolt/@v/v1.5.0.mod
    digest:
      kind: Sha256Sum
      value: 3acf3f97a95e4028c1bbe27e58a1a6ba4ec8fc510e17d3166c47c50f601b4a2e
  - kind: GoModule
    url: go_proxy:go.opentelemetry.io/auto/sdk/@v/v1.2.1.mod
    digest:
      kind: Sha256Sum
      value: 6c4d2df014d59fd6555897fd4e5bbc0316e8df4c737fbfdde5cd119fdefeeea9
  - kind: GoModule
    url: go_proxy:go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/@v/v0.70.0.mod
    digest:
      kind: Sha256Sum
      value: 1066ff9ecc445bab0cd0857b9aa749f136e8ba3d6918eb08f974a1bf3f8103bc
  - kind: GoModule
    url: go_proxy:go.opentelemetry.io/otel/@v/v1.45.0.mod
    digest:
      kind: Sha256Sum
      value: 5fbed2c6d71624dd869501048d52436832e3d8b2da7bea539d44b982b62d6fe0
  - kind: GoModule
    url: go_proxy:go.opentelemetry.io/otel/metric/@v/v1.45.0.mod
    digest:
      kind: Sha256Sum
      value: d5abe3973aa7d3f6c4302641b1f95a13fa9976a46d79717020f7583748842998
  - kind: GoModule
    url: go_proxy:go.opentelemetry.io/otel/trace/@v/v1.45.0.mod
    digest:
      kind: Sha256Sum
      value: 8deb258105daad00ccd15be702c3afd78517327191cb0c4903dec33ff466c92d
  - kind: GoModule
    url: go_proxy:go.uber.org/multierr/@v/v1.11.0.mod
    digest:
      kind: Sha256Sum
      value: 58a30dde730aba57576715d90841774f6344a879fec5633a2c66b37ec30c11f0
  - kind: GoModule
    url: go_proxy:go.uber.org/zap/@v/v1.28.0.mod
    digest:
      kind: Sha256Sum
      value: 19c87bf7cc2c86609e42258a6b08dbb28da81b9fbc33e2af40c6e785573d5d17
  - kind: GoModule
    url: go_proxy:go.yaml.in/yaml/v2/@v/v2.4.4.mod
    digest:
      kind: Sha256Sum
      value: 4bba343588a8a81f5cc4884d3d7ac7f5dd612b21af59d3f2ebea37ec476079bb
  - kind: GoModule
    url: go_proxy:go.yaml.in/yaml/v4/@v/v4.0.0-rc.7.mod
    digest:
      kind: Sha256Sum
      value: d42a0149da4645f3fc9d08f5b4d4302df9234908c48e622c5aeef16c68edebd5
  - kind: GoModule
    url: go_proxy:golang.org/x/crypto/@v/v0.58.0.mod
    digest:
      kind: Sha256Sum
      value: 938883ec4a74e7fc05c46269e924dda334c2b7ca7ca219e4d27ca56d1891ccd3
  - kind: GoModule
    url: go_proxy:golang.org/x/mod/@v/v0.42.0.mod
    digest:
      kind: Sha256Sum
      value: 92defdc3237bf4f850e9e5c7d7ad6d06b9ef6a10caa12c2c8e54150a4c370270
  - kind: GoModule
    url: go_proxy:golang.org/x/net/@v/v0.62.0.mod
    digest:
      kind: Sha256Sum
      value: 7bbcec6b6af859939ec01bbe5234e556c867bf80e171abc23ad16c2c8e3951fe
  - kind: GoModule
    url: go_proxy:golang.org/x/oauth2/@v/v0.36.0.mod
    digest:
      kind: Sha256Sum
      value: 90ff0f4a036bc1c24e6c006fe18d97d6d11683431f8f197b7ad48a341da72682
  - kind: GoModule
    url: go_proxy:golang.org/x/sync/@v/v0.24.0.mod
    digest:
      kind: Sha256Sum
      value: febf4fed5dc12c0de24528f7065bf071cc74a2424070194aaf24617b91066cda
  - kind: GoModule
    url: go_proxy:golang.org/x/sys/@v/v0.49.0.mod
    digest:
      kind: Sha256Sum
      value: 9522f4c9806d1c26586ea80fa56292929bd295865e71981927f52996c6b1c831
  - kind: GoModule
    url: go_proxy:golang.org/x/telemetry/@v/v0.0.0-20261009151841-97e8ea77aa2a.mod
    digest:
      kind: Sha256Sum
      value: b3db3a6093c95190ba4c799a41b18ed8cab5f9d5329e6d327eecd8bb54d7ff76
  - kind: GoModule
    url: go_proxy:golang.org/x/term/@v/v0.47.0.mod
    digest:
      kind: Sha256Sum
      value: cfc437810b8822bf57ca3ea4e39ebd418dd5671d72f2b110ce5a3164fa541b0b
  - kind: GoModule
    url: go_proxy:golang.org/x/text/@v/v0.43.0.mod
    digest:
      kind: Sha256Sum
      value: 63270b8ca6290a720212e1d6e58b8d12a8aa315a1cb960411d7ec2998c0aab59
  - kind: GoModule
    url: go_proxy:golang.org/x/time/@v/v0.15.0.mod
    digest:
      kind: Sha256Sum
      value: 6149b2491c92f67545fc5da0083a791e369b3f99670d30f52bde0604c48c9e69
  - kind: GoModule
    url: go_proxy:golang.org/x/tools/@v/v0.52.0.mod
    digest:
      kind: Sha256Sum
      value: b4272bcb2c99901b1878e04a56c8a584ac1dce9d5844a3c1cc68a627546fe6fe
  - kind: GoModule
    url: go_proxy:golang.org/x/vuln/@v/v1.6.0.mod
    digest:
      kind: Sha256Sum
      value: b4381c30c8be4428aeb108267c75155f6ac1ac2dd2a63aca83101ef1bf3db537
  - kind: GoModule
    url: go_proxy:golang.org/x/xerrors/@v/v0.0.0-20240903120638-7835f813f4da.mod
    digest:
      kind: Sha256Sum
      value: 097a3f1d073ed5fb8ccdeaaa7da6828ee60cbf4c49e243f73ff6ce59625dfa09
  - kind: GoModule
    url: go_proxy:google.golang.org/genproto/googleapis/api/@v/v0.0.0-20260817212433-ac3dfec99bb1.mod
    digest:
      kind: Sha256Sum
      value: 08892ac0667f165bc8bc0fd134be3287c8e261bf6fd236740af35a3c7c619ffb
  - kind: GoModule
    url: go_proxy:google.golang.org/genproto/googleapis/rpc/@v/v0.0.0-20260817212433-ac3dfec99bb1.mod
    digest:
      kind: Sha256Sum
      value: 67711b6f9adde7cd2d23ba3512bf371ddc628709a4b7ff598794e638607e9987
  - kind: GoModule
    url: go_proxy:google.golang.org/grpc/@v/v1.85.0.mod
    digest:
      kind: Sha256Sum
      value: cefeec472544b4affa46dcf08a02af961f421f57d4514373713a2d7fd54dcaed
  - kind: GoModule
    url: go_proxy:google.golang.org/protobuf/@v/v1.36.12.mod
    digest:
      kind: Sha256Sum
      value: a75c105a852fbd8da8d8cfac09c2eab9a206cfd27ed37c973737e23f632ca96e
  - kind: GoModule
    url: go_proxy:gopkg.in/dnaeon/go-vcr.v4/@v/v4.0.7.mod
    digest:
      kind: Sha256Sum
      value: d5655fc729b2a781b1f36c313579cd80b074b7d1a42985c02aff9bfd6c884b8e
  - kind: GoModule
    url: go_proxy:gopkg.in/ini.v1/@v/v1.67.3.mod
    digest:
      kind: Sha256Sum
      value: bbaaff022cbbee98f0c099e7217d0bde01261a518980d118423ed656406a5abf
  - kind: GoModule
    url: go_proxy:gopkg.in/warnings.v0/@v/v0.1.2.mod
    digest:
      kind: Sha256Sum
      value: cce6c236be750d350cb9126c5b4c4dfe039945fde031eaf83601923bf117bebc
  - kind: GoModule
    url: go_proxy:gopkg.in/yaml.v3/@v/v3.0.1.mod
    digest:
      kind: Sha256Sum
      value: 21579860a20306fcf43b1bd234d1fba319499c77611b71c05f9bf3ba90dab939
  - kind: GoModule
    url: go_proxy:modernc.org/libc/@v/v1.74.4.mod
    digest:
      kind: Sha256Sum
      value: 2904d69c00aef038bbe75d81a30f01ae2891d5f6ebd814be6a8221255483dfff
  - kind: GoModule
    url: go_proxy:modernc.org/mathutil/@v/v1.7.1.mod
    digest:
      kind: Sha256Sum
      value: 68683385203fe0204d853bae60003c336716d2526e7149bf58f51815a2479fd8
  - kind: GoModule
    url: go_proxy:modernc.org/memory/@v/v1.11.0.mod
    digest:
      kind: Sha256Sum
      value: e9890d3b9794d40a3703aa9809edc4e131cbb55a2831b602314076e91c5ace97
  - kind: GoModule
    url: go_proxy:modernc.org/sqlite/@v/v1.56.0.mod
    digest:
      kind: Sha256Sum
      value: 16d48f22c12f295bdb2b457473223bfa96c2b480d0bfb3243e8ecc577f49f10a
  - kind: GoModule
    url: go_proxy:osv.dev/bindings/go/@v/v0.0.0-20261007022941-648e046ef8ee.mod
    digest:
      kind: Sha256Sum
      value: 0135a0425ebb43e3d2c9a60b4f4410706782df17c25bb3f8e3412bb86f362d76
  - kind: GoModule
    url: go_proxy:sigs.k8s.io/yaml/@v/v1.6.0.mod
    digest:
      kind: Sha256Sum
      value: 4e3c3c1d49a6652440ff70fb475e54ae46be2cab63cc46721b3c02fd9cca985e
  - kind: GoModule
    url: go_proxy:www.velocidex.com/golang/go-ntfs/@v/v0.2.1.mod
    digest:
      kind: Sha256Sum
      value: 696b14268b7cbc103b038f7e55b44ea4daadc7054988721a55777f9cd45562fc
  - kind: GoModule
    url: go_proxy:www.velocidex.com/golang/regparser/@v/v0.0.0-20250203141505-31e704a67ef7.mod
    digest:
      kind: Sha256Sum
      value: 60561dac036e2315b267108d6a8f3cfa4d8b1aa56f2c20474af1db964816df65
  - kind: GoPackage
    url: go_proxy:bitbucket.org/creachadair/stringset/@v/v0.0.14.zip
    digest:
      kind: Sha256Sum
      value: d7365878cb8a70a2e212fe891095d5a6f9c4a30d899f583ea6a9c76483b6c41c
  - kind: GoPackage
    url: go_proxy:charm.land/glamour/v2/@v/v2.0.1.zip
    digest:
      kind: Sha256Sum
      value: c4a98f4e576cce274b8724ff6a8e71d8b2c022a1bc4b468e82725063d8f1c039
  - kind: GoPackage
    url: go_proxy:charm.land/lipgloss/v2/@v/v2.0.6.zip
    digest:
      kind: Sha256Sum
      value: 26b77e3a8159d4d084d04a32c63db22cf9a48553d3eee1b488e478b1bb592c23
  - kind: GoPackage
    url: go_proxy:cloud.google.com/go/compute/metadata/@v/v0.9.0.zip
    digest:
      kind: Sha256Sum
      value: f97e35d1c96239b8574054a77e312c95d2c82a89c21daf46ffeaea6d5fc59eca
  - kind: GoPackage
    url: go_proxy:dario.cat/mergo/@v/v1.0.2.zip
    digest:
      kind: Sha256Sum
      value: 67d2e9d83ca57d3a8ce1a0e0e626a7c03753b3966b58b41b95e97ca4e7b2c640
  - kind: GoPackage
    url: go_proxy:deps.dev/api/v3/@v/v3.0.0-20260811035547-133c155ce203.zip
    digest:
      kind: Sha256Sum
      value: 6b9bfac967844956b400a97f20dd1ad9407119bf32d0f6ede29f74a1798c402f
  - kind: GoPackage
    url: go_proxy:deps.dev/api/v3alpha/@v/v0.0.0-20260811035547-133c155ce203.zip
    digest:
      kind: Sha256Sum
      value: c5e0c0c16b766dd83e9dbece0dba441bfde4dc6045595d40fe44e0624dd1ea4e
  - kind: GoPackage
    url: go_proxy:deps.dev/util/maven/@v/v0.0.0-20260928000106-0e158e8db197.zip
    digest:
      kind: Sha256Sum
      value: 07cad3fcc54b37678b9eb8a396465fd7930444a4153b175495f756d3e2061c9d
  - kind: GoPackage
    url: go_proxy:deps.dev/util/pypi/@v/v0.0.0-20260727054525-2946ae4a6141.zip
    digest:
      kind: Sha256Sum
      value: 4c9d2733e4fff1d428d1e68061b9f047019b7d5ef827c8583faa8e02a97b6902
  - kind: GoPackage
    url: go_proxy:deps.dev/util/resolve/@v/v0.0.0-20260727054525-2946ae4a6141.zip
    digest:
      kind: Sha256Sum
      value: c07173425337f570040b50758fee08373fc91817b266ccf95890cfcf22e34f57
  - kind: GoPackage
    url: go_proxy:deps.dev/util/semver/@v/v0.0.0-20260727054525-2946ae4a6141.zip
    digest:
      kind: Sha256Sum
      value: 1e7c84fcfb3df5a9886f1c2e1bab6d3c81eda35f41a84ed301ab558f709b91c2
  - kind: GoPackage
    url: go_proxy:github.com/!burnt!sushi/toml/@v/v1.6.0.zip
    digest:
      kind: Sha256Sum
      value: 01f03d6c3f4bfee108bda3202407b54ac0c295b8302a1315512f12ac05011fd8
  - kind: GoPackage
    url: go_proxy:github.com/!cyclone!d!x/cyclonedx-go/@v/v0.12.0.zip
    digest:
      kind: Sha256Sum
      value: d40307bf6f8cbe7f295909d17ac4e2127ef204e82fb9e37397a59f91fd220ff3
  - kind: GoPackage
    url: go_proxy:github.com/!gehirn!inc/crypt/@v/v0.0.0-20230320061759-8cc1b52080c5.zip
    digest:
      kind: Sha256Sum
      value: bf4413da2ccf5f498ae214b83f0b6095ac4463f967cdb7fe14a5803c593a886f
  - kind: GoPackage
    url: go_proxy:github.com/!microsoft/go-winio/@v/v0.6.3-0.20251027160822-ad3df93bed29.zip
    digest:
      kind: Sha256Sum
      value: 6507326885292057ef1bf96a9d6a9300b1695f88a49b34f77fcfdf2a219c276c
  - kind: GoPackage
    url: go_proxy:github.com/!proton!mail/go-crypto/@v/v1.4.1.zip
    digest:
      kind: Sha256Sum
      value: 70bbdc0f9e926738193aed968f7901efab41493752277c4c94c9b751aa55c42a
  - kind: GoPackage
    url: go_proxy:github.com/!velocidex/json/@v/v0.0.0-20220224052537-92f3c0326e5a.zip
    digest:
      kind: Sha256Sum
      value: 3c19a326778ae93b6969ea4cb0f6300427552a94ed06be29c12a7fa61c9721b0
  - kind: GoPackage
    url: go_proxy:github.com/!velocidex/ordereddict/@v/v0.0.0-20250821063524-02dc06e46238.zip
    digest:
      kind: Sha256Sum
      value: 2ad246b3ef99f2ce0bcbe200b056d03645e3643c1878efaee05b5f6067845f77
  - kind: GoPackage
    url: go_proxy:github.com/!velocidex/yaml/v2/@v/v2.2.8.zip
    digest:
      kind: Sha256Sum
      value: b2a06b04a4e78bbb338dff7a9ed1f8dd0f0289e7e1ab2f2ad45df57ce8a4d007
  - kind: GoPackage
    url: go_proxy:github.com/aead/serpent/@v/v0.0.0-20160714141033-fba169763ea6.zip
    digest:
      kind: Sha256Sum
      value: 182f9024516f6118e999504016649740629aa946420f7aa6cac2ab135f95869d
  - kind: GoPackage
    url: go_proxy:github.com/agext/levenshtein/@v/v1.2.3.zip
    digest:
      kind: Sha256Sum
      value: f24dcae174b3418f6340fb8f54797788a71130b960da4f07d3e08206cbcbdc02
  - kind: GoPackage
    url: go_proxy:github.com/alecthomas/chroma/v2/@v/v2.19.0.zip
    digest:
      kind: Sha256Sum
      value: fc03b21c36ac2630e30647afcf2221b15e369104548255e5f3f5dcf50935bdf2
  - kind: GoPackage
    url: go_proxy:github.com/anchore/go-lzo/@v/v0.1.0.zip
    digest:
      kind: Sha256Sum
      value: 74e5636203039daeb2339a7953b653d39a1d15c23856e74135e6c5f9fe749216
  - kind: GoPackage
    url: go_proxy:github.com/anchore/go-struct-converter/@v/v0.1.0.zip
    digest:
      kind: Sha256Sum
      value: d59da72ec5a33286bf91e47055e3a526474f9ee2755735be7221dad0540dc88c
  - kind: GoPackage
    url: go_proxy:github.com/atotto/clipboard/@v/v0.1.4.zip
    digest:
      kind: Sha256Sum
      value: d67b2c36c662751309fd2ec351df3651584bea840bd27be9a90702c3a238b43f
  - kind: GoPackage
    url: go_proxy:github.com/aymanbagabas/go-osc52/v2/@v/v2.0.1.zip
    digest:
      kind: Sha256Sum
      value: 939ebf2a5481f2172e1a5e0c318d05aef5b6d950a960556216c3da7879a927f8
  - kind: GoPackage
    url: go_proxy:github.com/aymerick/douceur/@v/v0.2.0.zip
    digest:
      kind: Sha256Sum
      value: dcbf69760cc1a8b32384495438e1086e4c3d669b2ebc0debd92e1865ffd6be60
  - kind: GoPackage
    url: go_proxy:github.com/ayoubfaouzi/pkcs7/@v/v0.2.3.zip
    digest:
      kind: Sha256Sum
      value: aa5ac750dad3d1885e1d2c6379463aef774339f5897fc1178f4ccbbd0cb375e7
  - kind: GoPackage
    url: go_proxy:github.com/bazelbuild/buildtools/@v/v0.0.0-20260716142318-04cf7de1434f.zip
    digest:
      kind: Sha256Sum
      value: 59b460c2486aad5f5ccebd018969eb447aef127aecc6b30f5b706d245663e719
  - kind: GoPackage
    url: go_proxy:github.com/canonical/chisel-manifest/@v/v1.2.0.zip
    digest:
      kind: Sha256Sum
      value: ea4ae8e5d873c087f12b434f279b359bb903aa8bfe6000f14270bf2b288812a5
  - kind: GoPackage
    url: go_proxy:github.com/cespare/xxhash/v2/@v/v2.3.0.zip
    digest:
      kind: Sha256Sum
      value: 145a26cdc7c49db566017b807c4989ee7f7ddeb569423e9cb99f995fac3621d3
  - kind: GoPackage
    url: go_proxy:github.com/charmbracelet/bubbles/@v/v1.0.0.zip
    digest:
      kind: Sha256Sum
      value: b245dafe1f179d4f0ce17b950ce12ac884ab0c7f69fd2d2f282be68e373d5468
  - kind: GoPackage
    url: go_proxy:github.com/charmbracelet/bubbletea/@v/v1.3.10.zip
    digest:
      kind: Sha256Sum
      value: 8afc524c11d18878b0ac3426fd3318fdf05ad576e65883c597996296c1b27117
  - kind: GoPackage
    url: go_proxy:github.com/charmbracelet/colorprofile/@v/v0.4.3.zip
    digest:
      kind: Sha256Sum
      value: 656472ff48f01a098418a31667f3253cf34e04d4e1cb6c1a0a80f76ad370b689
  - kind: GoPackage
    url: go_proxy:github.com/charmbracelet/lipgloss/@v/v1.1.1-0.20250404203927-76690c660834.zip
    digest:
      kind: Sha256Sum
      value: 626c107b5c002b297a36aab58949904266eac5c6a030face80a771084bdb279a
  - kind: GoPackage
    url: go_proxy:github.com/charmbracelet/ultraviolet/@v/v0.0.0-20260811164956-006e29f97886.zip
    digest:
      kind: Sha256Sum
      value: f05a2aac1310f73700c7587db28429dacd345b1d68ca50c05048f9ac989c0f7f
  - kind: GoPackage
    url: go_proxy:github.com/charmbracelet/x/ansi/@v/v0.11.8.zip
    digest:
      kind: Sha256Sum
      value: ac0870e7be61cbffe23d06404c77cfd43e11e162e1c79a4bf3bfaf57036d7407
  - kind: GoPackage
    url: go_proxy:github.com/charmbracelet/x/cellbuf/@v/v0.0.15.zip
    digest:
      kind: Sha256Sum
      value: 2c5c421edef869c7f4b7b3fa29530a66897134764d95a750eed59ed5886d84f7
  - kind: GoPackage
    url: go_proxy:github.com/charmbracelet/x/exp/slice/@v/v0.0.0-20260803091719-3755ebad01b1.zip
    digest:
      kind: Sha256Sum
      value: 4546f5d012dfcf942f02f6951b3bad66d9d1fb800d56529ff77c83b9eb79e0f9
  - kind: GoPackage
    url: go_proxy:github.com/charmbracelet/x/term/@v/v0.2.2.zip
    digest:
      kind: Sha256Sum
      value: 0452a430f7e6882393f81ba19a70a63709960acb9743e1199a7b04d908e6b506
  - kind: GoPackage
    url: go_proxy:github.com/charmbracelet/x/termios/@v/v0.1.1.zip
    digest:
      kind: Sha256Sum
      value: 3dd9823ed5db08d398c276e216e4150560d3a6894814c4404251b4210b22abed
  - kind: GoPackage
    url: go_proxy:github.com/charmbracelet/x/windows/@v/v0.2.2.zip
    digest:
      kind: Sha256Sum
      value: fb3f82357ad9a8a25a42dfa1880434149dd6fcc43e0b32a03664f72082ce5c2f
  - kind: GoPackage
    url: go_proxy:github.com/clipperhouse/displaywidth/@v/v0.11.0.zip
    digest:
      kind: Sha256Sum
      value: 27830c91cdfb2a648748db21f7a2734dcb50d21c620edde51d488ba4e7967e3d
  - kind: GoPackage
    url: go_proxy:github.com/clipperhouse/uax29/v2/@v/v2.7.0.zip
    digest:
      kind: Sha256Sum
      value: 67b1278f1ffb4e4d783a390e48fe7396864650138e785d4b4bfca5914333f761
  - kind: GoPackage
    url: go_proxy:github.com/cloudflare/circl/@v/v1.6.4.zip
    digest:
      kind: Sha256Sum
      value: bc44d9316fad1a8657714cbf91ed2103bcc47934765e8ee471e174e8722e9242
  - kind: GoPackage
    url: go_proxy:github.com/compose-spec/compose-go/v2/@v/v2.14.0.zip
    digest:
      kind: Sha256Sum
      value: f54927905e5d2ae194da4c9b66e642ab26e6e35986d130514269e5ad5d561434
  - kind: GoPackage
    url: go_proxy:github.com/containerd/errdefs/@v/v1.0.0.zip
    digest:
      kind: Sha256Sum
      value: b4ef42c38d00f2c81cf3e69646549b7f5dc8fb72de9402d7b391963dc0ac9162
  - kind: GoPackage
    url: go_proxy:github.com/containerd/errdefs/pkg/@v/v0.3.0.zip
    digest:
      kind: Sha256Sum
      value: 593bf56f1991517e493510815d8fc6d344b8550fbfb3de56812f015096aab24f
  - kind: GoPackage
    url: go_proxy:github.com/containerd/typeurl/v2/@v/v2.3.0.zip
    digest:
      kind: Sha256Sum
      value: 243aa4979ace10e7aff8300ccc32beb72460fb0afb1c9a51a72b79e0f4e1be22
  - kind: GoPackage
    url: go_proxy:github.com/cyphar/filepath-securejoin/@v/v0.7.0.zip
    digest:
      kind: Sha256Sum
      value: 601684f1d3cfc8391cbaf7e5973b0485db6a5037426d9cccf47935ca0a4d65dd
  - kind: GoPackage
    url: go_proxy:github.com/davecgh/go-spew/@v/v1.1.2-0.20180830191138-d8f796af33cc.zip
    digest:
      kind: Sha256Sum
      value: b4d0923b169b194f0016ec46f3df1ab0c68e27999743e43fe2de59ecb2484128
  - kind: GoPackage
    url: go_proxy:github.com/deitch/magic/@v/v0.0.0-20240306090643-c67ab88f10cb.zip
    digest:
      kind: Sha256Sum
      value: aac23daf12cf80266a8b2657dff94e6431c872a95885e109271d624fe62be042
  - kind: GoPackage
    url: go_proxy:github.com/diskfs/go-diskfs/@v/v1.7.0.zip
    digest:
      kind: Sha256Sum
      value: 1b443c0e026f74dfbd6442ef181ccc076a75b37b08890b69cfb30586e4adcf98
  - kind: GoPackage
    url: go_proxy:github.com/distribution/reference/@v/v0.6.0.zip
    digest:
      kind: Sha256Sum
      value: 08232852a7a908263599777daab50e4306bd877e2467df036206367496122bcc
  - kind: GoPackage
    url: go_proxy:github.com/djherbis/times/@v/v1.6.0.zip
    digest:
      kind: Sha256Sum
      value: 21d69060967bc03ea3c39ff8c0b1a95511e96eccd3749a2daef1a02af1bc0a85
  - kind: GoPackage
    url: go_proxy:github.com/dlclark/regexp2/@v/v1.12.0.zip
    digest:
      kind: Sha256Sum
      value: dac93d7598b95a6a2c8b334f98078c77d22e29a85b4f73573591bcda65406636
  - kind: GoPackage
    url: go_proxy:github.com/docker/cli/@v/v29.7.1+incompatible.zip
    digest:
      kind: Sha256Sum
      value: ba93019d56e5345c63d7f78c4fcce4ca42a4afa464b91eab138c18bf93c5a31d
  - kind: GoPackage
    url: go_proxy:github.com/docker/docker-credential-helpers/@v/v0.9.8.zip
    digest:
      kind: Sha256Sum
      value: e48517c81480520bda12dd1636260c081fe82fe1fe09c3bb6941a7a122441887
  - kind: GoPackage
    url: go_proxy:github.com/docker/go-connections/@v/v0.8.1.zip
    digest:
      kind: Sha256Sum
      value: 5e442ebd8f4006f2bc0ef192dd4813da487f94d34a2aa662c5b9b964742e2565
  - kind: GoPackage
    url: go_proxy:github.com/docker/go-units/@v/v0.5.0.zip
    digest:
      kind: Sha256Sum
      value: 039d53ebe64af1aefa0be94ce42c621a17a3052c58ad15e5b3f357529beeaff6
  - kind: GoPackage
    url: go_proxy:github.com/dsoprea/go-exfat/@v/v0.0.0-20190906070738-5e932fbdb589.zip
    digest:
      kind: Sha256Sum
      value: 56d32347a0ea3f457e202c3be2f6565f5c0837cb5ef6a0d583ab8b6ae60b4f49
  - kind: GoPackage
    url: go_proxy:github.com/dsoprea/go-logging/@v/v0.0.0-20200710184922-b02d349568dd.zip
    digest:
      kind: Sha256Sum
      value: e6e73dfd34d25a5ebbbf44bb249864aa3c3fa846faae64a1629e8cca528aba93
  - kind: GoPackage
    url: go_proxy:github.com/dustin/go-humanize/@v/v1.0.1.zip
    digest:
      kind: Sha256Sum
      value: 319404ea84c8a4e2d3d83f30988b006e7dd04976de3e1a1a90484ad94679fa46
  - kind: GoPackage
    url: go_proxy:github.com/edsrzf/mmap-go/@v/v1.2.0.zip
    digest:
      kind: Sha256Sum
      value: 1ec1c0d3b80ad3259bb66e09e8bf2b7e1de2ce0928c8c6d6fcbe982bb00f8d75
  - kind: GoPackage
    url: go_proxy:github.com/elliotwutingfeng/asciiset/@v/v0.0.0-20260801111138-45c5fff54b41.zip
    digest:
      kind: Sha256Sum
      value: 159465bfc461b083291d5383c08cc923ceac26179a8301daf2dcb0cd6446e3a8
  - kind: GoPackage
    url: go_proxy:github.com/emirpasic/gods/@v/v1.18.1.zip
    digest:
      kind: Sha256Sum
      value: 1d75e291ac15cf9ca2fcd8bd24e2f7203abad319cd3622cd1b19db5c4fb9daa5
  - kind: GoPackage
    url: go_proxy:github.com/erikgeiser/coninput/@v/v0.0.0-20211004153227-1c3628e74d0f.zip
    digest:
      kind: Sha256Sum
      value: bd7f9a62374dc4d111863491729763a0eafcdc440d4a6ebead61d3af4a2c3f2f
  - kind: GoPackage
    url: go_proxy:github.com/erikvarga/go-rpmdb/@v/v0.0.0-20261001143808-1a11b79cbdd3.zip
    digest:
      kind: Sha256Sum
      value: 0d5b06b8f056bbddda35ab26c6f8bca7f9d866a2b3fd7acba964cfa533e63328
  - kind: GoPackage
    url: go_proxy:github.com/felixge/httpsnoop/@v/v1.1.0.zip
    digest:
      kind: Sha256Sum
      value: e3405a361843f8e69f64e41b523512925cd50fd5ea108b7912534922c31b00e7
  - kind: GoPackage
    url: go_proxy:github.com/gkampitakis/ciinfo/@v/v0.3.4.zip
    digest:
      kind: Sha256Sum
      value: d72810038e35518d5558e69d4f06a054cb3be66af456d0f2ef07b9262b7276e9
  - kind: GoPackage
    url: go_proxy:github.com/gkampitakis/go-snaps/@v/v0.5.25.zip
    digest:
      kind: Sha256Sum
      value: 3a0ce484b7078d5ce608c2fd887848d4029a5ebfbe90e709dddc4a63ad40ea14
  - kind: GoPackage
    url: go_proxy:github.com/go-errors/errors/@v/v1.5.1.zip
    digest:
      kind: Sha256Sum
      value: 9630a42ecb17920a5f9ce332356f8a28ad4aaff529e2ecb676b4a1d11d3149c0
  - kind: GoPackage
    url: go_proxy:github.com/go-git/gcfg/@v/v1.5.1-0.20230307220236-3a3c6141e376.zip
    digest:
      kind: Sha256Sum
      value: 4cd67689e108cfd654591c4a7f693ac5110634a73dabc12686fb07854556c480
  - kind: GoPackage
    url: go_proxy:github.com/go-git/go-billy/v5/@v/v5.9.2.zip
    digest:
      kind: Sha256Sum
      value: 9974a305102f61aca7626622e24d9dbe307d7b62c1e690be648af326c1f274af
  - kind: GoPackage
    url: go_proxy:github.com/go-git/go-git/v5/@v/v5.19.3.zip
    digest:
      kind: Sha256Sum
      value: 7c4113f00a23f361a6e8b5063f981f09a981686e374271ab6dd5a613ee4fe763
  - kind: GoPackage
    url: go_proxy:github.com/go-logr/logr/@v/v1.4.4.zip
    digest:
      kind: Sha256Sum
      value: 3ab107c1d280ce798eaa744efd595982fa709d4023f3f38d24189827483c1710
  - kind: GoPackage
    url: go_proxy:github.com/go-logr/stdr/@v/v1.2.2.zip
    digest:
      kind: Sha256Sum
      value: 9dd6893bf700198485ae699640b49bc1efbc6c73b37cb5792a0476e1fd8f7fef
  - kind: GoPackage
    url: go_proxy:github.com/go-ole/go-ole/@v/v1.3.0.zip
    digest:
      kind: Sha256Sum
      value: bbf5b3bfa227a5daa06eb16ecdecccc0b20e08749bf103afb523fd72764e727a
  - kind: GoPackage
    url: go_proxy:github.com/go-restruct/restruct/@v/v1.2.0-alpha.zip
    digest:
      kind: Sha256Sum
      value: 54bb2e4a7ca297c8580e54d9c879d2ecffddd97992c6c763cbe527daf6b04ad2
  - kind: GoPackage
    url: go_proxy:github.com/go-viper/mapstructure/v2/@v/v2.5.0.zip
    digest:
      kind: Sha256Sum
      value: 326f8e00f648af4ae8e6e18c606325e4206a92d6ed42f486dc2f4da8e1897547
  - kind: GoPackage
    url: go_proxy:github.com/gobwas/glob/@v/v0.2.3.zip
    digest:
      kind: Sha256Sum
      value: 0cfe486cd63d45ed4cb5863ff1cbd14b15e4b9380dcbf80ff26991b4049f4fdf
  - kind: GoPackage
    url: go_proxy:github.com/goccy/go-yaml/@v/v1.19.2.zip
    digest:
      kind: Sha256Sum
      value: 9ea8b466385c1ecf61fa55b68e409ea048b3d7fb1178eba66c1e24a7a30dfffb
  - kind: GoPackage
    url: go_proxy:github.com/golang/groupcache/@v/v0.0.0-20241129210726-2c02b8208cf8.zip
    digest:
      kind: Sha256Sum
      value: 163367355442a630b12b0b452892cd98e99fcfdf7e40b68d358be73479cc1c23
  - kind: GoPackage
    url: go_proxy:github.com/google/go-cmp/@v/v0.7.0.zip
    digest:
      kind: Sha256Sum
      value: 64a9ce046f2c320e3783fba0d1f4a15f8a18f0b009b67bf27f7630919db3f539
  - kind: GoPackage
    url: go_proxy:github.com/google/go-containerregistry/@v/v0.21.8.zip
    digest:
      kind: Sha256Sum
      value: 4854b9451601880a69b4a649ce32d2e03a152c929b16ae01afe4d6b8c203731e
  - kind: GoPackage
    url: go_proxy:github.com/google/jsonschema-go/@v/v0.4.3.zip
    digest:
      kind: Sha256Sum
      value: 9359ac98ff69ed2f3c51e3b2c9e3ab4cc16ca7d54dfe310fa5d258bd5decdfb5
  - kind: GoPackage
    url: go_proxy:github.com/google/osv-scalibr/@v/v0.5.4-0.20261105012210-c80efcc25cd9.zip
    digest:
      kind: Sha256Sum
      value: 83bcec8cfbc7c3d32139c98f47c2e0a5f5e482bf73a78081c297f0fd5d78c419
  - kind: GoPackage
    url: go_proxy:github.com/google/uuid/@v/v1.6.0.zip
    digest:
      kind: Sha256Sum
      value: d0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed
  - kind: GoPackage
    url: go_proxy:github.com/gorilla/css/@v/v1.0.1.zip
    digest:
      kind: Sha256Sum
      value: 870531962ce9787f8dfa2d7a5476be66e08a133c6c75155b20c551e7ac5bc25c
  - kind: GoPackage
    url: go_proxy:github.com/ianlancetaylor/demangle/@v/v0.0.0-20261012173340-cbb8aaea4290.zip
    digest:
      kind: Sha256Sum
      value: 4eefdde3995627dc93fdb9be8446c44cd371cf8077fb662ca41db2303555ef40
  - kind: GoPackage
    url: go_proxy:github.com/icholy/digest/@v/v1.2.0.zip
    digest:
      kind: Sha256Sum
      value: 5ff9d8b2a7dcae0d50b57060035258b3d85f6a8afff00d6bf9d0e3ab37137a06
  - kind: GoPackage
    url: go_proxy:github.com/jbenet/go-context/@v/v0.0.0-20150711004518-d14ea06fba99.zip
    digest:
      kind: Sha256Sum
      value: 4cd0955abeea43dc4b5a08b8769e696109e0376f2a113a9b8eff13cc90cac1c7
  - kind: GoPackage
    url: go_proxy:github.com/jedib0t/go-pretty/v6/@v/v6.8.3.zip
    digest:
      kind: Sha256Sum
      value: f6dfe2ff3f738dd91ba406aaffebdeb81a1b85edb240aec33f64306551373358
  - kind: GoPackage
    url: go_proxy:github.com/kevinburke/ssh_config/@v/v1.6.0.zip
    digest:
      kind: Sha256Sum
      value: cb3e2a23c10382dac238ea51ed1162c75cb7e986532d1ce92a2051469ca24e44
  - kind: GoPackage
    url: go_proxy:github.com/klauspost/compress/@v/v1.20.2.zip
    digest:
      kind: Sha256Sum
      value: f85b4729a966a3d0313310482a11b585f0be445a20b2ea0c967937fe14c17acc
  - kind: GoPackage
    url: go_proxy:github.com/kr/pretty/@v/v0.3.1.zip
    digest:
      kind: Sha256Sum
      value: ecf5a4af24826c3ad758ce06410ca08e2d58e4d95053be3b9dde2e14852c0cdc
  - kind: GoPackage
    url: go_proxy:github.com/kr/text/@v/v0.2.0.zip
    digest:
      kind: Sha256Sum
      value: 368eb318f91a5b67be905c47032ab5c31a1d49a97848b1011a0d0a2122b30ba4
  - kind: GoPackage
    url: go_proxy:github.com/lucasb-eyer/go-colorful/@v/v1.4.1.zip
    digest:
      kind: Sha256Sum
      value: 399a71ecf3e3aaa0af96a779f1c106688b095dbfd0a85455a7c706d3d7ff9ebd
  - kind: GoPackage
    url: go_proxy:github.com/lunixbochs/struc/@v/v0.0.0-20241101090106-8d528fa2c543.zip
    digest:
      kind: Sha256Sum
      value: c6ec6530e2046fba943d714e4ccf8dda6e842b5e7529fc7c4bdbd61f347b6911
  - kind: GoPackage
    url: go_proxy:github.com/maruel/natural/@v/v1.3.0.zip
    digest:
      kind: Sha256Sum
      value: 2abea434a97d45807d30b11dcd39cf8daedde137aed4181f83abc33b52454c48
  - kind: GoPackage
    url: go_proxy:github.com/masahiro331/go-ext4-filesystem/@v/v0.0.0-20260423010602-fe51f5b5e52b.zip
    digest:
      kind: Sha256Sum
      value: 5cbd28357feba18810ac3bd93f48b6c799a2420a96aaf3aef633385824522a49
  - kind: GoPackage
    url: go_proxy:github.com/mattn/go-isatty/@v/v0.0.24.zip
    digest:
      kind: Sha256Sum
      value: 4fcffec0bae0ad4af7bf96e2497a817d85de64af19ffe31d82bda362148234b8
  - kind: GoPackage
    url: go_proxy:github.com/mattn/go-localereader/@v/v0.0.1.zip
    digest:
      kind: Sha256Sum
      value: aa67306797b071ce93188fe2834f63ffd7963faf623d49229d891ef52e595b35
  - kind: GoPackage
    url: go_proxy:github.com/mattn/go-runewidth/@v/v0.0.27.zip
    digest:
      kind: Sha256Sum
      value: 78b1690bd2506faeeecff9cce615e5710c12fe25a5393abe3c2503d0ea4ee2ea
  - kind: GoPackage
    url: go_proxy:github.com/mattn/go-shellwords/@v/v1.0.14.zip
    digest:
      kind: Sha256Sum
      value: b6939f402c7e38e6a6310c6c83a54a5ecd496fac15d60b4b12f01cde0a4439e3
  - kind: GoPackage
    url: go_proxy:github.com/michaelkedar/xml/@v/v0.0.0-20250626233154-4ec9e090d1cd.zip
    digest:
      kind: Sha256Sum
      value: 75396549f47eacbd27f2ba5055f260188e21cfbe90ffa37bf6f1394c6de35771
  - kind: GoPackage
    url: go_proxy:github.com/microcosm-cc/bluemonday/@v/v1.0.27.zip
    digest:
      kind: Sha256Sum
      value: dbbc62b06600331e29a4d453b8b3e95b1ba48e50baddfd981a3825f8d0043011
  - kind: GoPackage
    url: go_proxy:github.com/micromdm/plist/@v/v0.2.2.zip
    digest:
      kind: Sha256Sum
      value: 84ccdf73b3b59bdfd665ebfe7da0ba64f03cdf2bbdd215206f7d1a4ede4dce64
  - kind: GoPackage
    url: go_proxy:github.com/moby/buildkit/@v/v0.32.2.zip
    digest:
      kind: Sha256Sum
      value: b87028619779a42901292ee0664deb75838cbf7a6e28a8ed5045dcba1083c4ae
  - kind: GoPackage
    url: go_proxy:github.com/moby/docker-image-spec/@v/v1.3.1.zip
    digest:
      kind: Sha256Sum
      value: e3fe212be410465c0cae032baa7e2c7282b9bb878f081f00549333edc260c306
  - kind: GoPackage
    url: go_proxy:github.com/moby/moby/api/@v/v1.55.0.zip
    digest:
      kind: Sha256Sum
      value: 5e6428e58b17018a8e1ecffb176dbdffc7678b97f7bf4f50fd3f814747de4847
  - kind: GoPackage
    url: go_proxy:github.com/moby/moby/client/@v/v0.5.1.zip
    digest:
      kind: Sha256Sum
      value: 1fbfaea19d085d23f99d47352f0665713c11986b383b8209625abac6db2e04b2
  - kind: GoPackage
    url: go_proxy:github.com/modelcontextprotocol/go-sdk/@v/v1.8.0.zip
    digest:
      kind: Sha256Sum
      value: f18a0f1664a13aa3f77208243f3e7d81c95c93c5714a76ba280c044cc2da0ec9
  - kind: GoPackage
    url: go_proxy:github.com/muesli/ansi/@v/v0.0.0-20230316100256-276c6243b2f6.zip
    digest:
      kind: Sha256Sum
      value: 59c0d420908d51df3c701510337fbe42bfb4d48fcc5f490b5eb2f36fc25f91b9
  - kind: GoPackage
    url: go_proxy:github.com/muesli/cancelreader/@v/v0.2.2.zip
    digest:
      kind: Sha256Sum
      value: f0654e7f8f8a49b02ff10a75ccaa0eb08a65aaacbc45f5ba93305276e2ac7f61
  - kind: GoPackage
    url: go_proxy:github.com/muesli/reflow/@v/v0.3.0.zip
    digest:
      kind: Sha256Sum
      value: 78e2cebf5a46a9b7c7c52d55d4ac4650cabd9135f180092e3f476293bb86696e
  - kind: GoPackage
    url: go_proxy:github.com/muesli/termenv/@v/v0.16.0.zip
    digest:
      kind: Sha256Sum
      value: ba02d3ebd9c1d87e2c2133b1f2bb61a7001b3765196e8016029ce9fe54c5c0fc
  - kind: GoPackage
    url: go_proxy:github.com/ncruces/go-strftime/@v/v1.0.0.zip
    digest:
      kind: Sha256Sum
      value: c1a7e718dbf5f779e9fc98b7354ed4d98de2949b83b65837c429b4b2c8c27686
  - kind: GoPackage
    url: go_proxy:github.com/opencontainers/go-digest/@v/v1.0.0.zip
    digest:
      kind: Sha256Sum
      value: 615efb31ff6cd71035b8aa38c3659d8b4da46f3cd92ac807cb50449adfe37c86
  - kind: GoPackage
    url: go_proxy:github.com/opencontainers/image-spec/@v/v1.1.1.zip
    digest:
      kind: Sha256Sum
      value: 3a32eeb459719172947c20be78b5b7293c6ea84f4039184e846f6b676bc19574
  - kind: GoPackage
    url: go_proxy:github.com/ossf/osv-schema/bindings/go/@v/v0.0.0-20261026052736-6410c13304f9.zip
    digest:
      kind: Sha256Sum
      value: b8e4c15345b4763f2ba097630b08794360ca2f642dad43f08adf203f9f8bbcf1
  - kind: GoPackage
    url: go_proxy:github.com/owenrumney/go-sarif/v3/@v/v3.3.2.zip
    digest:
      kind: Sha256Sum
      value: 9052acd9ebf06ac674999c62b9c93c09eb509b2699ee01a3b28c1826925f2249
  - kind: GoPackage
    url: go_proxy:github.com/package-url/packageurl-go/@v/v0.1.7.zip
    digest:
      kind: Sha256Sum
      value: 61a9ea183ca003f2280867dc1e10c9b8910e61f65045670a72d36722b0ea5fcf
  - kind: GoPackage
    url: go_proxy:github.com/pandatix/go-cvss/@v/v0.6.4.zip
    digest:
      kind: Sha256Sum
      value: 2c810021744da6d37335f1b467939180b4642db6e01dca1247d0168236d3fab7
  - kind: GoPackage
    url: go_proxy:github.com/pierrec/lz4/v4/@v/v4.1.27.zip
    digest:
      kind: Sha256Sum
      value: 702ad206ffeec8d3ac8bc1ce7e2d0b201fbc7683c8ab8758210172c54f03353f
  - kind: GoPackage
    url: go_proxy:github.com/pjbgf/sha1cd/@v/v0.7.0.zip
    digest:
      kind: Sha256Sum
      value: 5d641862b1f2ba4f19d99089a973663378dc446b1b42d6d381c5be8300fe5bd6
  - kind: GoPackage
    url: go_proxy:github.com/pkg/errors/@v/v0.9.1.zip
    digest:
      kind: Sha256Sum
      value: d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07
  - kind: GoPackage
    url: go_proxy:github.com/pkg/xattr/@v/v0.4.12.zip
    digest:
      kind: Sha256Sum
      value: 3657614c6f28f6298164935f48af2515835ae04190ed9f6954b5cdf89b1aee21
  - kind: GoPackage
    url: go_proxy:github.com/planetscale/vtprotobuf/@v/v0.6.1-0.20240319094008-0393e58bdf10.zip
    digest:
      kind: Sha256Sum
      value: 6fdbac53c6ace58d732be8ec29c1aae928639eb12960cc4c52a9f7a25395ca05
  - kind: GoPackage
    url: go_proxy:github.com/remyoudompheng/bigfft/@v/v0.0.0-20230129092748-24d4a6f8daec.zip
    digest:
      kind: Sha256Sum
      value: 9be16c32c384d55d0f7bd7b03f1ff1e9a4e4b91b000f0aa87a567a01b9b82398
  - kind: GoPackage
    url: go_proxy:github.com/rivo/uniseg/@v/v0.4.7.zip
    digest:
      kind: Sha256Sum
      value: b995e4aa0cc1e5779cc61138ac925cb8c1e963e40c80e4b93ee8553812ebb792
  - kind: GoPackage
    url: go_proxy:github.com/rogpeppe/go-internal/@v/v1.15.0.zip
    digest:
      kind: Sha256Sum
      value: c84d958181618407e61f0f837c0a226016cc7bb0de6d26d2d82fd476e3bf1f70
  - kind: GoPackage
    url: go_proxy:github.com/rust-secure-code/go-rustaudit/@v/v0.0.0-20250226111315-e20ec32e963c.zip
    digest:
      kind: Sha256Sum
      value: ae9e48aaed898fab5ccd3becb1fb44e5ef87513c97b622d2665a51db4900f10f
  - kind: GoPackage
    url: go_proxy:github.com/saferwall/pe/@v/v1.6.5.zip
    digest:
      kind: Sha256Sum
      value: bec1d6f6525452a16126d70577085fc456161cd3dd1f404909bcac1b5866e153
  - kind: GoPackage
    url: go_proxy:github.com/sahilm/fuzzy/@v/v0.1.3.zip
    digest:
      kind: Sha256Sum
      value: d93c49af536d39cd2f25be6f75e4bd4c3af5b0ca8f9b19121f9b7a6536d05c30
  - kind: GoPackage
    url: go_proxy:github.com/santhosh-tekuri/jsonschema/v6/@v/v6.0.2.zip
    digest:
      kind: Sha256Sum
      value: fe5eb88614e560d2072d1f95708ac217b6cb047789531ad633114ec277338635
  - kind: GoPackage
    url: go_proxy:github.com/segmentio/asm/@v/v1.2.1.zip
    digest:
      kind: Sha256Sum
      value: 04ee03ed0972329c3c8fa1cd57a30397be37b82f3e2ba2251d56ba9c6fbc1d99
  - kind: GoPackage
    url: go_proxy:github.com/segmentio/encoding/@v/v0.5.4.zip
    digest:
      kind: Sha256Sum
      value: 2189639875fe1153571445dc9b5dcaf221554143fe6701426fba69aa77780681
  - kind: GoPackage
    url: go_proxy:github.com/sergi/go-diff/@v/v1.4.0.zip
    digest:
      kind: Sha256Sum
      value: 63aef1860b251af1421ba0a014a6bb08a60833f13f948f3d88d66754bb484f53
  - kind: GoPackage
    url: go_proxy:github.com/shirou/gopsutil/@v/v3.21.11+incompatible.zip
    digest:
      kind: Sha256Sum
      value: 2079d749fb3bd347e9fd10418826ebf0d48ff5c171455060ef7d9bf842ccb8d9
  - kind: GoPackage
    url: go_proxy:github.com/sirupsen/logrus/@v/v1.9.4.zip
    digest:
      kind: Sha256Sum
      value: 3847d00c5ee6948f1ff0d0120bc343c55ce852becb7720f8f08f53eecfe9e437
  - kind: GoPackage
    url: go_proxy:github.com/skeema/knownhosts/@v/v1.3.2.zip
    digest:
      kind: Sha256Sum
      value: b4bba0494171ccdbbebd46c4e2b494d284ea07c3719e85694f5bc7867513ddf2
  - kind: GoPackage
    url: go_proxy:github.com/spdx/gordf/@v/v0.0.0-20250128162952-000978ccd6fb.zip
    digest:
      kind: Sha256Sum
      value: a3318eae31d13c7be5691822d7cabaf46a8dce8e4a8303c15de77950e2c5d8ff
  - kind: GoPackage
    url: go_proxy:github.com/spdx/tools-golang/@v/v0.5.7.zip
    digest:
      kind: Sha256Sum
      value: 32878e7a65f75f87dc89375504f0e5950c2a9881eeeee1ebcf4721bc5d4dc81c
  - kind: GoPackage
    url: go_proxy:github.com/tidwall/gjson/@v/v1.20.0.zip
    digest:
      kind: Sha256Sum
      value: 04ffbd1edb224bfe8c68ca083aaea06837c5e211bd047a238e01f9bd3ef69af7
  - kind: GoPackage
    url: go_proxy:github.com/tidwall/jsonc/@v/v0.3.3.zip
    digest:
      kind: Sha256Sum
      value: a50aed626a275151ba633b8108269ad46fd5858eeb3a81d298a26f423ad5960b
  - kind: GoPackage
    url: go_proxy:github.com/tidwall/match/@v/v1.2.0.zip
    digest:
      kind: Sha256Sum
      value: f35502f3dd450fa84ddc7b028310f7fecc86c8112f2397fe7ff7941c5afbcbc1
  - kind: GoPackage
    url: go_proxy:github.com/tidwall/pretty/@v/v1.2.2.zip
    digest:
      kind: Sha256Sum
      value: 07b70a5fc342be8cb14a5287f961bb00225354509bee373cd6b2b0cd7697927e
  - kind: GoPackage
    url: go_proxy:github.com/tidwall/sjson/@v/v1.2.5.zip
    digest:
      kind: Sha256Sum
      value: fc40fda87c7de55362f6386e069d674772f25c9d76411ee823acb9ac78b20565
  - kind: GoPackage
    url: go_proxy:github.com/tink-crypto/tink-go/v2/@v/v2.7.0.zip
    digest:
      kind: Sha256Sum
      value: e9f6c777f7891fee58a7f700bb5b30d9ebc5d82f6a841020a9df08e425704fec
  - kind: GoPackage
    url: go_proxy:github.com/tklauser/go-sysconf/@v/v0.4.0.zip
    digest:
      kind: Sha256Sum
      value: 61e89253bc4d7091170601be12633dc02e94a3bc30470b081a2449944fa18784
  - kind: GoPackage
    url: go_proxy:github.com/tklauser/numcpus/@v/v0.12.0.zip
    digest:
      kind: Sha256Sum
      value: 56c22a112976df3a4d8db776b41288658070650ae6382ec86d0a32fc07af0276
  - kind: GoPackage
    url: go_proxy:github.com/tonistiigi/go-csvvalue/@v/v0.0.0-20240814133006-030d3b2625d0.zip
    digest:
      kind: Sha256Sum
      value: 51bce4d81fe31cb3edfcfaa124a74e2cff5ef08ed8d6f54afb054b39dc0ed89a
  - kind: GoPackage
    url: go_proxy:github.com/ulikunitz/xz/@v/v0.5.16.zip
    digest:
      kind: Sha256Sum
      value: 0a7e01908924983df9118e62c1f49131e1e365f17b4e4e3020805e8fdfe6307a
  - kind: GoPackage
    url: go_proxy:github.com/urfave/cli/v3/@v/v3.14.0.zip
    digest:
      kind: Sha256Sum
      value: c02184a74258fa8a4a78d5e45aaf38958489fa6a780971f3f5558d9e3c96f3c8
  - kind: GoPackage
    url: go_proxy:github.com/xanzy/ssh-agent/@v/v0.3.3.zip
    digest:
      kind: Sha256Sum
      value: 19a86c2623b20cc98687bddd89e3f023db0ca51c8bc9e38b9ad9c56e5b7d110d
  - kind: GoPackage
    url: go_proxy:github.com/xeipuuv/gojsonpointer/@v/v0.0.0-20190905194746-02993c407bfb.zip
    digest:
      kind: Sha256Sum
      value: 11b54f0bc358b09261075c3e15cd14d57102f3ab1ba88c345c53eab6aaf228de
  - kind: GoPackage
    url: go_proxy:github.com/xeipuuv/gojsonreference/@v/v0.0.0-20180127040603-bd5ef7bd5415.zip
    digest:
      kind: Sha256Sum
      value: 7ec98f4df894413f4dc58c8df330ca8b24ff425b05a8e1074c3028c99f7e45e7
  - kind: GoPackage
    url: go_proxy:github.com/xeipuuv/gojsonschema/@v/v1.2.0.zip
    digest:
      kind: Sha256Sum
      value: 55c8ce068257aa0d263aad7470113dafcd50f955ee754fc853c2fdcd31ad096f
  - kind: GoPackage
    url: go_proxy:github.com/xhit/go-str2duration/v2/@v/v2.1.0.zip
    digest:
      kind: Sha256Sum
      value: 907db1bdf362568191e659f82339c21a4031d433bc5ac52f36de23eeceb8cb26
  - kind: GoPackage
    url: go_proxy:github.com/xo/terminfo/@v/v0.0.0-20220910002029-abceb7e1c41e.zip
    digest:
      kind: Sha256Sum
      value: b8f4270191e08e135e932dfe168769046a4268ec7f3892593b1d773b2c5fa4cf
  - kind: GoPackage
    url: go_proxy:github.com/yosida95/uritemplate/v3/@v/v3.0.2.zip
    digest:
      kind: Sha256Sum
      value: 65a29b6ab759cd30a1ed496a8a77b144a5683b89d505cfde51f907cb7ab9b8bd
  - kind: GoPackage
    url: go_proxy:github.com/yuin/goldmark-emoji/@v/v1.0.6.zip
    digest:
      kind: Sha256Sum
      value: a993ef47fd534db3246a5676611906bf9636dae575c6526410db4c60f38cdb2a
  - kind: GoPackage
    url: go_proxy:github.com/yuin/goldmark/@v/v1.8.5.zip
    digest:
      kind: Sha256Sum
      value: 2fa45e249cefad0a1b2ae0efebbaf59a86380a211349d3e9f04dbc172830cf53
  - kind: GoPackage
    url: go_proxy:github.com/yusufpapurcu/wmi/@v/v1.2.4.zip
    digest:
      kind: Sha256Sum
      value: c2a0a12203162ef8fd6f65e191aac359823d370e113122cbd8e80711ddc9c1f9
  - kind: GoPackage
    url: go_proxy:go.etcd.io/bbolt/@v/v1.5.0.zip
    digest:
      kind: Sha256Sum
      value: 2c350ca36afba707b917529a8049b001c71915c99c152d5e2600ed4bac6fbc37
  - kind: GoPackage
    url: go_proxy:go.opentelemetry.io/auto/sdk/@v/v1.2.1.zip
    digest:
      kind: Sha256Sum
      value: a08a16fc0a7041cdb875f47a260a56000632212c85f65a302a043c76380c8335
  - kind: GoPackage
    url: go_proxy:go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp/@v/v0.70.0.zip
    digest:
      kind: Sha256Sum
      value: 5afae012c182ed95c9068c4b4de772677fbfecb9fbe41605046f907abba8bc92
  - kind: GoPackage
    url: go_proxy:go.opentelemetry.io/otel/@v/v1.45.0.zip
    digest:
      kind: Sha256Sum
      value: 65b5fc93c93f4eaef740b4bba81fd2543f248d5df85cf4d1ddf9ab459b30f7a2
  - kind: GoPackage
    url: go_proxy:go.opentelemetry.io/otel/metric/@v/v1.45.0.zip
    digest:
      kind: Sha256Sum
      value: 8f30ef0039306bf3a4421b8c08e3fc8922d13503dce53b3438e860b3628faecd
  - kind: GoPackage
    url: go_proxy:go.opentelemetry.io/otel/trace/@v/v1.45.0.zip
    digest:
      kind: Sha256Sum
      value: 32d7d64ea5991378184b03a9ed7b7822b17691a239508a6905fdd73819cb6c6f
  - kind: GoPackage
    url: go_proxy:go.uber.org/multierr/@v/v1.11.0.zip
    digest:
      kind: Sha256Sum
      value: 2249b5d2fdce61f6ee661a679d8552599af084a761cbbc871da77641bddce0c3
  - kind: GoPackage
    url: go_proxy:go.uber.org/zap/@v/v1.28.0.zip
    digest:
      kind: Sha256Sum
      value: 49d6287497537480c2e9330e3dee9c38ac793fbf9fd2257dbc4fa5697818919c
  - kind: GoPackage
    url: go_proxy:go.yaml.in/yaml/v2/@v/v2.4.4.zip
    digest:
      kind: Sha256Sum
      value: 1b98a6a498cf255c5f2982d32c74633bc7969770957e98103ac1e14345aa4576
  - kind: GoPackage
    url: go_proxy:go.yaml.in/yaml/v4/@v/v4.0.0-rc.7.zip
    digest:
      kind: Sha256Sum
      value: 052a0e0b9671ba2026e5ed123575785c483ffadce2cdb083f33fd5104af48cb2
  - kind: GoPackage
    url: go_proxy:golang.org/x/crypto/@v/v0.58.0.zip
    digest:
      kind: Sha256Sum
      value: b0a45594cda20ddb4264d84aeff9b588b8570bf6a2833c51a0b821734a298d95
  - kind: GoPackage
    url: go_proxy:golang.org/x/mod/@v/v0.42.0.zip
    digest:
      kind: Sha256Sum
      value: 2770e372e42c30dd498d63bb094fe257edfad6882c611f8e0d82925feac159f3
  - kind: GoPackage
    url: go_proxy:golang.org/x/net/@v/v0.62.0.zip
    digest:
      kind: Sha256Sum
      value: 50e869800f4921e910eb6550369f937c7187d130a7f7f78a26ef9b589a7071a6
  - kind: GoPackage
    url: go_proxy:golang.org/x/oauth2/@v/v0.36.0.zip
    digest:
      kind: Sha256Sum
      value: 15bf65ff103e5dafc809d78cd037a1d1e88ccb8451824e851156002a13304504
  - kind: GoPackage
    url: go_proxy:golang.org/x/sync/@v/v0.24.0.zip
    digest:
      kind: Sha256Sum
      value: ca3fcf3ea8259e75891f7947e1a816a5b89402c542d45d8bbbd9e061b0c58019
  - kind: GoPackage
    url: go_proxy:golang.org/x/sys/@v/v0.49.0.zip
    digest:
      kind: Sha256Sum
      value: e73a06591ca0d7016ce3ccb45c36a8ed7128468aecc1a357f94d815c760c6b31
  - kind: GoPackage
    url: go_proxy:golang.org/x/telemetry/@v/v0.0.0-20261009151841-97e8ea77aa2a.zip
    digest:
      kind: Sha256Sum
      value: d716edef11729767caecb52ed5d76bb0d7cf17c9f91cc5a57a698e9847d3f2ba
  - kind: GoPackage
    url: go_proxy:golang.org/x/term/@v/v0.47.0.zip
    digest:
      kind: Sha256Sum
      value: d990d5ab94dfa41ba980645b721bba7490064337a01bb03e6cacace70e8df0bf
  - kind: GoPackage
    url: go_proxy:golang.org/x/text/@v/v0.43.0.zip
    digest:
      kind: Sha256Sum
      value: b75131f628f6e2e4892fd638d33127e952a5027775e0162b94ba069cb4e13863
  - kind: GoPackage
    url: go_proxy:golang.org/x/time/@v/v0.15.0.zip
    digest:
      kind: Sha256Sum
      value: 8cfb20e915fa5d6c3fd264304233f8d71a3385e48a37819239c532ad9da27f84
  - kind: GoPackage
    url: go_proxy:golang.org/x/tools/@v/v0.52.0.zip
    digest:
      kind: Sha256Sum
      value: 90b2a941aa5f2fe87564b8e38c3f03796de2e3597b7f4c52a9a6a53201b32c48
  - kind: GoPackage
    url: go_proxy:golang.org/x/vuln/@v/v1.6.0.zip
    digest:
      kind: Sha256Sum
      value: b677bec1ea587aa03320e7d65520dd52cae824fd197ede36417a5f572be41cb3
  - kind: GoPackage
    url: go_proxy:golang.org/x/xerrors/@v/v0.0.0-20240903120638-7835f813f4da.zip
    digest:
      kind: Sha256Sum
      value: 07ee9f680118861ee732ce0df4553b834383b87e0519fb9a0990c51d7abd6885
  - kind: GoPackage
    url: go_proxy:google.golang.org/genproto/googleapis/api/@v/v0.0.0-20260817212433-ac3dfec99bb1.zip
    digest:
      kind: Sha256Sum
      value: 88da11db859222fdd0d2c8242c876c65f52e506254372bd6a437ff8ea8e1ab64
  - kind: GoPackage
    url: go_proxy:google.golang.org/genproto/googleapis/rpc/@v/v0.0.0-20260817212433-ac3dfec99bb1.zip
    digest:
      kind: Sha256Sum
      value: ea86b19385ad8a93819621cd90ed75db1e8ec364b6b3ada2061a601d785b7c11
  - kind: GoPackage
    url: go_proxy:google.golang.org/grpc/@v/v1.85.0.zip
    digest:
      kind: Sha256Sum
      value: bd1ce651075f55e5bad492f9e1ee7cc013f1b96770981556d2a9cb5ee2c31e1e
  - kind: GoPackage
    url: go_proxy:google.golang.org/protobuf/@v/v1.36.12.zip
    digest:
      kind: Sha256Sum
      value: 68f8a3174aff42950fd9bd02c11b45c6986eb8060508d124d1c3dd6bf86b9be6
  - kind: GoPackage
    url: go_proxy:gopkg.in/dnaeon/go-vcr.v4/@v/v4.0.7.zip
    digest:
      kind: Sha256Sum
      value: b1d376e76f0520216d9cda0bf9ffbc0e79b282549f2d5d54163640ec6eab2ba4
  - kind: GoPackage
    url: go_proxy:gopkg.in/ini.v1/@v/v1.67.3.zip
    digest:
      kind: Sha256Sum
      value: 20ab7e3150a9d0a098b5f642cc2a1ba1886da48ae0ec4080240bf33f7a7086c2
  - kind: GoPackage
    url: go_proxy:gopkg.in/warnings.v0/@v/v0.1.2.zip
    digest:
      kind: Sha256Sum
      value: c412b1f704c1e8ba59b6cfdb1072f8be847c03f77d6507c692913d6d9454e51c
  - kind: GoPackage
    url: go_proxy:gopkg.in/yaml.v3/@v/v3.0.1.zip
    digest:
      kind: Sha256Sum
      value: aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015
  - kind: GoPackage
    url: go_proxy:modernc.org/libc/@v/v1.74.4.zip
    digest:
      kind: Sha256Sum
      value: e68439e5374517936f0f8f13c87ab1e565632099537f13ed3238c24900cfa72f
  - kind: GoPackage
    url: go_proxy:modernc.org/mathutil/@v/v1.7.1.zip
    digest:
      kind: Sha256Sum
      value: 5be0da18eb557a1198bfe370e37022f2dbdb9cdc5d63130fc8e8330ab240bd2e
  - kind: GoPackage
    url: go_proxy:modernc.org/memory/@v/v1.11.0.zip
    digest:
      kind: Sha256Sum
      value: 4930b81d10818a6d11497204fe06b2edc359136a7881586363caa694c8607d0c
  - kind: GoPackage
    url: go_proxy:modernc.org/sqlite/@v/v1.56.0.zip
    digest:
      kind: Sha256Sum
      value: 6321abf675769662cda07d8cd922eac3eb42e37877a0da3c1b5d7227b2c2417b
  - kind: GoPackage
    url: go_proxy:osv.dev/bindings/go/@v/v0.0.0-20261007022941-648e046ef8ee.zip
    digest:
      kind: Sha256Sum
      value: f403289355044e8acb169778b1a05cd132bee5dc56c75153f02364880d7ca7bd
  - kind: GoPackage
    url: go_proxy:sigs.k8s.io/yaml/@v/v1.6.0.zip
    digest:
      kind: Sha256Sum
      value: cf88648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e11e5052
  - kind: GoPackage
    url: go_proxy:www.velocidex.com/golang/go-ntfs/@v/v0.2.1.zip
    digest:
      kind: Sha256Sum
      value: 5dddadc86526d3611acad0b6966def38b929694a2be474b40c4174521b876ce3
  - kind: GoPackage
    url: go_proxy:www.velocidex.com/golang/regparser/@v/v0.0.0-20250203141505-31e704a67ef7.zip
    digest:
      kind: Sha256Sum
      value: 83532fb80ccfe9d333a933fa9fed5f31d1cc70de1e42fd9bb65fe64c60e734fd
