kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- public-stacks/buildsystem-autotools.bst
- public-stacks/buildsystem-cmake.bst
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
  ref: 0.14.0-0-g8511071f6518e6df5dcadf8b113a43addd7ea1fe
- kind: cargo2
  ref:
  - kind: registry
    name: addr2line
    version: 0.24.2
    sha: dfbe277e56a376000877090da837660b4427aad530e3028d44e0bffe4f89a1c1
  - kind: registry
    name: adler2
    version: 2.0.1
    sha: 320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa
  - kind: registry
    name: aes
    version: 0.8.4
    sha: b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0
  - kind: registry
    name: aho-corasick
    version: 1.1.3
    sha: 8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916
  - kind: registry
    name: aligned
    version: 0.4.2
    sha: 377e4c0ba83e4431b10df45c1d4666f178ea9c552cac93e60c3a88bf32785923
  - kind: registry
    name: aligned-vec
    version: 0.6.4
    sha: dc890384c8602f339876ded803c97ad529f3842aba97f6392b3dba0dd171769b
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
    version: 0.6.19
    sha: 301af1932e46185686725e0fad2f8f2aa7da69dd70bf6ecc44d6b703844a3933
  - kind: registry
    name: anstyle
    version: 1.0.11
    sha: 862ed96ca487e809f1c8e5a8447f6ee2cf102f846893800b20cebdf541fc6bbd
  - kind: registry
    name: anstyle-parse
    version: 0.2.7
    sha: 4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2
  - kind: registry
    name: anstyle-query
    version: 1.1.3
    sha: 6c8bdeb6047d8983be085bab0ba1472e6dc604e7041dbf6fcd5e71523014fae9
  - kind: registry
    name: anstyle-wincon
    version: 3.0.9
    sha: 403f75924867bb1033c59fbf0797484329750cfbe3c4325cd33127941fabc882
  - kind: registry
    name: anyhow
    version: 1.0.98
    sha: e16d2d3311acee920a9eb8d33b8cbc1787ce4a264e85f964c2404b969bdcd487
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
    name: as-slice
    version: 0.2.1
    sha: 516b6b4f0e40d50dcda9365d53964ec74560ad4284da2e7fc97122cd83174516
  - kind: registry
    name: async-channel
    version: 2.5.0
    sha: 924ed96dd52d1b75e9c1a3e6275715fd320f5f9439fb5a4a11fa51f4221158d2
  - kind: registry
    name: async-compression
    version: 0.4.27
    sha: ddb939d66e4ae03cee6091612804ba446b12878410cfa17f785f4dd67d4014e8
  - kind: registry
    name: async-lock
    version: 3.4.0
    sha: ff6e472cdea888a4bd64f342f09b3f50e1886d32afe8df3d663c01140b811b18
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
    version: 0.1.88
    sha: e539d3fca749fcee5236ab05e93a52867dd549cc157c8cb7f99595f3cedffdb5
  - kind: registry
    name: async-tungstenite
    version: 0.30.0
    sha: e308e9866b891743e3fdf9dfd6b57f85c5062ca01ce4fed6f393e76eb5accea4
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
    version: 1.5.0
    sha: c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8
  - kind: registry
    name: av-data
    version: 0.4.4
    sha: fca67ba5d317924c02180c576157afd54babe48a76ebc66ce6d34bb8ba08308e
  - kind: registry
    name: av-scenechange
    version: 0.14.1
    sha: 0f321d77c20e19b92c39e7471cf986812cbb46659d2af674adc4331ef3f18394
  - kind: registry
    name: av1-grain
    version: 0.2.4
    sha: 4f3efb2ca85bc610acfa917b5aaa36f3fcbebed5b3182d7f877b02531c4b80c8
  - kind: registry
    name: aws-config
    version: 1.5.18
    sha: 90aff65e86db5fe300752551c1b015ef72b708ac54bded8ef43d0d53cb7cb0b1
  - kind: registry
    name: aws-credential-types
    version: 1.2.2
    sha: 4471bef4c22a06d2c7a1b6492493d3fdf24a805323109d6874f9c94d5906ac14
  - kind: registry
    name: aws-lc-rs
    version: 1.13.2
    sha: 08b5d4e069cbc868041a64bd68dc8cb39a0d79585cd6c5a24caa8c2d622121be
  - kind: registry
    name: aws-lc-sys
    version: 0.30.0
    sha: dbfd150b5dbdb988bcc8fb1fe787eb6b7ee6180ca24da683b61ea5405f3d43ff
  - kind: registry
    name: aws-runtime
    version: 1.5.5
    sha: 76dd04d39cc12844c0994f2c9c5a6f5184c22e9188ec1ff723de41910a21dcad
  - kind: registry
    name: aws-sdk-kinesisvideo
    version: 1.62.0
    sha: ee4a417ba5708249f751871346b33e90fa77ce4f23e22feb71f2d7b108d3eab8
  - kind: registry
    name: aws-sdk-kinesisvideosignaling
    version: 1.61.0
    sha: 21e26c7eb8320764c744668f328331895b6560bd8895bc1fc9b0150ecc7db98d
  - kind: registry
    name: aws-sdk-polly
    version: 1.64.0
    sha: 65ba925135b467d391852089f5e44516e411429cc625a2e7d1172cf935c16e95
  - kind: registry
    name: aws-sdk-s3
    version: 1.76.0
    sha: 66e83401ad7287ad15244d557e35502c2a94105ca5b41d656c391f1a4fc04ca2
  - kind: registry
    name: aws-sdk-sso
    version: 1.61.0
    sha: e65ff295979977039a25f5a0bf067a64bc5e6aa38f3cef4037cf42516265553c
  - kind: registry
    name: aws-sdk-ssooidc
    version: 1.62.0
    sha: 91430a60f754f235688387b75ee798ef00cfd09709a582be2b7525ebb5306d4f
  - kind: registry
    name: aws-sdk-sts
    version: 1.62.0
    sha: 9276e139d39fff5a0b0c984fc2d30f970f9a202da67234f948fda02e5bea1dbe
  - kind: registry
    name: aws-sdk-transcribestreaming
    version: 1.63.0
    sha: 6c422a13b02fc024859f342e3c2dca7c956bd686257f023e261e13d8a43734e0
  - kind: registry
    name: aws-sdk-translate
    version: 1.61.0
    sha: 48a847f4c6ffb31af5ac79b6a1bd73f19ae61ea8762b5d82dcbdc336b21d005d
  - kind: registry
    name: aws-sigv4
    version: 1.2.9
    sha: 9bfe75fad52793ce6dec0dc3d4b1f388f038b5eb866c8d4d7f3a8e21b5ea5051
  - kind: registry
    name: aws-smithy-async
    version: 1.2.5
    sha: 1e190749ea56f8c42bf15dd76c65e14f8f765233e6df9b0506d9d934ebef867c
  - kind: registry
    name: aws-smithy-checksums
    version: 0.62.0
    sha: f2f45a1c384d7a393026bc5f5c177105aa9fa68e4749653b985707ac27d77295
  - kind: registry
    name: aws-smithy-eventstream
    version: 0.60.9
    sha: 338a3642c399c0a5d157648426110e199ca7fd1c689cc395676b81aa563700c4
  - kind: registry
    name: aws-smithy-http
    version: 0.60.12
    sha: 7809c27ad8da6a6a68c454e651d4962479e81472aa19ae99e59f9aba1f9713cc
  - kind: registry
    name: aws-smithy-http
    version: 0.61.1
    sha: e6f276f21c7921fe902826618d1423ae5bf74cf8c1b8472aee8434f3dfd31824
  - kind: registry
    name: aws-smithy-json
    version: 0.61.4
    sha: a16e040799d29c17412943bdbf488fd75db04112d0c0d4b9290bacf5ae0014b9
  - kind: registry
    name: aws-smithy-query
    version: 0.60.7
    sha: f2fbd61ceb3fe8a1cb7352e42689cec5335833cd9f94103a61e98f9bb61c64bb
  - kind: registry
    name: aws-smithy-runtime
    version: 1.7.8
    sha: d526a12d9ed61fadefda24abe2e682892ba288c2018bcb38b1b4c111d13f6d92
  - kind: registry
    name: aws-smithy-runtime-api
    version: 1.7.4
    sha: 3da37cf5d57011cb1753456518ec76e31691f1f474b73934a284eb2a1c76510f
  - kind: registry
    name: aws-smithy-types
    version: 1.3.2
    sha: d498595448e43de7f4296b7b7a18a8a02c61ec9349128c80a368f7c3b4ab11a8
  - kind: registry
    name: aws-smithy-xml
    version: 0.60.10
    sha: 3db87b96cb1b16c024980f133968d52882ca0daaee3a086c6decc500f6c99728
  - kind: registry
    name: aws-types
    version: 1.3.6
    sha: 3873f8deed8927ce8d04487630dc9ff73193bab64742a61d050e57a68dec4125
  - kind: registry
    name: backtrace
    version: 0.3.75
    sha: 6806a6321ec58106fea15becdad98371e28d92ccbc7c8f1b3b6dd724fe8f1002
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
    name: bindgen
    version: 0.69.5
    sha: 271383c67ccabffb7381723dea0672a673f292304fcb45c01cc648c7a8d58088
  - kind: registry
    name: bindgen
    version: 0.71.1
    sha: 5f58bf3d7db68cfbac37cfc485a8d711e87e064c3d0fe0435b92f7a407f9d6b3
  - kind: registry
    name: bindgen
    version: 0.72.0
    sha: 4f72209734318d0b619a5e0f5129918b848c416e122a3c4ce054e03cb87b726f
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.9.1
    sha: 1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967
  - kind: registry
    name: bitreader
    version: 0.3.11
    sha: 886559b1e163d56c765bc3a985febb4eee8009f625244511d8ee3c432e08c066
  - kind: registry
    name: bitstream-io
    version: 4.3.0
    sha: 1f30faa215941f112abe3f87ae44889e4596260602a1a2b82837c7860fdd56a0
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: bstr
    version: 1.12.0
    sha: 234113d19d0d7d613b40e86fb654acf958910802bcceab913a4f9e7cda03b1a4
  - kind: registry
    name: built
    version: 0.8.0
    sha: f4ad8f11f288f48ca24471bbd51ac257aaeaaa07adae295591266b792902ae64
  - kind: registry
    name: bumpalo
    version: 3.19.0
    sha: 46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43
  - kind: registry
    name: byte-slice-cast
    version: 1.2.3
    sha: 7575182f7272186991736b70173b0ea045398f984bf5ebbb3804736ce1330c9d
  - kind: registry
    name: bytemuck
    version: 1.23.1
    sha: 5c76a5792e44e4abe34d3abf15636779261d45a7450612059293d1d2cfc63422
  - kind: registry
    name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - kind: registry
    name: byteorder-lite
    version: 0.1.0
    sha: 8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495
  - kind: registry
    name: byteorder_slice
    version: 3.0.0
    sha: 0b294e30387378958e8bf8f4242131b930ea615ff81e8cac2440cea0a6013190
  - kind: registry
    name: bytes
    version: 1.10.1
    sha: d71b6127be86fdcfddb610f7182ac57211d4b18a3e9c82eb2d17662f2227ad6a
  - kind: registry
    name: bytes-utils
    version: 0.1.4
    sha: 7dafe3a8757b027e2be6e4e5601ed563c55989fcf1546e933c66c8eb3a058d35
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: cairo-rs
    version: 0.21.0
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: cairo-sys-rs
    version: 0.21.0
  - kind: registry
    name: cc
    version: 1.2.29
    sha: 5c1599538de2394445747c8cf7935946e3cc27e9625f889d979bfb2aaf569362
  - kind: registry
    name: cdg
    version: 0.1.0
    sha: d254b2c9fc971518da5d652aee7edc6b9bb96fa32de28f166895faf69d9926e6
  - kind: registry
    name: cdg_renderer
    version: 0.8.0
    sha: 0070ec0e6be4ed55d28bcfc499ecd479cb3764181eee2018dc661d8efd4e3f71
  - kind: registry
    name: cdp-types
    version: 0.3.0
    sha: 332ca05a88e143d80a245f9aa6c65b6e6383ee3e332017005647c27c6a62f902
  - kind: registry
    name: cea608-types
    version: 0.1.4
    sha: 5dfc9d3f5161702cf339e6337203ac26b64279383468247e45b36e221cb06cae
  - kind: registry
    name: cea708-types
    version: 0.4.1
    sha: de28b1d549e7f8f53a746fb36ae4c10c776a8e004950b527be1669a58667ae0b
  - kind: registry
    name: cesu8
    version: 1.1.0
    sha: 6d43a04d8753f35258c91f8ec639f792891f748a1edbd759cf1dcea3382ad83c
  - kind: registry
    name: cexpr
    version: 0.6.0
    sha: 6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766
  - kind: registry
    name: cfg-expr
    version: 0.18.0
    sha: 1a2b34126159980f92da2a08bdec0694fd80fb5eb9e48aff25d20a0d8dfa710d
  - kind: registry
    name: cfg-if
    version: 1.0.1
    sha: 9555578bc9e57714c812a1f84e4fc5b4d21fcb063490c624de019f7464c91268
  - kind: registry
    name: cfg_aliases
    version: 0.2.1
    sha: 613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724
  - kind: registry
    name: chrono
    version: 0.4.41
    sha: c469d952047f47f91b68d1cba3f10d63c11d73e4636f24f08daf0278abf01c4d
  - kind: registry
    name: cipher
    version: 0.4.4
    sha: 773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad
  - kind: registry
    name: clang-sys
    version: 1.8.1
    sha: 0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4
  - kind: registry
    name: clap
    version: 4.5.41
    sha: be92d32e80243a54711e5d7ce823c35c41c9d929dc4ab58e1276f625841aadf9
  - kind: registry
    name: clap_builder
    version: 4.5.41
    sha: 707eab41e9622f9139419d573eca0900137718000c517d47da73045f54331c3d
  - kind: registry
    name: clap_derive
    version: 4.5.41
    sha: ef4f52386a59ca4c860f7393bcf8abd8dfd91ecccc0f774635ff68e92eeef491
  - kind: registry
    name: clap_lex
    version: 0.7.5
    sha: b94f61472cee1439c0b966b47e3aca9ae07e45d070759512cd390ea2bebc6675
  - kind: registry
    name: claxon
    version: 0.4.3
    sha: 4bfbf56724aa9eca8afa4fcfadeb479e722935bb2a0900c2d37e0cc477af0688
  - kind: registry
    name: cmake
    version: 0.1.54
    sha: e7caa3f9de89ddbe2c607f4101924c5abec803763ae9534e4f4d7d8f84aa81f0
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
    version: 1.0.4
    sha: b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75
  - kind: registry
    name: combine
    version: 4.6.7
    sha: ba5a308b75df32fe02788e748662718f03fde005016435c444eea572398219fd
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
    version: 0.10.1
    sha: b2a6cd9ae233e7f62ba4e9353e81a88df7fc8a5987b8d445b4d90c879bd156f6
  - kind: registry
    name: core-foundation
    version: 0.9.4
    sha: 91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f
  - kind: registry
    name: core-foundation-sys
    version: 0.8.7
    sha: 773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b
  - kind: registry
    name: core2
    version: 0.4.0
    sha: b49ba7ef1ad6107f8824dbe97de947cbaac53c44e7f9756a1fba0d37c1eec505
  - kind: registry
    name: cpufeatures
    version: 0.2.17
    sha: 59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280
  - kind: registry
    name: crc
    version: 3.3.0
    sha: 9710d3b3739c2e349eb44fe848ad0b7c8cb1e42bd87ee49371df2f7acaf3e675
  - kind: registry
    name: crc-catalog
    version: 2.4.0
    sha: 19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5
  - kind: registry
    name: crc32c
    version: 0.6.8
    sha: 3a47af21622d091a8f0fb295b88bc886ac74efcc613efc19f5d0b21de5c89e47
  - kind: registry
    name: crc32fast
    version: 1.5.0
    sha: 9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511
  - kind: registry
    name: crc64fast-nvme
    version: 1.2.0
    sha: 4955638f00a809894c947f85a024020a20815b65a5eea633798ea7924edab2b3
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
    name: csound
    version: 0.1.8
    sha: 8d49045d7365f5c2cadb1f20932189a0da101ac86c8dbe891975814b2348d57d
  - kind: registry
    name: csound-sys
    version: 0.1.2
    sha: 86b11869eaed111b64d29e66cc5c7de9f172d5b623b716eb74c5dd841dbcfe39
  - kind: registry
    name: ctr
    version: 0.9.2
    sha: 0369ee1ad671834580515889b80f2ea915f23b8be8d0daa4bbaf2ac5c7590835
  - kind: registry
    name: ctrlc
    version: 3.4.7
    sha: 46f93780a459b7d656ef7f071fe699c4d3d2cb201c4b24d085b6ddc505276e73
  - kind: registry
    name: darling
    version: 0.20.11
    sha: fc7f46116c46ff9ab3eb1597a45688b6715c6e628b5c133e288e709a29bcb4ee
  - kind: registry
    name: darling_core
    version: 0.20.11
    sha: 0d00b9596d185e565c2207a0b01f8bd1a135483d02d9b7b0a54b11da8d53412e
  - kind: registry
    name: darling_macro
    version: 0.20.11
    sha: fc34b93ccb385b40dc71c6fceac4b2ad23662c7eeb248cf10d529b7e055b6ead
  - kind: registry
    name: dash-mpd
    version: 0.18.4
    sha: a8566944d3b3287a865a0ea8590b07b437142ca3640fed806c15e18a4087ea42
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
    version: 2.9.0
    sha: 2a2330da5de22e8a3cb63252ce2abb30116bf5265e89c0e01bc17015ce30a476
  - kind: registry
    name: dav1d
    version: 0.11.0
    sha: f6cf827d3349972e28999ad957d9fb6d6bf2dee306af76640855e9488e769798
  - kind: registry
    name: dav1d-sys
    version: 0.8.3
    sha: c3c91aea6668645415331133ed6f8ddf0e7f40160cd97a12d59e68716a58704b
  - kind: registry
    name: der
    version: 0.6.1
    sha: f1a467a65c5e759bce6e65eaf91cc29f466cdc57cb65777bd646872a8a1fd4de
  - kind: registry
    name: der
    version: 0.7.10
    sha: e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb
  - kind: registry
    name: deranged
    version: 0.4.0
    sha: 9c9e6a11ca8224451684bc0d7d5a7adbf8f2fd6887261a1cfc3c0432f9d4068e
  - kind: registry
    name: derive-into-owned
    version: 0.2.0
    sha: 2c9d94d81e3819a7b06a8638f448bc6339371ca9b6076a99d4a43eece3c4c923
  - kind: registry
    name: derive_builder
    version: 0.20.2
    sha: 507dfb09ea8b7fa618fcf76e953f4f5e192547945816d5358edffe39f6f94947
  - kind: registry
    name: derive_builder_core
    version: 0.20.2
    sha: 2d5bcf7b024d6835cfb3d473887cd966994907effbe9227e8c8219824d06c4e8
  - kind: registry
    name: derive_builder_macro
    version: 0.20.2
    sha: ab63b0e2bf4d5928aff72e83a7dace85d7bba5fe12dcc3c5a572d78caffd3f3c
  - kind: registry
    name: derive_more
    version: 2.0.1
    sha: 093242cf7570c207c83073cf82f79706fe7b8317e98620a47d5be7c3d8497678
  - kind: registry
    name: derive_more-impl
    version: 2.0.1
    sha: bda628edc44c4bb645fbe0f758797143e4e07926f7ebf4e9bdfbd3d2ce621df3
  - kind: registry
    name: diff
    version: 0.1.13
    sha: 56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8
  - kind: registry
    name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
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
    name: dunce
    version: 1.0.5
    sha: 92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813
  - kind: registry
    name: dyn-clone
    version: 1.0.19
    sha: 1c7a8fb8a9fbf66c1f703fe16184d10ca0ee9d23be5b4436400408ba54a95005
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
    version: 1.15.0
    sha: 48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719
  - kind: registry
    name: elliptic-curve
    version: 0.12.3
    sha: e7bb888ab5300a19b8e5bceef25ac745ad065f3c9f7efc6de1b91958110891d3
  - kind: registry
    name: encoding_rs
    version: 0.8.35
    sha: 75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3
  - kind: registry
    name: enumn
    version: 0.1.14
    sha: 2f9ed6b3789237c8a0c1c505af1c7eb2c560df6186f01b098c3a1064ea532f38
  - kind: registry
    name: env_filter
    version: 0.1.3
    sha: 186e05a59d4c50738528153b83b0b0194d3a29507dfec16eccd4b342903397d0
  - kind: registry
    name: env_logger
    version: 0.11.8
    sha: 13c863f0904021b108aa8b2f55046443e6b1ebde8fd4a15c399893aae4fa069f
  - kind: registry
    name: equator
    version: 0.4.2
    sha: 4711b213838dfee0117e3be6ac926007d7f433d7bbe33595975d4190cb07e6fc
  - kind: registry
    name: equator-macro
    version: 0.4.2
    sha: 44f23cf4b44bfce11a86ace86f8a73ffdec849c9fd00a386a53d278bd9e81fb3
  - kind: registry
    name: equivalent
    version: 1.0.2
    sha: 877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f
  - kind: registry
    name: errno
    version: 0.3.13
    sha: 778e2ac28f6c47af28e4907f13ffd1e1ddbd400980a9abd7c8df189bf578a5ad
  - kind: registry
    name: etherparse
    version: 0.18.0
    sha: 3ff83a5facf1a7cbfef93cfb48d6d4fb6a1f42d8ac2341a96b3255acb4d4f860
  - kind: registry
    name: event-listener
    version: 5.4.0
    sha: 3492acde4c3fc54c845eaab3eed8bd00c7a7d881f78bfc801e43a93dec1331ae
  - kind: registry
    name: event-listener-strategy
    version: 0.5.4
    sha: 8be9f3dfaaffdae2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93
  - kind: registry
    name: fallible-iterator
    version: 0.3.0
    sha: 2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649
  - kind: registry
    name: fastbloom
    version: 0.9.0
    sha: 27cea6e7f512d43b098939ff4d5a5d6fe3db07971e1d05176fe26c642d33f5b8
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
    commit: bd9eabfc14c9ad53c37b32279e276619f4390ab8
    repo: github:rust-av/ffv1.git
    query:
      rev: bd9eabfc14c9ad53c37b32279e276619f4390ab8
    name: ffv1
    version: 0.0.0
  - kind: registry
    name: field-offset
    version: 0.3.6
    sha: 38e2275cc4e4fc009b0669731a1e5ab7ebf11f469eaede2bab9309a5b4d6057f
  - kind: registry
    name: filetime
    version: 0.2.25
    sha: 35c0522e981e68cbfa8c3f978441a5f34b30b96e146b33cd3359176b50fe8586
  - kind: registry
    name: fixedbitset
    version: 0.4.2
    sha: 0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80
  - kind: registry
    name: flate2
    version: 1.1.2
    sha: 4a3d7db9596fecd151c5f638c0ee5d5bd487b6e0ea232e5dc96d5250f6f94b1d
  - kind: git
    commit: 833508af656d298c269f2397c8541a084264d992
    repo: github:rust-av/flavors
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
    version: 0.1.5
    sha: d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2
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
    version: 3.1.1
    sha: 88d7be93788013f265201256d58f04936a8079ad5dc898743aa20525f503b683
  - kind: registry
    name: fs_extra
    version: 1.3.0
    sha: 42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c
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
    name: futures-timer
    version: 3.0.3
    sha: f288b0a4f20f9a56b5d1da57e2227c661b7b16168e2f72365f57b63326e29b24
  - kind: registry
    name: futures-util
    version: 0.3.31
    sha: 9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: gdk-pixbuf
    version: 0.21.0
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: gdk-pixbuf-sys
    version: 0.21.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gdk4
    version: 0.10.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gdk4-sys
    version: 0.10.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gdk4-wayland
    version: 0.10.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gdk4-wayland-sys
    version: 0.10.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gdk4-win32
    version: 0.10.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gdk4-win32-sys
    version: 0.10.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gdk4-x11
    version: 0.10.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gdk4-x11-sys
    version: 0.10.0
  - kind: registry
    name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - kind: registry
    name: getifaddrs
    version: 0.2.0
    sha: b1c016cebf305060d144de015c98191ede05c210af588857bc2d4f8611c04663
  - kind: registry
    name: getrandom
    version: 0.2.16
    sha: 335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592
  - kind: registry
    name: getrandom
    version: 0.3.3
    sha: 26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4
  - kind: registry
    name: gif
    version: 0.13.3
    sha: 4ae047235e33e2829703574b54fdec96bfbad892062d97fed2f76022287de61b
  - kind: registry
    name: gimli
    version: 0.31.1
    sha: 07e28edb80900c19c28f1072f2e8aeca7fa06b23cd4169cefe1af5aa3260783f
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: gio
    version: 0.21.0
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: gio-sys
    version: 0.21.0
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: glib
    version: 0.21.0
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: glib-macros
    version: 0.21.0
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: glib-sys
    version: 0.21.0
  - kind: registry
    name: glob
    version: 0.3.2
    sha: a8d1add55171497b4705a648c6b583acafb01d58050a51727785f0b2c8e0a2b2
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: gobject-sys
    version: 0.21.0
  - kind: registry
    name: governor
    version: 0.6.3
    sha: 68a7f542ee6b35af73b06abc0dad1c1bae89964e4e253bc4b587b91c9637867b
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: graphene-rs
    version: 0.21.0
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: graphene-sys
    version: 0.21.0
  - kind: registry
    name: group
    version: 0.12.1
    sha: 5dfbfb3a6cfbd390d5c9564ab283a0349b9b9fcd46a706c1eb10e0db70bfbac7
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gsk4
    version: 0.10.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gsk4-sys
    version: 0.10.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-allocators
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-allocators-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-analytics
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-analytics-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-app
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-app-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-audio
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-audio-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-base
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-base-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-check
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-check-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-gl
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-gl-egl
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-gl-egl-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-gl-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-gl-wayland
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-gl-wayland-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-gl-x11
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-gl-x11-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-net
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-net-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-pbutils
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-pbutils-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-rtp
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-rtp-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-sdp
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-sdp-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-tag
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-tag-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-utils
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-video
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-video-sys
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-webrtc
    version: 0.24.0
  - kind: git
    commit: ef17224f7a88b01d788c7ebc81a85d10df5f09a1
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.24
    name: gstreamer-webrtc-sys
    version: 0.24.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gtk4
    version: 0.10.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gtk4-macros
    version: 0.10.0
  - kind: git
    commit: 416aa3ae63fc33ff6436ab1fe26ffbdbe47e8976
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.10
    name: gtk4-sys
    version: 0.10.0
  - kind: registry
    name: h2
    version: 0.3.27
    sha: 0beca50380b1fc32983fc1cb4587bfa4bb9e78fc259aad4a0032d2080309222d
  - kind: registry
    name: h2
    version: 0.4.11
    sha: 17da50a276f1e01e0ba6c029e47b7100754904ee8a278f886546e98575380785
  - kind: registry
    name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - kind: registry
    name: hashbrown
    version: 0.15.4
    sha: 5971ac85611da7067dbfcabef3c70ebb5606018acd9e2a3903a0da507521e0d5
  - kind: registry
    name: headers
    version: 0.3.9
    sha: 06683b93020a07e3dbcf5f8c0f6d40080d725bea7936fc01ad345c01b97dc270
  - kind: registry
    name: headers
    version: 0.4.1
    sha: b3314d5adb5d94bcdf56771f2e50dbbc80bb4bdf88967526706205ac9eff24eb
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
    version: 0.5.2
    sha: fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c
  - kind: registry
    name: hex
    version: 0.4.3
    sha: 7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70
  - kind: registry
    name: hmac
    version: 0.12.1
    sha: 6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e
  - kind: registry
    name: home
    version: 0.5.11
    sha: 589533453244b0995c858700322199b2becb13b627df2851f64a2775d024abcf
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
    version: 1.3.1
    sha: f4a85d31aea989eead29a3aaf9e1115a180df8282431156e533de47660892565
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
    version: 0.1.3
    sha: b021d93e26becf5dc7e1b75b1bed1fd93124b374ceb73f43d4d4eafec896a64a
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
    name: hyper-proxy2
    version: 0.1.0
    sha: 9043b7b23fb0bc4a1c7014c27b50a4fc42cc76206f71d34fc0dfe5b28ddc3faf
  - kind: registry
    name: hyper-rustls
    version: 0.24.2
    sha: ec3efd23720e2049821a693cbc7e65ea87c72f1c58ff2f9522ff332b1491e590
  - kind: registry
    name: hyper-rustls
    version: 0.26.0
    sha: a0bea761b46ae2b24eb4aef630d8d1c398157b6fc29e6350ecf090a0b70c952c
  - kind: registry
    name: hyper-rustls
    version: 0.27.7
    sha: e3c93eb611681b207e1fe55d5a71ecf91572ec8a6705cdb6857f7d8d5242cf58
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
    version: 0.1.15
    sha: 7f66d5bd4c6f02bf0542fad85d626775bab9258cf795a4256dcaf3161114d1df
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
    version: 0.1.63
    sha: b0c919e5debc312ad217002b8048a17b7d83f80703865bbfcfebb0458b0b27d8
  - kind: registry
    name: iana-time-zone-haiku
    version: 0.1.2
    sha: f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f
  - kind: registry
    name: icu_collections
    version: 2.0.0
    sha: 200072f5d0e3614556f94a9930d5dc3e0662a652823904c3a75dc3b0af7fee47
  - kind: registry
    name: icu_locale_core
    version: 2.0.0
    sha: 0cde2700ccaed3872079a65fb1a78f6c0a36c91570f28755dda67bc8f7d9f00a
  - kind: registry
    name: icu_normalizer
    version: 2.0.0
    sha: 436880e8e18df4d7bbc06d58432329d6458cc84531f7ac5f024e93deadb37979
  - kind: registry
    name: icu_normalizer_data
    version: 2.0.0
    sha: 00210d6893afc98edb752b664b8890f0ef174c8adbb8d0be9710fa66fbbf72d3
  - kind: registry
    name: icu_properties
    version: 2.0.1
    sha: 016c619c1eeb94efb86809b015c58f479963de65bdb6253345c1a1276f22e32b
  - kind: registry
    name: icu_properties_data
    version: 2.0.1
    sha: 298459143998310acd25ffe6810ed544932242d3f07083eee1084d83a71bd632
  - kind: registry
    name: icu_provider
    version: 2.0.0
    sha: 03c80da27b5f4187909049ee2d72f276f0d9f99a42c306bd0131ecfe04d8e5af
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
    version: 1.2.1
    sha: 3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344
  - kind: registry
    name: image
    version: 0.25.6
    sha: db35664ce6b9810857a38a906215e75a9c879f0696556a39f59c62829710251a
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
    version: 2.10.0
    sha: fe4cd85333e22411419a0bcae1297d25e58c9443848b11dc6a86fefe8c78a661
  - kind: registry
    name: inout
    version: 0.1.4
    sha: 879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01
  - kind: registry
    name: interpolate_name
    version: 0.2.4
    sha: c34819042dc3d3971c46c2190835914dfbe0c3c13f61449b2997f4e9722dfa60
  - kind: registry
    name: io-uring
    version: 0.7.8
    sha: b86e202f00093dcba4275d4636b93ef9dd75d025ae560d2521b45ea28ab49013
  - kind: registry
    name: ipnet
    version: 2.11.0
    sha: 469fb0b9cefa57e3ef31275ee7cacb78f2fdca44e4765491884a2b119d4eb130
  - kind: registry
    name: iri-string
    version: 0.7.8
    sha: dbc5ebe9c3a1a7a5127f920a418f7585e9e758e911d0466ed004f393b0e380b2
  - kind: registry
    name: is_terminal_polyfill
    version: 1.70.1
    sha: 7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf
  - kind: registry
    name: iso8601
    version: 0.6.3
    sha: e1082f0c48f143442a1ac6122f67e360ceee130b967af4d50996e5154a45df46
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
    version: 0.13.0
    sha: 413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186
  - kind: registry
    name: itertools
    version: 0.14.0
    sha: 2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285
  - kind: registry
    name: itoa
    version: 1.0.15
    sha: 4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c
  - kind: registry
    name: jiff
    version: 0.2.15
    sha: be1f93b8b1eb69c77f24bbb0afdf66f54b632ee39af40ca21c4365a1d7347e49
  - kind: registry
    name: jiff-static
    version: 0.2.15
    sha: 03343451ff899767262ec32146f6d559dd759fdadf42ff0e227c7c48f72594b4
  - kind: registry
    name: jni
    version: 0.21.1
    sha: 1a87aa2bb7d2af34197c04845522473242e1aa17c12f4935d5856491a7fb8c97
  - kind: registry
    name: jni-sys
    version: 0.3.0
    sha: 8eaf4bc02d17cbdd7ff4c7438cafcdf7fb9a4613313ad11b4f8fefe7d3fa0130
  - kind: registry
    name: jobserver
    version: 0.1.33
    sha: 38f262f097c174adebe41eb73d66ae9c06b2844fb0da69969647bbddd9b0538a
  - kind: registry
    name: js-sys
    version: 0.3.77
    sha: 1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f
  - kind: registry
    name: jsonwebtoken
    version: 9.3.1
    sha: 5a87cc7a48537badeae96744432de36f4be2b4a34a05a5ef32e9dd8a1c169dde
  - kind: registry
    name: khronos-egl
    version: 6.0.0
    sha: 6aae1df220ece3c0ada96b8153459b67eebe9ae9212258bb0134ae60416fdf76
  - kind: registry
    name: kstring
    version: 2.0.2
    sha: 558bf9508a558512042d3095138b1f7b8fe90c5467d94f9f1da28b3731c5dbd1
  - kind: registry
    name: lazy_static
    version: 1.5.0
    sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
  - kind: registry
    name: lazycell
    version: 1.3.0
    sha: 830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55
  - kind: registry
    name: lewton
    version: 0.10.2
    sha: 777b48df9aaab155475a83a7df3070395ea1ac6902f5cd062b8f2b028075c030
  - kind: registry
    name: libc
    version: 0.2.174
    sha: 1171693293099992e19cddea4e8b849964e9846f4acee11b3948bcc337be8776
  - kind: registry
    name: libfuzzer-sys
    version: 0.4.10
    sha: 5037190e1f70cbeef565bd267599242926f724d3b8a9f510fd7e0b540cfa4404
  - kind: registry
    name: libloading
    version: 0.8.8
    sha: 07033963ba89ebaf1584d767badaa2e8fcec21aedea6b8c0346d487d49c28667
  - kind: registry
    name: libm
    version: 0.2.15
    sha: f9fbbcab51052fe104eb5e5d351cf728d30a5be1fe14d9be8a3b097481fb97de
  - kind: registry
    name: libredox
    version: 0.1.4
    sha: 1580801010e535496706ba011c15f8532df6b42297d2e471fec38ceadd8c0638
  - kind: registry
    name: librespot-audio
    version: 0.6.0
    sha: 7e07566fe7553042936c61bbdd9bedb524114a904aa7f9738e266c641468bab8
  - kind: registry
    name: librespot-core
    version: 0.6.0
    sha: c4c76303efcf949a59f9380220ca420c4d72fa32dbb3641a0079f429cc5e44e7
  - kind: registry
    name: librespot-metadata
    version: 0.6.0
    sha: 7cf6d5c46a401b1dd3e062ebdce959aa694bbae1039841756545d2e9c4f8be5f
  - kind: registry
    name: librespot-oauth
    version: 0.6.0
    sha: 00dcad779aa6c3b442e493e2a40ca83a5c5fcf38a65c05b026c3587bd4f8d14f
  - kind: registry
    name: librespot-playback
    version: 0.6.0
    sha: 4ed1f776a04c8c9275407f8d4df034f2615ea729ec6c6d0fa69f423fc571df64
  - kind: registry
    name: librespot-protocol
    version: 0.6.0
    sha: 80802f52b5a1b3a2157454e6aca483a627fbf7b942e0a5fea037ebf3ed8b0546
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
    name: linux-raw-sys
    version: 0.9.4
    sha: cd945864f07fe9f5371a27ad7b52a172b4b499999f1d97574c9fa68373937e12
  - kind: registry
    name: litemap
    version: 0.8.0
    sha: 241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956
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
    version: 0.4.13
    sha: 96936507f153605bddfcda068dd804796c84324ed2510809e5b2a624c81da765
  - kind: registry
    name: log
    version: 0.4.27
    sha: 13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94
  - kind: registry
    name: lru
    version: 0.12.5
    sha: 234cf4f4a04dc1f57e24b96cc0cd600cf2af460d4161ac5ecdd0af8e1f3b2a38
  - kind: registry
    name: lru
    version: 0.16.0
    sha: 86ea4e65087ff52f3862caff188d489f1fab49a0cb09e01b2e3f1a617b10aaed
  - kind: registry
    name: lru-slab
    version: 0.1.2
    sha: 112b39cec0b298b6c1999fee3e31427f74f676e4cb9879ed1a121b43661a4154
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
    version: 2.7.5
    sha: 32a282da65faaf38286cf3be983213fcf1d2e2a58700e808f83f4ea9a4804bc0
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
    version: 0.8.9
    sha: 1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316
  - kind: registry
    name: mio
    version: 1.0.4
    sha: 78bed444cc8a2160f01cbcf811ef18cac863ad68ae8ca62092e8db51d51c761c
  - kind: registry
    name: more-asserts
    version: 0.3.1
    sha: 1fafa6961cabd9c63bcd77a45d7e3b7f3b552b70417831fb0f56db717e72407e
  - kind: registry
    name: mp4-atom
    version: 0.8.1
    sha: 40a59fd1da0f5d0864ba19bd9d45cefc3dc19835f6f3bbf9016a86e4b4480042
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
    version: 0.10.1
    sha: 1d87ecb2933e8aeadb3e3a02b828fed80a7528047e68b4f424523a0981a3a084
  - kind: registry
    name: nanorand
    version: 0.7.0
    sha: 6a51313c5820b0b02bd422f4b44776fbf47961755c74ce64afc73bfad10226c3
  - kind: registry
    name: nasm-rs
    version: 0.3.0
    sha: 12fcfa1bd49e0342ec1d07ed2be83b59963e7acbeb9310e1bb2c07b69dadd959
  - kind: registry
    name: native-tls
    version: 0.2.14
    sha: 87de3442987e9dbec73158d5c715e7ad9072fda936bb03d19d7fa10e00520f0e
  - kind: registry
    name: new_debug_unreachable
    version: 1.0.6
    sha: 650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086
  - kind: registry
    name: nix
    version: 0.30.1
    sha: 74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6
  - kind: registry
    name: nnnoiseless
    version: 0.5.1
    sha: 23d377ce2fb579ed5c14cfa0d39e70849030fdf673d6d1a764cadb2dfbb02a50
  - kind: registry
    name: no-std-compat
    version: 0.4.1
    sha: b93853da6d84c2e3c7d730d6473e8817692dd89be387eb01b94d7f108ecb5b8c
  - kind: registry
    name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - kind: registry
    name: nom
    version: 8.0.0
    sha: df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405
  - kind: registry
    name: nonzero_ext
    version: 0.3.0
    sha: 38bf9645c8b145698bb0b18a4637dcacbc421ea49bef2317e4fd8065a387cf21
  - kind: registry
    name: noop_proc_macro
    version: 0.3.0
    sha: 0676bb32a98c1a483ce53e500a81ad9c3d5b3f7c920c28c24e9cb0980d0b5bc8
  - kind: registry
    name: ntapi
    version: 0.4.1
    sha: e8a3895c6391c39d7fe7ebc444a87eb2991b2a0bc718fdabd071eec617fc68e4
  - kind: registry
    name: nu-ansi-term
    version: 0.46.0
    sha: 77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84
  - kind: registry
    name: num
    version: 0.4.3
    sha: 35bd024e8b2ff75562e5f34e7f4905839deb4b22955ef5e73d2fea1b9813cb23
  - kind: registry
    name: num-bigint
    version: 0.4.6
    sha: a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9
  - kind: registry
    name: num-bigint-dig
    version: 0.8.4
    sha: dc84195820f291c7697304f3cbdadd1cb7199c0efc917ff5eafd71225c136151
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
    name: num-iter
    version: 0.1.45
    sha: 1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf
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
    version: 1.17.0
    sha: 91df4bbde75afed763b708b7eee1e8e7651e02d97f6d5dd763e89367e957b23b
  - kind: registry
    name: num_threads
    version: 0.1.7
    sha: 5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9
  - kind: registry
    name: oauth2
    version: 4.4.2
    sha: c38841cdd844847e3e7c8d29cef9dcfed8877f8f56f9071f77843ecf3baf937f
  - kind: registry
    name: object
    version: 0.36.7
    sha: 62948e14d923ea95ea2c7c86c71013138b66525b86bdc08d2dcc262bdb497b87
  - kind: registry
    name: ogg
    version: 0.9.2
    sha: fdab8dcd8d4052eaacaf8fb07a3ccd9a6e26efadb42878a413c68fc4af1dee2b
  - kind: registry
    name: once_cell
    version: 1.21.3
    sha: 42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d
  - kind: registry
    name: once_cell_polyfill
    version: 1.70.1
    sha: a4895175b425cb1f87721b59f0f286c2092bd4af812243672510e1ac53e2e0ad
  - kind: registry
    name: openssl
    version: 0.10.73
    sha: 8505734d46c8ab1e19a1dce3aef597ad87dcb4c37e7188231769bd6bd51cebf8
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
    version: 0.9.109
    sha: 90096e2e47630d78b7d1c20952dc621f957103f8bc2c8359ec81290d75238571
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
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: pango
    version: 0.21.0
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: pango-sys
    version: 0.21.0
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: pangocairo
    version: 0.21.0
  - kind: git
    commit: a93a100230de5eb68850af90a96961c34d2b917b
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.21
    name: pangocairo-sys
    version: 0.21.0
  - kind: registry
    name: parking
    version: 2.2.1
    sha: f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba
  - kind: registry
    name: parking_lot
    version: 0.12.4
    sha: 70d58bf43669b5795d1576d0641cfb6fbb2057bf629506267a92807158584a13
  - kind: registry
    name: parking_lot_core
    version: 0.9.11
    sha: bc838d2a56b5b1a6c25f55575dfc605fabb63bb2365f6c2353ef9159aa69e4a5
  - kind: registry
    name: parse_link_header
    version: 0.4.0
    sha: fbc23fdb8bbf668d582b0c17120bf6b7f91d85ccad3a5b39706f019a4efda005
  - kind: registry
    name: paste
    version: 1.0.15
    sha: 57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a
  - kind: registry
    name: pastey
    version: 0.1.0
    sha: b3a8cb46bdc156b1c90460339ae6bfd45ba0394e5effbaa640badb4987fdc261
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
    version: 0.12.2
    sha: f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2
  - kind: registry
    name: pcap-file
    version: 2.0.0
    sha: 1fc1f139757b058f9f37b76c48501799d12c9aa0aa4c0d4c980b062ee925d1b2
  - kind: registry
    name: pem
    version: 3.0.5
    sha: 38af38e8470ac9dee3ce1bae1af9c1671fffc44ddfd8bd1d0a3445bf349a8ef3
  - kind: registry
    name: pem-rfc7468
    version: 0.7.0
    sha: 88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412
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
    name: pkcs1
    version: 0.7.5
    sha: c8ffb9f10fa047879315e6625af03c164b16962a5368d724ed16323b68ace47f
  - kind: registry
    name: pkcs8
    version: 0.10.2
    sha: f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7
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
    version: 3.8.0
    sha: b53a684391ad002dd6a596ceb6c74fd004fdce75f4be2e3f615068abbea5fd50
  - kind: registry
    name: portable-atomic
    version: 1.11.1
    sha: f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483
  - kind: registry
    name: portable-atomic-util
    version: 0.2.4
    sha: d8a2f0d8d040d7848a709caf78912debcc3f33ee4b3cac47d73d1e1069e83507
  - kind: registry
    name: potential_utf
    version: 0.1.2
    sha: e5a7c30837279ca13e7c867e9e40053bc68740f988cb07f7ca6df43cc734b585
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - kind: registry
    name: ppv-lite86
    version: 0.2.21
    sha: 85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9
  - kind: registry
    name: pretty_assertions
    version: 1.4.1
    sha: 3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d
  - kind: registry
    name: prettyplease
    version: 0.2.35
    sha: 061c1221631e079b26479d25bbf2275bfe5917ae8419cd7e34f13bfc2aa7539a
  - kind: registry
    name: primal-check
    version: 0.3.4
    sha: dc0d895b311e3af9902528fbb8f928688abbd95872819320517cc24ca6b2bd08
  - kind: registry
    name: priority-queue
    version: 2.5.0
    sha: 5676d703dda103cbb035b653a9f11448c0a7216c7926bd35fcb5865475d0c970
  - kind: registry
    name: proc-macro-crate
    version: 3.3.0
    sha: edce586971a4dfaa28950c6f18ed55e0406c1ab88bbce2c6f6293a7aaba73d35
  - kind: registry
    name: proc-macro-error-attr2
    version: 2.0.0
    sha: 96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5
  - kind: registry
    name: proc-macro-error2
    version: 2.0.1
    sha: 11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802
  - kind: registry
    name: proc-macro2
    version: 1.0.95
    sha: 02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778
  - kind: registry
    name: profiling
    version: 1.0.17
    sha: 3eb8486b569e12e2c32ad3e204dbaba5e4b5b216e9367044f25f1dba42341773
  - kind: registry
    name: profiling-procmacros
    version: 1.0.17
    sha: 52717f9a02b6965224f95ca2a81e2e0c5c43baacd28ca057577988930b6c3d5b
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
    version: 3.7.2
    sha: d65a1d4ddae7d8b5de68153b48f6aa3bba8cb002b243dbdbc55a5afbc98f99f4
  - kind: registry
    name: protobuf-codegen
    version: 3.7.2
    sha: 5d3976825c0014bbd2f3b34f0001876604fe87e0c86cd8fa54251530f1544ace
  - kind: registry
    name: protobuf-parse
    version: 3.7.2
    sha: b4aeaa1f2460f1d348eeaeed86aea999ce98c1bded6f089ff8514c9d9dbdc973
  - kind: registry
    name: protobuf-support
    version: 3.7.2
    sha: 3e36c2f31e0a47f9280fb347ef5e461ffcd2c52dd520d8e216b52f93b0b0d7d6
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
    version: 0.36.2
    sha: f7649a7b4df05aed9ea7ec6f628c67c9953a43869b8bc50929569b2999d443fe
  - kind: registry
    name: quick-xml
    version: 0.37.5
    sha: 331e97a1af0bf59823e6eadffe373d7b27f485be8748f71471c662c1f269b7fb
  - kind: registry
    name: quick-xml
    version: 0.38.0
    sha: 8927b0664f5c5a98265138b7e3f90aa19a6b21353182469ace36d4ac527b7b1b
  - kind: registry
    name: quinn
    version: 0.11.8
    sha: 626214629cda6781b6dc1d316ba307189c85ba657213ce642d9c77670f8202c8
  - kind: registry
    name: quinn-proto
    version: 0.11.12
    sha: 49df843a9161c85bb8aae55f101bc0bac8bcafd637a620d9122fd7e0b2f7422e
  - kind: registry
    name: quinn-udp
    version: 0.5.13
    sha: fcebb1209ee276352ef14ff8732e24cc2b02bbac986cd74a4c81bcb2f9881970
  - kind: registry
    name: quote
    version: 1.0.40
    sha: 1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d
  - kind: registry
    name: r-efi
    version: 5.3.0
    sha: 69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f
  - kind: registry
    name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - kind: registry
    name: rand
    version: 0.9.1
    sha: 9fbfd9d094a40bf3ae768db9361049ace4c0e04a4fd6b359518bd7b73a73dd97
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
    version: 0.8.1
    sha: 43b6dd56e85d9483277cde964fd1bdb0428de4fec5ebba7540995639a21cb32b
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
    version: 0.14.2
    sha: 49bc8ffa8a832eb1d7c8000337f8b0d2f4f2f5ec3cf4ddc26f125e3ad2451824
  - kind: registry
    name: realfft
    version: 3.5.0
    sha: f821338fddb99d089116342c46e9f1fbf3828dba077674613e734e01d6ea8677
  - kind: registry
    name: redox_syscall
    version: 0.5.13
    sha: 0d04b7d0ee6b4a0207a0a7adb104d23ecb0b47d6beae7152d0fa34b692b29fd6
  - kind: registry
    name: ref-cast
    version: 1.0.24
    sha: 4a0ae411dbe946a674d89546582cea4ba2bb8defac896622d6496f14c23ba5cf
  - kind: registry
    name: ref-cast-impl
    version: 1.0.24
    sha: 1165225c21bff1f3bbce98f5a1f889949bc902d3575308cc7b0de30b4f6d27c7
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
    version: 0.12.22
    sha: cbc931937e6ca3a06e3b6c0aa7841849b160a90351d6ab467a8b9b9959767531
  - kind: registry
    name: rfc6979
    version: 0.3.1
    sha: 7743f17af12fa0b03b803ba12cd6a8d9483a587e89c69445e3909655c0b9fabb
  - kind: registry
    name: rgb
    version: 0.8.52
    sha: 0c6a884d2998352bb4daf0183589aec883f16a6da1f4dde84d8e2e9a5409a1ce
  - kind: registry
    name: ring
    version: 0.17.14
    sha: a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7
  - kind: registry
    name: rsa
    version: 0.9.8
    sha: 78928ac1ed176a5ca1d17e578a1825f3d81ca54cf41053a592584b020cfd691b
  - kind: registry
    name: rtcp-types
    version: 0.2.0
    sha: d0f21b493eabbc715ef2107c4e022874c06769047b3008a9b645a86ea8048f61
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
    version: 0.1.25
    sha: 989e6739f80c4ad5b13e0fd7fe89531180375b18520cc8c82080e4dc4035b84f
  - kind: registry
    name: rustc-hash
    version: 1.1.0
    sha: 08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2
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
    version: 6.4.0
    sha: c6f140db74548f7c9d7cce60912c9ac414e74df5e718dc947d514b051b42f3f4
  - kind: registry
    name: rustix
    version: 0.38.44
    sha: fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154
  - kind: registry
    name: rustix
    version: 1.0.7
    sha: c71e83d6afe7ff64890ec6b71d6a69bb8a610ab78ce364b3352876bb4c801266
  - kind: registry
    name: rustls
    version: 0.21.12
    sha: 3f56a14d1f48b391359b22f731fd4bd7e43c97f3c50eee276f3aa09c94784d3e
  - kind: registry
    name: rustls
    version: 0.22.4
    sha: bf4ef73721ac7bcd79b2b315da7779d8fc09718c6b3d2d1b2d94850eb8c18432
  - kind: registry
    name: rustls
    version: 0.23.29
    sha: 2491382039b29b9b11ff08b76ff6c97cf287671dbb74f0be44bda389fffe9bd1
  - kind: registry
    name: rustls-native-certs
    version: 0.6.3
    sha: a9aace74cb666635c918e9c12bc0d348266037aa8eb599b5cba565709a8dff00
  - kind: registry
    name: rustls-native-certs
    version: 0.7.3
    sha: e5bfb394eeed242e909609f56089eecfe5fda225042e8b171791b9c95f5931e5
  - kind: registry
    name: rustls-native-certs
    version: 0.8.1
    sha: 7fcff2dd52b58a8d98a70243663a0d234c4e2b79235637849d15913394a247d3
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
    version: 1.12.0
    sha: 229a4a4c221013e7e1f1a043678c5cc39fe5171437c88fb47151a21e6f5b5c79
  - kind: registry
    name: rustls-platform-verifier
    version: 0.5.3
    sha: 19787cda76408ec5404443dc8b31795c87cd8fec49762dc75fa727740d34acc1
  - kind: registry
    name: rustls-platform-verifier-android
    version: 0.1.1
    sha: f87165f0995f63a9fbeea62b64d10b4d9d8e78ec6d7d51fb2125fda7bb36788f
  - kind: registry
    name: rustls-webpki
    version: 0.101.7
    sha: 8b6275d1ee7a1cd780b64aca7726599a1dbc893b1e64144529e55c3c2f745765
  - kind: registry
    name: rustls-webpki
    version: 0.102.8
    sha: 64ca1bc8749bd4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9
  - kind: registry
    name: rustls-webpki
    version: 0.103.4
    sha: 0a17884ae0c1b773f1ccd2bd4a8c72f16da897310a98b0e84bf349ad5ead92fc
  - kind: registry
    name: rustversion
    version: 1.0.21
    sha: 8a0d197bd2c9dc6e53b84da9556a69ba4cdfab8619eb41a8bd1cc2027a0f6b1d
  - kind: registry
    name: ryu
    version: 1.0.20
    sha: 28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f
  - kind: registry
    name: safe_arch
    version: 0.7.4
    sha: 96b02de82ddbe1b636e6170c21be622223aea188ef2e139be0a5b219ec215323
  - kind: registry
    name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - kind: registry
    name: scc
    version: 2.3.4
    sha: 22b2d775fb28f245817589471dd49c5edf64237f4a19d10ce9a92ff4651a27f4
  - kind: registry
    name: schannel
    version: 0.1.27
    sha: 1f29ebaa345f945cec9fbbc532eb307f0fdad8161f281b6369539c8d84876b3d
  - kind: registry
    name: schemars
    version: 0.9.0
    sha: 4cd191f9397d57d581cddd31014772520aa448f65ef991055d7f61582c65165f
  - kind: registry
    name: schemars
    version: 1.0.4
    sha: 82d20c4491bc164fa2f6c5d44565947a52ad80b9505d8e36f8d54c27c739fcd0
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
    version: 3.0.9
    sha: 62f5557d2bbddd5afd236ba7856b0e494f5acc7ce805bb0774cc5674b20a06b4
  - kind: registry
    name: sdp-types
    version: 0.1.8
    sha: 9bb6c636ace20de73fb9536017f9ef069b258308a6c341a4aaf3d2fd11afc570
  - kind: registry
    name: sec1
    version: 0.3.0
    sha: 3be24c1842290c45df0a7bf069e0c268a747ad05a192f2fd7dcfdbc1cba40928
  - kind: registry
    name: security-framework
    version: 2.11.1
    sha: 897b2245f0b511c87893af39b033e5ca9cce68824c4d7e7630b5a1d339658d02
  - kind: registry
    name: security-framework
    version: 3.2.0
    sha: 271720403f46ca04f7ba6f55d438f8bd878d6b8ca0a1046e8228c4145bcbb316
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
    version: 1.0.219
    sha: 5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6
  - kind: registry
    name: serde_bytes
    version: 0.11.17
    sha: 8437fd221bde2d4ca316d61b90e337e9e702b3820b87d63caa9ba6c02bd06d96
  - kind: registry
    name: serde_derive
    version: 1.0.219
    sha: 5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00
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
    version: 0.6.9
    sha: bf41e0cfaf7226dca15e8197172c295a782857fcb97fad1808a166870dee75a3
  - kind: registry
    name: serde_urlencoded
    version: 0.7.1
    sha: d3491c14715ca2294c4d6a88f15e84739788c1d030eed8c110436aafdaa2f3fd
  - kind: registry
    name: serde_with
    version: 3.14.0
    sha: f2c45cd61fefa9db6f254525d46e392b852e0e61d9a1fd36e5bd183450a556d5
  - kind: registry
    name: serde_with_macros
    version: 3.14.0
    sha: de90945e6565ce0d9a25098082ed4ee4002e047cb59892c318d66821e14bb30f
  - kind: registry
    name: serial_test
    version: 3.2.0
    sha: 1b258109f244e1d6891bf1053a55d63a5cd4f8f4c30cf9a1280989f80e7a1fa9
  - kind: registry
    name: serial_test_derive
    version: 3.2.0
    sha: 5d69265a08751de7844521fd15003ae0a888e035773ba05695c5c759a6f89eef
  - kind: registry
    name: sha1
    version: 0.10.6
    sha: e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba
  - kind: registry
    name: sha2
    version: 0.10.9
    sha: a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283
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
    version: 0.3.18
    sha: d881a16cf4426aa584979d30bd82cb33429027e42122b169753d6ef1085ed6e2
  - kind: registry
    name: signal-hook-registry
    version: 1.4.5
    sha: 9203b8055f63a2a00e2f593bb0510367fe707d7ff1e5c872de2f537b339e5410
  - kind: registry
    name: signature
    version: 1.6.4
    sha: 74233d3b3b2f6d4b006dc19dee745e73e2a6bfb6f93607cd3b02bd5b00797d7c
  - kind: registry
    name: signature
    version: 2.2.0
    sha: 77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de
  - kind: registry
    name: simd-adler32
    version: 0.3.7
    sha: d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe
  - kind: registry
    name: simd_helpers
    version: 0.1.0
    sha: 95890f873bec569a0362c235787f3aca6e1e887302ba4840839bcc6459c42da6
  - kind: registry
    name: siphasher
    version: 1.0.1
    sha: 56199f7ddabf13fe5074ce809e7d3f42b42ae711800501b5b16ea82ad029c39d
  - kind: registry
    name: skia-bindings
    version: 0.87.0
    sha: 704242769235d2ffe66a2a0a3002661262fc4af08d32807c362d7b0160ee703c
  - kind: registry
    name: skia-safe
    version: 0.87.0
    sha: 0f7d94f3e7537c71ad4cf132eb26e3be8c8a886ed3649c4525c089041fc312b2
  - kind: registry
    name: slab
    version: 0.4.10
    sha: 04dc19736151f35336d325007ac991178d504a119863a2fcb3758cdb5e52c50d
  - kind: registry
    name: smallvec
    version: 1.15.1
    sha: 67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03
  - kind: registry
    name: smawk
    version: 0.3.2
    sha: b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c
  - kind: registry
    name: socket2
    version: 0.5.10
    sha: e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678
  - kind: registry
    name: socket2
    version: 0.6.0
    sha: 233504af464074f9d066d7b5416c5f9b894a5862a6506e306f7b816cdd6f1807
  - kind: registry
    name: sodiumoxide
    version: 0.2.7
    sha: e26be3acb6c2d9a7aac28482586a7856436af4cfe7100031d219de2d2ecb0028
  - kind: registry
    name: spin
    version: 0.9.8
    sha: 6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67
  - kind: registry
    name: spinning_top
    version: 0.3.0
    sha: d96d2d1d716fb500937168cc09353ffdc7a012be8475ac7308e1bdf0e3923300
  - kind: registry
    name: spki
    version: 0.6.0
    sha: 67cf02bbac7a337dc36e4f5a693db6c21e7863f45070f7064577eb4367a3212b
  - kind: registry
    name: spki
    version: 0.7.3
    sha: d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d
  - kind: registry
    name: sprintf
    version: 0.4.2
    sha: 78222247fc55e10208ed1ba60f8296390bc67a489bc27a36231765d8d6f60ec5
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
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: subtle
    version: 2.6.1
    sha: 13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292
  - kind: registry
    name: symphonia
    version: 0.5.4
    sha: 815c942ae7ee74737bb00f965fa5b5a2ac2ce7b6c01c0cc169bbeaf7abd5f5a9
  - kind: registry
    name: symphonia-bundle-mp3
    version: 0.5.4
    sha: c01c2aae70f0f1fb096b6f0ff112a930b1fb3626178fba3ae68b09dce71706d4
  - kind: registry
    name: symphonia-codec-vorbis
    version: 0.5.4
    sha: 5a98765fb46a0a6732b007f7e2870c2129b6f78d87db7987e6533c8f164a9f30
  - kind: registry
    name: symphonia-core
    version: 0.5.4
    sha: 798306779e3dc7d5231bd5691f5a813496dc79d3f56bf82e25789f2094e022c3
  - kind: registry
    name: symphonia-format-ogg
    version: 0.5.4
    sha: ada3505789516bcf00fc1157c67729eded428b455c27ca370e41f4d785bfa931
  - kind: registry
    name: symphonia-metadata
    version: 0.5.4
    sha: bc622b9841a10089c5b18e99eb904f4341615d5aa55bbf4eedde1be721a4023c
  - kind: registry
    name: symphonia-utils-xiph
    version: 0.5.4
    sha: 484472580fa49991afda5f6550ece662237b00c6f562c7d9638d1b086ed010fe
  - kind: registry
    name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - kind: registry
    name: syn
    version: 2.0.104
    sha: 17b6f705963418cdb9927482fa304bc562ece2fdd4f616084c50b7023b435a40
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
    version: 0.13.2
    sha: 728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2
  - kind: registry
    name: sysinfo
    version: 0.31.4
    sha: 355dbe4f8799b304b05e1b0f05fc59b2a18d36645cf169607da45bde2f69a1be
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
    version: 7.0.5
    sha: e4be53aa0cba896d2dc615bd42bbc130acdcffa239e0a2d965ea5b3b2a86ffdb
  - kind: registry
    name: tar
    version: 0.4.44
    sha: 1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a
  - kind: registry
    name: target-lexicon
    version: 0.13.2
    sha: e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a
  - kind: registry
    name: tempfile
    version: 3.20.0
    sha: e8a64e3985349f2441a1a9ef0b853f869006c3855f2cda6862a94d26ebb9d6a1
  - kind: registry
    name: test-log
    version: 0.2.18
    sha: 1e33b98a582ea0be1168eba097538ee8dd4bbe0f2b01b22ac92ea30054e5be7b
  - kind: registry
    name: test-log-macros
    version: 0.2.18
    sha: 451b374529930d7601b1eef8d32bc79ae870b6079b069401709c2a8bf9e75f36
  - kind: registry
    name: test-with
    version: 0.15.3
    sha: e3c82f52ec88a4992bd0c46b8ef271c070c52689bf34f7effae7a26708cbf13d
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
    version: 1.1.9
    sha: f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185
  - kind: registry
    name: time
    version: 0.3.41
    sha: 8a7619e19bc266e0f9c5e6686659d394bc57973859340060a69221e57dbc0c40
  - kind: registry
    name: time-core
    version: 0.1.4
    sha: c9e9a38711f559d9e3ce1cdb06dd7c5b8ea546bc90052da6d06bb76da74bb07c
  - kind: registry
    name: time-macros
    version: 0.2.22
    sha: 3526739392ec93fd8b359c8e98514cb3e8e021beb4e5f597b00a0221f8ed8a49
  - kind: registry
    name: tinystr
    version: 0.8.1
    sha: 5d4f6d1145dcb577acf783d4e601bc1d76a13337bb54e6233add580b07344c8b
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
    version: 1.46.1
    sha: 0cc3a2344dafbe23a245241fe8b09735b521110d30fcefbbd5feb1797ca35d17
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
    version: 0.25.0
    sha: 775e0c0f0adb3a2f22a00c4745d728b479985fc15ee7ca6a2608388c5569860f
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
    name: tokio-tungstenite
    version: 0.24.0
    sha: edc5f74e248dc973e0dbb7b74c7e0d6fcc301c694ff50049504004ef4d0cdcd9
  - kind: registry
    name: tokio-util
    version: 0.7.15
    sha: 66a539a9ad6d5d281510d5bd368c973d636c02dbf8a67300bfb6b950696ad7df
  - kind: registry
    name: toml
    version: 0.8.23
    sha: dc1beb996b9d83529a9e75c17a1686767d148d70663143c7854d8b4a09ced362
  - kind: registry
    name: toml_datetime
    version: 0.6.11
    sha: 22cddaf88f4fbc13c51aebbf5f8eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c
  - kind: registry
    name: toml_datetime
    version: 0.7.0
    sha: bade1c3e902f58d73d3f294cd7f20391c1cb2fbcb643b73566bc773971df91e3
  - kind: registry
    name: toml_edit
    version: 0.22.27
    sha: 41fe8c660ae4257887cf66394862d21dbca4a6ddd26f04a3560410406a2f819a
  - kind: registry
    name: toml_edit
    version: 0.23.1
    sha: b1f23a5f4511b296579b6c83e437fe85fa7ece22e3ec44e45ddb975bcf57c3dd
  - kind: registry
    name: toml_parser
    version: 1.0.1
    sha: 97200572db069e74c512a14117b296ba0a80a30123fbbb5aa1f4a348f639ca30
  - kind: registry
    name: toml_write
    version: 0.1.2
    sha: 5d99f8c9a7727884afe522e9bd5edbfc91a3312b36a77b5fb8926e4c31a41801
  - kind: registry
    name: tower
    version: 0.5.2
    sha: d039ad9159c98b70ecfd540b2573b97f7f52c3e8d9f8ad57a24b916a536975f9
  - kind: registry
    name: tower-http
    version: 0.6.6
    sha: adc82fd73de2a9722ac5da747f12383d2bfdb93591ee6c58486e0097890f05f2
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
    version: 0.1.30
    sha: 81383ab64e72a7a8b8e13130c49e3dab29def6d0c7d76a03087b3cf71c5c6903
  - kind: registry
    name: tracing-core
    version: 0.1.34
    sha: b9d12581f227e93f094d3af2ae690a574abb8a2b9b7a96e7cfe9647b2b617678
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
    version: 0.24.0
    sha: 18e5b8366ee7a95b16d32197d0b2604b43a0be89dc5fac9f8e96ccafbaedda8a
  - kind: registry
    name: tungstenite
    version: 0.27.0
    sha: eadc29d668c91fcc564941132e17b28a7ceb2f3ebf0b9dae3e03fd7a6748eb0d
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
    version: 0.2.1
    sha: 4a1a07cc7db3810833284e8d372ccdc6da29741639ecc70c9ec107df0fa6154c
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
    name: utf8_iter
    version: 1.0.4
    sha: b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be
  - kind: registry
    name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - kind: registry
    name: uuid
    version: 1.17.0
    sha: 3cf4199d1e5d15ddd86a694e4d0dffa9c323ce759fea589f00fef9d81cc1931d
  - kind: registry
    name: v_frame
    version: 0.3.9
    sha: 666b7727c8875d6ab5db9533418d7c764233ac9c0cff1d469aec8fa127597be2
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
    version: 9.0.6
    sha: 6b2bf58be11fc9414104c6d3a2e464163db5ef74b12296bda593cac37b6e4777
  - kind: registry
    name: vergen-gitcl
    version: 1.0.8
    sha: b9dfc1de6eb2e08a4ddf152f1b179529638bedc0ea95e6d667c014506377aefe
  - kind: registry
    name: vergen-lib
    version: 0.1.6
    sha: 9b07e6010c0f3e59fcb164e0163834597da68d1f864e2b8ca49f74de01e9c166
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
    name: vvdec
    version: 0.6.11
    sha: 689743f6dc5c608197123319f088d73d3048a9e5d93682b95b8a347243975cb0
  - kind: registry
    name: vvdec-sys
    version: 0.7.0
    sha: 18df9e7fd48eb13204c547ccd570774b701981878489779c9a427ee97579f24d
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
    version: 0.11.1+wasi-snapshot-preview1
    sha: ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b
  - kind: registry
    name: wasi
    version: 0.14.2+wasi-0.2.4
    sha: 9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3
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
    name: web-transport-proto
    version: 0.2.6
    sha: 1814af4572856a29a2d29a56520e86fda994423043b70139ce98e5a32e0d91be
  - kind: registry
    name: web-transport-quinn
    version: 0.7.2
    sha: 5f9226d1daf46670c9bf83422bf8ff6020c7af549cf7f8159e3dbbb2aed97f3a
  - kind: registry
    name: webm-iterable
    version: 0.6.4
    sha: cd9fbf173b4b38f2f8bbb0082a0d4cb21f263a70811f5fccb1663c421c66d9f9
  - kind: registry
    name: webpki
    version: 0.22.4
    sha: ed63aea5ce73d0ff405984102c42de94fc55a6b75765d621c65262469b3c9b53
  - kind: registry
    name: webpki-root-certs
    version: 0.26.11
    sha: 75c7f0ef91146ebfb530314f5f1d24528d7f0767efbfd31dce919275413e393e
  - kind: registry
    name: webpki-root-certs
    version: 1.0.1
    sha: 86138b15b2b7d561bc4469e77027b8dd005a43dc502e9031d1f5afc8ce1f280e
  - kind: registry
    name: webpki-roots
    version: 0.25.4
    sha: 5f20c57d8d7db6d3b86154206ae5d8fba62dd39573114de97c2cb0578251f8e1
  - kind: registry
    name: weezl
    version: 0.1.10
    sha: a751b3277700db47d3e574514de2eced5e54dc8a5436a3bf7a0b248b2cee16f3
  - kind: registry
    name: which
    version: 4.4.2
    sha: 87ba24419a2078cd2b0f2ede2691b6c66d8e47836da3b6db8265ebad47afbfc7
  - kind: registry
    name: wide
    version: 0.7.33
    sha: 0ce5da8ecb62bcd8ec8b7ea19f69a51275e91299be594ea5cc6ef7819e16cd03
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
    name: windows
    version: 0.57.0
    sha: 12342cb4d8e3b046f3d80effd474a7a02447231330ef77d71daa6fbc40681143
  - kind: registry
    name: windows-core
    version: 0.57.0
    sha: d2ed2439a290666cd67ecce2b0ffaad89c2a56b976b736e6ece670297897832d
  - kind: registry
    name: windows-core
    version: 0.61.2
    sha: c0fdd3ddb90610c7638aa2b3a3ab2904fb9e5cdbecc643ddb3647212781c4ae3
  - kind: registry
    name: windows-implement
    version: 0.57.0
    sha: 9107ddc059d5b6fbfbffdfa7a7fe3e22a226def0b2608f72e9d552763d3e1ad7
  - kind: registry
    name: windows-implement
    version: 0.60.0
    sha: a47fddd13af08290e67f4acabf4b459f647552718f683a7b415d290ac744a836
  - kind: registry
    name: windows-interface
    version: 0.57.0
    sha: 29bee4b38ea3cde66011baa44dba677c432a78593e202392d1e9070cf2a7fca7
  - kind: registry
    name: windows-interface
    version: 0.59.1
    sha: bd9211b69f8dcdfa817bfd14bf1c97c9188afa36f4750130fcdf3f400eca9fa8
  - kind: registry
    name: windows-link
    version: 0.1.3
    sha: 5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a
  - kind: registry
    name: windows-registry
    version: 0.5.3
    sha: 5b8a9ed28765efc97bbc954883f4e6796c33a06546ebafacbabee9696967499e
  - kind: registry
    name: windows-result
    version: 0.1.2
    sha: 5e383302e8ec8515204254685643de10811af0ed97ea37210dc26fb0032647f8
  - kind: registry
    name: windows-result
    version: 0.3.4
    sha: 56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6
  - kind: registry
    name: windows-strings
    version: 0.4.2
    sha: 56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57
  - kind: registry
    name: windows-sys
    version: 0.45.0
    sha: 75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0
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
    name: windows-sys
    version: 0.60.2
    sha: f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb
  - kind: registry
    name: windows-targets
    version: 0.42.2
    sha: 8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071
  - kind: registry
    name: windows-targets
    version: 0.48.5
    sha: 9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c
  - kind: registry
    name: windows-targets
    version: 0.52.6
    sha: 9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973
  - kind: registry
    name: windows-targets
    version: 0.53.2
    sha: c66f69fcc9ce11da9966ddb31a40968cad001c5bedeb5c2b82ede4253ab48aef
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.42.2
    sha: 597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.48.5
    sha: 2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.52.6
    sha: 32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.53.0
    sha: 86b8d5f90ddd19cb4a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.42.2
    sha: e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.48.5
    sha: dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.52.6
    sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.53.0
    sha: c7651a1f62a11b8cbd5e0d42526e55f2c99886c77e007179efff86c2b137e66c
  - kind: registry
    name: windows_i686_gnu
    version: 0.42.2
    sha: c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f
  - kind: registry
    name: windows_i686_gnu
    version: 0.48.5
    sha: a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e
  - kind: registry
    name: windows_i686_gnu
    version: 0.52.6
    sha: 8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b
  - kind: registry
    name: windows_i686_gnu
    version: 0.53.0
    sha: c1dc67659d35f387f5f6c479dc4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.52.6
    sha: 0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.53.0
    sha: 9ce6ccbdedbf6d6354471319e781c0dfef054c81fbc7cf83f338a4296c0cae11
  - kind: registry
    name: windows_i686_msvc
    version: 0.42.2
    sha: 44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060
  - kind: registry
    name: windows_i686_msvc
    version: 0.48.5
    sha: 8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406
  - kind: registry
    name: windows_i686_msvc
    version: 0.52.6
    sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
  - kind: registry
    name: windows_i686_msvc
    version: 0.53.0
    sha: 581fee95406bb13382d2f65cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.42.2
    sha: 8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.48.5
    sha: 53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.52.6
    sha: 147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.53.0
    sha: 2e55b5ac9ea33f2fc1716d1742db15574fd6fc8dadc51caab1c16a3d3b4190ba
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.42.2
    sha: 26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.48.5
    sha: 0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.52.6
    sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.53.0
    sha: 0a6e035dd0599267ce1ee132e51c27dd29437f63325753051e71dd9e42406c57
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.42.2
    sha: 9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.48.5
    sha: ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.52.6
    sha: 589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.53.0
    sha: 271414315aff87387382ec3d271b52d7ae78726f5d44ac98b4f4030c91880486
  - kind: registry
    name: winnow
    version: 0.7.12
    sha: f3edebf492c8125044983378ecb5766203ad3b4c2f7a922bd7dd207f6d443e95
  - kind: registry
    name: winreg
    version: 0.50.0
    sha: 524e57b2c537c0f9b1e69f1965311ec12182b4122e45035b1508cd24d2adadb1
  - kind: registry
    name: wit-bindgen-rt
    version: 0.39.0
    sha: 6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1
  - kind: registry
    name: writeable
    version: 0.6.1
    sha: ea2f10b9bb0928dfb1b42b65e1f9e36f7f54dbdf08457afefb38afcdec4fa2bb
  - kind: registry
    name: xattr
    version: 1.5.1
    sha: af3a19837351dc82ba89f8a125e22a3c475f05aba604acc023d62b2739ae2909
  - kind: registry
    name: xml-rs
    version: 0.8.27
    sha: 6fd8403733700263c6eb89f192880191f1b83e332f7a20371ddcf421c4a337c7
  - kind: registry
    name: xmlparser
    version: 0.13.6
    sha: 66fee0b777b0f5ac1c69bb06d361268faafa61cd4682ae064a171c16c433e9e4
  - kind: registry
    name: xmltree
    version: 0.11.0
    sha: b619f8c85654798007fb10afa5125590b43b088c225a25fc2fec100a9fad0fc6
  - kind: registry
    name: y4m
    version: 0.8.0
    sha: 7a5a4b21e1a62b67a2970e6831bc091d7b87e119e7f9791aef9702e3bef04448
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
    version: 0.8.0
    sha: 5f41bb01b8226ef4bfd589436a297c53d118f65921786300e427be8d487695cc
  - kind: registry
    name: yoke-derive
    version: 0.8.0
    sha: 38da3c9736e16c5d3c8c597a9aaa5d1fa565d0532ae05e27c24aa62fb32c0ab6
  - kind: registry
    name: zerocopy
    version: 0.7.35
    sha: 1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0
  - kind: registry
    name: zerocopy
    version: 0.8.26
    sha: 1039dd0d3c310cf05de012d8a39ff557cb0d23087fd44cad61df08fc31907a2f
  - kind: registry
    name: zerocopy-derive
    version: 0.7.35
    sha: fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e
  - kind: registry
    name: zerocopy-derive
    version: 0.8.26
    sha: 9ecf5b4cc5364572d7f4c329661bcc82724222973f2cab6f050a4e5c22f75181
  - kind: registry
    name: zerofrom
    version: 0.1.6
    sha: 50cc42e0333e05660c3587f3bf9d0478688e15d870fab3346451ce7f8c9fbea5
  - kind: registry
    name: zerofrom-derive
    version: 0.1.6
    sha: d71e5d6e06ab090c67b5e44993ec16b72dcbaabc526db883a360057678b48502
  - kind: registry
    name: zeroize
    version: 1.8.1
    sha: ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde
  - kind: registry
    name: zerotrie
    version: 0.2.2
    sha: 36f0bbd478583f79edad978b407914f61b2972f5af6fa089686016be8f9af595
  - kind: registry
    name: zerovec
    version: 0.11.2
    sha: 4a05eb080e015ba39cc9e23bbe5e7fb04d5fb040350f99f34e338d5fdd294428
  - kind: registry
    name: zerovec-derive
    version: 0.11.1
    sha: 5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f
- kind: patch
  # adapted from https://build.opensuse.org/projects/openSUSE:Factory:RISCV/packages/gstreamer-plugins-rs/files/vendor.patch?expand=1
  path: 
    patches/gstreamer-plugins-rs/gst-plugins-rs-0.13.0-libsodium-sys-riscv64.patch
