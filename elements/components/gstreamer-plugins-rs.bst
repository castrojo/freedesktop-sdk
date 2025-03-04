kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- public-stacks/buildsystem-autotools.bst
- components/cargo-c.bst
- components/hotdoc.bst
- components/rust.bst

depends:
- components/gstreamer-plugins-bad.bst
- components/dav1d.bst

# disable everything by default to prevent new plugins getting added
# on updates, only enable plugins which are in use by apps
variables:
  meson-local: >-
    -Dauto_features=disabled
    -Dtests=disabled
    -Ddoc=enabled
    -Drtp=enabled
    -Dgif=enabled
    -Dspotify=enabled
    -Dhlssink3=enabled
    -Ddav1d=enabled

sources:
- kind: git_repo
  url: freedesktop:gstreamer/gst-plugins-rs.git
  track: '*.*'
  exclude:
  - "gstreamer-*"
  ref: 0.13.5-0-g49e4a1438dd8ff1c3c7be07e48c95a02b20a0707
- kind: cargo2
  ref:
  - kind: registry
    name: addr2line
    version: 0.24.2
    sha: dfbe277e56a376000877090da837660b4427aad530e3028d44e0bffe4f89a1c1
  - kind: registry
    name: adler2
    version: 2.0.0
    sha: 512761e0bb2578dd7380c6baaa0f4ce03e84f95e960231d1dec8bf4d7d6e2627
  - kind: registry
    name: aes
    version: 0.6.0
    sha: 884391ef1066acaa41e766ba8f596341b96e93ce34f9a43e7d24bf0a0eaf0561
  - kind: registry
    name: aes-ctr
    version: 0.6.0
    sha: 7729c3cde54d67063be556aeac75a81330d802f0259500ca40cb52967f975763
  - kind: registry
    name: aes-soft
    version: 0.6.4
    sha: be14c7498ea50828a38d0e24a765ed2effe92a705885b57d029cd67d45744072
  - kind: registry
    name: aesni
    version: 0.10.0
    sha: ea2e11f5e94c2f7d386164cc2aa1f97823fed6f259e486940a71c174dd01b0ce
  - kind: registry
    name: ahash
    version: 0.8.11
    sha: e89da841a80418a9b391ebaea17f5c112ffaaa96f621d2c285b5174da76b9011
  - kind: registry
    name: aho-corasick
    version: 1.1.3
    sha: 8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916
  - kind: registry
    name: aligned-vec
    version: 0.5.0
    sha: 4aa90d7ce82d4be67b64039a3d588d38dbcc6736577de4a847025ce5b0c468d1
  - kind: registry
    name: allocator-api2
    version: 0.2.21
    sha: 683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923
  - kind: registry
    name: android-tzdata
    version: 0.1.1
    sha: e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0
  - kind: registry
    name: android_system_properties
    version: 0.1.5
    sha: 819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311
  - kind: registry
    name: anstream
    version: 0.6.18
    sha: 8acc5369981196006228e28809f761875c0327210a891e941f4c683b3a99529b
  - kind: registry
    name: anstyle
    version: 1.0.10
    sha: 55cc3b69f167a1ef2e161439aa98aed94e6028e5f9a59be9a6ffb47aef1651f9
  - kind: registry
    name: anstyle-parse
    version: 0.2.6
    sha: 3b2d16507662817a6a20a9ea92df6652ee4f94f914589377d69f3b21bc5798a9
  - kind: registry
    name: anstyle-query
    version: 1.1.2
    sha: 79947af37f4177cfead1110013d678905c37501914fba0efea834c3fe9a8d60c
  - kind: registry
    name: anstyle-wincon
    version: 3.0.7
    sha: ca3534e77181a9cc07539ad51f2141fe32f6c3ffd4df76db8ad92346b003ae4e
  - kind: registry
    name: anyhow
    version: 1.0.97
    sha: dcfed56ad506cb2c684a14971b8861fdc3baaaae314b9e5f9bb532cbe3ba7a4f
  - kind: registry
    name: arbitrary
    version: 1.4.1
    sha: dde20b3d026af13f561bdd0f15edf01fc734f0dafcedbaf42bba506a9517f223
  - kind: registry
    name: arg_enum_proc_macro
    version: 0.3.4
    sha: 0ae92a5119aa49cdbcf6b9f893fe4e1d98b04ccbf82ee0584ad948a44a734dea
  - kind: registry
    name: arrayvec
    version: 0.7.6
    sha: 7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50
  - kind: registry
    name: async-channel
    version: 2.3.1
    sha: 89b47800b0be77592da0afd425cc03468052844aff33b84e33cc696f64e77b6a
  - kind: registry
    name: async-compression
    version: 0.4.20
    sha: 310c9bcae737a48ef5cdee3174184e6d548b292739ede61a1f955ef76a738861
  - kind: registry
    name: async-recursion
    version: 1.1.1
    sha: 3b43422f69d8ff38f95f1b2bb76517c91589a924d1559a0e935d7c8ce0274c11
  - kind: registry
    name: async-stream
    version: 0.3.6
    sha: 0b5a71a6f37880a80d1d7f19efd781e4b5de42c88f0722cc13bcb6cc2cfe8476
  - kind: registry
    name: async-stream-impl
    version: 0.3.6
    sha: c7c24de15d275a1ecfd47a380fb4d5ec9bfe0933f309ed5e705b775596a3574d
  - kind: registry
    name: async-task
    version: 4.7.1
    sha: 8b75356056920673b02621b35afd0f7dda9306d03c79a30f5c56c44cf256e3de
  - kind: registry
    name: async-trait
    version: 0.1.87
    sha: d556ec1359574147ec0c4fc5eb525f3f23263a592b1a9c07e0a75b427de55c97
  - kind: registry
    name: async-tungstenite
    version: 0.29.1
    sha: ef0f7efedeac57d9b26170f72965ecfd31473ca52ca7a64e925b0b6f5f079886
  - kind: registry
    name: atomic-waker
    version: 1.1.2
    sha: 1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0
  - kind: registry
    name: atomic_refcell
    version: 0.1.13
    sha: 41e67cd8309bbd06cd603a9e693a784ac2e5d1e955f11286e355089fcab3047c
  - kind: registry
    name: autocfg
    version: 1.4.0
    sha: ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26
  - kind: registry
    name: av-data
    version: 0.4.4
    sha: fca67ba5d317924c02180c576157afd54babe48a76ebc66ce6d34bb8ba08308e
  - kind: registry
    name: av1-grain
    version: 0.2.3
    sha: 6678909d8c5d46a42abcf571271e15fdbc0a225e3646cf23762cd415046c78bf
  - kind: registry
    name: aws-config
    version: 1.1.10
    sha: 48730d0b4c3d91c43d0d37168831d9fd0e065ad4a889a2ee9faf8d34c3d2804d
  - kind: registry
    name: aws-credential-types
    version: 1.2.0
    sha: e16838e6c9e12125face1c1eff1343c75e3ff540de98ff7ebd61874a89bcfeb9
  - kind: registry
    name: aws-runtime
    version: 1.2.0
    sha: f4963ac9ff2d33a4231b3806c1c69f578f221a9cabb89ad2bde62ce2b442c8a7
  - kind: registry
    name: aws-sdk-kinesisvideo
    version: 1.19.0
    sha: 9c3d7de7e417e5007e6f12e435557b46aaaa1df3fdb51a036bbab99e666376e4
  - kind: registry
    name: aws-sdk-kinesisvideosignaling
    version: 1.19.0
    sha: cc8518435480e92dba7851a57dea9a60a3afb9df3de0a3a5ecb140651e86ce48
  - kind: registry
    name: aws-sdk-s3
    version: 1.22.0
    sha: 644c5939c1b78097d37f3341708978d68490070d4b0f8fa91f0878678c06a7ef
  - kind: registry
    name: aws-sdk-sso
    version: 1.19.0
    sha: b2be5ba83b077b67a6f7a1927eb6b212bf556e33bd74b5eaa5aa6e421910803a
  - kind: registry
    name: aws-sdk-ssooidc
    version: 1.19.0
    sha: 022ca669825f841aef17b12d4354ef2b8651e4664be49f2d9ea13e4062a80c9f
  - kind: registry
    name: aws-sdk-sts
    version: 1.19.0
    sha: 8e4a5f5cb007347c1ab34a6d56456301dfada921fc9e57d687ecb08baddd11ff
  - kind: registry
    name: aws-sdk-transcribestreaming
    version: 1.19.0
    sha: 70b9c12055c6f2ebad6a75f4aa271059ba6826c6d4d75a9d86e1a2a6bb78808f
  - kind: registry
    name: aws-sdk-translate
    version: 1.19.0
    sha: 74469e5e24283c60cf4811acb8f788a777eff8a8fa6266e8939f86ba250bb53e
  - kind: registry
    name: aws-sigv4
    version: 1.2.1
    sha: 58b56f1cbe6fd4d0c2573df72868f20ab1c125ca9c9dbce17927a463433a2e57
  - kind: registry
    name: aws-smithy-async
    version: 1.2.1
    sha: 62220bc6e97f946ddd51b5f1361f78996e704677afc518a4ff66b7a72ea1378c
  - kind: registry
    name: aws-smithy-checksums
    version: 0.60.7
    sha: 83fa43bc04a6b2441968faeab56e68da3812f978a670a5db32accbdcafddd12f
  - kind: registry
    name: aws-smithy-eventstream
    version: 0.60.4
    sha: e6363078f927f612b970edf9d1903ef5cef9a64d1e8423525ebb1f0a1633c858
  - kind: registry
    name: aws-smithy-http
    version: 0.60.8
    sha: 4a7de001a1b9a25601016d8057ea16e31a45fdca3751304c8edf4ad72e706c08
  - kind: registry
    name: aws-smithy-json
    version: 0.60.7
    sha: 4683df9469ef09468dad3473d129960119a0d3593617542b7d52086c8486f2d6
  - kind: registry
    name: aws-smithy-query
    version: 0.60.7
    sha: f2fbd61ceb3fe8a1cb7352e42689cec5335833cd9f94103a61e98f9bb61c64bb
  - kind: registry
    name: aws-smithy-runtime
    version: 1.2.1
    sha: c53572b4cd934ee5e8461ad53caa36e9d246aaef42166e3ac539e206a925d330
  - kind: registry
    name: aws-smithy-runtime-api
    version: 1.4.0
    sha: 4cc56a5c96ec741de6c5e6bf1ce6948be969d6506dfa9c39cffc284e31e4979b
  - kind: registry
    name: aws-smithy-types
    version: 1.1.8
    sha: abe14dceea1e70101d38fbf2a99e6a34159477c0fb95e68e05c66bd7ae4c3729
  - kind: registry
    name: aws-smithy-xml
    version: 0.60.8
    sha: d123fbc2a4adc3c301652ba8e149bf4bc1d1725affb9784eb20c953ace06bf55
  - kind: registry
    name: aws-types
    version: 1.2.0
    sha: 5a43b56df2c529fe44cb4d92bd64d0479883fb9608ff62daede4df5405381814
  - kind: registry
    name: backtrace
    version: 0.3.74
    sha: 8d82cb332cdfaed17ae235a638438ac4d4839913cc2af585c3c6746e8f8bee1a
  - kind: registry
    name: base16ct
    version: 0.1.1
    sha: 349a06037c7bf932dd7e7d1f653678b2038b9ad46a74102f1fc7bd7872678cce
  - kind: registry
    name: base32
    version: 0.5.1
    sha: 022dfe9eb35f19ebbcb51e0b40a5ab759f46ad60cadf7297e0bd085afb50e076
  - kind: registry
    name: base64
    version: 0.13.1
    sha: 9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8
  - kind: registry
    name: base64
    version: 0.21.7
    sha: 9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: base64-serde
    version: 0.8.0
    sha: 77c6d128af408d8ebd08331f0331cf2cf20d19e6c44a7aec58791641ecc8c0b5
  - kind: registry
    name: base64-simd
    version: 0.8.0
    sha: 339abbe78e73178762e23bea9dfd08e697eb3f3301cd4be981c0f78ba5859195
  - kind: registry
    name: base64ct
    version: 1.6.0
    sha: 8c3c1a368f70d6cf7302d78f8f7093da241fb8e8807c05cc9e51a125895a6d5b
  - kind: registry
    name: bincode
    version: 1.3.3
    sha: b1f45e9417d87227c7a56d22e471c6206462cba514c7590c09aff4cf6d1ddcad
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.9.0
    sha: 5c8214115b7bf84099f1309324e63141d4c5d7cc26862f97a0a857dbefe165bd
  - kind: registry
    name: bitstream-io
    version: 2.3.0
    sha: 7c12d1856e42f0d817a835fe55853957c85c8c8a470114029143d3f12671446e
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: block-buffer
    version: 0.9.0
    sha: 4152116fd6e9dadb291ae18fc1ec3575ed6d84c29642d97890f4b4a3417297e4
  - kind: registry
    name: bstr
    version: 1.10.0
    sha: 40723b8fb387abc38f4f4a37c09073622e41dd12327033091ef8950659e6dc0c
  - kind: registry
    name: build_const
    version: 0.2.2
    sha: b4ae4235e6dac0694637c763029ecea1a2ec9e4e06ec2729bd21ba4d9c863eb7
  - kind: registry
    name: built
    version: 0.7.6
    sha: 73848a43c5d63a1251d17adf6c2bf78aa94830e60a335a95eeea45d6ba9e1e4d
  - kind: registry
    name: bumpalo
    version: 3.17.0
    sha: 1628fb46dfa0b37568d12e5edd512553eccf6a22a78e8bde00bb4aed84d5bdbf
  - kind: registry
    name: byte-slice-cast
    version: 1.2.3
    sha: 7575182f7272186991736b70173b0ea045398f984bf5ebbb3804736ce1330c9d
  - kind: registry
    name: bytemuck
    version: 1.22.0
    sha: b6b1fc10dbac614ebc03540c9dbd60e83887fda27794998c6528f1782047d540
  - kind: registry
    name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - kind: registry
    name: byteorder-lite
    version: 0.1.0
    sha: 8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495
  - kind: registry
    name: bytes
    version: 1.10.0
    sha: f61dac84819c6588b558454b194026eb1f09c293b9036ae9b159e74e73ab6cf9
  - kind: registry
    name: bytes-utils
    version: 0.1.4
    sha: 7dafe3a8757b027e2be6e4e5601ed563c55989fcf1546e933c66c8eb3a058d35
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: cairo-rs
    version: 0.20.9
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: cairo-sys-rs
    version: 0.20.9
  - kind: registry
    name: cc
    version: 1.2.16
    sha: be714c154be609ec7f5dad223a33bf1482fff90472de28f7362806e6d4832b8c
  - kind: registry
    name: cdg
    version: 0.1.0
    sha: d254b2c9fc971518da5d652aee7edc6b9bb96fa32de28f166895faf69d9926e6
  - kind: registry
    name: cdg_renderer
    version: 0.8.0
    sha: 0070ec0e6be4ed55d28bcfc499ecd479cb3764181eee2018dc661d8efd4e3f71
  - kind: registry
    name: cea608-types
    version: 0.1.4
    sha: 5dfc9d3f5161702cf339e6337203ac26b64279383468247e45b36e221cb06cae
  - kind: registry
    name: cea708-types
    version: 0.3.5
    sha: 711a98fc25dbb1c2a76505ac7ede42a5ed81aa36360939ad7709e92eff7f8fe3
  - kind: registry
    name: cfg-expr
    version: 0.15.8
    sha: d067ad48b8650848b989a59a86c6c36a995d02d2bf778d45c3c5d57bc2718f02
  - kind: registry
    name: cfg-expr
    version: 0.17.2
    sha: 8d4ba6e40bd1184518716a6e1a781bf9160e286d219ccdb8ab2612e74cfe4789
  - kind: registry
    name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - kind: registry
    name: cfg_aliases
    version: 0.2.1
    sha: 613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724
  - kind: registry
    name: chrono
    version: 0.4.40
    sha: 1a7964611d71df112cb1730f2ee67324fcf4d0fc6606acbbe9bfe06df124637c
  - kind: registry
    name: cipher
    version: 0.2.5
    sha: 12f8e7987cbd042a63249497f41aed09f8e65add917ea6566effbc56578d6801
  - kind: registry
    name: clap
    version: 4.4.18
    sha: 1e578d6ec4194633722ccf9544794b71b1385c3c027efe0c55db226fc880865c
  - kind: registry
    name: clap_builder
    version: 4.4.18
    sha: 4df4df40ec50c46000231c914968278b1eb05098cf8f1b3a518a95030e71d1c7
  - kind: registry
    name: clap_derive
    version: 4.4.7
    sha: cf9804afaaf59a91e75b022a30fb7229a7901f60c755489cc61c9b423b836442
  - kind: registry
    name: clap_lex
    version: 0.6.0
    sha: 702fc72eb24e5a1e48ce58027a675bc24edd52096d5397d4aea7c6dd9eca0bd1
  - kind: registry
    name: claxon
    version: 0.4.3
    sha: 4bfbf56724aa9eca8afa4fcfadeb479e722935bb2a0900c2d37e0cc477af0688
  - kind: registry
    name: color-name
    version: 1.1.0
    sha: c8cabd7573f60c1096a1e2bd82b2dc03a8063e607c698e15189a476c3541d65c
  - kind: registry
    name: color-thief
    version: 0.2.2
    sha: e6460d760cf38ce67c9e0318f896538820acc54f2d0a3bfc5b2c557211066c98
  - kind: registry
    name: color_quant
    version: 1.1.0
    sha: 3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b
  - kind: registry
    name: colorchoice
    version: 1.0.3
    sha: 5b63caa9aa9397e2d9480a9b13673856c78d8ac123288526c37d7839f2a86990
  - kind: registry
    name: concurrent-queue
    version: 2.5.0
    sha: 4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973
  - kind: registry
    name: const-oid
    version: 0.9.6
    sha: c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8
  - kind: registry
    name: cookie
    version: 0.18.1
    sha: 4ddef33a339a91ea89fb53151bd0a4689cfce27055c291dfa69945475d22c747
  - kind: registry
    name: cookie-factory
    version: 0.3.3
    sha: 9885fa71e26b8ab7855e2ec7cae6e9b380edff76cd052e07c683a0319d51b3a2
  - kind: registry
    name: cookie_store
    version: 0.21.1
    sha: 2eac901828f88a5241ee0600950ab981148a18f2f756900ffba1b125ca6a3ef9
  - kind: registry
    name: core-foundation
    version: 0.9.4
    sha: 91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f
  - kind: registry
    name: core-foundation-sys
    version: 0.8.7
    sha: 773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b
  - kind: registry
    name: cpufeatures
    version: 0.2.17
    sha: 59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280
  - kind: registry
    name: crc
    version: 1.8.1
    sha: d663548de7f5cca343f1e0a48d14dcfb0e9eb4e079ec58883b7251539fa10aeb
  - kind: registry
    name: crc32c
    version: 0.6.8
    sha: 3a47af21622d091a8f0fb295b88bc886ac74efcc613efc19f5d0b21de5c89e47
  - kind: registry
    name: crc32fast
    version: 1.4.2
    sha: a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3
  - kind: registry
    name: crossbeam-deque
    version: 0.8.6
    sha: 9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51
  - kind: registry
    name: crossbeam-epoch
    version: 0.9.18
    sha: 5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e
  - kind: registry
    name: crossbeam-utils
    version: 0.8.21
    sha: d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28
  - kind: registry
    name: crypto-bigint
    version: 0.4.9
    sha: ef2b4b23cddf68b89b8f8069890e8c270d54e2d5fe1b143820234805e4cb17ef
  - kind: registry
    name: crypto-bigint
    version: 0.5.5
    sha: 0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76
  - kind: registry
    name: crypto-common
    version: 0.1.6
    sha: 1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3
  - kind: registry
    name: crypto-mac
    version: 0.11.0
    sha: 25fab6889090c8133f3deb8f73ba3c65a7f456f66436fc012a1b1e272b1e103e
  - kind: registry
    name: csound
    version: 0.1.8
    sha: 8d49045d7365f5c2cadb1f20932189a0da101ac86c8dbe891975814b2348d57d
  - kind: registry
    name: csound-sys
    version: 0.1.2
    sha: 86b11869eaed111b64d29e66cc5c7de9f172d5b623b716eb74c5dd841dbcfe39
  - kind: registry
    name: ctr
    version: 0.6.0
    sha: fb4a30d54f7443bf3d6191dcd486aca19e67cb3c49fa7a06a319966346707e7f
  - kind: registry
    name: ctrlc
    version: 3.4.5
    sha: 90eeab0aa92f3f9b4e87f258c72b139c207d251f9cbc1080a0086b86a8870dd3
  - kind: registry
    name: darling
    version: 0.20.10
    sha: 6f63b86c8a8826a49b8c21f08a2d07338eec8d900540f8630dc76284be802989
  - kind: registry
    name: darling_core
    version: 0.20.10
    sha: 95133861a8032aaea082871032f5815eb9e98cef03fa916ab4500513994df9e5
  - kind: registry
    name: darling_macro
    version: 0.20.10
    sha: d336a2a514f6ccccaa3e09b02d41d35330c07ddf03a62165fcec10bb561c7806
  - kind: registry
    name: dash-mpd
    version: 0.18.0
    sha: df8c53700cb27af681192b9f2fdb2fc700c0d4a1efaa33f57a94d237156e4c98
  - kind: registry
    name: dasp_frame
    version: 0.11.0
    sha: b2a3937f5fe2135702897535c8d4a5553f8b116f76c1529088797f2eee7c5cd6
  - kind: registry
    name: dasp_sample
    version: 0.11.0
    sha: 0c87e182de0887fd5361989c677c4e8f5000cd9491d6d563161a8f3a5519fc7f
  - kind: registry
    name: data-encoding
    version: 2.8.0
    sha: 575f75dfd25738df5b91b8e43e14d44bda14637a58fae779fd2b064f8bf3e010
  - kind: registry
    name: dav1d
    version: 0.10.3
    sha: 0d4b54a40baf633a71c6f0fb49494a7e4ee7bc26f3e727212b6cb915aa1ea1e1
  - kind: registry
    name: dav1d-sys
    version: 0.8.2
    sha: 6ecb1c5e8f4dc438eedc1b534a54672fb0e0a56035dae6b50162787bd2c50e95
  - kind: registry
    name: der
    version: 0.6.1
    sha: f1a467a65c5e759bce6e65eaf91cc29f466cdc57cb65777bd646872a8a1fd4de
  - kind: registry
    name: deranged
    version: 0.3.11
    sha: b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4
  - kind: registry
    name: diff
    version: 0.1.13
    sha: 56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8
  - kind: registry
    name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - kind: registry
    name: digest
    version: 0.9.0
    sha: d3dd60d1080a57a05ab032377049e0591415d2b31afd7028356dbf3cc6dcb066
  - kind: registry
    name: displaydoc
    version: 0.2.5
    sha: 97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0
  - kind: registry
    name: document-features
    version: 0.2.11
    sha: 95249b50c6c185bee49034bcb378a49dc2b5dff0be90ff6616d31d64febab05d
  - kind: registry
    name: dssim-core
    version: 3.2.11
    sha: a5baa7723d29512337a4694b2a9a06618ce86bac66c0bcf42c3149cb09791648
  - kind: registry
    name: ebml-iterable
    version: 0.6.3
    sha: 7b5173ac3752f08b526a6991509615e1a345b221ec3c58c7633433e8c9582312
  - kind: registry
    name: ebml-iterable-specification
    version: 0.4.0
    sha: f56467af159a98735d44231f53eaa505e919e6003266f103b99649a93f106784
  - kind: registry
    name: ebml-iterable-specification-derive
    version: 0.4.0
    sha: b066b81018300fdce40f71c4db355a102699324af96fad28f25ab1b5f87de066
  - kind: registry
    name: ebur128
    version: 0.1.10
    sha: e227cc62d64d6fe01abbef48134b9c1f17d470cef1e7a56337ad05b1f81df7f9
  - kind: registry
    name: ecdsa
    version: 0.14.8
    sha: 413301934810f597c1d19ca71c8710e99a3f1ba28a0d2ebc01551a2daeea3c5c
  - kind: registry
    name: ed25519
    version: 1.5.3
    sha: 91cff35c70bba8a626e3185d8cd48cc11b5437e1a5bcd15b9b5fa3c64b6dfee7
  - kind: registry
    name: either
    version: 1.14.0
    sha: b7914353092ddf589ad78f25c5c1c21b7f80b0ff8621e7c814c3485b5306da9d
  - kind: registry
    name: elliptic-curve
    version: 0.12.3
    sha: e7bb888ab5300a19b8e5bceef25ac745ad065f3c9f7efc6de1b91958110891d3
  - kind: registry
    name: encoding_rs
    version: 0.8.35
    sha: 75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3
  - kind: registry
    name: env_filter
    version: 0.1.3
    sha: 186e05a59d4c50738528153b83b0b0194d3a29507dfec16eccd4b342903397d0
  - kind: registry
    name: env_logger
    version: 0.11.6
    sha: dcaee3d8e3cfc3fd92428d477bc97fc29ec8716d180c0d74c643bb26166660e0
  - kind: registry
    name: equivalent
    version: 1.0.2
    sha: 877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f
  - kind: registry
    name: errno
    version: 0.3.10
    sha: 33d852cb9b869c2a9b3df2f71a3074817f01e1844f839a144f5fcef059a4eb5d
  - kind: registry
    name: event-listener
    version: 5.4.0
    sha: 3492acde4c3fc54c845eaab3eed8bd00c7a7d881f78bfc801e43a93dec1331ae
  - kind: registry
    name: event-listener-strategy
    version: 0.5.3
    sha: 3c3e4e0dd3673c1139bf041f3008816d9cf2946bbfac2945c09e523b8d7b05b2
  - kind: registry
    name: fallible-iterator
    version: 0.3.0
    sha: 2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649
  - kind: registry
    name: fastrand
    version: 2.3.0
    sha: 37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be
  - kind: registry
    name: fdeflate
    version: 0.3.7
    sha: 1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c
  - kind: registry
    name: ff
    version: 0.12.1
    sha: d013fc25338cc558c5c2cfbad646908fb23591e2404481826742b651c9af7160
  - kind: git
    commit: 2afb025a327173ce891954c052e804d0f880368a
    repo: https://github.com/rust-av/ffv1.git
    query:
      rev: 2afb025a327173ce891954c052e804d0f880368a
    name: ffv1
    version: 0.0.0
  - kind: registry
    name: field-offset
    version: 0.3.6
    sha: 38e2275cc4e4fc009b0669731a1e5ab7ebf11f469eaede2bab9309a5b4d6057f
  - kind: registry
    name: fixedbitset
    version: 0.4.2
    sha: 0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80
  - kind: registry
    name: flate2
    version: 1.1.0
    sha: 11faaf5a5236997af9848be0bef4db95824b1d534ebc64d0f0c6cf3e67bd38dc
  - kind: git
    commit: 833508af656d298c269f2397c8541a084264d992
    repo: https://github.com/rust-av/flavors
    name: flavors
    version: 0.2.0
  - kind: registry
    name: flume
    version: 0.11.1
    sha: da0e4dd2a88388a1f4ccc7c9ce104604dab68d9f408dc34cd45823d5a9069095
  - kind: registry
    name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
  - kind: registry
    name: foldhash
    version: 0.1.4
    sha: a0d2fde1f7b3d48b8395d5f2de76c18a528bd6a9cdde438df747bfcba3e05d6f
  - kind: registry
    name: foreign-types
    version: 0.3.2
    sha: f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1
  - kind: registry
    name: foreign-types-shared
    version: 0.1.1
    sha: 00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b
  - kind: registry
    name: form_urlencoded
    version: 1.2.1
    sha: e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456
  - kind: registry
    name: fs-err
    version: 3.1.0
    sha: 1f89bda4c2a21204059a977ed3bfe746677dfd137b83c339e702b0ac91d482aa
  - kind: registry
    name: fst
    version: 0.4.7
    sha: 7ab85b9b05e3978cc9a9cf8fea7f01b494e1a09ed3037e16ba39edc7a29eb61a
  - kind: registry
    name: futures
    version: 0.3.31
    sha: 65bc07b1a8bc7c85c5f2e110c476c7389b4554ba72af57d8445ea63a576b0876
  - kind: registry
    name: futures-channel
    version: 0.3.31
    sha: 2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10
  - kind: registry
    name: futures-core
    version: 0.3.31
    sha: 05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e
  - kind: registry
    name: futures-executor
    version: 0.3.31
    sha: 1e28d1d997f585e54aebc3f97d39e72338912123a67330d723fdbb564d646c9f
  - kind: registry
    name: futures-io
    version: 0.3.31
    sha: 9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6
  - kind: registry
    name: futures-macro
    version: 0.3.31
    sha: 162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650
  - kind: registry
    name: futures-sink
    version: 0.3.31
    sha: e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7
  - kind: registry
    name: futures-task
    version: 0.3.31
    sha: f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988
  - kind: registry
    name: futures-util
    version: 0.3.31
    sha: 9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: gdk-pixbuf
    version: 0.20.9
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: gdk-pixbuf-sys
    version: 0.20.9
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gdk4
    version: 0.9.6
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gdk4-sys
    version: 0.9.6
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gdk4-wayland
    version: 0.9.6
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gdk4-wayland-sys
    version: 0.9.6
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gdk4-win32
    version: 0.9.6
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gdk4-win32-sys
    version: 0.9.6
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gdk4-x11
    version: 0.9.6
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gdk4-x11-sys
    version: 0.9.6
  - kind: registry
    name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - kind: registry
    name: getrandom
    version: 0.2.15
    sha: c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7
  - kind: registry
    name: getrandom
    version: 0.3.1
    sha: 43a49c392881ce6d5c3b8cb70f98717b7c07aabbdff06687b9030dbfbe2725f8
  - kind: registry
    name: gif
    version: 0.13.1
    sha: 3fb2d69b19215e18bb912fa30f7ce15846e301408695e44e0ef719f1da9e19f2
  - kind: registry
    name: gimli
    version: 0.31.1
    sha: 07e28edb80900c19c28f1072f2e8aeca7fa06b23cd4169cefe1af5aa3260783f
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: gio
    version: 0.20.9
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: gio-sys
    version: 0.20.9
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: glib
    version: 0.20.9
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: glib-macros
    version: 0.20.9
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: glib-sys
    version: 0.20.9
  - kind: registry
    name: glob
    version: 0.3.2
    sha: a8d1add55171497b4705a648c6b583acafb01d58050a51727785f0b2c8e0a2b2
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: gobject-sys
    version: 0.20.9
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: graphene-rs
    version: 0.20.9
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: graphene-sys
    version: 0.20.9
  - kind: registry
    name: group
    version: 0.12.1
    sha: 5dfbfb3a6cfbd390d5c9564ab283a0349b9b9fcd46a706c1eb10e0db70bfbac7
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gsk4
    version: 0.9.6
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gsk4-sys
    version: 0.9.6
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-allocators
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-allocators-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-app
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-app-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-audio
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-audio-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-base
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-base-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-check
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-check-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-gl
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-gl-egl
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-gl-egl-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-gl-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-gl-wayland
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-gl-wayland-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-gl-x11
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-gl-x11-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-net
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-net-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-pbutils
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-pbutils-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-rtp
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-rtp-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-sdp
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-sdp-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-utils
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-video
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-video-sys
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-webrtc
    version: 0.23.5
  - kind: git
    commit: 3d31d72f08c7d11af64fd86309123cc7deed3ab4
    repo: https://gitlab.freedesktop.org/gstreamer/gstreamer-rs
    query:
      branch: 0.23
    name: gstreamer-webrtc-sys
    version: 0.23.5
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gtk4
    version: 0.9.6
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gtk4-macros
    version: 0.9.6
  - kind: git
    commit: 20d14bdf598eb1a3bde54e68c32b92775b165bd4
    repo: https://github.com/gtk-rs/gtk4-rs
    query:
      branch: 0.9
    name: gtk4-sys
    version: 0.9.6
  - kind: registry
    name: h2
    version: 0.3.26
    sha: 81fe527a889e1532da5c525686d96d4c2e74cdd345badf8dfef9f6b39dd5f5e8
  - kind: registry
    name: h2
    version: 0.4.8
    sha: 5017294ff4bb30944501348f6f8e42e6ad28f42c8bbef7a74029aff064a4e3c2
  - kind: registry
    name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - kind: registry
    name: hashbrown
    version: 0.15.2
    sha: bf151400ff0baff5465007dd2f3e717f3fe502074ca563069ce3a6629d07b289
  - kind: registry
    name: headers
    version: 0.3.9
    sha: 06683b93020a07e3dbcf5f8c0f6d40080d725bea7936fc01ad345c01b97dc270
  - kind: registry
    name: headers
    version: 0.4.0
    sha: 322106e6bd0cba2d5ead589ddb8150a13d7c4217cf80d7c4f682ca994ccc6aa9
  - kind: registry
    name: headers-core
    version: 0.2.0
    sha: e7f66481bfee273957b1f20485a4ff3362987f85b2c236580d81b4eb7a326429
  - kind: registry
    name: headers-core
    version: 0.3.0
    sha: 54b4a22553d4242c49fddb9ba998a99962b5cc6f22cb5a3482bec22522403ce4
  - kind: registry
    name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - kind: registry
    name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - kind: registry
    name: hermit-abi
    version: 0.3.9
    sha: d231dfb89cfffdbc30e7fc41579ed6066ad03abda9e567ccafae602b97ec5024
  - kind: registry
    name: hermit-abi
    version: 0.4.0
    sha: fbf6a919d6cf397374f7dfeeea91d974c7c0a7221d0d0f4f20d859d329e53fcc
  - kind: registry
    name: hex
    version: 0.4.3
    sha: 7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70
  - kind: registry
    name: hmac
    version: 0.11.0
    sha: 2a2a2320eb7ec0ebe8da8f744d7812d9fc4cb4d09344ac01898dbcb6a20ae69b
  - kind: registry
    name: hmac
    version: 0.12.1
    sha: 6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e
  - kind: registry
    name: hrtf
    version: 0.8.1
    sha: 0f4de47a84fd55fa33aa5ef337016814fdc869fdad23e7898b5322fa290248e6
  - kind: registry
    name: http
    version: 0.2.12
    sha: 601cbb57e577e2f5ef5be8e7b83f0f63994f25aa94d673e54a92d5c516d101f1
  - kind: registry
    name: http
    version: 1.2.0
    sha: f16ca2af56261c99fba8bac40a10251ce8188205a4c448fbb745a2e4daa76fea
  - kind: registry
    name: http-body
    version: 0.4.6
    sha: 7ceab25649e9960c0311ea418d17bee82c0dcec1bd053b5f9a66e265a693bed2
  - kind: registry
    name: http-body
    version: 1.0.1
    sha: 1efedce1fb8e6913f23e0c92de8e62cd5b772a67e7b3946df930a62566c93184
  - kind: registry
    name: http-body-util
    version: 0.1.2
    sha: 793429d76616a256bcb62c2a2ec2bed781c8307e797e2598c50010f2bee2544f
  - kind: registry
    name: httparse
    version: 1.10.1
    sha: 6dbf3de79e51f3d586ab4cb9d5c3e2c14aa28ed23d180cf89b4df0454a69cc87
  - kind: registry
    name: httpdate
    version: 1.0.3
    sha: df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9
  - kind: registry
    name: human_bytes
    version: 0.4.3
    sha: 91f255a4535024abf7640cb288260811fc14794f62b063652ed349f9a6c2348e
  - kind: registry
    name: humantime
    version: 2.1.0
    sha: 9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4
  - kind: registry
    name: hxdmp
    version: 0.2.1
    sha: a17b27f28a7466846baca75f0a5244e546e44178eb7f1c07a3820f413e91c6b0
  - kind: registry
    name: hyper
    version: 0.14.32
    sha: 41dfc780fdec9373c01bae43289ea34c972e40ee3c9f6b3c8801a35f35586ce7
  - kind: registry
    name: hyper
    version: 1.6.0
    sha: cc2b571658e38e0c01b1fdca3bbbe93c00d3d71693ff2770043f8c29bc7d6f80
  - kind: registry
    name: hyper-proxy
    version: 0.9.1
    sha: ca815a891b24fdfb243fa3239c86154392b0953ee584aa1a2a1f66d20cbe75cc
  - kind: registry
    name: hyper-rustls
    version: 0.24.2
    sha: ec3efd23720e2049821a693cbc7e65ea87c72f1c58ff2f9522ff332b1491e590
  - kind: registry
    name: hyper-rustls
    version: 0.27.5
    sha: 2d191583f3da1305256f22463b9bb0471acad48a4e534a5218b9963e9c1f59b2
  - kind: registry
    name: hyper-tls
    version: 0.5.0
    sha: d6183ddfa99b85da61a140bea0efc93fdf56ceaa041b37d553518030827f9905
  - kind: registry
    name: hyper-tls
    version: 0.6.0
    sha: 70206fc6890eaca9fde8a0bf71caa2ddfc9fe045ac9e5c70df101a7dbde866e0
  - kind: registry
    name: hyper-util
    version: 0.1.10
    sha: df2dcfbe0677734ab2f3ffa7fa7bfd4706bfdc1ef393f2ee30184aed67e631b4
  - kind: registry
    name: hyphenation
    version: 0.8.4
    sha: bcf4dd4c44ae85155502a52c48739c8a48185d1449fff1963cffee63c28a50f0
  - kind: registry
    name: hyphenation_commons
    version: 0.8.4
    sha: 5febe7a2ade5c7d98eb8b75f946c046b335324b06a14ea0998271504134c05bf
  - kind: registry
    name: iana-time-zone
    version: 0.1.61
    sha: 235e081f3925a06703c2d0117ea8b91f042756fd6e7a6e5d901e8ca1a996b220
  - kind: registry
    name: iana-time-zone-haiku
    version: 0.1.2
    sha: f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f
  - kind: registry
    name: icu_collections
    version: 1.5.0
    sha: db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526
  - kind: registry
    name: icu_locid
    version: 1.5.0
    sha: 13acbb8371917fc971be86fc8057c41a64b521c184808a698c02acc242dbf637
  - kind: registry
    name: icu_locid_transform
    version: 1.5.0
    sha: 01d11ac35de8e40fdeda00d9e1e9d92525f3f9d887cdd7aa81d727596788b54e
  - kind: registry
    name: icu_locid_transform_data
    version: 1.5.0
    sha: fdc8ff3388f852bede6b579ad4e978ab004f139284d7b28715f773507b946f6e
  - kind: registry
    name: icu_normalizer
    version: 1.5.0
    sha: 19ce3e0da2ec68599d193c93d088142efd7f9c5d6fc9b803774855747dc6a84f
  - kind: registry
    name: icu_normalizer_data
    version: 1.5.0
    sha: f8cafbf7aa791e9b22bec55a167906f9e1215fd475cd22adfcf660e03e989516
  - kind: registry
    name: icu_properties
    version: 1.5.1
    sha: 93d6020766cfc6302c15dbbc9c8778c37e62c14427cb7f6e601d849e092aeef5
  - kind: registry
    name: icu_properties_data
    version: 1.5.0
    sha: 67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed19569
  - kind: registry
    name: icu_provider
    version: 1.5.0
    sha: 6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9
  - kind: registry
    name: icu_provider_macros
    version: 1.5.0
    sha: 1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6
  - kind: registry
    name: ident_case
    version: 1.0.1
    sha: b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39
  - kind: registry
    name: idna
    version: 1.0.3
    sha: 686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e
  - kind: registry
    name: idna_adapter
    version: 1.2.0
    sha: daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71
  - kind: registry
    name: image
    version: 0.25.5
    sha: cd6f44aed642f18953a158afeb30206f4d50da59fbc66ecb53c66488de73563b
  - kind: registry
    name: image_hasher
    version: 3.0.0
    sha: 7c191dc6138f559a0177b8413eaf2a37784d8e63c697e247aa3740930f1c9364
  - kind: registry
    name: imgref
    version: 1.11.0
    sha: d0263a3d970d5c054ed9312c0057b4f3bde9c0b33836d3637361d4a9e6e7a408
  - kind: registry
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.7.1
    sha: 8c9c992b02b5b4c94ea26e32fe5bccb7aa7d9f390ab5c1221ff895bc7ea8b652
  - kind: registry
    name: interpolate_name
    version: 0.2.4
    sha: c34819042dc3d3971c46c2190835914dfbe0c3c13f61449b2997f4e9722dfa60
  - kind: registry
    name: ipnet
    version: 2.11.0
    sha: 469fb0b9cefa57e3ef31275ee7cacb78f2fdca44e4765491884a2b119d4eb130
  - kind: registry
    name: is_terminal_polyfill
    version: 1.70.1
    sha: 7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf
  - kind: registry
    name: iso8601
    version: 0.6.2
    sha: c5c177cff824ab21a6f41079a4c401241c4e8be14f316c4c6b07d5fca351c98d
  - kind: registry
    name: itertools
    version: 0.11.0
    sha: b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57
  - kind: registry
    name: itertools
    version: 0.12.1
    sha: ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569
  - kind: registry
    name: itertools
    version: 0.14.0
    sha: 2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285
  - kind: registry
    name: itoa
    version: 1.0.15
    sha: 4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c
  - kind: registry
    name: jobserver
    version: 0.1.32
    sha: 48d1dbcbbeb6a7fec7e059840aa538bd62aaccf972c7346c4d9d2059312853d0
  - kind: registry
    name: js-sys
    version: 0.3.77
    sha: 1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f
  - kind: registry
    name: jsonwebtoken
    version: 9.2.0
    sha: 5c7ea04a7c5c055c175f189b6dc6ba036fd62306b58c66c9f6389036c503a3f4
  - kind: registry
    name: khronos-egl
    version: 6.0.0
    sha: 6aae1df220ece3c0ada96b8153459b67eebe9ae9212258bb0134ae60416fdf76
  - kind: registry
    name: lazy_static
    version: 1.5.0
    sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
  - kind: registry
    name: lewton
    version: 0.10.2
    sha: 777b48df9aaab155475a83a7df3070395ea1ac6902f5cd062b8f2b028075c030
  - kind: registry
    name: libc
    version: 0.2.170
    sha: 875b3680cb2f8f71bdcf9a30f38d48282f5d3c95cbf9b3fa57269bb5d5c06828
  - kind: registry
    name: libfuzzer-sys
    version: 0.4.9
    sha: cf78f52d400cf2d84a3a973a78a592b4adc535739e0a5597a0da6f0c357adc75
  - kind: registry
    name: libloading
    version: 0.8.6
    sha: fc2f4eb4bc735547cfed7c0a4922cbd04a4655978c09b54f1f7b228750664c34
  - kind: registry
    name: libm
    version: 0.2.11
    sha: 8355be11b20d696c8f18f6cc018c4e372165b1fa8126cef092399c9951984ffa
  - kind: registry
    name: librespot-audio
    version: 0.4.2
    sha: c176a31355e1ea8e0b9c4ced19df4947bfe4770661c25c142b6fba2365940d9d
  - kind: registry
    name: librespot-core
    version: 0.4.2
    sha: 046349f25888e644bf02d9c5de0164b2a493d29aa4ce18e1ad0b756da9b55d6d
  - kind: registry
    name: librespot-metadata
    version: 0.4.2
    sha: 6b80361fcbcb5092056fd47c08c34d5d51b08385d8efb6941c0d3e46d032c21c
  - kind: registry
    name: librespot-playback
    version: 0.4.2
    sha: 5190a0b9bcc7f70ee4196a6b4a1c731d405ca130d4a6fcd4c561cfdde8b7cfb7
  - kind: registry
    name: librespot-protocol
    version: 0.4.2
    sha: 5d6d3ac6196ac0ea67bbe039f56d6730a5d8b31502ef9bce0f504ed729dcb39f
  - kind: registry
    name: libsodium-sys
    version: 0.2.7
    sha: 6b779387cd56adfbc02ea4a668e704f729be8d6a6abd2c27ca5ee537849a92fd
  - kind: registry
    name: libwebp-sys2
    version: 0.1.11
    sha: 4790186411a6843ecc0a141c8948c8e623a0bb5e886834b1b6c90f3dfa85bb99
  - kind: registry
    name: linux-raw-sys
    version: 0.4.15
    sha: d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab
  - kind: registry
    name: litemap
    version: 0.7.4
    sha: 4ee93343901ab17bd981295f2cf0026d4ad018c7c31ba84549a4ddbb47a45104
  - kind: registry
    name: litrs
    version: 0.4.1
    sha: b4ce301924b7887e9d637144fdade93f9dfff9b60981d4ac161db09720d39aa5
  - kind: registry
    name: livekit-api
    version: 0.3.2
    sha: e20c3fc3de5944ce6b5c8da4084cf828bbae7216671e32e83b767ce61feeb7e0
  - kind: registry
    name: livekit-protocol
    version: 0.3.2
    sha: 1a1bd23257110be29d024d8d816adff70df18ea1d22ceb1aab6f3ad4aab0d523
  - kind: registry
    name: lock_api
    version: 0.4.12
    sha: 07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17
  - kind: registry
    name: log
    version: 0.4.26
    sha: 30bde2b3dc3671ae49d8e2e9f044c7c005836e7a023ee57cffa25ab82764bb9e
  - kind: registry
    name: lru
    version: 0.12.5
    sha: 234cf4f4a04dc1f57e24b96cc0cd600cf2af460d4161ac5ecdd0af8e1f3b2a38
  - kind: registry
    name: lru
    version: 0.13.0
    sha: 227748d55f2f0ab4735d87fd623798cb6b664512fe979705f829c9f81c934465
  - kind: registry
    name: m3u8-rs
    version: 6.0.0
    sha: f03cd3335fb5f2447755d45cda9c70f76013626a9db44374973791b0926a86c3
  - kind: registry
    name: matchers
    version: 0.1.0
    sha: 8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558
  - kind: registry
    name: maybe-rayon
    version: 0.1.1
    sha: 8ea1f30cedd69f0a2954655f7188c6a834246d2bcf1e315e2ac40c4b24dc9519
  - kind: registry
    name: md-5
    version: 0.10.6
    sha: d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf
  - kind: registry
    name: memchr
    version: 2.7.4
    sha: 78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: mime
    version: 0.3.17
    sha: 6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a
  - kind: registry
    name: mime_guess
    version: 2.0.5
    sha: f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e
  - kind: registry
    name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - kind: registry
    name: miniz_oxide
    version: 0.8.5
    sha: 8e3e04debbb59698c15bacbb6d93584a8c0ca9cc3213cb423d31f760d8843ce5
  - kind: registry
    name: mio
    version: 1.0.3
    sha: 2886843bf800fba2e3377cff24abf6379b4c4d5c6681eaf9ea5b0d15090450bd
  - kind: registry
    name: more-asserts
    version: 0.3.1
    sha: 1fafa6961cabd9c63bcd77a45d7e3b7f3b552b70417831fb0f56db717e72407e
  - kind: registry
    name: muldiv
    version: 1.0.1
    sha: 956787520e75e9bd233246045d19f42fb73242759cc57fba9611d940ae96d4b0
  - kind: registry
    name: multer
    version: 2.1.0
    sha: 01acbdc23469fd8fe07ab135923371d5f5a422fbf9c522158677c8eb15bc51c2
  - kind: registry
    name: multimap
    version: 0.10.0
    sha: defc4c55412d89136f966bbb339008b474350e5e6e78d2714439c386b3137a03
  - kind: registry
    name: nanorand
    version: 0.7.0
    sha: 6a51313c5820b0b02bd422f4b44776fbf47961755c74ce64afc73bfad10226c3
  - kind: registry
    name: nasm-rs
    version: 0.2.5
    sha: fe4d98d0065f4b1daf164b3eafb11974c94662e5e2396cf03f32d0bb5c17da51
  - kind: registry
    name: native-tls
    version: 0.2.13
    sha: 0dab59f8e050d5df8e4dd87d9206fb6f65a483e20ac9fda365ade4fab353196c
  - kind: registry
    name: new_debug_unreachable
    version: 1.0.6
    sha: 650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086
  - kind: registry
    name: nix
    version: 0.29.0
    sha: 71e2746dc3a24dd78b3cfcb7be93368c6de9963d30f43a6a73998a9cf4b17b46
  - kind: registry
    name: nnnoiseless
    version: 0.5.1
    sha: 23d377ce2fb579ed5c14cfa0d39e70849030fdf673d6d1a764cadb2dfbb02a50
  - kind: registry
    name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - kind: registry
    name: nom
    version: 8.0.0
    sha: df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405
  - kind: registry
    name: noop_proc_macro
    version: 0.3.0
    sha: 0676bb32a98c1a483ce53e500a81ad9c3d5b3f7c920c28c24e9cb0980d0b5bc8
  - kind: registry
    name: nu-ansi-term
    version: 0.46.0
    sha: 77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84
  - kind: registry
    name: num-bigint
    version: 0.4.6
    sha: a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9
  - kind: registry
    name: num-complex
    version: 0.4.6
    sha: 73f88a1307638156682bada9d7604135552957b7818057dcef22705b4d509495
  - kind: registry
    name: num-conv
    version: 0.1.0
    sha: 51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9
  - kind: registry
    name: num-derive
    version: 0.4.2
    sha: ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202
  - kind: registry
    name: num-integer
    version: 0.1.46
    sha: 7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f
  - kind: registry
    name: num-rational
    version: 0.4.2
    sha: f83d14da390562dca69fc84082e73e548e1ad308d24accdedd2720017cb37824
  - kind: registry
    name: num-traits
    version: 0.2.19
    sha: 071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841
  - kind: registry
    name: num_cpus
    version: 1.16.0
    sha: 4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43
  - kind: registry
    name: object
    version: 0.36.7
    sha: 62948e14d923ea95ea2c7c86c71013138b66525b86bdc08d2dcc262bdb497b87
  - kind: registry
    name: ogg
    version: 0.8.0
    sha: 6951b4e8bf21c8193da321bcce9c9dd2e13c858fe078bf9054a288b419ae5d6e
  - kind: registry
    name: once_cell
    version: 1.20.3
    sha: 945462a4b81e43c4e3ba96bd7b49d834c6f61198356aa858733bc4acf3cbe62e
  - kind: registry
    name: opaque-debug
    version: 0.3.1
    sha: c08d65885ee38876c4f86fa503fb49d7b507c2b62552df7c70b2fce627e06381
  - kind: registry
    name: openssl
    version: 0.10.71
    sha: 5e14130c6a98cd258fdcb0fb6d744152343ff729cbfcb28c656a9d12b999fbcd
  - kind: registry
    name: openssl-macros
    version: 0.1.1
    sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
  - kind: registry
    name: openssl-probe
    version: 0.1.6
    sha: d05e27ee213611ffe7d6348b942e8f942b37114c00cc03cec254295a4a17852e
  - kind: registry
    name: openssl-sys
    version: 0.9.106
    sha: 8bb61ea9811cc39e3c2069f40b8b8e2e70d8569b361f879786cc7ed48b777cdd
  - kind: registry
    name: option-operations
    version: 0.5.0
    sha: 7c26d27bb1aeab65138e4bf7666045169d1717febcc9ff870166be8348b223d0
  - kind: registry
    name: outref
    version: 0.5.2
    sha: 1a80800c0488c3a21695ea981a54918fbb37abf04f4d0720c453632255e2ff0e
  - kind: registry
    name: overload
    version: 0.1.1
    sha: b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39
  - kind: registry
    name: p256
    version: 0.11.1
    sha: 51f44edd08f51e2ade572f141051021c5af22677e42b7dd28a88155151c33594
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: pango
    version: 0.20.9
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: pango-sys
    version: 0.20.9
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: pangocairo
    version: 0.20.9
  - kind: git
    commit: 052084edb141065138e407dd6e53471ad166413f
    repo: https://github.com/gtk-rs/gtk-rs-core
    query:
      branch: 0.20
    name: pangocairo-sys
    version: 0.20.9
  - kind: registry
    name: parking
    version: 2.2.1
    sha: f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba
  - kind: registry
    name: parking_lot
    version: 0.12.3
    sha: f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27
  - kind: registry
    name: parking_lot_core
    version: 0.9.10
    sha: 1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8
  - kind: registry
    name: parse_link_header
    version: 0.4.0
    sha: fbc23fdb8bbf668d582b0c17120bf6b7f91d85ccad3a5b39706f019a4efda005
  - kind: registry
    name: paste
    version: 1.0.15
    sha: 57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a
  - kind: registry
    name: pbjson
    version: 0.6.0
    sha: 1030c719b0ec2a2d25a5df729d6cff1acf3cc230bf766f4f97833591f7577b90
  - kind: registry
    name: pbjson-build
    version: 0.6.2
    sha: 2580e33f2292d34be285c5bc3dba5259542b083cfad6037b6d70345f24dcb735
  - kind: registry
    name: pbjson-types
    version: 0.6.0
    sha: 18f596653ba4ac51bdecbb4ef6773bc7f56042dc13927910de1684ad3d32aa12
  - kind: registry
    name: pbkdf2
    version: 0.8.0
    sha: d95f5254224e617595d2cc3cc73ff0a5eaf2637519e25f03388154e9378b6ffa
  - kind: registry
    name: pem
    version: 3.0.5
    sha: 38af38e8470ac9dee3ce1bae1af9c1671fffc44ddfd8bd1d0a3445bf349a8ef3
  - kind: registry
    name: percent-encoding
    version: 2.3.1
    sha: e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e
  - kind: registry
    name: petgraph
    version: 0.6.5
    sha: b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db
  - kind: registry
    name: pin-project
    version: 1.1.10
    sha: 677f1add503faace112b9f1373e43e9e054bfdd22ff1a63c1bc485eaec6a6a8a
  - kind: registry
    name: pin-project-internal
    version: 1.1.10
    sha: 6e918e4ff8c4549eb882f14b3a4bc8c8bc93de829416eacf579f1207a8fbf861
  - kind: registry
    name: pin-project-lite
    version: 0.2.16
    sha: 3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b
  - kind: registry
    name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - kind: registry
    name: pkcs8
    version: 0.9.0
    sha: 9eca2c590a5f85da82668fa685c09ce2888b9430e83299debf1f34b65fd4a4ba
  - kind: registry
    name: pkg-config
    version: 0.3.32
    sha: 7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c
  - kind: registry
    name: png
    version: 0.17.16
    sha: 82151a2fc869e011c153adc57cf2789ccb8d9906ce52c0b39a6b5697749d7526
  - kind: registry
    name: pocket-resources
    version: 0.3.2
    sha: c135f38778ad324d9e9ee68690bac2c1a51f340fdf96ca13e2ab3914eb2e51d8
  - kind: registry
    name: polling
    version: 3.7.4
    sha: a604568c3202727d1507653cb121dbd627a58684eb09a820fd746bee38b4442f
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - kind: registry
    name: ppv-lite86
    version: 0.2.20
    sha: 77957b295656769bb8ad2b6a6b09d897d94f05c41b069aede1fcdaa675eaea04
  - kind: registry
    name: pretty_assertions
    version: 1.4.1
    sha: 3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d
  - kind: registry
    name: prettyplease
    version: 0.2.30
    sha: f1ccf34da56fc294e7d4ccf69a85992b7dfb826b7cf57bac6a70bba3494cc08a
  - kind: registry
    name: primal-check
    version: 0.3.4
    sha: dc0d895b311e3af9902528fbb8f928688abbd95872819320517cc24ca6b2bd08
  - kind: registry
    name: priority-queue
    version: 1.4.0
    sha: a0bda9164fe05bc9225752d54aae413343c36f684380005398a6a8fde95fe785
  - kind: registry
    name: proc-macro-crate
    version: 3.2.0
    sha: 8ecf48c7ca261d60b74ab1a7b20da18bede46776b2e55535cb958eb595c5fa7b
  - kind: registry
    name: proc-macro-error
    version: 1.0.4
    sha: da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c
  - kind: registry
    name: proc-macro-error-attr
    version: 1.0.4
    sha: a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869
  - kind: registry
    name: proc-macro2
    version: 1.0.94
    sha: a31971752e70b8b2686d7e46ec17fb38dad4051d94024c88df49b667caea9c84
  - kind: registry
    name: profiling
    version: 1.0.16
    sha: afbdc74edc00b6f6a218ca6a5364d6226a259d4b8ea1af4a0ea063f27e179f4d
  - kind: registry
    name: profiling-procmacros
    version: 1.0.16
    sha: a65f2e60fbf1063868558d69c6beacf412dc755f9fc020f514b7955fc914fe30
  - kind: registry
    name: prost
    version: 0.12.6
    sha: deb1435c188b76130da55f17a466d252ff7b1418b2ad3e037d127b94e3411f29
  - kind: registry
    name: prost-build
    version: 0.12.6
    sha: 22505a5c94da8e3b7c2996394d1c933236c4d743e81a410bcca4e6989fc066a4
  - kind: registry
    name: prost-derive
    version: 0.12.6
    sha: 81bddcdb20abf9501610992b6759a4c888aef7d1a7247ef75e2404275ac24af1
  - kind: registry
    name: prost-types
    version: 0.12.6
    sha: 9091c90b0a32608e984ff2fa4091273cbdd755d54935c51d520887f4a1dbd5b0
  - kind: registry
    name: protobuf
    version: 2.28.0
    sha: 106dd99e98437432fed6519dedecfade6a06a73bb7b2a1e019fdd2bee5778d94
  - kind: registry
    name: protobuf-codegen
    version: 2.28.0
    sha: 033460afb75cf755fcfc16dfaed20b86468082a2ea24e05ac35ab4a099a017d6
  - kind: registry
    name: protobuf-codegen-pure
    version: 2.28.0
    sha: 95a29399fc94bcd3eeaa951c715f7bea69409b2445356b00519740bcd6ddd865
  - kind: registry
    name: psl-types
    version: 2.0.11
    sha: 33cb294fe86a74cbcf50d4445b37da762029549ebeea341421c7c70370f86cac
  - kind: registry
    name: publicsuffix
    version: 2.3.0
    sha: 6f42ea446cab60335f76979ec15e12619a2165b5ae2c12166bef27d283a9fadf
  - kind: registry
    name: quick-xml
    version: 0.37.2
    sha: 165859e9e55f79d67b96c5d96f4e88b6f2695a1972849c15a6a3f5c59fc2c003
  - kind: registry
    name: quinn
    version: 0.11.6
    sha: 62e96808277ec6f97351a2380e6c25114bc9e67037775464979f3037c92d05ef
  - kind: registry
    name: quinn-proto
    version: 0.11.9
    sha: a2fe5ef3495d7d2e377ff17b1a8ce2ee2ec2a18cde8b6ad6619d65d0701c135d
  - kind: registry
    name: quinn-udp
    version: 0.5.10
    sha: e46f3055866785f6b92bc6164b76be02ca8f2eb4b002c0354b28cf4c119e5944
  - kind: registry
    name: quote
    version: 1.0.39
    sha: c1f1914ce909e1658d9907913b4b91947430c7d9be598b15a1912935b8c04801
  - kind: registry
    name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - kind: registry
    name: rand
    version: 0.9.0
    sha: 3779b94aeb87e8bd4e834cee3650289ee9e0d5677f976ecdb6d219e5f4f6cd94
  - kind: registry
    name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - kind: registry
    name: rand_chacha
    version: 0.9.0
    sha: d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb
  - kind: registry
    name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - kind: registry
    name: rand_core
    version: 0.9.3
    sha: 99d9a13982dcf210057a8a78572b2217b667c3beacbf3a0d8b454f6f82837d38
  - kind: registry
    name: rand_distr
    version: 0.4.3
    sha: 32cb0b9bc82b0a0876c2dd994a7e7a2683d3e7390ca40e6886785ef0c7e3ee31
  - kind: registry
    name: raptorq
    version: 2.0.0
    sha: 90b1b1fad69672f0b901b5004863ea4307f03d168a3db5f2bcba4d3dfed88e97
  - kind: registry
    name: rav1e
    version: 0.7.1
    sha: cd87ce80a7665b1cce111f8a16c1f3929f6547ce91ade6addf4ec86a8dda5ce9
  - kind: registry
    name: rayon
    version: 1.10.0
    sha: b418a60154510ca1a002a752ca9714984e21e4241e804d32555251faf8b78ffa
  - kind: registry
    name: rayon-core
    version: 1.12.1
    sha: 1465873a3dfdaa8ae7cb14b4383657caab0b3e8a0aa9ae8e04b044854c8dfce2
  - kind: registry
    name: rcgen
    version: 0.13.2
    sha: 75e669e5202259b5314d1ea5397316ad400819437857b90861765f24c4cf80a2
  - kind: registry
    name: realfft
    version: 3.4.0
    sha: 390252372b7f2aac8360fc5e72eba10136b166d6faeed97e6d0c8324eb99b2b1
  - kind: registry
    name: redox_syscall
    version: 0.5.10
    sha: 0b8c0c260b63a8219631167be35e6a988e9554dbd323f8bd08439c8ed1302bd1
  - kind: registry
    name: regex
    version: 1.11.1
    sha: b544ef1b4eac5dc2db33ea63606ae9ffcfac26c1416a2806ae0bf5f56b201191
  - kind: registry
    name: regex-automata
    version: 0.1.10
    sha: 6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132
  - kind: registry
    name: regex-automata
    version: 0.4.9
    sha: 809e8dc61f6de73b46c85f4c96486310fe304c434cfa43669d7b40f711150908
  - kind: registry
    name: regex-lite
    version: 0.1.6
    sha: 53a49587ad06b26609c52e423de037e7f57f20d53535d66e08c695f347df952a
  - kind: registry
    name: regex-syntax
    version: 0.6.29
    sha: f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1
  - kind: registry
    name: regex-syntax
    version: 0.8.5
    sha: 2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c
  - kind: registry
    name: reqwest
    version: 0.11.27
    sha: dd67538700a17451e7cba03ac727fb961abb7607553461627b97de0b89cf4a62
  - kind: registry
    name: reqwest
    version: 0.12.12
    sha: 43e734407157c3c2034e0258f5e4473ddb361b1e85f95a66690d67264d7cd1da
  - kind: registry
    name: rfc6979
    version: 0.3.1
    sha: 7743f17af12fa0b03b803ba12cd6a8d9483a587e89c69445e3909655c0b9fabb
  - kind: registry
    name: rgb
    version: 0.8.50
    sha: 57397d16646700483b67d2dd6511d79318f9d057fdbd21a4066aeac8b41d310a
  - kind: registry
    name: ring
    version: 0.17.11
    sha: da5349ae27d3887ca812fb375b45a4fbb36d8d12d2df394968cd86e35683fe73
  - kind: registry
    name: rtcp-types
    version: 0.1.0
    sha: ce5248489db464de29835170cd1f6e19933146b0016789effc59cb53d9f13844
  - kind: registry
    name: rtp-types
    version: 0.1.2
    sha: 7bb90df8268abfe08452ef2dae9e867a54edfdaa71b3127ef47d8b031f77ac73
  - kind: registry
    name: rtsp-types
    version: 0.1.3
    sha: f47bf238c3da7994ef66a71724f385cb1ee25dcf04a156402d2727ad84dc1433
  - kind: registry
    name: rubato
    version: 0.14.1
    sha: e6dd52e80cfc21894deadf554a5673002938ae4625f7a283e536f9cf7c17b0d5
  - kind: registry
    name: rustc-demangle
    version: 0.1.24
    sha: 719b953e2095829ee67db738b3bfa9fa368c94900df327b3f07fe6e794d2fe1f
  - kind: registry
    name: rustc-hash
    version: 2.1.1
    sha: 357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d
  - kind: registry
    name: rustc_version
    version: 0.4.1
    sha: cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92
  - kind: registry
    name: rustdct
    version: 0.7.1
    sha: 8b61555105d6a9bf98797c063c362a1d24ed8ab0431655e38f1cf51e52089551
  - kind: registry
    name: rustfft
    version: 6.2.0
    sha: 43806561bc506d0c5d160643ad742e3161049ac01027b5e6d7524091fd401d86
  - kind: registry
    name: rustix
    version: 0.38.44
    sha: fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154
  - kind: registry
    name: rustls
    version: 0.21.12
    sha: 3f56a14d1f48b391359b22f731fd4bd7e43c97f3c50eee276f3aa09c94784d3e
  - kind: registry
    name: rustls
    version: 0.23.23
    sha: 47796c98c480fce5406ef69d1c76378375492c3b0a0de587be0c1d9feb12f395
  - kind: registry
    name: rustls-native-certs
    version: 0.6.3
    sha: a9aace74cb666635c918e9c12bc0d348266037aa8eb599b5cba565709a8dff00
  - kind: registry
    name: rustls-pemfile
    version: 1.0.4
    sha: 1c74cae0a4cf6ccbbf5f359f08efdf8ee7e1dc532573bf0db71968cb56b1448c
  - kind: registry
    name: rustls-pemfile
    version: 2.2.0
    sha: dce314e5fee3f39953d46bb63bb8a46d40c2f8fb7cc5a3b6cab2bde9721d6e50
  - kind: registry
    name: rustls-pki-types
    version: 1.11.0
    sha: 917ce264624a4b4db1c364dcc35bfca9ded014d0a958cd47ad3e960e988ea51c
  - kind: registry
    name: rustls-webpki
    version: 0.101.7
    sha: 8b6275d1ee7a1cd780b64aca7726599a1dbc893b1e64144529e55c3c2f745765
  - kind: registry
    name: rustls-webpki
    version: 0.102.8
    sha: 64ca1bc8749bd4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9
  - kind: registry
    name: rustversion
    version: 1.0.20
    sha: eded382c5f5f786b989652c49544c4877d9f015cc22e145a5ea8ea66c2921cd2
  - kind: registry
    name: ryu
    version: 1.0.20
    sha: 28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f
  - kind: registry
    name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - kind: registry
    name: scc
    version: 2.3.3
    sha: ea091f6cac2595aa38993f04f4ee692ed43757035c36e67c180b6828356385b1
  - kind: registry
    name: schannel
    version: 0.1.27
    sha: 1f29ebaa345f945cec9fbbc532eb307f0fdad8161f281b6369539c8d84876b3d
  - kind: registry
    name: scoped-tls
    version: 1.0.1
    sha: e1cf6437eb19a8f4a6cc0f7dca544973b0b78843adbfeb3683d1a94a0024a294
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - kind: registry
    name: sct
    version: 0.7.1
    sha: da046153aa2352493d6cb7da4b6e5c0c057d8a1d0a9aa8560baffdd945acd414
  - kind: registry
    name: sdd
    version: 3.0.7
    sha: b07779b9b918cc05650cb30f404d4d7835d26df37c235eded8a6832e2fb82cca
  - kind: registry
    name: sdp-types
    version: 0.1.7
    sha: 9ce72d627cd766d36f6e959e3add7277146cbc0853bc0699c925ba15138e93ee
  - kind: registry
    name: sec1
    version: 0.3.0
    sha: 3be24c1842290c45df0a7bf069e0c268a747ad05a192f2fd7dcfdbc1cba40928
  - kind: registry
    name: security-framework
    version: 2.11.1
    sha: 897b2245f0b511c87893af39b033e5ca9cce68824c4d7e7630b5a1d339658d02
  - kind: registry
    name: security-framework-sys
    version: 2.14.0
    sha: 49db231d56a190491cb4aeda9527f1ad45345af50b0851622a7adb8c03b01c32
  - kind: registry
    name: semver
    version: 1.0.26
    sha: 56e6fa9c48d24d85fb3de5ad847117517440f6beceb7798af16b4a87d616b8d0
  - kind: registry
    name: serde
    version: 1.0.218
    sha: e8dfc9d19bdbf6d17e22319da49161d5d0108e4188e8b680aef6299eed22df60
  - kind: registry
    name: serde_bytes
    version: 0.11.16
    sha: 364fec0df39c49a083c9a8a18a23a6bcfd9af130fe9fe321d18520a0d113e09e
  - kind: registry
    name: serde_derive
    version: 1.0.218
    sha: f09503e191f4e797cb8aac08e9a4a4695c5edf6a2e70e376d961ddd5c969f82b
  - kind: registry
    name: serde_json
    version: 1.0.140
    sha: 20068b6e96dc6c9bd23e01df8827e6c7e1f2fddd43c21810382803c136b99373
  - kind: registry
    name: serde_path_to_error
    version: 0.1.17
    sha: 59fab13f937fa393d08645bf3a84bdfe86e296747b506ada67bb15f10f218b2a
  - kind: registry
    name: serde_spanned
    version: 0.6.8
    sha: 87607cb1398ed59d48732e575a4c28a7a8ebf2454b964fe3f224f2afc07909e1
  - kind: registry
    name: serde_urlencoded
    version: 0.7.1
    sha: d3491c14715ca2294c4d6a88f15e84739788c1d030eed8c110436aafdaa2f3fd
  - kind: registry
    name: serde_with
    version: 3.12.0
    sha: d6b6f7f2fcb69f747921f79f3926bd1e203fce4fef62c268dd3abfb6d86029aa
  - kind: registry
    name: serde_with_macros
    version: 3.12.0
    sha: 8d00caa5193a3c8362ac2b73be6b9e768aa5a4b2f721d8f4b339600c3cb51f8e
  - kind: registry
    name: serial_test
    version: 3.2.0
    sha: 1b258109f244e1d6891bf1053a55d63a5cd4f8f4c30cf9a1280989f80e7a1fa9
  - kind: registry
    name: serial_test_derive
    version: 3.2.0
    sha: 5d69265a08751de7844521fd15003ae0a888e035773ba05695c5c759a6f89eef
  - kind: registry
    name: sha-1
    version: 0.9.8
    sha: 99cd6713db3cf16b6c84e06321e049a9b9f699826e16096d23bbcc44d15d51a6
  - kind: registry
    name: sha1
    version: 0.10.6
    sha: e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba
  - kind: registry
    name: sha2
    version: 0.10.8
    sha: 793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8
  - kind: registry
    name: shannon
    version: 0.2.0
    sha: 7ea5b41c9427b56caa7b808cb548a04fb50bb5b9e98590b53f28064ff4174561
  - kind: registry
    name: sharded-slab
    version: 0.1.7
    sha: f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6
  - kind: registry
    name: shell-words
    version: 1.1.0
    sha: 24188a676b6ae68c3b2cb3a01be17fbf7240ce009799bb56d5b1409051e78fde
  - kind: registry
    name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - kind: registry
    name: signal-hook
    version: 0.3.17
    sha: 8621587d4798caf8eb44879d42e56b9a93ea5dcd315a6487c357130095b62801
  - kind: registry
    name: signal-hook-registry
    version: 1.4.2
    sha: a9e9e0b4211b72e7b8b6e85c807d36c212bdb33ea8587f7569562a84df5465b1
  - kind: registry
    name: signature
    version: 1.6.4
    sha: 74233d3b3b2f6d4b006dc19dee745e73e2a6bfb6f93607cd3b02bd5b00797d7c
  - kind: registry
    name: simd-adler32
    version: 0.3.7
    sha: d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe
  - kind: registry
    name: simd_helpers
    version: 0.1.0
    sha: 95890f873bec569a0362c235787f3aca6e1e887302ba4840839bcc6459c42da6
  - kind: registry
    name: slab
    version: 0.4.9
    sha: 8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67
  - kind: registry
    name: smallvec
    version: 1.14.0
    sha: 7fcf8323ef1faaee30a44a340193b1ac6814fd9b7b4e88e9d4519a3e4abe1cfd
  - kind: registry
    name: smawk
    version: 0.3.2
    sha: b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c
  - kind: registry
    name: socket2
    version: 0.5.8
    sha: c970269d99b64e60ec3bd6ad27270092a5394c4e309314b18ae3fe575695fbe8
  - kind: registry
    name: sodiumoxide
    version: 0.2.7
    sha: e26be3acb6c2d9a7aac28482586a7856436af4cfe7100031d219de2d2ecb0028
  - kind: registry
    name: spin
    version: 0.9.8
    sha: 6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67
  - kind: registry
    name: spki
    version: 0.6.0
    sha: 67cf02bbac7a337dc36e4f5a693db6c21e7863f45070f7064577eb4367a3212b
  - kind: registry
    name: sprintf
    version: 0.4.0
    sha: 46781e6f401f1557f5b4560284baf7268bd9ca531e9e387120a8695fe5bc1fb1
  - kind: registry
    name: stable_deref_trait
    version: 1.2.0
    sha: a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3
  - kind: registry
    name: static_assertions
    version: 1.1.0
    sha: a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f
  - kind: registry
    name: strength_reduce
    version: 0.2.4
    sha: fe895eb47f22e2ddd4dabc02bce419d2e643c8e3b585c78158b349195bc24d82
  - kind: registry
    name: strsim
    version: 0.10.0
    sha: 73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623
  - kind: registry
    name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: subtle
    version: 2.6.1
    sha: 13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292
  - kind: registry
    name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - kind: registry
    name: syn
    version: 2.0.99
    sha: e02e925281e18ffd9d640e234264753c43edc62d64b2d4cf898f1bc5e75f3fc2
  - kind: registry
    name: sync_wrapper
    version: 0.1.2
    sha: 2047c6ded9c721764247e62cd3b03c09ffc529b2ba5b10ec482ae507a4a70160
  - kind: registry
    name: sync_wrapper
    version: 1.0.2
    sha: 0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263
  - kind: registry
    name: synstructure
    version: 0.13.1
    sha: c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971
  - kind: registry
    name: system-configuration
    version: 0.5.1
    sha: ba3a3adc5c275d719af8cb4272ea1c4a6d668a777f37e115f6d11ddbc1c8e0e7
  - kind: registry
    name: system-configuration
    version: 0.6.1
    sha: 3c879d448e9d986b661742763247d3693ed13609438cf3d006f51f5368a5ba6b
  - kind: registry
    name: system-configuration-sys
    version: 0.5.0
    sha: a75fb188eb626b924683e3b95e3a48e63551fcfb51949de2f06a9d91dbee93c9
  - kind: registry
    name: system-configuration-sys
    version: 0.6.0
    sha: 8e1d1b10ced5ca923a1fcb8d03e96b8d3268065d724548c0211415ff6ac6bac4
  - kind: registry
    name: system-deps
    version: 6.2.2
    sha: a3e535eb8dded36d55ec13eddacd30dec501792ff23a0b1682c38601b8cf2349
  - kind: registry
    name: system-deps
    version: 7.0.3
    sha: 66d23aaf9f331227789a99e8de4c91bf46703add012bdfd45fdecdfb2975a005
  - kind: registry
    name: target-lexicon
    version: 0.12.16
    sha: 61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1
  - kind: registry
    name: tempfile
    version: 3.17.1
    sha: 22e5a0acb1f3f55f65cc4a866c361b2fb2a0ff6366785ae6fbb5f85df07ba230
  - kind: registry
    name: test-log
    version: 0.2.16
    sha: 3dffced63c2b5c7be278154d76b479f9f9920ed34e7574201407f0b14e2bbb93
  - kind: registry
    name: test-log-macros
    version: 0.2.16
    sha: 5999e24eaa32083191ba4e425deb75cdf25efefabe5aaccb7446dd0d4122a3f5
  - kind: registry
    name: test-with
    version: 0.12.6
    sha: 5a3a0c1b477619de2a1bf72990195561a06f7b68bbf272cea676236ad7cfb9e8
  - kind: registry
    name: textwrap
    version: 0.16.2
    sha: c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057
  - kind: registry
    name: thiserror
    version: 1.0.69
    sha: b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52
  - kind: registry
    name: thiserror
    version: 2.0.12
    sha: 567b8a2dae586314f7be2a752ec7474332959c6460e02bde30d702a66d488708
  - kind: registry
    name: thiserror-impl
    version: 1.0.69
    sha: 4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1
  - kind: registry
    name: thiserror-impl
    version: 2.0.12
    sha: 7f7cf42b4507d8ea322120659672cf1b9dbb93f8f2d4ecfd6e51350ff5b17a1d
  - kind: registry
    name: thread-id
    version: 4.2.2
    sha: cfe8f25bbdd100db7e1d34acf7fd2dc59c4bf8f7483f505eaa7d4f12f76cc0ea
  - kind: registry
    name: thread_local
    version: 1.1.8
    sha: 8b9ef9bad013ada3808854ceac7b46812a6465ba368859a37e2100283d2d719c
  - kind: registry
    name: time
    version: 0.3.37
    sha: 35e7868883861bd0e56d9ac6efcaaca0d6d5d82a2a7ec8209ff492c07cf37b21
  - kind: registry
    name: time-core
    version: 0.1.2
    sha: ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3
  - kind: registry
    name: time-macros
    version: 0.2.19
    sha: 2834e6017e3e5e4b9834939793b282bc03b37a3336245fa820e35e233e2a85de
  - kind: registry
    name: tinystr
    version: 0.7.6
    sha: 9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f
  - kind: registry
    name: tinyvec
    version: 1.9.0
    sha: 09b3661f17e86524eccd4371ab0429194e0d7c008abb45f7a7495b1719463c71
  - kind: registry
    name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - kind: registry
    name: tokio
    version: 1.43.0
    sha: 3d61fa4ffa3de412bfea335c6ecff681de2b609ba3c77ef3e00e521813a9ed9e
  - kind: registry
    name: tokio-macros
    version: 2.5.0
    sha: 6e06d43f1345a3bcd39f6a56dbb7dcab2ba47e68e8ac134855e7e2bdbaf8cab8
  - kind: registry
    name: tokio-native-tls
    version: 0.3.1
    sha: bbae76ab933c85776efabc971569dd6119c580d8f5d448769dec1764bf796ef2
  - kind: registry
    name: tokio-rustls
    version: 0.24.1
    sha: c28327cf380ac148141087fbfb9de9d7bd4e84ab5d2c28fbc911d753de8a7081
  - kind: registry
    name: tokio-rustls
    version: 0.26.2
    sha: 8e727b36a1a0e8b74c376ac2211e40c2c8af09fb4013c60d910495810f008e9b
  - kind: registry
    name: tokio-stream
    version: 0.1.17
    sha: eca58d7bba4a75707817a2c44174253f9236b2d5fbd055602e9d5c07c139a047
  - kind: registry
    name: tokio-tungstenite
    version: 0.20.1
    sha: 212d5dcb2a1ce06d81107c3d0ffa3121fe974b73f068c8282cb1c32328113b6c
  - kind: registry
    name: tokio-tungstenite
    version: 0.21.0
    sha: c83b561d025642014097b66e6c1bb422783339e0909e4429cde4749d1990bc38
  - kind: registry
    name: tokio-util
    version: 0.7.13
    sha: d7fcaa8d55a2bdd6b83ace262b016eca0d79ee02818c5c1bcdf0305114081078
  - kind: registry
    name: toml
    version: 0.8.20
    sha: cd87a5cdd6ffab733b2f74bc4fd7ee5fff6634124999ac278c35fc78c6120148
  - kind: registry
    name: toml_datetime
    version: 0.6.8
    sha: 0dd7358ecb8fc2f8d014bf86f6f638ce72ba252a2c3a2572f2a795f1d23efb41
  - kind: registry
    name: toml_edit
    version: 0.22.24
    sha: 17b4795ff5edd201c7cd6dca065ae59972ce77d1b80fa0a84d94950ece7d1474
  - kind: registry
    name: tower
    version: 0.5.2
    sha: d039ad9159c98b70ecfd540b2573b97f7f52c3e8d9f8ad57a24b916a536975f9
  - kind: registry
    name: tower-layer
    version: 0.3.3
    sha: 121c2a6cda46980bb0fcd1647ffaf6cd3fc79a013de288782836f6df9c48780e
  - kind: registry
    name: tower-service
    version: 0.3.3
    sha: 8df9b6e13f2d32c91b9bd719c00d1958837bc7dec474d94952798cc8e69eeec3
  - kind: registry
    name: tracing
    version: 0.1.41
    sha: 784e0ac535deb450455cbfa28a6f0df145ea1bb7ae51b821cf5e7927fdcfbdd0
  - kind: registry
    name: tracing-attributes
    version: 0.1.28
    sha: 395ae124c09f9e6918a2310af6038fba074bcf474ac352496d5910dd59a2226d
  - kind: registry
    name: tracing-core
    version: 0.1.33
    sha: e672c95779cf947c5311f83787af4fa8fffd12fb27e4993211a84bdfd9610f9c
  - kind: registry
    name: tracing-log
    version: 0.2.0
    sha: ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3
  - kind: registry
    name: tracing-subscriber
    version: 0.3.19
    sha: e8189decb5ac0fa7bc8b96b7cb9b2701d60d48805aca84a238004d665fcc4008
  - kind: registry
    name: transpose
    version: 0.2.3
    sha: 1ad61aed86bc3faea4300c7aee358b4c6d0c8d6ccc36524c96e4c92ccf26e77e
  - kind: registry
    name: try-lock
    version: 0.2.5
    sha: e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b
  - kind: registry
    name: tungstenite
    version: 0.20.1
    sha: 9e3dac10fd62eaf6617d3a904ae222845979aec67c615d1c842b4002c7666fb9
  - kind: registry
    name: tungstenite
    version: 0.21.0
    sha: 9ef1a641ea34f399a848dea702823bbecfb4c486f911735368f1f137cb8257e1
  - kind: registry
    name: tungstenite
    version: 0.26.2
    sha: 4793cb5e56680ecbb1d843515b23b6de9a75eb04b66643e256a396d43be33c13
  - kind: registry
    name: typenum
    version: 1.18.0
    sha: 1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f
  - kind: registry
    name: unicase
    version: 2.8.1
    sha: 75b844d17643ee918803943289730bec8aac480150456169e647ed0b576ba539
  - kind: registry
    name: unicode-ident
    version: 1.0.18
    sha: 5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512
  - kind: registry
    name: unicode-linebreak
    version: 0.1.5
    sha: 3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f
  - kind: registry
    name: unicode-width
    version: 0.2.0
    sha: 1fc81956842c57dac11422a97c3b8195a1ff727f06e85c84ed2e8aa277c9a0fd
  - kind: registry
    name: untrusted
    version: 0.9.0
    sha: 8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1
  - kind: registry
    name: url
    version: 2.5.4
    sha: 32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60
  - kind: registry
    name: url-escape
    version: 0.1.1
    sha: 44e0ce4d1246d075ca5abec4b41d33e87a6054d08e2366b63205665e950db218
  - kind: registry
    name: urlencoding
    version: 2.1.3
    sha: daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da
  - kind: registry
    name: utf-8
    version: 0.7.6
    sha: 09cc8ee72d2a9becf2f2febe0205bbed8fc6615b7cb429ad062dc7b7ddd036a9
  - kind: registry
    name: utf16_iter
    version: 1.0.5
    sha: c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246
  - kind: registry
    name: utf8_iter
    version: 1.0.4
    sha: b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be
  - kind: registry
    name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - kind: registry
    name: uuid
    version: 1.15.1
    sha: e0f540e3240398cce6128b64ba83fdbdd86129c16a3aa1a3a252efd66eb3d587
  - kind: registry
    name: v_frame
    version: 0.3.8
    sha: d6f32aaa24bacd11e488aa9ba66369c7cd514885742c9fe08cfe85884db3e92b
  - kind: registry
    name: va_list
    version: 0.1.4
    sha: 350bd5ef744f978a387cd08ce514be4e3766746496f355d59d68af36f52d36da
  - kind: registry
    name: valuable
    version: 0.1.1
    sha: ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65
  - kind: registry
    name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
  - kind: registry
    name: vergen
    version: 3.2.0
    sha: e7141e445af09c8919f1d5f8a20dae0b20c3b57a45dee0d5823c6ed5d237f15a
  - kind: registry
    name: version-compare
    version: 0.2.0
    sha: 852e951cb7832cb45cb1169900d19760cfa39b82bc0ea9c0e5a14ae88411c98b
  - kind: registry
    name: version_check
    version: 0.9.5
    sha: 0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a
  - kind: registry
    name: vsimd
    version: 0.8.0
    sha: 5c3082ca00d5a5ef149bb8b555a72ae84c9c59f7250f013ac822ac2e49b19c64
  - kind: registry
    name: waker-fn
    version: 1.2.0
    sha: 317211a0dc0ceedd78fb2ca9a44aed3d7b9b26f81870d485c07122b4350673b7
  - kind: registry
    name: walkdir
    version: 2.5.0
    sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
  - kind: registry
    name: want
    version: 0.3.1
    sha: bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e
  - kind: registry
    name: warp
    version: 0.3.7
    sha: 4378d202ff965b011c64817db11d5829506d3404edeadb61f190d111da3f231c
  - kind: registry
    name: wasi
    version: 0.11.0+wasi-snapshot-preview1
    sha: 9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423
  - kind: registry
    name: wasi
    version: 0.13.3+wasi-0.2.2
    sha: 26816d2e1a4a36a2940b96c5296ce403917633dff8f3440e9b236ed6f6bacad2
  - kind: registry
    name: wasm-bindgen
    version: 0.2.100
    sha: 1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5
  - kind: registry
    name: wasm-bindgen-backend
    version: 0.2.100
    sha: 2f0a0651a5c2bc21487bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6
  - kind: registry
    name: wasm-bindgen-futures
    version: 0.4.50
    sha: 555d470ec0bc3bb57890405e5d4322cc9ea83cebb085523ced7be4144dac1e61
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.100
    sha: 7fe63fc6d09ed3792bd0897b314f53de8e16568c2b3f7982f468c0bf9bd0b407
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.100
    sha: 8ae87ea40c9f689fc23f209965b6fb8a99ad69aeeb0231408be24920604395de
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.100
    sha: 1a05d73b933a847d6cccdda8f838a22ff101ad9bf93e33684f39c1f5f0eece3d
  - kind: registry
    name: web-sys
    version: 0.3.77
    sha: 33b6dd2ef9186f1f2072e409e99cd22a975331a6b3591b12c764e0e55c60d5d2
  - kind: registry
    name: web-time
    version: 1.1.0
    sha: 5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb
  - kind: registry
    name: webm-iterable
    version: 0.6.4
    sha: cd9fbf173b4b38f2f8bbb0082a0d4cb21f263a70811f5fccb1663c421c66d9f9
  - kind: registry
    name: weezl
    version: 0.1.8
    sha: 53a85b86a771b1c87058196170769dd264f66c0782acf1ae6cc51bfd64b39082
  - kind: registry
    name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - kind: registry
    name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - kind: registry
    name: winapi-util
    version: 0.1.9
    sha: cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb
  - kind: registry
    name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - kind: registry
    name: windows-core
    version: 0.52.0
    sha: 33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9
  - kind: registry
    name: windows-link
    version: 0.1.0
    sha: 6dccfd733ce2b1753b03b6d3c65edf020262ea35e20ccdf3e288043e6dd620e3
  - kind: registry
    name: windows-registry
    version: 0.2.0
    sha: e400001bb720a623c1c69032f8e3e4cf09984deec740f007dd2b03ec864804b0
  - kind: registry
    name: windows-result
    version: 0.2.0
    sha: 1d1043d8214f791817bab27572aaa8af63732e11bf84aa21a45a78d6c317ae0e
  - kind: registry
    name: windows-strings
    version: 0.1.0
    sha: 4cd9b125c486025df0eabcb585e62173c6c9eddcec5d117d3b6e8c30e2ee4d10
  - kind: registry
    name: windows-sys
    version: 0.48.0
    sha: 677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9
  - kind: registry
    name: windows-sys
    version: 0.52.0
    sha: 282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d
  - kind: registry
    name: windows-sys
    version: 0.59.0
    sha: 1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b
  - kind: registry
    name: windows-targets
    version: 0.48.5
    sha: 9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c
  - kind: registry
    name: windows-targets
    version: 0.52.6
    sha: 9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.48.5
    sha: 2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.52.6
    sha: 32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.48.5
    sha: dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.52.6
    sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
  - kind: registry
    name: windows_i686_gnu
    version: 0.48.5
    sha: a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e
  - kind: registry
    name: windows_i686_gnu
    version: 0.52.6
    sha: 8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.52.6
    sha: 0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66
  - kind: registry
    name: windows_i686_msvc
    version: 0.48.5
    sha: 8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406
  - kind: registry
    name: windows_i686_msvc
    version: 0.52.6
    sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.48.5
    sha: 53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.52.6
    sha: 147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.48.5
    sha: 0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.52.6
    sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.48.5
    sha: ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.52.6
    sha: 589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec
  - kind: registry
    name: winnow
    version: 0.7.3
    sha: 0e7f4ea97f6f78012141bcdb6a216b2609f0979ada50b20ca5b52dde2eac2bb1
  - kind: registry
    name: winreg
    version: 0.50.0
    sha: 524e57b2c537c0f9b1e69f1965311ec12182b4122e45035b1508cd24d2adadb1
  - kind: registry
    name: wit-bindgen-rt
    version: 0.33.0
    sha: 3268f3d866458b787f390cf61f4bbb563b922d091359f9608842999eaee3943c
  - kind: registry
    name: write16
    version: 1.0.0
    sha: d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936
  - kind: registry
    name: writeable
    version: 0.5.5
    sha: 1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51
  - kind: registry
    name: xattr
    version: 1.4.0
    sha: e105d177a3871454f754b33bb0ee637ecaaac997446375fd3e5d43a2ed00c909
  - kind: registry
    name: xml-rs
    version: 0.8.25
    sha: c5b940ebc25896e71dd073bad2dbaa2abfe97b0a391415e22ad1326d9c54e3c4
  - kind: registry
    name: xmlparser
    version: 0.13.6
    sha: 66fee0b777b0f5ac1c69bb06d361268faafa61cd4682ae064a171c16c433e9e4
  - kind: registry
    name: xmltree
    version: 0.11.0
    sha: b619f8c85654798007fb10afa5125590b43b088c225a25fc2fec100a9fad0fc6
  - kind: registry
    name: yansi
    version: 1.0.1
    sha: cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049
  - kind: registry
    name: yasna
    version: 0.5.2
    sha: e17bb3549cc1321ae1296b9cdc2698e2b6cb1992adfa19a8c72e5b7a738f44cd
  - kind: registry
    name: yoke
    version: 0.7.5
    sha: 120e6aef9aa629e3d4f52dc8cc43a015c7724194c97dfaf45180d2daf2b77f40
  - kind: registry
    name: yoke-derive
    version: 0.7.5
    sha: 2380878cad4ac9aac1e2435f3eb4020e8374b5f13c296cb75b4620ff8e229154
  - kind: registry
    name: zerocopy
    version: 0.6.6
    sha: 854e949ac82d619ee9a14c66a1b674ac730422372ccb759ce0c39cabcf2bf8e6
  - kind: registry
    name: zerocopy
    version: 0.7.35
    sha: 1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0
  - kind: registry
    name: zerocopy
    version: 0.8.21
    sha: dcf01143b2dd5d134f11f545cf9f1431b13b749695cb33bcce051e7568f99478
  - kind: registry
    name: zerocopy-derive
    version: 0.6.6
    sha: 125139de3f6b9d625c39e2efdd73d41bdac468ccd556556440e322be0e1bbd91
  - kind: registry
    name: zerocopy-derive
    version: 0.7.35
    sha: fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e
  - kind: registry
    name: zerocopy-derive
    version: 0.8.21
    sha: 712c8386f4f4299382c9abee219bee7084f78fb939d88b6840fcc1320d5f6da2
  - kind: registry
    name: zerofrom
    version: 0.1.5
    sha: cff3ee08c995dee1859d998dea82f7374f2826091dd9cd47def953cae446cd2e
  - kind: registry
    name: zerofrom-derive
    version: 0.1.5
    sha: 595eed982f7d355beb85837f651fa22e90b3c044842dc7f2c2842c086f295808
  - kind: registry
    name: zeroize
    version: 1.8.1
    sha: ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde
  - kind: registry
    name: zerovec
    version: 0.10.4
    sha: aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079
  - kind: registry
    name: zerovec-derive
    version: 0.10.3
    sha: 6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6
- kind: patch
  # adapted from https://build.opensuse.org/projects/openSUSE:Factory:RISCV/packages/gstreamer-plugins-rs/files/vendor.patch?expand=1
  path: patches/gstreamer-plugins-rs/gst-plugins-rs-0.13.0-libsodium-sys-riscv64.patch
