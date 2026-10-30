kind: manual

build-depends:
  - public-stacks/buildsystem-go.bst

config:
  build-commands:
    - go build -o osv-scanner ./cmd/osv-scanner
  install-commands:
    - install -Dm755 -t "%{install-root}%{bindir}" osv-scanner

sources:
  - kind: git_repo
    url: github:google/osv-scanner.git
    track: v*.*.*
    ref: v2.7.0-0-gbfe2f84abd2f09fe0b83ba7f6dad40d296762f40
  - kind: go_mod_vendor
    proxy-url: git_https:proxy.golang.org/
    ref:
      - module: bitbucket.org/creachadair/stringset
        version: v0.0.14
        sha256sum: d7365878cb8a70a2e212fe891095d5a6f9c4a30d899f583ea6a9c76483b6c41c
      - module: charm.land/glamour/v2
        version: v2.0.1
        sha256sum: c4a98f4e576cce274b8724ff6a8e71d8b2c022a1bc4b468e82725063d8f1c039
      - module: charm.land/lipgloss/v2
        version: v2.0.6
        sha256sum: 26b77e3a8159d4d084d04a32c63db22cf9a48553d3eee1b488e478b1bb592c23
      - module: cloud.google.com/go/compute/metadata
        version: v0.9.0
        sha256sum: f97e35d1c96239b8574054a77e312c95d2c82a89c21daf46ffeaea6d5fc59eca
      - module: dario.cat/mergo
        version: v1.0.2
        sha256sum: 67d2e9d83ca57d3a8ce1a0e0e626a7c03753b3966b58b41b95e97ca4e7b2c640
      - module: deps.dev/api/v3
        version: v3.0.0-20260811035547-133c155ce203
        sha256sum: 6b9bfac967844956b400a97f20dd1ad9407119bf32d0f6ede29f74a1798c402f
      - module: deps.dev/api/v3alpha
        version: v0.0.0-20260811035547-133c155ce203
        sha256sum: c5e0c0c16b766dd83e9dbece0dba441bfde4dc6045595d40fe44e0624dd1ea4e
      - module: deps.dev/util/maven
        version: v0.0.0-20260928000106-0e158e8db197
        sha256sum: 07cad3fcc54b37678b9eb8a396465fd7930444a4153b175495f756d3e2061c9d
      - module: deps.dev/util/pypi
        version: v0.0.0-20260727054525-2946ae4a6141
        sha256sum: 4c9d2733e4fff1d428d1e68061b9f047019b7d5ef827c8583faa8e02a97b6902
      - module: deps.dev/util/resolve
        version: v0.0.0-20260727054525-2946ae4a6141
        sha256sum: c07173425337f570040b50758fee08373fc91817b266ccf95890cfcf22e34f57
      - module: deps.dev/util/semver
        version: v0.0.0-20260727054525-2946ae4a6141
        sha256sum: 1e7c84fcfb3df5a9886f1c2e1bab6d3c81eda35f41a84ed301ab558f709b91c2
      - module: github.com/BurntSushi/toml
        version: v1.6.0
        sha256sum: 01f03d6c3f4bfee108bda3202407b54ac0c295b8302a1315512f12ac05011fd8
      - module: github.com/CycloneDX/cyclonedx-go
        version: v0.12.0
        sha256sum: d40307bf6f8cbe7f295909d17ac4e2127ef204e82fb9e37397a59f91fd220ff3
      - module: github.com/GehirnInc/crypt
        version: v0.0.0-20230320061759-8cc1b52080c5
        sha256sum: bf4413da2ccf5f498ae214b83f0b6095ac4463f967cdb7fe14a5803c593a886f
      - module: github.com/Microsoft/go-winio
        version: v0.6.3-0.20251027160822-ad3df93bed29
        sha256sum: 6507326885292057ef1bf96a9d6a9300b1695f88a49b34f77fcfdf2a219c276c
      - module: github.com/Microsoft/hcsshim
        version: v0.15.0-rc.1
        sha256sum: 1f22b2c814bc4267df09975f4f41a9980ca45c86ac175ccadad1a189a1f7ddaf
      - module: github.com/ProtonMail/go-crypto
        version: v1.4.1
        sha256sum: 70bbdc0f9e926738193aed968f7901efab41493752277c4c94c9b751aa55c42a
      - module: github.com/Velocidex/json
        version: v0.0.0-20220224052537-92f3c0326e5a
        sha256sum: 3c19a326778ae93b6969ea4cb0f6300427552a94ed06be29c12a7fa61c9721b0
      - module: github.com/Velocidex/ordereddict
        version: v0.0.0-20250821063524-02dc06e46238
        sha256sum: 2ad246b3ef99f2ce0bcbe200b056d03645e3643c1878efaee05b5f6067845f77
      - module: github.com/Velocidex/yaml/v2
        version: v2.2.8
        sha256sum: b2a06b04a4e78bbb338dff7a9ed1f8dd0f0289e7e1ab2f2ad45df57ce8a4d007
      - module: github.com/aead/serpent
        version: v0.0.0-20160714141033-fba169763ea6
        sha256sum: 182f9024516f6118e999504016649740629aa946420f7aa6cac2ab135f95869d
      - module: github.com/agext/levenshtein
        version: v1.2.3
        sha256sum: f24dcae174b3418f6340fb8f54797788a71130b960da4f07d3e08206cbcbdc02
      - module: github.com/alecthomas/assert
        version: v1.0.0
        sha256sum: be346d2847db5cfc7e40babb0b3b7062fa20e76af366652eb4f65710ea7d5fdc
      - module: github.com/alecthomas/assert/v2
        version: v2.11.0
        sha256sum: 87ddcb6a9c42228ba1b3b61c581bf2ff358f014078bd274b8ff5b47f7a4759eb
      - module: github.com/alecthomas/chroma/v2
        version: v2.19.0
        sha256sum: fc03b21c36ac2630e30647afcf2221b15e369104548255e5f3f5dcf50935bdf2
      - module: github.com/alecthomas/colour
        version: v0.1.0
        sha256sum: 74d51002731fa104943b62ee11fb61b14c517e75a4a3983bfb03976b6c75349b
      - module: github.com/alecthomas/repr
        version: v0.4.0
        sha256sum: e4d4ec046c3ad7425c8e78352dc114ab34b1dd7f3a42c640e19cb51c94484c36
      - module: github.com/anchore/go-lzo
        version: v0.1.0
        sha256sum: 74e5636203039daeb2339a7953b653d39a1d15c23856e74135e6c5f9fe749216
      - module: github.com/anchore/go-struct-converter
        version: v0.1.0
        sha256sum: d59da72ec5a33286bf91e47055e3a526474f9ee2755735be7221dad0540dc88c
      - module: github.com/anmitsu/go-shlex
        version: v0.0.0-20200514113438-38f4b401e2be
        sha256sum: 2a5cf7c9a2709f649fd508cbacb2be96e4fba4d534a28a122ee4d7574af40b5e
      - module: github.com/armon/go-socks5
        version: v0.0.0-20160902184237-e75332964ef5
        sha256sum: f473e6dce826a0552639833cf72cfaa8bc7141daa7b537622d7f78eacfd9dfb3
      - module: github.com/atotto/clipboard
        version: v0.1.4
        sha256sum: d67b2c36c662751309fd2ec351df3651584bea840bd27be9a90702c3a238b43f
      - module: github.com/aymanbagabas/go-osc52/v2
        version: v2.0.1
        sha256sum: 939ebf2a5481f2172e1a5e0c318d05aef5b6d950a960556216c3da7879a927f8
      - module: github.com/aymanbagabas/go-udiff
        version: v0.4.1
        sha256sum: 3782bb9735dc4c1e4c98ff7d7713af27f276e1a0ff493e4b237ff51ebd92efbd
      - module: github.com/aymerick/douceur
        version: v0.2.0
        sha256sum: dcbf69760cc1a8b32384495438e1086e4c3d669b2ebc0debd92e1865ffd6be60
      - module: github.com/ayoubfaouzi/pkcs7
        version: v0.2.3
        sha256sum: aa5ac750dad3d1885e1d2c6379463aef774339f5897fc1178f4ccbbd0cb375e7
      - module: github.com/bazelbuild/buildtools
        version: v0.0.0-20260716142318-04cf7de1434f
        sha256sum: 59b460c2486aad5f5ccebd018969eb447aef127aecc6b30f5b706d245663e719
      - module: github.com/bradleyjkemp/cupaloy/v2
        version: v2.8.0
        sha256sum: fa73841b46ae55cc098f7739338825e574441c44eb9271d2ceab75acc0db3ed7
      - module: github.com/canonical/chisel-manifest
        version: v1.2.0
        sha256sum: ea4ae8e5d873c087f12b434f279b359bb903aa8bfe6000f14270bf2b288812a5
      - module: github.com/cespare/xxhash/v2
        version: v2.3.0
        sha256sum: 145a26cdc7c49db566017b807c4989ee7f7ddeb569423e9cb99f995fac3621d3
      - module: github.com/charmbracelet/bubbles
        version: v1.0.0
        sha256sum: b245dafe1f179d4f0ce17b950ce12ac884ab0c7f69fd2d2f282be68e373d5468
      - module: github.com/charmbracelet/bubbletea
        version: v1.3.10
        sha256sum: 8afc524c11d18878b0ac3426fd3318fdf05ad576e65883c597996296c1b27117
      - module: github.com/charmbracelet/colorprofile
        version: v0.4.3
        sha256sum: 656472ff48f01a098418a31667f3253cf34e04d4e1cb6c1a0a80f76ad370b689
      - module: github.com/charmbracelet/lipgloss
        version: v1.1.1-0.20250404203927-76690c660834
        sha256sum: 626c107b5c002b297a36aab58949904266eac5c6a030face80a771084bdb279a
      - module: github.com/charmbracelet/ultraviolet
        version: v0.0.0-20260811164956-006e29f97886
        sha256sum: f05a2aac1310f73700c7587db28429dacd345b1d68ca50c05048f9ac989c0f7f
      - module: github.com/charmbracelet/x/ansi
        version: v0.11.8
        sha256sum: ac0870e7be61cbffe23d06404c77cfd43e11e162e1c79a4bf3bfaf57036d7407
      - module: github.com/charmbracelet/x/cellbuf
        version: v0.0.15
        sha256sum: 2c5c421edef869c7f4b7b3fa29530a66897134764d95a750eed59ed5886d84f7
      - module: github.com/charmbracelet/x/exp/golden
        version: v0.0.0-20250806222409-83e3a29d542f
        sha256sum: 68636b6cdec0e4fc0bbe0b50c4efc52c82f2e175d118a9033631abdd9594b527
      - module: github.com/charmbracelet/x/exp/slice
        version: v0.0.0-20260803091719-3755ebad01b1
        sha256sum: 4546f5d012dfcf942f02f6951b3bad66d9d1fb800d56529ff77c83b9eb79e0f9
      - module: github.com/charmbracelet/x/term
        version: v0.2.2
        sha256sum: 0452a430f7e6882393f81ba19a70a63709960acb9743e1199a7b04d908e6b506
      - module: github.com/charmbracelet/x/termios
        version: v0.1.1
        sha256sum: 3dd9823ed5db08d398c276e216e4150560d3a6894814c4404251b4210b22abed
      - module: github.com/charmbracelet/x/windows
        version: v0.2.2
        sha256sum: fb3f82357ad9a8a25a42dfa1880434149dd6fcc43e0b32a03664f72082ce5c2f
      - module: github.com/clipperhouse/displaywidth
        version: v0.11.0
        sha256sum: 27830c91cdfb2a648748db21f7a2734dcb50d21c620edde51d488ba4e7967e3d
      - module: github.com/clipperhouse/uax29/v2
        version: v2.7.0
        sha256sum: 67b1278f1ffb4e4d783a390e48fe7396864650138e785d4b4bfca5914333f761
      - module: github.com/cloudflare/circl
        version: v1.6.4
        sha256sum: bc44d9316fad1a8657714cbf91ed2103bcc47934765e8ee471e174e8722e9242
      - module: github.com/compose-spec/compose-go/v2
        version: v2.14.0
        sha256sum: f54927905e5d2ae194da4c9b66e642ab26e6e35986d130514269e5ad5d561434
      - module: github.com/containerd/cgroups/v3
        version: v3.1.3
        sha256sum: 44f3fecb3be9b7ac3cd7b538dc47e19109607a1b56eb961506eef64c34597cf4
      - module: github.com/containerd/containerd/api
        version: v1.11.1
        sha256sum: 84be1a24db4773cbac5bd2e46057041947e6008e5ab300228b160ed6bd691327
      - module: github.com/containerd/containerd/v2
        version: v2.3.3
        sha256sum: 2da41dbc385cee1a4963a7424a6254de701e9045cfb9292cff5d8a57ed6d3ea9
      - module: github.com/containerd/continuity
        version: v0.5.0
        sha256sum: bc1857ce83f4d08781284557b9b3a31e2044b2c8143c83494ac55ab90cf61a07
      - module: github.com/containerd/errdefs
        version: v1.0.0
        sha256sum: b4ef42c38d00f2c81cf3e69646549b7f5dc8fb72de9402d7b391963dc0ac9162
      - module: github.com/containerd/errdefs/pkg
        version: v0.3.0
        sha256sum: 593bf56f1991517e493510815d8fc6d344b8550fbfb3de56812f015096aab24f
      - module: github.com/containerd/fifo
        version: v1.1.0
        sha256sum: b139b81b236b29613edffca908d29753b9f49a4d2e3ea472e16162b4bfdcdbc2
      - module: github.com/containerd/log
        version: v0.1.0
        sha256sum: 2008faf206ec820e7fc3d40baba924936c21347dafad4a7ff122fa90e26e57d7
      - module: github.com/containerd/platforms
        version: v1.0.0-rc.4
        sha256sum: ca98ec9fae23a02c54653aff728e7ccec440d1866eb9bcb1d47c0e553b26d24d
      - module: github.com/containerd/plugin
        version: v1.1.0
        sha256sum: e1f803ef59e9194c5a092c37dd8d34a2e0c7a5c6c7afb6b04c4344b452b73c84
      - module: github.com/containerd/ttrpc
        version: v1.2.9
        sha256sum: 0165bf2ac92bb7344af6483542592032f10c53cda252bdc5cad68bcd96b5550a
      - module: github.com/containerd/typeurl/v2
        version: v2.3.0
        sha256sum: 243aa4979ace10e7aff8300ccc32beb72460fb0afb1c9a51a72b79e0f4e1be22
      - module: github.com/cyphar/filepath-securejoin
        version: v0.7.0
        sha256sum: 601684f1d3cfc8391cbaf7e5973b0485db6a5037426d9cccf47935ca0a4d65dd
      - module: github.com/davecgh/go-spew
        version: v1.1.2-0.20180830191138-d8f796af33cc
        sha256sum: b4d0923b169b194f0016ec46f3df1ab0c68e27999743e43fe2de59ecb2484128
      - module: github.com/deitch/magic
        version: v0.0.0-20240306090643-c67ab88f10cb
        sha256sum: aac23daf12cf80266a8b2657dff94e6431c872a95885e109271d624fe62be042
      - module: github.com/diskfs/go-diskfs
        version: v1.7.0
        sha256sum: 1b443c0e026f74dfbd6442ef181ccc076a75b37b08890b69cfb30586e4adcf98
      - module: github.com/distribution/reference
        version: v0.6.0
        sha256sum: 08232852a7a908263599777daab50e4306bd877e2467df036206367496122bcc
      - module: github.com/djherbis/times
        version: v1.6.0
        sha256sum: 21d69060967bc03ea3c39ff8c0b1a95511e96eccd3749a2daef1a02af1bc0a85
      - module: github.com/dlclark/regexp2
        version: v1.12.0
        sha256sum: dac93d7598b95a6a2c8b334f98078c77d22e29a85b4f73573591bcda65406636
      - module: github.com/docker/cli
        version: v29.7.1+incompatible
        sha256sum: ba93019d56e5345c63d7f78c4fcce4ca42a4afa464b91eab138c18bf93c5a31d
      - module: github.com/docker/docker-credential-helpers
        version: v0.9.8
        sha256sum: e48517c81480520bda12dd1636260c081fe82fe1fe09c3bb6941a7a122441887
      - module: github.com/docker/go-connections
        version: v0.8.1
        sha256sum: 5e442ebd8f4006f2bc0ef192dd4813da487f94d34a2aa662c5b9b964742e2565
      - module: github.com/docker/go-units
        version: v0.5.0
        sha256sum: 039d53ebe64af1aefa0be94ce42c621a17a3052c58ad15e5b3f357529beeaff6
      - module: github.com/dsoprea/go-exfat
        version: v0.0.0-20190906070738-5e932fbdb589
        sha256sum: 56d32347a0ea3f457e202c3be2f6565f5c0837cb5ef6a0d583ab8b6ae60b4f49
      - module: github.com/dsoprea/go-logging
        version: v0.0.0-20200710184922-b02d349568dd
        sha256sum: e6e73dfd34d25a5ebbbf44bb249864aa3c3fa846faae64a1629e8cca528aba93
      - module: github.com/dustin/go-humanize
        version: v1.0.1
        sha256sum: 319404ea84c8a4e2d3d83f30988b006e7dd04976de3e1a1a90484ad94679fa46
      - module: github.com/edsrzf/mmap-go
        version: v1.2.0
        sha256sum: 1ec1c0d3b80ad3259bb66e09e8bf2b7e1de2ce0928c8c6d6fcbe982bb00f8d75
      - module: github.com/elazarl/goproxy
        version: v1.7.2
        sha256sum: 5459c32a441fe243c3129654d55632421a3068050df1bef70f133c46ed706532
      - module: github.com/elliotwutingfeng/asciiset
        version: v0.0.0-20260801111138-45c5fff54b41
        sha256sum: 159465bfc461b083291d5383c08cc923ceac26179a8301daf2dcb0cd6446e3a8
      - module: github.com/emirpasic/gods
        version: v1.18.1
        sha256sum: 1d75e291ac15cf9ca2fcd8bd24e2f7203abad319cd3622cd1b19db5c4fb9daa5
      - module: github.com/erikgeiser/coninput
        version: v0.0.0-20211004153227-1c3628e74d0f
        sha256sum: bd7f9a62374dc4d111863491729763a0eafcdc440d4a6ebead61d3af4a2c3f2f
      - module: github.com/erikvarga/go-rpmdb
        version: v0.0.0-20261001143808-1a11b79cbdd3
        sha256sum: 0d5b06b8f056bbddda35ab26c6f8bca7f9d866a2b3fd7acba964cfa533e63328
      - module: github.com/felixge/httpsnoop
        version: v1.1.0
        sha256sum: e3405a361843f8e69f64e41b523512925cd50fd5ea108b7912534922c31b00e7
      - module: github.com/gkampitakis/ciinfo
        version: v0.3.4
        sha256sum: d72810038e35518d5558e69d4f06a054cb3be66af456d0f2ef07b9262b7276e9
      - module: github.com/gkampitakis/go-snaps
        version: v0.5.23
        sha256sum: 11fcf55d1ba9f0f931350b13776ded4e87a80023f3c6eab97a3222c4ead36681
      - module: github.com/glebarez/go-sqlite
        version: v1.20.3
        sha256sum: e494f16ce62620e2bbf641542876996b385d69de755e6ec571504945cbc9c710
      - module: github.com/gliderlabs/ssh
        version: v0.3.8
        sha256sum: 3e9697b8a4c4aff1916002ed8cd2da5b9f356fadf8b230af094c9bf0c5d238f6
      - module: github.com/go-errors/errors
        version: v1.5.1
        sha256sum: 9630a42ecb17920a5f9ce332356f8a28ad4aaff529e2ecb676b4a1d11d3149c0
      - module: github.com/go-git/gcfg
        version: v1.5.1-0.20230307220236-3a3c6141e376
        sha256sum: 4cd67689e108cfd654591c4a7f693ac5110634a73dabc12686fb07854556c480
      - module: github.com/go-git/go-billy/v5
        version: v5.9.1
        sha256sum: f763708d528588b81422068924d81f23bd16527f2c47ac2a32c0105aad4099f0
      - module: github.com/go-git/go-git-fixtures/v4
        version: v4.3.2-0.20231010084843-55a94097c399
        sha256sum: 50918111651335001cd5837ba71283647baab911842a20d233381148752100c2
      - module: github.com/go-git/go-git/v5
        version: v5.19.2
        sha256sum: 8912b30dd8f38491ea74ab818cacc50b0083fafb4c5c896b2824e36090dab133
      - module: github.com/go-logr/logr
        version: v1.4.4
        sha256sum: 3ab107c1d280ce798eaa744efd595982fa709d4023f3f38d24189827483c1710
      - module: github.com/go-logr/stdr
        version: v1.2.2
        sha256sum: 9dd6893bf700198485ae699640b49bc1efbc6c73b37cb5792a0476e1fd8f7fef
      - module: github.com/go-ole/go-ole
        version: v1.3.0
        sha256sum: bbf5b3bfa227a5daa06eb16ecdecccc0b20e08749bf103afb523fd72764e727a
      - module: github.com/go-restruct/restruct
        version: v1.2.0-alpha
        sha256sum: 54bb2e4a7ca297c8580e54d9c879d2ecffddd97992c6c763cbe527daf6b04ad2
      - module: github.com/go-test/deep
        version: v1.0.8
        sha256sum: 233399e19c35bf44f21357b8424e484dd76c0950a0d87f51c0dacb23a52ea346
      - module: github.com/go-viper/mapstructure/v2
        version: v2.5.0
        sha256sum: 326f8e00f648af4ae8e6e18c606325e4206a92d6ed42f486dc2f4da8e1897547
      - module: github.com/gobwas/glob
        version: v0.2.3
        sha256sum: 0cfe486cd63d45ed4cb5863ff1cbd14b15e4b9380dcbf80ff26991b4049f4fdf
      - module: github.com/goccy/go-yaml
        version: v1.19.2
        sha256sum: 9ea8b466385c1ecf61fa55b68e409ea048b3d7fb1178eba66c1e24a7a30dfffb
      - module: github.com/gohugoio/hashstructure
        version: v0.6.0
        sha256sum: 4bd82809c462527e3ee2a1b1eef0f56418b2a82082231e315d6bb10cd691a836
      - module: github.com/golang-jwt/jwt/v5
        version: v5.3.1
        sha256sum: 5c9a74494e2bc746cee56558b5473252af5767f7ea4044caa9ea0fa2a056fec7
      - module: github.com/golang/groupcache
        version: v0.0.0-20241129210726-2c02b8208cf8
        sha256sum: 163367355442a630b12b0b452892cd98e99fcfdf7e40b68d358be73479cc1c23
      - module: github.com/golang/protobuf
        version: v1.5.4
        sha256sum: 9a2f43d3eac8ceda506ebbeb4f229254b87235ce90346692a0e233614182190b
      - module: github.com/google/go-cmp
        version: v0.7.0
        sha256sum: 64a9ce046f2c320e3783fba0d1f4a15f8a18f0b009b67bf27f7630919db3f539
      - module: github.com/google/go-containerregistry
        version: v0.21.8
        sha256sum: 4854b9451601880a69b4a649ce32d2e03a152c929b16ae01afe4d6b8c203731e
      - module: github.com/google/go-cpy
        version: v0.0.0-20211218193943-a9c933c06932
        sha256sum: c85548d6f959df942c60040c8bc94b9eaed6c2a239daac2121889274c6c4b37b
      - module: github.com/google/jsonschema-go
        version: v0.4.3
        sha256sum: 9359ac98ff69ed2f3c51e3b2c9e3ab4cc16ca7d54dfe310fa5d258bd5decdfb5
      - module: github.com/google/osv-scalibr
        version: v0.5.4-0.20261009010329-5be78a00e3c2
        sha256sum: 3a248c185de32c9a00b1874d756ba496cfcdabd7627ff1f346a496ed0b94044a
      - module: github.com/google/pprof
        version: v0.0.0-20260802141513-ef3492d7dac3
        sha256sum: ac456417ec911aaa66b5440a85c39d7e5a649532e77fe9ba26c1d03112c5c35d
      - module: github.com/google/uuid
        version: v1.6.0
        sha256sum: d0f02f377217f42702e259684e06441edbf5140dddcc34ba9bea56038b38a6ed
      - module: github.com/gorilla/css
        version: v1.0.1
        sha256sum: 870531962ce9787f8dfa2d7a5476be66e08a133c6c75155b20c551e7ac5bc25c
      - module: github.com/hashicorp/golang-lru/v2
        version: v2.0.7
        sha256sum: 2eb92ff13970bccd460efae14255bfc03bb51474da0137e477a60f95561acc30
      - module: github.com/hexops/gotextdiff
        version: v1.0.3
        sha256sum: a10c3942f09bc5132268d22d4bb9d0c1849122d533fe8cdf65ea69da05cebbaf
      - module: github.com/ianlancetaylor/demangle
        version: v0.0.0-20260724033716-83e58baca724
        sha256sum: fabdd52cd74a737632600aea516f473f4dd233bc8a6e7ac83ba6035999bf8d1a
      - module: github.com/icholy/digest
        version: v1.2.0
        sha256sum: 5ff9d8b2a7dcae0d50b57060035258b3d85f6a8afff00d6bf9d0e3ab37137a06
      - module: github.com/jbenet/go-context
        version: v0.0.0-20150711004518-d14ea06fba99
        sha256sum: 4cd0955abeea43dc4b5a08b8769e696109e0376f2a113a9b8eff13cc90cac1c7
      - module: github.com/jedib0t/go-pretty/v6
        version: v6.8.3
        sha256sum: f6dfe2ff3f738dd91ba406aaffebdeb81a1b85edb240aec33f64306551373358
      - module: github.com/kevinburke/ssh_config
        version: v1.6.0
        sha256sum: cb3e2a23c10382dac238ea51ed1162c75cb7e986532d1ce92a2051469ca24e44
      - module: github.com/klauspost/compress
        version: v1.19.1
        sha256sum: a77e019f60dff8bdf00ad137985c808957cc657381daa4281824843bc6b46910
      - module: github.com/klauspost/cpuid/v2
        version: v2.4.0
        sha256sum: 4e0c1281558514efccc2cc3ab78d430426486fe9101d6dcc9a1b090e05c26c69
      - module: github.com/kr/pretty
        version: v0.3.1
        sha256sum: ecf5a4af24826c3ad758ce06410ca08e2d58e4d95053be3b9dde2e14852c0cdc
      - module: github.com/kr/text
        version: v0.2.0
        sha256sum: 368eb318f91a5b67be905c47032ab5c31a1d49a97848b1011a0d0a2122b30ba4
      - module: github.com/kylelemons/godebug
        version: v1.1.0
        sha256sum: dbbd0ce8c2f4932bb03704d73026b21af12bd68d5b8f4798dbf10a487a2b6d13
      - module: github.com/lucasb-eyer/go-colorful
        version: v1.4.1
        sha256sum: 399a71ecf3e3aaa0af96a779f1c106688b095dbfd0a85455a7c706d3d7ff9ebd
      - module: github.com/lunixbochs/struc
        version: v0.0.0-20241101090106-8d528fa2c543
        sha256sum: c6ec6530e2046fba943d714e4ccf8dda6e842b5e7529fc7c4bdbd61f347b6911
      - module: github.com/maruel/natural
        version: v1.3.0
        sha256sum: 2abea434a97d45807d30b11dcd39cf8daedde137aed4181f83abc33b52454c48
      - module: github.com/masahiro331/go-ext4-filesystem
        version: v0.0.0-20260423010602-fe51f5b5e52b
        sha256sum: 5cbd28357feba18810ac3bd93f48b6c799a2420a96aaf3aef633385824522a49
      - module: github.com/mattn/go-isatty
        version: v0.0.24
        sha256sum: 4fcffec0bae0ad4af7bf96e2497a817d85de64af19ffe31d82bda362148234b8
      - module: github.com/mattn/go-localereader
        version: v0.0.1
        sha256sum: aa67306797b071ce93188fe2834f63ffd7963faf623d49229d891ef52e595b35
      - module: github.com/mattn/go-runewidth
        version: v0.0.27
        sha256sum: 78b1690bd2506faeeecff9cce615e5710c12fe25a5393abe3c2503d0ea4ee2ea
      - module: github.com/mattn/go-shellwords
        version: v1.0.14
        sha256sum: b6939f402c7e38e6a6310c6c83a54a5ecd496fac15d60b4b12f01cde0a4439e3
      - module: github.com/michaelkedar/xml
        version: v0.0.0-20250626233154-4ec9e090d1cd
        sha256sum: 75396549f47eacbd27f2ba5055f260188e21cfbe90ffa37bf6f1394c6de35771
      - module: github.com/microcosm-cc/bluemonday
        version: v1.0.27
        sha256sum: dbbc62b06600331e29a4d453b8b3e95b1ba48e50baddfd981a3825f8d0043011
      - module: github.com/micromdm/plist
        version: v0.2.2
        sha256sum: 84ccdf73b3b59bdfd665ebfe7da0ba64f03cdf2bbdd215206f7d1a4ede4dce64
      - module: github.com/moby/buildkit
        version: v0.32.2
        sha256sum: b87028619779a42901292ee0664deb75838cbf7a6e28a8ed5045dcba1083c4ae
      - module: github.com/moby/docker-image-spec
        version: v1.3.1
        sha256sum: e3fe212be410465c0cae032baa7e2c7282b9bb878f081f00549333edc260c306
      - module: github.com/moby/locker
        version: v1.0.1
        sha256sum: f07361346d12a24e168db7fb2f21281883bee6060f1aedf7507bccf20c4a793f
      - module: github.com/moby/moby/api
        version: v1.55.0
        sha256sum: 5e6428e58b17018a8e1ecffb176dbdffc7678b97f7bf4f50fd3f814747de4847
      - module: github.com/moby/moby/client
        version: v0.5.1
        sha256sum: 1fbfaea19d085d23f99d47352f0665713c11986b383b8209625abac6db2e04b2
      - module: github.com/moby/sys/mountinfo
        version: v0.7.2
        sha256sum: 94f79687bc3b72ca4cc60fafda851454fefc0ef04bdb4499e8c7c2b2e231b5d3
      - module: github.com/moby/sys/sequential
        version: v0.7.0
        sha256sum: 7079b80c6b1ce943a924f1b6daa9fc05ba8ce1c6e37da354dca5aada6510291b
      - module: github.com/moby/sys/signal
        version: v0.7.1
        sha256sum: 8c3853bc4ba4f283f7fccde5c548e93c3613db46f5209394a60cdbbc3eaf4f42
      - module: github.com/moby/sys/user
        version: v0.4.1
        sha256sum: acfdb68bda18ee112adacf55e0b20752a1f5633c55fb020f2a10a9b2eeaec46a
      - module: github.com/moby/sys/userns
        version: v0.1.0
        sha256sum: 24c102bcc418dedc378fbcaa53b10251b35042f2e86bf088f773250064fe3080
      - module: github.com/modelcontextprotocol/go-sdk
        version: v1.8.0
        sha256sum: f18a0f1664a13aa3f77208243f3e7d81c95c93c5714a76ba280c044cc2da0ec9
      - module: github.com/mohae/deepcopy
        version: v0.0.0-20170929034955-c48cc78d4826
        sha256sum: 41ba726508a213f4af89e7d58937263ff778e352d591edd422d3a3dc3272585c
      - module: github.com/muesli/ansi
        version: v0.0.0-20230316100256-276c6243b2f6
        sha256sum: 59c0d420908d51df3c701510337fbe42bfb4d48fcc5f490b5eb2f36fc25f91b9
      - module: github.com/muesli/cancelreader
        version: v0.2.2
        sha256sum: f0654e7f8f8a49b02ff10a75ccaa0eb08a65aaacbc45f5ba93305276e2ac7f61
      - module: github.com/muesli/reflow
        version: v0.3.0
        sha256sum: 78e2cebf5a46a9b7c7c52d55d4ac4650cabd9135f180092e3f476293bb86696e
      - module: github.com/muesli/termenv
        version: v0.16.0
        sha256sum: ba02d3ebd9c1d87e2c2133b1f2bb61a7001b3765196e8016029ce9fe54c5c0fc
      - module: github.com/ncruces/go-strftime
        version: v1.0.0
        sha256sum: c1a7e718dbf5f779e9fc98b7354ed4d98de2949b83b65837c429b4b2c8c27686
      - module: github.com/onsi/gomega
        version: v1.34.1
        sha256sum: 1ee4fadbf25a01e7fabba93aa88cbf6c4c79ac2d8a45a6017e3ea4f696d51993
      - module: github.com/opencontainers/go-digest
        version: v1.0.0
        sha256sum: 615efb31ff6cd71035b8aa38c3659d8b4da46f3cd92ac807cb50449adfe37c86
      - module: github.com/opencontainers/image-spec
        version: v1.1.1
        sha256sum: 3a32eeb459719172947c20be78b5b7293c6ea84f4039184e846f6b676bc19574
      - module: github.com/opencontainers/runtime-spec
        version: v1.3.0
        sha256sum: 09e58e616eb70f2972ed19ada447dd661b298b39777adb0bbd35c94886bdbdf8
      - module: github.com/ossf/osv-schema/bindings/go
        version: v0.0.0-20260902031056-b388a18021a3
        sha256sum: efc3dc1d8fe9ffb2da8e418f9ad712dc5fd982abb61833685fbba3f97610d808
      - module: github.com/owenrumney/go-sarif/v3
        version: v3.3.1
        sha256sum: 38efd805c036d2d4fc3465984674d21fa5e26bb9fa044b3d5e17e9f5faf50929
      - module: github.com/package-url/packageurl-go
        version: v0.1.7
        sha256sum: 61a9ea183ca003f2280867dc1e10c9b8910e61f65045670a72d36722b0ea5fcf
      - module: github.com/pandatix/go-cvss
        version: v0.6.4
        sha256sum: 2c810021744da6d37335f1b467939180b4642db6e01dca1247d0168236d3fab7
      - module: github.com/pierrec/lz4/v4
        version: v4.1.27
        sha256sum: 702ad206ffeec8d3ac8bc1ce7e2d0b201fbc7683c8ab8758210172c54f03353f
      - module: github.com/pjbgf/sha1cd
        version: v0.6.0
        sha256sum: d72c5f828279f5e52c5642995441676c380a827b42c09724b7540a6de688a450
      - module: github.com/pkg/errors
        version: v0.9.1
        sha256sum: d4c36b8bcd0616290a3913215e0f53b931bd6e00670596f2960df1b44af2bd07
      - module: github.com/pkg/xattr
        version: v0.4.12
        sha256sum: 3657614c6f28f6298164935f48af2515835ae04190ed9f6954b5cdf89b1aee21
      - module: github.com/planetscale/vtprotobuf
        version: v0.6.1-0.20240319094008-0393e58bdf10
        sha256sum: 6fdbac53c6ace58d732be8ec29c1aae928639eb12960cc4c52a9f7a25395ca05
      - module: github.com/pmezard/go-difflib
        version: v1.0.0
        sha256sum: de04cecc1a4b8d53e4357051026794bcbc54f2e6a260cfac508ce69d5d6457a0
      - module: github.com/remyoudompheng/bigfft
        version: v0.0.0-20230129092748-24d4a6f8daec
        sha256sum: 9be16c32c384d55d0f7bd7b03f1ff1e9a4e4b91b000f0aa87a567a01b9b82398
      - module: github.com/rivo/uniseg
        version: v0.4.7
        sha256sum: b995e4aa0cc1e5779cc61138ac925cb8c1e963e40c80e4b93ee8553812ebb792
      - module: github.com/rogpeppe/go-internal
        version: v1.15.0
        sha256sum: c84d958181618407e61f0f837c0a226016cc7bb0de6d26d2d82fd476e3bf1f70
      - module: github.com/rust-secure-code/go-rustaudit
        version: v0.0.0-20250226111315-e20ec32e963c
        sha256sum: ae9e48aaed898fab5ccd3becb1fb44e5ef87513c97b622d2665a51db4900f10f
      - module: github.com/saferwall/pe
        version: v1.6.5
        sha256sum: bec1d6f6525452a16126d70577085fc456161cd3dd1f404909bcac1b5866e153
      - module: github.com/sahilm/fuzzy
        version: v0.1.3
        sha256sum: d93c49af536d39cd2f25be6f75e4bd4c3af5b0ca8f9b19121f9b7a6536d05c30
      - module: github.com/santhosh-tekuri/jsonschema/v6
        version: v6.0.2
        sha256sum: fe5eb88614e560d2072d1f95708ac217b6cb047789531ad633114ec277338635
      - module: github.com/sebdah/goldie
        version: v1.0.0
        sha256sum: 750ca88bfd6865811f63c7d509538d97808472e3d26a50690a4921d598fb2d6b
      - module: github.com/segmentio/asm
        version: v1.2.1
        sha256sum: 04ee03ed0972329c3c8fa1cd57a30397be37b82f3e2ba2251d56ba9c6fbc1d99
      - module: github.com/segmentio/encoding
        version: v0.5.4
        sha256sum: 2189639875fe1153571445dc9b5dcaf221554143fe6701426fba69aa77780681
      - module: github.com/sergi/go-diff
        version: v1.4.0
        sha256sum: 63aef1860b251af1421ba0a014a6bb08a60833f13f948f3d88d66754bb484f53
      - module: github.com/shirou/gopsutil
        version: v3.21.11+incompatible
        sha256sum: 2079d749fb3bd347e9fd10418826ebf0d48ff5c171455060ef7d9bf842ccb8d9
      - module: github.com/sirupsen/logrus
        version: v1.9.4
        sha256sum: 3847d00c5ee6948f1ff0d0120bc343c55ce852becb7720f8f08f53eecfe9e437
      - module: github.com/skeema/knownhosts
        version: v1.3.2
        sha256sum: b4bba0494171ccdbbebd46c4e2b494d284ea07c3719e85694f5bc7867513ddf2
      - module: github.com/spdx/gordf
        version: v0.0.0-20250128162952-000978ccd6fb
        sha256sum: a3318eae31d13c7be5691822d7cabaf46a8dce8e4a8303c15de77950e2c5d8ff
      - module: github.com/spdx/tools-golang
        version: v0.5.7
        sha256sum: 32878e7a65f75f87dc89375504f0e5950c2a9881eeeee1ebcf4721bc5d4dc81c
      - module: github.com/stretchr/testify
        version: v1.12.1
        sha256sum: 6874ed1c4b0b7e9feb27989b16c179b36590020633436ae260cefc5f5565589f
      - module: github.com/terminalstatic/go-xsd-validate
        version: v0.1.8
        sha256sum: 361eee7a38992790b3ed47e3b2748f17909c6a135c45681bf745bfbb82c6763f
      - module: github.com/thoas/go-funk
        version: v0.9.3
        sha256sum: 73e643f2368addaa84bbe0384e75255abfda75ebb4f721edfc91ca7167703bb7
      - module: github.com/tidwall/gjson
        version: v1.19.0
        sha256sum: 7ba89e2bab7ae946a22f6fc7317e8b5d6d5b65885185d986676553a440a3a6b6
      - module: github.com/tidwall/jsonc
        version: v0.3.3
        sha256sum: a50aed626a275151ba633b8108269ad46fd5858eeb3a81d298a26f423ad5960b
      - module: github.com/tidwall/match
        version: v1.2.0
        sha256sum: f35502f3dd450fa84ddc7b028310f7fecc86c8112f2397fe7ff7941c5afbcbc1
      - module: github.com/tidwall/pretty
        version: v1.2.1
        sha256sum: 9327579bf9e610de753eeb7c35c8cf1e3f56e6e5623cbf65e47bc8076023d1ab
      - module: github.com/tidwall/sjson
        version: v1.2.5
        sha256sum: fc40fda87c7de55362f6386e069d674772f25c9d76411ee823acb9ac78b20565
      - module: github.com/tink-crypto/tink-go/v2
        version: v2.7.0
        sha256sum: e9f6c777f7891fee58a7f700bb5b30d9ebc5d82f6a841020a9df08e425704fec
      - module: github.com/tklauser/go-sysconf
        version: v0.4.0
        sha256sum: 61e89253bc4d7091170601be12633dc02e94a3bc30470b081a2449944fa18784
      - module: github.com/tklauser/numcpus
        version: v0.12.0
        sha256sum: 56c22a112976df3a4d8db776b41288658070650ae6382ec86d0a32fc07af0276
      - module: github.com/tonistiigi/go-csvvalue
        version: v0.0.0-20240814133006-030d3b2625d0
        sha256sum: 51bce4d81fe31cb3edfcfaa124a74e2cff5ef08ed8d6f54afb054b39dc0ed89a
      - module: github.com/ulikunitz/xz
        version: v0.5.16
        sha256sum: 0a7e01908924983df9118e62c1f49131e1e365f17b4e4e3020805e8fdfe6307a
      - module: github.com/urfave/cli/v3
        version: v3.13.0
        sha256sum: 90f537d1ef33c7361904ac1828f04ef6a0003d80a3a3c0902f2f0489e6a6c799
      - module: github.com/xanzy/ssh-agent
        version: v0.3.3
        sha256sum: 19a86c2623b20cc98687bddd89e3f023db0ca51c8bc9e38b9ad9c56e5b7d110d
      - module: github.com/xeipuuv/gojsonpointer
        version: v0.0.0-20190905194746-02993c407bfb
        sha256sum: 11b54f0bc358b09261075c3e15cd14d57102f3ab1ba88c345c53eab6aaf228de
      - module: github.com/xeipuuv/gojsonreference
        version: v0.0.0-20180127040603-bd5ef7bd5415
        sha256sum: 7ec98f4df894413f4dc58c8df330ca8b24ff425b05a8e1074c3028c99f7e45e7
      - module: github.com/xeipuuv/gojsonschema
        version: v1.2.0
        sha256sum: 55c8ce068257aa0d263aad7470113dafcd50f955ee754fc853c2fdcd31ad096f
      - module: github.com/xhit/go-str2duration/v2
        version: v2.1.0
        sha256sum: 907db1bdf362568191e659f82339c21a4031d433bc5ac52f36de23eeceb8cb26
      - module: github.com/xo/terminfo
        version: v0.0.0-20220910002029-abceb7e1c41e
        sha256sum: b8f4270191e08e135e932dfe168769046a4268ec7f3892593b1d773b2c5fa4cf
      - module: github.com/yosida95/uritemplate/v3
        version: v3.0.2
        sha256sum: 65a29b6ab759cd30a1ed496a8a77b144a5683b89d505cfde51f907cb7ab9b8bd
      - module: github.com/yuin/goldmark
        version: v1.8.5
        sha256sum: 2fa45e249cefad0a1b2ae0efebbaf59a86380a211349d3e9f04dbc172830cf53
      - module: github.com/yuin/goldmark-emoji
        version: v1.0.6
        sha256sum: a993ef47fd534db3246a5676611906bf9636dae575c6526410db4c60f38cdb2a
      - module: github.com/yusufpapurcu/wmi
        version: v1.2.4
        sha256sum: c2a0a12203162ef8fd6f65e191aac359823d370e113122cbd8e80711ddc9c1f9
      - module: go.etcd.io/bbolt
        version: v1.5.0
        sha256sum: 2c350ca36afba707b917529a8049b001c71915c99c152d5e2600ed4bac6fbc37
      - module: go.opencensus.io
        version: v0.24.0
        sha256sum: 203a767d7f8e7c1ebe5588220ad168d1e15b14ae70a636de7ca9a4a88a7e0d0c
      - module: go.opentelemetry.io/auto/sdk
        version: v1.2.1
        sha256sum: a08a16fc0a7041cdb875f47a260a56000632212c85f65a302a043c76380c8335
      - module: go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp
        version: v0.70.0
        sha256sum: 5afae012c182ed95c9068c4b4de772677fbfecb9fbe41605046f907abba8bc92
      - module: go.opentelemetry.io/otel
        version: v1.45.0
        sha256sum: 65b5fc93c93f4eaef740b4bba81fd2543f248d5df85cf4d1ddf9ab459b30f7a2
      - module: go.opentelemetry.io/otel/metric
        version: v1.45.0
        sha256sum: 8f30ef0039306bf3a4421b8c08e3fc8922d13503dce53b3438e860b3628faecd
      - module: go.opentelemetry.io/otel/sdk
        version: v1.45.0
        sha256sum: ad0e63fa1cfc01dffec2a90a8f2d2c1bc0f55d0462940176dc41b7ada0d03258
      - module: go.opentelemetry.io/otel/sdk/metric
        version: v1.45.0
        sha256sum: 535731f380b12313c4ed5d7adb4b7d3a357609b212b03c8b7dc437809787be91
      - module: go.opentelemetry.io/otel/trace
        version: v1.45.0
        sha256sum: 32d7d64ea5991378184b03a9ed7b7822b17691a239508a6905fdd73819cb6c6f
      - module: go.uber.org/goleak
        version: v1.3.0
        sha256sum: 70edef0ce7d830d992f024e527fd3452069b884f94a27787a718bd68dd620702
      - module: go.uber.org/multierr
        version: v1.11.0
        sha256sum: 2249b5d2fdce61f6ee661a679d8552599af084a761cbbc871da77641bddce0c3
      - module: go.uber.org/zap
        version: v1.28.0
        sha256sum: 49d6287497537480c2e9330e3dee9c38ac793fbf9fd2257dbc4fa5697818919c
      - module: go.yaml.in/yaml/v2
        version: v2.4.4
        sha256sum: 1b98a6a498cf255c5f2982d32c74633bc7969770957e98103ac1e14345aa4576
      - module: go.yaml.in/yaml/v3
        version: v3.0.5
        sha256sum: f2d70caa35f66283aec58b889af8c5f07c374c5934be27a738c1215263e19205
      - module: go.yaml.in/yaml/v4
        version: v4.0.0-rc.6
        sha256sum: 1c362e5bfb0495a037e58b8d5f7baa6df713f949ee0e394398e86c1f2992cca9
      - module: golang.org/x/crypto
        version: v0.58.0
        sha256sum: b0a45594cda20ddb4264d84aeff9b588b8570bf6a2833c51a0b821734a298d95
      - module: golang.org/x/exp
        version: v0.0.0-20260603202125-055de637280b
        sha256sum: 58fe5c8604984923267e1cd7b9709fe37e1491c4a18df8f97adb38cc6d1b6cbf
      - module: golang.org/x/mod
        version: v0.41.0
        sha256sum: 201e678d0a35b18b246abe58d80017b75d60be21cbaf4cbb9e963b48872565a9
      - module: golang.org/x/net
        version: v0.61.0
        sha256sum: f6843a98d608298e48a6ca287292c9a6fae066284050ce174d5ffb781c9b3dcf
      - module: golang.org/x/oauth2
        version: v0.36.0
        sha256sum: 15bf65ff103e5dafc809d78cd037a1d1e88ccb8451824e851156002a13304504
      - module: golang.org/x/sync
        version: v0.24.0
        sha256sum: ca3fcf3ea8259e75891f7947e1a816a5b89402c542d45d8bbbd9e061b0c58019
      - module: golang.org/x/sys
        version: v0.49.0
        sha256sum: e73a06591ca0d7016ce3ccb45c36a8ed7128468aecc1a357f94d815c760c6b31
      - module: golang.org/x/telemetry
        version: v0.0.0-20260924152758-ed294f943157
        sha256sum: fd337baf7135f8e4c98ea04830184b23b81bd1f6b86c925f82a7d0fcbb54c971
      - module: golang.org/x/term
        version: v0.47.0
        sha256sum: d990d5ab94dfa41ba980645b721bba7490064337a01bb03e6cacace70e8df0bf
      - module: golang.org/x/text
        version: v0.43.0
        sha256sum: b75131f628f6e2e4892fd638d33127e952a5027775e0162b94ba069cb4e13863
      - module: golang.org/x/time
        version: v0.15.0
        sha256sum: 8cfb20e915fa5d6c3fd264304233f8d71a3385e48a37819239c532ad9da27f84
      - module: golang.org/x/tools
        version: v0.51.0
        sha256sum: 176a49a54ed781feb196235cc640f0454884f4e59d0b859ab4ecc9169cde513c
      - module: golang.org/x/tools/go/expect
        version: v0.1.1-deprecated
        sha256sum: b2389159ddd768c6bd83a0cc92bbf9be01c32ca973c366fc224b79762d90dd79
      - module: golang.org/x/tools/go/packages/packagestest
        version: v0.1.1-deprecated
        sha256sum: 15792a78ef9338b2c08d5010b24211f85c4d39e8c31db316f1ca4a891605ed01
      - module: golang.org/x/vuln
        version: v1.6.0
        sha256sum: b677bec1ea587aa03320e7d65520dd52cae824fd197ede36417a5f572be41cb3
      - module: golang.org/x/xerrors
        version: v0.0.0-20240903120638-7835f813f4da
        sha256sum: 07ee9f680118861ee732ce0df4553b834383b87e0519fb9a0990c51d7abd6885
      - module: gonum.org/v1/gonum
        version: v0.17.0
        sha256sum: dadeb3d260548de27375f7188bdfd5a175110120fd8ee8085a63b0dff2cae501
      - module: google.golang.org/genproto/googleapis/api
        version: v0.0.0-20260803160001-6ac0973c030d
        sha256sum: 81fb4ff242fb2e9ec4328eed36190bf5ba96307ff85a057e2327fbd171b47650
      - module: google.golang.org/genproto/googleapis/rpc
        version: v0.0.0-20260803160001-6ac0973c030d
        sha256sum: a17ff826d2b2e39c2179f99cea77e36137af38f193a718c6445570d326784111
      - module: google.golang.org/grpc
        version: v1.84.0
        sha256sum: a14bebefbac1ec115d9e1f8042006c185d65adf43a91644f3e58df0688831b95
      - module: google.golang.org/protobuf
        version: v1.36.12
        sha256sum: 68f8a3174aff42950fd9bd02c11b45c6986eb8060508d124d1c3dd6bf86b9be6
      - module: gopkg.in/check.v1
        version: v1.0.0-20201130134442-10cb98267c6c
        sha256sum: f555684e5c5dacc2850dddb345fef1b8f93f546b72685589789da6d2b062710e
      - module: gopkg.in/dnaeon/go-vcr.v4
        version: v4.0.7
        sha256sum: b1d376e76f0520216d9cda0bf9ffbc0e79b282549f2d5d54163640ec6eab2ba4
      - module: gopkg.in/ini.v1
        version: v1.67.3
        sha256sum: 20ab7e3150a9d0a098b5f642cc2a1ba1886da48ae0ec4080240bf33f7a7086c2
      - module: gopkg.in/warnings.v0
        version: v0.1.2
        sha256sum: c412b1f704c1e8ba59b6cfdb1072f8be847c03f77d6507c692913d6d9454e51c
      - module: gopkg.in/yaml.v3
        version: v3.0.1
        sha256sum: aab8fbc4e6300ea08e6afe1caea18a21c90c79f489f52c53e2f20431f1a9a015
      - module: gotest.tools/v3
        version: v3.5.2
        sha256sum: d7c40ae135e4a34dee9ca4847ad18208f138847721e693647b897259287a1d4b
      - module: modernc.org/cc/v4
        version: v4.29.1
        sha256sum: 33131f21d7d8b4b8560ebc6494b21a7cd224ad7e5f0fe794b8968895a78022ec
      - module: modernc.org/ccgo/v4
        version: v4.34.6
        sha256sum: 04b683a9cb7ccb3120d246f1b511a17fc1c9121de642bf65a8fa6ee2019b3b6f
      - module: modernc.org/fileutil
        version: v1.4.0
        sha256sum: 521c4c8778420b7cf8e72cc3e7dea296989bf651fde511e6919939af8424b6c3
      - module: modernc.org/gc/v2
        version: v2.6.5
        sha256sum: 81acefe8212e783eaca4d33554acce0ee60b3ce060071f96047b922e1214e2f5
      - module: modernc.org/gc/v3
        version: v3.1.4
        sha256sum: 58f628c7387e3639aa06d590223969c6fad5767ac6c49f497eb835bbb0c734a0
      - module: modernc.org/goabi0
        version: v0.2.0
        sha256sum: b6f4bb78a21d826d1c4933a3ea4c8b9939a61391c289aeb45f5f53929ab9827a
      - module: modernc.org/libc
        version: v1.74.4
        sha256sum: e68439e5374517936f0f8f13c87ab1e565632099537f13ed3238c24900cfa72f
      - module: modernc.org/mathutil
        version: v1.7.1
        sha256sum: 5be0da18eb557a1198bfe370e37022f2dbdb9cdc5d63130fc8e8330ab240bd2e
      - module: modernc.org/memory
        version: v1.11.0
        sha256sum: 4930b81d10818a6d11497204fe06b2edc359136a7881586363caa694c8607d0c
      - module: modernc.org/opt
        version: v0.2.0
        sha256sum: e8629d448ebc94f7143c5ff3fb981a099a5ea173958770f4b9a36b27c27eec43
      - module: modernc.org/sortutil
        version: v1.2.1
        sha256sum: 9e1de659d552156ce018f31eb88ff879d82c406fd4746b9a1131e0f89c6d1ee1
      - module: modernc.org/sqlite
        version: v1.56.0
        sha256sum: 6321abf675769662cda07d8cd922eac3eb42e37877a0da3c1b5d7227b2c2417b
      - module: modernc.org/strutil
        version: v1.2.1
        sha256sum: 5b8fa61ca4141c5fd82183fad4bc7a45af8237b6fb1dfca65ce7960a03c483c4
      - module: modernc.org/token
        version: v1.1.0
        sha256sum: 3efaa49e9fb10569da9e09e785fa230cd5c0f50fcf605f3b5439dfcd61577c58
      - module: osv.dev/bindings/go
        version: v0.0.0-20260805021707-3a57b89df3b6
        sha256sum: 25d81815376e1e96ae4b41ff5b4e055a895e450e11d1e9f56024c80e1347bb48
      - module: pgregory.net/rapid
        version: v1.2.0
        sha256sum: c48fcf01d3621eb8fde71a0cfa46c3c1bb12cc5a038951bbef903b16916ae64a
      - module: sigs.k8s.io/yaml
        version: v1.6.0
        sha256sum: cf88648a471581817b00a42ee8d24fd73eb0e3503998cf46d8e63787e11e5052
      - module: www.velocidex.com/golang/go-ntfs
        version: v0.2.1
        sha256sum: 5dddadc86526d3611acad0b6966def38b929694a2be474b40c4174521b876ce3
      - module: www.velocidex.com/golang/regparser
        version: v0.0.0-20250203141505-31e704a67ef7
        sha256sum: 83532fb80ccfe9d333a933fa9fed5f31d1cc70de1e42fd9bb65fe64c60e734fd
