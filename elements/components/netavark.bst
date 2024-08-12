kind: make

build-depends:
- components/git-minimal.bst
- components/go-md2man.bst
- components/rust.bst
- components/protobuf.bst

depends:
- bootstrap-import.bst

runtime-depends:
- components/aardvark-dns.bst

config:
  build-commands:
    (<):
    - |
      %{make} docs

sources:
- kind: git_repo
  url: github:containers/netavark.git
  track: v*
  ref: v1.12.1-0-ga4e1359ee7fa036db2712f495d4afc95c63a32d8
- kind: cargo2
  ref:
  - name: addr2line
    version: 0.22.0
    sha: 6e4503c46a5c0c7844e948c9a4d6acd9f50cccb4de1c48eb9e291ea17470c678
  - name: adler
    version: 1.0.2
    sha: f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe
  - name: aho-corasick
    version: 1.1.3
    sha: 8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916
  - name: android-tzdata
    version: 0.1.1
    sha: e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0
  - name: android_system_properties
    version: 0.1.5
    sha: 819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311
  - name: anstream
    version: 0.6.15
    sha: 64e15c1ab1f89faffbf04a634d5e1962e9074f2741eef6d97f3c4e322426d526
  - name: anstyle
    version: 1.0.8
    sha: 1bec1de6f59aedf83baf9ff929c98f2ad654b97c9510f4e70cf6f661d49fd5b1
  - name: anstyle-parse
    version: 0.2.5
    sha: eb47de1e80c2b463c735db5b217a0ddc39d612e7ac9e2e96a5aed1f57616c1cb
  - name: anstyle-query
    version: 1.1.1
    sha: 6d36fc52c7f6c869915e99412912f22093507da8d9e942ceaf66fe4b7c14422a
  - name: anstyle-wincon
    version: 3.0.4
    sha: 5bf74e1b6e971609db8ca7a9ce79fd5768ab6ae46441c572e46cf596f59e57f8
  - name: anyhow
    version: 1.0.86
    sha: b3d1d046238990b9cf5bcde22a3fb3584ee5cf65fb2765f454ed428c7a0063da
  - name: arrayvec
    version: 0.7.4
    sha: 96d30a06541fbafbc7f82ed10c06164cfbd2c401138f6addd8404629c4b16711
  - name: async-broadcast
    version: 0.5.1
    sha: 7c48ccdbf6ca6b121e0f586cbc0e73ae440e56c67c30fa0873b4e110d9c26d2b
  - name: async-channel
    version: 2.3.1
    sha: 89b47800b0be77592da0afd425cc03468052844aff33b84e33cc696f64e77b6a
  - name: async-executor
    version: 1.13.0
    sha: d7ebdfa2ebdab6b1760375fa7d6f382b9f486eac35fc994625a00e89280bdbb7
  - name: async-fs
    version: 1.6.0
    sha: 279cf904654eeebfa37ac9bb1598880884924aab82e290aa65c9e77a0e142e06
  - name: async-io
    version: 1.13.0
    sha: 0fc5b45d93ef0529756f812ca52e44c221b35341892d3dcc34132ac02f3dd2af
  - name: async-io
    version: 2.3.3
    sha: 0d6baa8f0178795da0e71bc42c9e5d13261aac7ee549853162e66a241ba17964
  - name: async-lock
    version: 2.8.0
    sha: 287272293e9d8c41773cec55e365490fe034813a2f172f502d6ddcf75b2f582b
  - name: async-lock
    version: 3.4.0
    sha: ff6e472cdea888a4bd64f342f09b3f50e1886d32afe8df3d663c01140b811b18
  - name: async-process
    version: 1.8.1
    sha: ea6438ba0a08d81529c69b36700fa2f95837bfe3e776ab39cde9c14d9149da88
  - name: async-recursion
    version: 1.1.1
    sha: 3b43422f69d8ff38f95f1b2bb76517c91589a924d1559a0e935d7c8ce0274c11
  - name: async-signal
    version: 0.2.9
    sha: dfb3634b73397aa844481f814fad23bbf07fdb0eabec10f2eb95e58944b1ec32
  - name: async-stream
    version: 0.3.5
    sha: cd56dd203fef61ac097dd65721a419ddccb106b2d2b70ba60a6b529f03961a51
  - name: async-stream-impl
    version: 0.3.5
    sha: 16e62a023e7c117e27523144c5d2459f4397fcc3cab0085af8e2224f643a0193
  - name: async-task
    version: 4.7.1
    sha: 8b75356056920673b02621b35afd0f7dda9306d03c79a30f5c56c44cf256e3de
  - name: async-trait
    version: 0.1.81
    sha: 6e0c28dcc82d7c8ead5cb13beb15405b57b8546e93215673ff8ca0349a028107
  - name: atomic-waker
    version: 1.1.2
    sha: 1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0
  - name: autocfg
    version: 1.3.0
    sha: 0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0
  - name: axum
    version: 0.6.20
    sha: 3b829e4e32b91e643de6eafe82b1d90675f5874230191a4ffbc1b336dec4d6bf
  - name: axum-core
    version: 0.3.4
    sha: 759fa577a247914fd3f7f76d62972792636412fbfd634cd452f6a385a74d2d2c
  - name: backtrace
    version: 0.3.73
    sha: 5cc23269a4f8976d0a4d2e7109211a419fe30e8d88d677cd60b6bc79c5732e0a
  - name: base64
    version: 0.21.7
    sha: 9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: bitflags
    version: 2.6.0
    sha: b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de
  - name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - name: blocking
    version: 1.6.1
    sha: 703f41c54fc768e63e091340b424302bb1c29ef4aa0c7f10fe849dfb114d29ea
  - name: bumpalo
    version: 3.16.0
    sha: 79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c
  - name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - name: bytes
    version: 1.7.0
    sha: fca2be1d5c43812bae364ee3f30b3afcb7877cf59f4aeb94c66f313a41d2fac9
  - name: cc
    version: 1.1.7
    sha: 26a5c3fd7bfa1ce3897a3a3501d362b2d87b7f2583ebcb4a949ec25911025cbc
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: cfg_aliases
    version: 0.2.1
    sha: 613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724
  - name: chrono
    version: 0.4.38
    sha: a21f936df1771bf62b77f047b726c4625ff2e8aa607c01ec06e5a05bd8463401
  - name: clap
    version: 4.4.18
    sha: 1e578d6ec4194633722ccf9544794b71b1385c3c027efe0c55db226fc880865c
  - name: clap_builder
    version: 4.4.18
    sha: 4df4df40ec50c46000231c914968278b1eb05098cf8f1b3a518a95030e71d1c7
  - name: clap_derive
    version: 4.4.7
    sha: cf9804afaaf59a91e75b022a30fb7229a7901f60c755489cc61c9b423b836442
  - name: clap_lex
    version: 0.6.0
    sha: 702fc72eb24e5a1e48ce58027a675bc24edd52096d5397d4aea7c6dd9eca0bd1
  - name: colorchoice
    version: 1.0.2
    sha: d3fd119d74b830634cea2a0f58bbd0d54540518a14397557951e79340abc28c0
  - name: concurrent-queue
    version: 2.5.0
    sha: 4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973
  - name: core-foundation-sys
    version: 0.8.6
    sha: 06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f
  - name: cpufeatures
    version: 0.2.12
    sha: 53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504
  - name: crossbeam-utils
    version: 0.8.20
    sha: 22ec99545bb0ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80
  - name: crypto-common
    version: 0.1.6
    sha: 1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3
  - name: data-encoding
    version: 2.6.0
    sha: e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2
  - name: derivative
    version: 2.2.0
    sha: fcc3dd5e9e9c0b295d6e1e4d811fb6f157d5ffd784b8d202fc62eac8035a770b
  - name: dhcproto
    version: 0.9.0
    sha: dcee045385d5f7819022821f41209b9945d17550760b0b2349aaef4ecfa14bc3
  - name: dhcproto-macros
    version: 0.1.0
    sha: a7993efb860416547839c115490d4951c6d0f8ec04a3594d9dd99d50ed7ec170
  - name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - name: either
    version: 1.13.0
    sha: 60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0
  - name: enum-as-inner
    version: 0.5.1
    sha: c9720bba047d567ffc8a3cba48bf19126600e249ab7f128e9233e6376976a116
  - name: enum-as-inner
    version: 0.6.0
    sha: 5ffccbb6966c05b32ef8fbac435df276c4ae4d3dc55a8cd0eb9745e6c12f546a
  - name: enumflags2
    version: 0.7.10
    sha: d232db7f5956f3f14313dc2f87985c58bd2c695ce124c8cdd984e08e15ac133d
  - name: enumflags2_derive
    version: 0.7.10
    sha: de0d48a183585823424a4ce1aa132d174a6a81bd540895822eb4c8373a8e49e8
  - name: env_filter
    version: 0.1.2
    sha: 4f2c92ceda6ceec50f43169f9ee8424fe2db276791afde7b2cd8bc084cb376ab
  - name: env_logger
    version: 0.11.5
    sha: e13fa619b91fb2381732789fc5de83b45675e882f66623b7d8cb4f643017018d
  - name: equivalent
    version: 1.0.1
    sha: 5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5
  - name: errno
    version: 0.3.9
    sha: 534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba
  - name: etherparse
    version: 0.13.0
    sha: 827292ea592108849932ad8e30218f8b1f21c0dfd0696698a18b5d0aed62d990
  - name: ethtool
    version: 0.2.5
    sha: 1d8e04a35517dc77748dc04bf38152799382d3d8f85cb07cb579bb7f4d8d3b5a
  - name: event-listener
    version: 2.5.3
    sha: 0206175f82b8d6bf6652ff7d71a1e27fd2e4efde587fd368662814d6ec1d9ce0
  - name: event-listener
    version: 3.1.0
    sha: d93877bcde0eb80ca09131a08d23f0a5c18a620b01db137dba666d18cd9b30c2
  - name: event-listener
    version: 5.3.1
    sha: 6032be9bd27023a771701cc49f9f053c751055f71efb2e0ae5c15809093675ba
  - name: event-listener-strategy
    version: 0.5.2
    sha: 0f214dc438f977e6d4e3500aaa277f5ad94ca83fbbd9b1a15713ce2344ccc5a1
  - name: fastrand
    version: 1.9.0
    sha: e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be
  - name: fastrand
    version: 2.1.0
    sha: 9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a
  - name: fixedbitset
    version: 0.4.2
    sha: 0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80
  - name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
  - name: form_urlencoded
    version: 1.2.1
    sha: e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456
  - name: fs2
    version: 0.4.3
    sha: 9564fc758e15025b46aa6643b1b77d047d1a56a1aea6e01002ac0c7026876213
  - name: futures
    version: 0.3.30
    sha: 645c6916888f6cb6350d2550b80fb63e734897a8498abe35cfb732b6487804b0
  - name: futures-channel
    version: 0.3.30
    sha: eac8f7d7865dcb88bd4373ab671c8cf4508703796caa2b1985a9ca867b3fcb78
  - name: futures-core
    version: 0.3.30
    sha: dfc6580bb841c5a68e9ef15c77ccc837b40a7504914d52e47b8b0e9bbda25a1d
  - name: futures-executor
    version: 0.3.30
    sha: a576fc72ae164fca6b9db127eaa9a9dda0d61316034f33a0a0d4eda41f02b01d
  - name: futures-io
    version: 0.3.30
    sha: a44623e20b9681a318efdd71c299b6b222ed6f231972bfe2f224ebad6311f0c1
  - name: futures-lite
    version: 1.13.0
    sha: 49a9d51ce47660b1e808d3c990b4709f2f415d928835a17dfd16991515c46bce
  - name: futures-lite
    version: 2.3.0
    sha: 52527eb5074e35e9339c6b4e8d12600c7128b68fb25dcb9fa9dec18f7c25f3a5
  - name: futures-macro
    version: 0.3.30
    sha: 87750cf4b7a4c0625b1529e4c543c2182106e4dedc60a2a6455e00d212c489ac
  - name: futures-sink
    version: 0.3.30
    sha: 9fb8e00e87438d937621c1c6269e53f536c14d3fbd6a042bb24879e57d474fb5
  - name: futures-task
    version: 0.3.30
    sha: 38d84fa142264698cdce1a9f9172cf383a0c82de1bddcf3092901442c4097004
  - name: futures-util
    version: 0.3.30
    sha: 3d6401deb83407ab3da39eba7e33987a73c3df0c82b4bb5813ee871c19c41d48
  - name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - name: genetlink
    version: 0.2.5
    sha: 1f890076c1faa1298bf747ce3694a8d9e0d2cc4b06fe293f12dd95742bfd079f
  - name: getrandom
    version: 0.2.15
    sha: c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7
  - name: gimli
    version: 0.29.0
    sha: 40ecd4077b5ae9fd2e9e169b102c6c330d0605168eb0e8bf79952b256dbefffd
  - name: h2
    version: 0.3.26
    sha: 81fe527a889e1532da5c525686d96d4c2e74cdd345badf8dfef9f6b39dd5f5e8
  - name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - name: hashbrown
    version: 0.14.5
    sha: e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1
  - name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - name: hermit-abi
    version: 0.3.9
    sha: d231dfb89cfffdbc30e7fc41579ed6066ad03abda9e567ccafae602b97ec5024
  - name: hermit-abi
    version: 0.4.0
    sha: fbf6a919d6cf397374f7dfeeea91d974c7c0a7221d0d0f4f20d859d329e53fcc
  - name: hex
    version: 0.4.3
    sha: 7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70
  - name: http
    version: 0.2.12
    sha: 601cbb57e577e2f5ef5be8e7b83f0f63994f25aa94d673e54a92d5c516d101f1
  - name: http-body
    version: 0.4.6
    sha: 7ceab25649e9960c0311ea418d17bee82c0dcec1bd053b5f9a66e265a693bed2
  - name: httparse
    version: 1.9.4
    sha: 0fcc0b4a115bf80b728eb8ea024ad5bd707b615bfed49e0665b6e0f86fd082d9
  - name: httpdate
    version: 1.0.3
    sha: df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9
  - name: humantime
    version: 2.1.0
    sha: 9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4
  - name: hyper
    version: 0.14.30
    sha: a152ddd61dfaec7273fe8419ab357f33aee0d914c5f4efbf0d96fa749eea5ec9
  - name: hyper-timeout
    version: 0.4.1
    sha: bbb958482e8c7be4bc3cf272a766a2b0bf1a6755e7a6ae777f017a31d11b13b1
  - name: iana-time-zone
    version: 0.1.60
    sha: e7ffbb5a1b541ea2561f8c41c087286cc091e21e556a4f09a8f6cbf17b69b141
  - name: iana-time-zone-haiku
    version: 0.1.2
    sha: f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f
  - name: idna
    version: 0.2.3
    sha: 418a0a6fab821475f634efe3ccc45c013f742efe03d853e8d3355d5cb850ecf8
  - name: idna
    version: 0.5.0
    sha: 634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6
  - name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - name: indexmap
    version: 2.2.6
    sha: 168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26
  - name: instant
    version: 0.1.13
    sha: e0242819d153cba4b4b05a5a8f2a7e9bbf97b6055b2a002b395c96b5ff3c0222
  - name: io-lifetimes
    version: 1.0.11
    sha: eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2
  - name: ipnet
    version: 2.9.0
    sha: 8f518f335dce6725a761382244631d86cf0ccb2863413590b31338feb467f9c3
  - name: iptables
    version: 0.5.2
    sha: 43b627935a2f5d654613bea2bcd677cc760b03ecf224ced0f1970c0d174813b9
  - name: is_terminal_polyfill
    version: 1.70.1
    sha: 7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf
  - name: itertools
    version: 0.12.1
    sha: ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569
  - name: itoa
    version: 1.0.11
    sha: 49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b
  - name: js-sys
    version: 0.3.69
    sha: 29c15563dc2726973df627357ce0c9ddddbea194836909d655df6a75d2cf296d
  - name: lazy_static
    version: 1.5.0
    sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
  - name: libc
    version: 0.2.155
    sha: 97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c
  - name: linux-raw-sys
    version: 0.3.8
    sha: ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519
  - name: linux-raw-sys
    version: 0.4.14
    sha: 78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89
  - name: log
    version: 0.4.22
    sha: a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24
  - name: matches
    version: 0.1.10
    sha: 2532096657941c2fea9c289d370a250971c689d4f143798ff67113ec042024a5
  - name: matchit
    version: 0.7.3
    sha: 0e7465ac9959cc2b1404e8e2367b43684a6d13790fe23056cc8c6c5a6b7bcb94
  - name: memchr
    version: 2.7.4
    sha: 78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3
  - name: memoffset
    version: 0.7.1
    sha: 5de893c32cde5f383baa4c04c5d6dbdd735cfd4a794b0debdb2bb1b421da5ff4
  - name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - name: mime
    version: 0.3.17
    sha: 6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a
  - name: miniz_oxide
    version: 0.7.4
    sha: b8a240ddb74feaf34a79a7add65a741f3167852fba007066dcac1ca548d89c08
  - name: mio
    version: 1.0.1
    sha: 4569e456d394deccd22ce1c1913e6ea0e54519f577285001215d33557431afe4
  - name: mozim
    version: 0.2.4
    sha: 60e650710a77d000a05361154218ae4a30bcb8cb7eb453b2e46666fe1e2b0cf8
  - name: mptcp-pm
    version: 0.1.3
    sha: 3eafa8fc63dce407b75e336f9a22f18cf5510a3a5c3a5d83262688eb5cca42d5
  - name: multimap
    version: 0.10.0
    sha: defc4c55412d89136f966bbb339008b474350e5e6e78d2714439c386b3137a03
  - name: netlink-packet-core
    version: 0.7.0
    sha: 72724faf704479d67b388da142b186f916188505e7e0b26719019c525882eda4
  - name: netlink-packet-generic
    version: 0.3.3
    sha: 1cd7eb8ad331c84c6b8cb7f685b448133e5ad82e1ffd5acafac374af4a5a308b
  - name: netlink-packet-route
    version: 0.19.0
    sha: 74c171cd77b4ee8c7708da746ce392440cb7bcf618d122ec9ecc607b12938bf4
  - name: netlink-packet-route
    version: 0.20.1
    sha: 55e5bda7ca0f9ac5e75b5debac3b75e29a8ac8e2171106a2c3bb466389a8dd83
  - name: netlink-packet-utils
    version: 0.5.2
    sha: 0ede8a08c71ad5a95cdd0e4e52facd37190977039a4704eb82a283f713747d34
  - name: netlink-proto
    version: 0.11.3
    sha: 86b33524dc0968bfad349684447bfce6db937a9ac3332a1fe60c0c5a5ce63f21
  - name: netlink-sys
    version: 0.8.6
    sha: 416060d346fbaf1f23f9512963e3e878f1a78e707cb699ba9215761754244307
  - name: nftables
    version: 0.4.1
    sha: 3b5081f5cae4d24af558828494371be6672d02a693e9b4cbca4a0cbae5443e6f
  - name: nispor
    version: 1.2.19
    sha: 9cd23dbe46d34178505027dc6b39446d3ce4e726fbeb90f397f1caa1f3bcdd4e
  - name: nix
    version: 0.26.4
    sha: 598beaf3cc6fdd9a5dfb1630c2800c7acd31df7aaf0f565796fba2b53ca1af1b
  - name: nix
    version: 0.27.1
    sha: 2eb04e9c688eff1c89d72b407f168cf79bb9e867a9d3323ed6c01519eb9cc053
  - name: nix
    version: 0.29.0
    sha: 71e2746dc3a24dd78b3cfcb7be93368c6de9963d30f43a6a73998a9cf4b17b46
  - name: num-traits
    version: 0.2.19
    sha: 071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841
  - name: object
    version: 0.36.2
    sha: 3f203fa8daa7bb185f760ae12bd8e097f63d17041dcdcaf675ac54cdf863170e
  - name: once_cell
    version: 1.19.0
    sha: 3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92
  - name: ordered-float
    version: 2.10.1
    sha: 68f19d67e5a2795c94e73e0bb1cc1a7edeb2e28efd39e2e1c9b7a40c1108b11c
  - name: ordered-stream
    version: 0.2.0
    sha: 9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50
  - name: parking
    version: 2.2.0
    sha: bb813b8af86854136c6922af0598d719255ecb2179515e6e7730d468f05c9cae
  - name: paste
    version: 1.0.15
    sha: 57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a
  - name: percent-encoding
    version: 2.3.1
    sha: e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e
  - name: petgraph
    version: 0.6.5
    sha: b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db
  - name: pin-project
    version: 1.1.5
    sha: b6bf43b791c5b9e34c3d182969b4abb522f9343702850a2e57f460d00d09b4b3
  - name: pin-project-internal
    version: 1.1.5
    sha: 2f38a4412a78282e09a2cf38d195ea5420d15ba0602cb375210efbc877243965
  - name: pin-project-lite
    version: 0.2.14
    sha: bda66fc9667c18cb2758a2ac84d1167245054bcf85d5d1aaa6923f45801bdd02
  - name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - name: piper
    version: 0.2.3
    sha: ae1d5c74c9876f070d3e8fd503d748c7d974c3e48da8f41350fa5222ef9b4391
  - name: polling
    version: 2.8.0
    sha: 4b2d323e8ca7996b3e23126511a523f7e62924d93ecd5ae73b333815b0eb3dce
  - name: polling
    version: 3.7.2
    sha: a3ed00ed3fbf728b5816498ecd316d1716eecaced9c0c8d2c5a6740ca214985b
  - name: ppv-lite86
    version: 0.2.18
    sha: dee4364d9f3b902ef14fab8a1ddffb783a1cb6b4bba3bfc1fa3922732c7de97f
  - name: prettyplease
    version: 0.2.20
    sha: 5f12335488a2f3b0a83b14edad48dca9879ce89b2edd10e80237e4e852dd645e
  - name: proc-macro-crate
    version: 1.3.1
    sha: 7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919
  - name: proc-macro2
    version: 1.0.86
    sha: 5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77
  - name: prost
    version: 0.12.6
    sha: deb1435c188b76130da55f17a466d252ff7b1418b2ad3e037d127b94e3411f29
  - name: prost-build
    version: 0.12.6
    sha: 22505a5c94da8e3b7c2996394d1c933236c4d743e81a410bcca4e6989fc066a4
  - name: prost-derive
    version: 0.12.6
    sha: 81bddcdb20abf9501610992b6759a4c888aef7d1a7247ef75e2404275ac24af1
  - name: prost-types
    version: 0.12.6
    sha: 9091c90b0a32608e984ff2fa4091273cbdd755d54935c51d520887f4a1dbd5b0
  - name: quote
    version: 1.0.36
    sha: 0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7
  - name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - name: regex
    version: 1.10.5
    sha: b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f
  - name: regex-automata
    version: 0.4.7
    sha: 38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df
  - name: regex-syntax
    version: 0.8.4
    sha: 7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b
  - name: rtnetlink
    version: 0.14.1
    sha: b684475344d8df1859ddb2d395dd3dac4f8f3422a1aa0725993cb375fc5caba5
  - name: rustc-demangle
    version: 0.1.24
    sha: 719b953e2095829ee67db738b3bfa9fa368c94900df327b3f07fe6e794d2fe1f
  - name: rustix
    version: 0.37.27
    sha: fea8ca367a3a01fe35e6943c400addf443c0f57670e6ec51196f71a4b8762dd2
  - name: rustix
    version: 0.38.34
    sha: 70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f
  - name: rustversion
    version: 1.0.17
    sha: 955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6
  - name: ryu
    version: 1.0.18
    sha: f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f
  - name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - name: serde
    version: 1.0.204
    sha: bc76f558e0cbb2a839d37354c575f1dc3fdc6546b5be373ba43d95f231bf7c12
  - name: serde-value
    version: 0.7.0
    sha: f3a1a3341211875ef120e117ea7fd5228530ae7e7036a779fdc9117be6b3282c
  - name: serde_derive
    version: 1.0.204
    sha: e0cd7e117be63d3c3678776753929474f3b04a43a080c744d6b0ae2a8c28e222
  - name: serde_json
    version: 1.0.121
    sha: 4ab380d7d9f22ef3f21ad3e6c1ebe8e4fc7a2000ccba2e4d71fc96f15b2cb609
  - name: serde_path_to_error
    version: 0.1.16
    sha: af99884400da37c88f5e9146b7f1fd0fbcae8f6eec4e9da38b67d05486f814a6
  - name: serde_repr
    version: 0.1.19
    sha: 6c64451ba24fc7a6a2d60fc75dd9c83c90903b19028d4eff35e88fc1e86564e9
  - name: sha1
    version: 0.10.6
    sha: e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba
  - name: sha2
    version: 0.10.8
    sha: 793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8
  - name: signal-hook-registry
    version: 1.4.2
    sha: a9e9e0b4211b72e7b8b6e85c807d36c212bdb33ea8587f7569562a84df5465b1
  - name: slab
    version: 0.4.9
    sha: 8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67
  - name: smallvec
    version: 1.13.2
    sha: 3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67
  - name: socket2
    version: 0.4.10
    sha: 9f7916fc008ca5542385b89a3d3ce689953c143e9304a9bf8beec1de48994c0d
  - name: socket2
    version: 0.5.7
    sha: ce305eb0b4296696835b71df73eb912e0f1ffd2556a501fcede6e0c50349191c
  - name: static_assertions
    version: 1.1.0
    sha: a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f
  - name: strsim
    version: 0.10.0
    sha: 73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623
  - name: strum
    version: 0.26.3
    sha: 8fec0f0aef304996cf250b31b5a10dee7980c85da9d759361292b8bca5a18f06
  - name: strum_macros
    version: 0.26.4
    sha: 4c6bee85a5a24955dc440386795aa378cd9cf82acd5f764469152d2270e581be
  - name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - name: syn
    version: 2.0.72
    sha: dc4b9b9bf2add8093d3f2c0204471e951b2285580335de42f9d2534f3ae7a8af
  - name: sync_wrapper
    version: 0.1.2
    sha: 2047c6ded9c721764247e62cd3b03c09ffc529b2ba5b10ec482ae507a4a70160
  - name: sysctl
    version: 0.5.5
    sha: ec7dddc5f0fee506baf8b9fdb989e242f17e4b11c61dfbb0635b705217199eea
  - name: tempfile
    version: 3.10.1
    sha: 85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1
  - name: thiserror
    version: 1.0.63
    sha: c0342370b38b6a11b6cc11d6a805569958d54cfa061a29969c3b5ce2ea405724
  - name: thiserror-impl
    version: 1.0.63
    sha: a4558b58466b9ad7ca0f102865eccc95938dca1a74a856f2b57b6629050da261
  - name: tinyvec
    version: 1.8.0
    sha: 445e881f4f6d382d5f27c034e25eb92edd7c784ceab92a0937db7f2e9471b938
  - name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - name: tokio
    version: 1.39.2
    sha: daa4fb1bc778bd6f04cbfc4bb2d06a7396a8f299dc33ea1900cedaa316f467b1
  - name: tokio-io-timeout
    version: 1.2.0
    sha: 30b74022ada614a1b4834de765f9bb43877f910cc8ce4be40e89042c9223a8bf
  - name: tokio-macros
    version: 2.4.0
    sha: 693d596312e88961bc67d7f1f97af8a70227d9f90c31bba5806eec004978d752
  - name: tokio-stream
    version: 0.1.15
    sha: 267ac89e0bec6e691e5813911606935d77c476ff49024f98abcea3e7b15e37af
  - name: tokio-util
    version: 0.7.11
    sha: 9cf6b47b3771c49ac75ad09a6162f53ad4b8088b76ac60e8ec1455b31a189fe1
  - name: toml_datetime
    version: 0.6.8
    sha: 0dd7358ecb8fc2f8d014bf86f6f638ce72ba252a2c3a2572f2a795f1d23efb41
  - name: toml_edit
    version: 0.19.15
    sha: 1b5bb770da30e5cbfde35a2d7b9b8a2c4b8ef89548a7a6aeab5c9a576e3e7421
  - name: tonic
    version: 0.11.0
    sha: 76c4eb7a4e9ef9d4763600161f12f5070b92a578e1b634db88a6887844c91a13
  - name: tonic-build
    version: 0.11.0
    sha: be4ef6dd70a610078cb4e338a0f79d06bc759ff1b22d2120c2ff02ae264ba9c2
  - name: tower
    version: 0.4.13
    sha: b8fa9be0de6cf49e536ce1851f987bd21a43b771b09473c3549a6c853db37c1c
  - name: tower-layer
    version: 0.3.2
    sha: c20c8dbed6283a09604c3e69b4b7eeb54e298b8a600d4d5ecb5ad39de609f1d0
  - name: tower-service
    version: 0.3.2
    sha: b6bc1c9ce2b5135ac7f93c72918fc37feb872bdc6a5533a8b85eb4b86bfdae52
  - name: tracing
    version: 0.1.40
    sha: c3523ab5a71916ccf420eebdf5521fcef02141234bbc0b8a49f2fdc4544364ef
  - name: tracing-attributes
    version: 0.1.27
    sha: 34704c8d6ebcbc939824180af020566b01a7c01f80641264eba0999f6c2b6be7
  - name: tracing-core
    version: 0.1.32
    sha: c06d3da6113f116aaee68e4d601191614c9053067f9ab7f6edbcb161237daa54
  - name: trust-dns-proto
    version: 0.22.0
    sha: 4f7f83d1e4a0e4358ac54c5c3681e5d7da5efc5a7a632c90bb6d6669ddd9bc26
  - name: try-lock
    version: 0.2.5
    sha: e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b
  - name: typenum
    version: 1.17.0
    sha: 42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825
  - name: uds_windows
    version: 1.1.0
    sha: 89daebc3e6fd160ac4aa9fc8b3bf71e1f74fbf92367ae71fb83a037e8bf164b9
  - name: unicode-bidi
    version: 0.3.15
    sha: 08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75
  - name: unicode-ident
    version: 1.0.12
    sha: 3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b
  - name: unicode-normalization
    version: 0.1.23
    sha: a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415101f5
  - name: url
    version: 2.5.2
    sha: 22784dbdf76fdde8af1aeda5622b546b422b6fc585325248a2bf9f5e41e94d6c
  - name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - name: version_check
    version: 0.9.5
    sha: 0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a
  - name: waker-fn
    version: 1.2.0
    sha: 317211a0dc0ceedd78fb2ca9a44aed3d7b9b26f81870d485c07122b4350673b7
  - name: walkdir
    version: 2.5.0
    sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
  - name: want
    version: 0.3.1
    sha: bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e
  - name: wasi
    version: 0.11.0+wasi-snapshot-preview1
    sha: 9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423
  - name: wasm-bindgen
    version: 0.2.92
    sha: 4be2531df63900aeb2bca0daaaddec08491ee64ceecbee5076636a3b026795a8
  - name: wasm-bindgen-backend
    version: 0.2.92
    sha: 614d787b966d3989fa7bb98a654e369c762374fd3213d212cfc0251257e747da
  - name: wasm-bindgen-macro
    version: 0.2.92
    sha: a1f8823de937b71b9460c0c34e25f3da88250760bec0ebac694b49997550d726
  - name: wasm-bindgen-macro-support
    version: 0.2.92
    sha: e94f17b526d0a461a191c78ea52bbce64071ed5c04c9ffe424dcb38f74171bb7
  - name: wasm-bindgen-shared
    version: 0.2.92
    sha: af190c94f2773fdb3729c55b007a722abb5384da03bc0986df4c289bf5567e96
  - name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - name: winapi-util
    version: 0.1.8
    sha: 4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91cf9c4c64358067d15a7b6c6b
  - name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - name: windows-core
    version: 0.52.0
    sha: 33ab640c8d7e35bf8ba19b884ba838ceb4fba93a4e8c65a9059d08afcfc683d9
  - name: windows-sys
    version: 0.48.0
    sha: 677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9
  - name: windows-sys
    version: 0.52.0
    sha: 282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d
  - name: windows-targets
    version: 0.48.5
    sha: 9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c
  - name: windows-targets
    version: 0.52.6
    sha: 9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973
  - name: windows_aarch64_gnullvm
    version: 0.48.5
    sha: 2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8
  - name: windows_aarch64_gnullvm
    version: 0.52.6
    sha: 32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3
  - name: windows_aarch64_msvc
    version: 0.48.5
    sha: dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc
  - name: windows_aarch64_msvc
    version: 0.52.6
    sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
  - name: windows_i686_gnu
    version: 0.48.5
    sha: a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e
  - name: windows_i686_gnu
    version: 0.52.6
    sha: 8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b
  - name: windows_i686_gnullvm
    version: 0.52.6
    sha: 0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66
  - name: windows_i686_msvc
    version: 0.48.5
    sha: 8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406
  - name: windows_i686_msvc
    version: 0.52.6
    sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
  - name: windows_x86_64_gnu
    version: 0.48.5
    sha: 53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e
  - name: windows_x86_64_gnu
    version: 0.52.6
    sha: 147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78
  - name: windows_x86_64_gnullvm
    version: 0.48.5
    sha: 0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc
  - name: windows_x86_64_gnullvm
    version: 0.52.6
    sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
  - name: windows_x86_64_msvc
    version: 0.48.5
    sha: ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538
  - name: windows_x86_64_msvc
    version: 0.52.6
    sha: 589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec
  - name: winnow
    version: 0.5.40
    sha: f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876
  - name: xdg-home
    version: 1.2.0
    sha: ca91dcf8f93db085f3a0a29358cd0b9d670915468f4290e8b85d118a34211ab8
  - name: zbus
    version: 3.15.2
    sha: 675d170b632a6ad49804c8cf2105d7c31eddd3312555cffd4b740e08e97c25e6
  - name: zbus_macros
    version: 3.15.2
    sha: 7131497b0f887e8061b430c530240063d33bf9455fa34438f388a245da69e0a5
  - name: zbus_names
    version: 2.6.1
    sha: 437d738d3750bed6ca9b8d423ccc7a8eb284f6b1d6d4e225a0e4e6258d864c8d
  - name: zerocopy
    version: 0.6.6
    sha: 854e949ac82d619ee9a14c66a1b674ac730422372ccb759ce0c39cabcf2bf8e6
  - name: zerocopy-derive
    version: 0.6.6
    sha: 125139de3f6b9d625c39e2efdd73d41bdac468ccd556556440e322be0e1bbd91
  - name: zvariant
    version: 3.15.2
    sha: 4eef2be88ba09b358d3b58aca6e41cd853631d44787f319a1383ca83424fb2db
  - name: zvariant_derive
    version: 3.15.2
    sha: 37c24dc0bed72f5f90d1f8bb5b07228cbf63b3c6e9f82d82559d4bae666e7ed9
  - name: zvariant_utils
    version: 1.0.1
    sha: 7234f0d811589db492d16893e3f21e8e2fd282e6d01b0cddee310322062cc200
