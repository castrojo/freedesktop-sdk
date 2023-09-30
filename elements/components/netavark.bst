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
  ref: v1.8.0-0-g837f1f3fb77aa61656a0f561769446453655663e
- kind: cargo
  url: crates:crates
  ref:
  - name: addr2line
    version: 0.21.0
    sha: 8a30b2e23b9e17a9f90641c7ab1549cd9b44f296d3ccbf309d2863cfe398a0cb
  - name: adler
    version: 1.0.2
    sha: f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe
  - name: aho-corasick
    version: 1.1.1
    sha: ea5d730647d4fadd988536d06fecce94b7b4f2a7efdae548f1cf4b63205518ab
  - name: android-tzdata
    version: 0.1.1
    sha: e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0
  - name: android_system_properties
    version: 0.1.5
    sha: 819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311
  - name: anstream
    version: 0.3.2
    sha: 0ca84f3628370c59db74ee214b3263d58f9aadd9b4fe7e711fd87dc452b7f163
  - name: anstyle
    version: 1.0.2
    sha: 15c4c2c83f81532e5845a733998b6971faca23490340a418e9b72a3ec9de12ea
  - name: anstyle-parse
    version: 0.2.1
    sha: 938874ff5980b03a87c5524b3ae5b59cf99b1d6bc836848df7bc5ada9643c333
  - name: anstyle-query
    version: 1.0.0
    sha: 5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b
  - name: anstyle-wincon
    version: 1.0.2
    sha: c677ab05e09154296dd37acecd46420c17b9713e8366facafa8fc0885167cf4c
  - name: anyhow
    version: 1.0.75
    sha: a4668cab20f66d8d020e1fbc0ebe47217433c1b6c8f2040faf858554e394ace6
  - name: arrayvec
    version: 0.7.4
    sha: 96d30a06541fbafbc7f82ed10c06164cfbd2c401138f6addd8404629c4b16711
  - name: async-broadcast
    version: 0.5.1
    sha: 7c48ccdbf6ca6b121e0f586cbc0e73ae440e56c67c30fa0873b4e110d9c26d2b
  - name: async-channel
    version: 1.9.0
    sha: 81953c529336010edd6d8e358f886d9581267795c61b19475b71314bffa46d35
  - name: async-executor
    version: 1.5.3
    sha: 78f2db9467baa66a700abce2a18c5ad793f6f83310aca1284796fc3921d113fd
  - name: async-fs
    version: 1.6.0
    sha: 279cf904654eeebfa37ac9bb1598880884924aab82e290aa65c9e77a0e142e06
  - name: async-io
    version: 1.13.0
    sha: 0fc5b45d93ef0529756f812ca52e44c221b35341892d3dcc34132ac02f3dd2af
  - name: async-lock
    version: 2.8.0
    sha: 287272293e9d8c41773cec55e365490fe034813a2f172f502d6ddcf75b2f582b
  - name: async-process
    version: 1.8.0
    sha: bf012553ce51eb7aa6dc2143804cc8252bd1cb681a1c5cb7fa94ca88682dee1d
  - name: async-recursion
    version: 1.0.5
    sha: 5fd55a5ba1179988837d24ab4c7cc8ed6efdeff578ede0416b4225a5fca35bd0
  - name: async-signal
    version: 0.2.1
    sha: 4af361a844928cb7d36590d406709473a1b574f443094422ef166daa3b493208
  - name: async-stream
    version: 0.3.5
    sha: cd56dd203fef61ac097dd65721a419ddccb106b2d2b70ba60a6b529f03961a51
  - name: async-stream-impl
    version: 0.3.5
    sha: 16e62a023e7c117e27523144c5d2459f4397fcc3cab0085af8e2224f643a0193
  - name: async-task
    version: 4.4.1
    sha: b9441c6b2fe128a7c2bf680a44c34d0df31ce09e5b7e401fcca3faa483dbc921
  - name: async-trait
    version: 0.1.73
    sha: bc00ceb34980c03614e35a3a4e218276a0a824e911d07651cd0d858a51e8c0f0
  - name: atomic-waker
    version: 1.1.2
    sha: 1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0
  - name: autocfg
    version: 1.1.0
    sha: d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa
  - name: axum
    version: 0.6.20
    sha: 3b829e4e32b91e643de6eafe82b1d90675f5874230191a4ffbc1b336dec4d6bf
  - name: axum-core
    version: 0.3.4
    sha: 759fa577a247914fd3f7f76d62972792636412fbfd634cd452f6a385a74d2d2c
  - name: backtrace
    version: 0.3.69
    sha: 2089b7e3f35b9dd2d0ed921ead4f6d318c27680d4a5bd167b3ee120edb105837
  - name: base64
    version: 0.21.4
    sha: 9ba43ea6f343b788c8764558649e08df62f86c6ef251fdaeb1ffd010a9ae50a2
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: bitflags
    version: 2.4.0
    sha: b4682ae6287fcf752ecaabbfcc7b6f9b72aa33933dc23a554d853aea8eea8635
  - name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - name: blocking
    version: 1.4.0
    sha: 94c4ef1f913d78636d78d538eec1f18de81e481f44b1be0a81060090530846e1
  - name: bumpalo
    version: 3.14.0
    sha: 7f30e7476521f6f8af1a1c4c0b8cc94f0bee37d91763d0ca2665f299b6cd8aec
  - name: byteorder
    version: 1.4.3
    sha: 14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610
  - name: bytes
    version: 1.5.0
    sha: a2bd12c1caf447e69cd4528f47f94d203fd2582878ecb9e9465484c4148a8223
  - name: cc
    version: 1.0.83
    sha: f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: chrono
    version: 0.4.31
    sha: 7f2c685bad3eb3d45a01354cedb7d5faa66194d1d58ba6e267a8de788f79db38
  - name: clap
    version: 4.3.24
    sha: fb690e81c7840c0d7aade59f242ea3b41b9bc27bcd5997890e7702ae4b32e487
  - name: clap_builder
    version: 4.3.24
    sha: 5ed2e96bc16d8d740f6f48d663eddf4b8a0983e79210fd55479b7bcd0a69860e
  - name: clap_derive
    version: 4.3.12
    sha: 54a9bb5758fc5dfe728d1019941681eccaf0cf8a4189b692a0ee2f2ecf90a050
  - name: clap_lex
    version: 0.5.0
    sha: 2da6da31387c7e4ef160ffab6d5e7f00c42626fe39aea70a7b0f1773f7dd6c1b
  - name: colorchoice
    version: 1.0.0
    sha: acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7
  - name: concurrent-queue
    version: 2.3.0
    sha: f057a694a54f12365049b0958a1685bb52d567f5593b355fbf685838e873d400
  - name: core-foundation-sys
    version: 0.8.4
    sha: e496a50fda8aacccc86d7529e2c1e0892dbd0f898a6b5645b5561b89c3210efa
  - name: cpufeatures
    version: 0.2.9
    sha: a17b76ff3a4162b0b27f354a0c87015ddad39d35f9c0c36607a3bdd175dde1f1
  - name: crossbeam-utils
    version: 0.8.16
    sha: 5a22b2d63d4d1dc0b7f1b6b2747dd0088008a9be28b6ddf0b1e7d335e3037294
  - name: crypto-common
    version: 0.1.6
    sha: 1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3
  - name: data-encoding
    version: 2.4.0
    sha: c2e66c9d817f1720209181c316d28635c050fa304f9c79e47a520882661b7308
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
    version: 1.9.0
    sha: a26ae43d7bcc3b814de94796a5e736d4029efb0ee900c12e2d54c993ad1a1e07
  - name: enum-as-inner
    version: 0.5.1
    sha: c9720bba047d567ffc8a3cba48bf19126600e249ab7f128e9233e6376976a116
  - name: enumflags2
    version: 0.7.8
    sha: 5998b4f30320c9d93aed72f63af821bfdac50465b75428fce77b48ec482c3939
  - name: enumflags2_derive
    version: 0.7.8
    sha: f95e2801cd355d4a1a3e3953ce6ee5ae9603a5c833455343a8bfe3f44d418246
  - name: env_logger
    version: 0.10.0
    sha: 85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0
  - name: equivalent
    version: 1.0.1
    sha: 5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5
  - name: errno
    version: 0.3.3
    sha: 136526188508e25c6fef639d7927dfb3e0e3084488bf202267829cf7fc23dbdd
  - name: errno-dragonfly
    version: 0.1.2
    sha: aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf
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
    version: 3.0.0
    sha: 29e56284f00d94c1bc7fd3c77027b4623c88c1f53d8d2394c6199f2921dea325
  - name: fastrand
    version: 1.9.0
    sha: e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be
  - name: fastrand
    version: 2.0.1
    sha: 25cbce373ec4653f1a01a31e8a5e5ec0c622dc27ff9c4e6606eefef5cbbed4a5
  - name: fixedbitset
    version: 0.4.2
    sha: 0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80
  - name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
  - name: form_urlencoded
    version: 1.2.0
    sha: a62bc1cf6f830c2ec14a513a9fb124d0a213a629668a4186f329db21fe045652
  - name: fs2
    version: 0.4.3
    sha: 9564fc758e15025b46aa6643b1b77d047d1a56a1aea6e01002ac0c7026876213
  - name: futures
    version: 0.3.28
    sha: 23342abe12aba583913b2e62f22225ff9c950774065e4bfb61a19cd9770fec40
  - name: futures-channel
    version: 0.3.28
    sha: 955518d47e09b25bbebc7a18df10b81f0c766eaf4c4f1cccef2fca5f2a4fb5f2
  - name: futures-core
    version: 0.3.28
    sha: 4bca583b7e26f571124fe5b7561d49cb2868d79116cfa0eefce955557c6fee8c
  - name: futures-executor
    version: 0.3.28
    sha: ccecee823288125bd88b4d7f565c9e58e41858e47ab72e8ea2d64e93624386e0
  - name: futures-io
    version: 0.3.28
    sha: 4fff74096e71ed47f8e023204cfd0aa1289cd54ae5430a9523be060cdb849964
  - name: futures-lite
    version: 1.13.0
    sha: 49a9d51ce47660b1e808d3c990b4709f2f415d928835a17dfd16991515c46bce
  - name: futures-macro
    version: 0.3.28
    sha: 89ca545a94061b6365f2c7355b4b32bd20df3ff95f02da9329b34ccc3bd6ee72
  - name: futures-sink
    version: 0.3.28
    sha: f43be4fe21a13b9781a69afa4985b0f6ee0e1afab2c6f454a8cf30e2b2237b6e
  - name: futures-task
    version: 0.3.28
    sha: 76d3d132be6c0e6aa1534069c705a74a5997a356c0dc2f86a47765e5617c5b65
  - name: futures-util
    version: 0.3.28
    sha: 26b01e40b772d54cf6c6d721c1d1abd0647a0106a12ecaa1c186273392a69533
  - name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - name: genetlink
    version: 0.2.5
    sha: 1f890076c1faa1298bf747ce3694a8d9e0d2cc4b06fe293f12dd95742bfd079f
  - name: getrandom
    version: 0.2.10
    sha: be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427
  - name: gimli
    version: 0.28.0
    sha: 6fb8d784f27acf97159b40fc4db5ecd8aa23b9ad5ef69cdd136d3bc80665f0c0
  - name: h2
    version: 0.3.21
    sha: 91fc23aa11be92976ef4729127f1a74adf36d8436f7816b185d18df956790833
  - name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - name: hashbrown
    version: 0.14.0
    sha: 2c6201b9ff9fd90a5a3bac2e56a830d0caa509576f0e503818ee82c181b3437a
  - name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - name: hermit-abi
    version: 0.3.3
    sha: d77f7ec81a6d05a3abb01ab6eb7590f6083d08449fe5a1c8b1e620283546ccb7
  - name: hex
    version: 0.4.3
    sha: 7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70
  - name: home
    version: 0.5.5
    sha: 5444c27eef6923071f7ebcc33e3444508466a76f7a2b93da00ed6e19f30c1ddb
  - name: http
    version: 0.2.9
    sha: bd6effc99afb63425aff9b05836f029929e345a6148a14b7ecd5ab67af944482
  - name: http-body
    version: 0.4.5
    sha: d5f38f16d184e36f2408a55281cd658ecbd3ca05cce6d6510a176eca393e26d1
  - name: httparse
    version: 1.8.0
    sha: d897f394bad6a705d5f4104762e116a75639e470d80901eed05a860a95cb1904
  - name: httpdate
    version: 1.0.3
    sha: df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9
  - name: humantime
    version: 2.1.0
    sha: 9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4
  - name: hyper
    version: 0.14.27
    sha: ffb1cfd654a8219eaef89881fdb3bb3b1cdc5fa75ded05d6933b2b382e395468
  - name: hyper-timeout
    version: 0.4.1
    sha: bbb958482e8c7be4bc3cf272a766a2b0bf1a6755e7a6ae777f017a31d11b13b1
  - name: iana-time-zone
    version: 0.1.57
    sha: 2fad5b825842d2b38bd206f3e81d6957625fd7f0a361e345c30e01a0ae2dd613
  - name: iana-time-zone-haiku
    version: 0.1.2
    sha: f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f
  - name: idna
    version: 0.2.3
    sha: 418a0a6fab821475f634efe3ccc45c013f742efe03d853e8d3355d5cb850ecf8
  - name: idna
    version: 0.4.0
    sha: 7d20d6b07bfbc108882d88ed8e37d39636dcc260e15e30c45e6ba089610b917c
  - name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - name: indexmap
    version: 2.0.0
    sha: d5477fe2230a79769d8dc68e0eabf5437907c0457a5614a9e8dddb67f65eb65d
  - name: instant
    version: 0.1.12
    sha: 7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c
  - name: io-lifetimes
    version: 1.0.11
    sha: eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2
  - name: ipnet
    version: 2.8.0
    sha: 28b29a3cd74f0f4598934efe3aeba42bae0eb4680554128851ebbecb02af14e6
  - name: iptables
    version: 0.5.1
    sha: d39f0d72d0feb83c9b7f4e1fbde2b4a629886f30841127b3f86383831dba2629
  - name: is-terminal
    version: 0.4.9
    sha: cb0889898416213fab133e1d33a0e5858a48177452750691bde3666d0fdbaf8b
  - name: itertools
    version: 0.11.0
    sha: b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57
  - name: itoa
    version: 1.0.9
    sha: af150ab688ff2122fcef229be89cb50dd66af9e01a4ff320cc137eecc9bacc38
  - name: js-sys
    version: 0.3.64
    sha: c5f195fe497f702db0f318b07fdd68edb16955aed830df8363d837542f8f935a
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: libc
    version: 0.2.148
    sha: 9cdc71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b
  - name: linux-raw-sys
    version: 0.3.8
    sha: ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519
  - name: linux-raw-sys
    version: 0.4.7
    sha: 1a9bad9f94746442c783ca431b22403b519cd7fbeed0533fdd6328b2f2212128
  - name: log
    version: 0.4.20
    sha: b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f
  - name: matches
    version: 0.1.10
    sha: 2532096657941c2fea9c289d370a250971c689d4f143798ff67113ec042024a5
  - name: matchit
    version: 0.7.3
    sha: 0e7465ac9959cc2b1404e8e2367b43684a6d13790fe23056cc8c6c5a6b7bcb94
  - name: memchr
    version: 2.6.3
    sha: 8f232d6ef707e1956a43342693d2a31e72989554d58299d7a88738cc95b0d35c
  - name: memoffset
    version: 0.7.1
    sha: 5de893c32cde5f383baa4c04c5d6dbdd735cfd4a794b0debdb2bb1b421da5ff4
  - name: mime
    version: 0.3.17
    sha: 6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a
  - name: miniz_oxide
    version: 0.7.1
    sha: e7810e0be55b428ada41041c41f32c9f1a42817901b4ccf45fa3d4b6561e74c7
  - name: mio
    version: 0.8.8
    sha: 927a765cd3fc26206e66b296465fa9d3e5ab003e651c1b3c060e7956d96b19d2
  - name: mozim
    version: 0.2.2
    sha: 0c1c15d0df314be0af498b122169739cc873045e431a0cb1a83564f7459ac491
  - name: mptcp-pm
    version: 0.1.3
    sha: 3eafa8fc63dce407b75e336f9a22f18cf5510a3a5c3a5d83262688eb5cca42d5
  - name: multimap
    version: 0.8.3
    sha: e5ce46fe64a9d73be07dcbe690a38ce1b293be448fd8ce1e6c1b8062c9f72c6a
  - name: netlink-packet-core
    version: 0.7.0
    sha: 72724faf704479d67b388da142b186f916188505e7e0b26719019c525882eda4
  - name: netlink-packet-generic
    version: 0.3.3
    sha: 1cd7eb8ad331c84c6b8cb7f685b448133e5ad82e1ffd5acafac374af4a5a308b
  - name: netlink-packet-route
    version: 0.17.1
    sha: 053998cea5a306971f88580d0829e90f270f940befd7cf928da179d4187a5a66
  - name: netlink-packet-utils
    version: 0.5.2
    sha: 0ede8a08c71ad5a95cdd0e4e52facd37190977039a4704eb82a283f713747d34
  - name: netlink-proto
    version: 0.11.2
    sha: 842c6770fc4bb33dd902f41829c61ef872b8e38de1405aa0b938b27b8fba12c3
  - name: netlink-sys
    version: 0.8.5
    sha: 6471bf08e7ac0135876a9581bf3217ef0333c191c128d34878079f42ee150411
  - name: nispor
    version: 1.2.14
    sha: 0d219cea7e1b66a2de5d4dd3e29fb561e91568377e57544912cce3e870b29542
  - name: nix
    version: 0.26.4
    sha: 598beaf3cc6fdd9a5dfb1630c2800c7acd31df7aaf0f565796fba2b53ca1af1b
  - name: nix
    version: 0.27.1
    sha: 2eb04e9c688eff1c89d72b407f168cf79bb9e867a9d3323ed6c01519eb9cc053
  - name: num-traits
    version: 0.2.16
    sha: f30b0abd723be7e2ffca1272140fac1a2f084c77ec3e123c192b66af1ee9e6c2
  - name: num_cpus
    version: 1.16.0
    sha: 4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43
  - name: object
    version: 0.32.1
    sha: 9cf5f9dd3933bd50a9e1f149ec995f39ae2c496d31fd772c1fd45ebc27e902b0
  - name: once_cell
    version: 1.18.0
    sha: dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d
  - name: ordered-float
    version: 2.10.0
    sha: 7940cf2ca942593318d07fcf2596cdca60a85c9e7fab408a5e21a4f9dcd40d87
  - name: ordered-stream
    version: 0.2.0
    sha: 9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50
  - name: parking
    version: 2.1.1
    sha: e52c774a4c39359c1d1c52e43f73dd91a75a614652c825408eec30c95a9b2067
  - name: paste
    version: 1.0.14
    sha: de3145af08024dea9fa9914f381a17b8fc6034dfb00f3a84013f7ff43f29ed4c
  - name: percent-encoding
    version: 2.3.0
    sha: 9b2a4787296e9989611394c33f193f676704af1686e70b8f8033ab5ba9a35a94
  - name: petgraph
    version: 0.6.4
    sha: e1d3afd2628e69da2be385eb6f2fd57c8ac7977ceeff6dc166ff1657b0e386a9
  - name: pin-project
    version: 1.1.3
    sha: fda4ed1c6c173e3fc7a83629421152e01d7b1f9b7f65fb301e490e8cfc656422
  - name: pin-project-internal
    version: 1.1.3
    sha: 4359fd9c9171ec6e8c62926d6faaf553a8dc3f64e1507e76da7911b4f6a04405
  - name: pin-project-lite
    version: 0.2.13
    sha: 8afb450f006bf6385ca15ef45d71d2288452bc3683ce2e2cacc0d18e4be60b58
  - name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - name: piper
    version: 0.2.1
    sha: 668d31b1c4eba19242f2088b2bf3316b82ca31082a8335764db4e083db7485d4
  - name: polling
    version: 2.8.0
    sha: 4b2d323e8ca7996b3e23126511a523f7e62924d93ecd5ae73b333815b0eb3dce
  - name: ppv-lite86
    version: 0.2.17
    sha: 5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de
  - name: prettyplease
    version: 0.2.15
    sha: ae005bd773ab59b4725093fd7df83fd7892f7d8eafb48dbd7de6e024e4215f9d
  - name: proc-macro-crate
    version: 1.3.1
    sha: 7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919
  - name: proc-macro2
    version: 1.0.67
    sha: 3d433d9f1a3e8c1263d9456598b16fec66f4acc9a74dacffd35c7bb09b3a1328
  - name: prost
    version: 0.12.1
    sha: f4fdd22f3b9c31b53c060df4a0613a1c7f062d4115a2b984dd15b1858f7e340d
  - name: prost-build
    version: 0.12.1
    sha: 8bdf592881d821b83d471f8af290226c8d51402259e9bb5be7f9f8bdebbb11ac
  - name: prost-derive
    version: 0.12.1
    sha: 265baba7fabd416cf5078179f7d2cbeca4ce7a9041111900675ea7c4cb8a4c32
  - name: prost-types
    version: 0.12.1
    sha: e081b29f63d83a4bc75cfc9f3fe424f9156cf92d8a4f0c9407cce9a1b67327cf
  - name: quote
    version: 1.0.33
    sha: 5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae
  - name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - name: redox_syscall
    version: 0.3.5
    sha: 567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29
  - name: regex
    version: 1.9.5
    sha: 697061221ea1b4a94a624f67d0ae2bfe4e22b8a17b6a192afb11046542cc8c47
  - name: regex-automata
    version: 0.3.8
    sha: c2f401f4955220693b56f8ec66ee9c78abffd8d1c4f23dc41a23839eb88f0795
  - name: regex-syntax
    version: 0.7.5
    sha: dbb5fb1acd8a1a18b3dd5be62d25485eb770e05afb408a9627d14d451bae12da
  - name: rtnetlink
    version: 0.13.1
    sha: 7a552eb82d19f38c3beed3f786bd23aa434ceb9ac43ab44419ca6d67a7e186c0
  - name: rustc-demangle
    version: 0.1.23
    sha: d626bb9dae77e28219937af045c257c28bfd3f69333c512553507f5f9798cb76
  - name: rustix
    version: 0.37.23
    sha: 4d69718bf81c6127a49dc64e44a742e8bb9213c0ff8869a22c308f84c1d4ab06
  - name: rustix
    version: 0.38.14
    sha: 747c788e9ce8e92b12cd485c49ddf90723550b654b32508f979b71a7b1ecda4f
  - name: rustversion
    version: 1.0.14
    sha: 7ffc183a10b4478d04cbbbfc96d0873219d962dd5accaff2ffbd4ceb7df837f4
  - name: ryu
    version: 1.0.15
    sha: 1ad4cc8da4ef723ed60bced201181d83791ad433213d8c24efffda1eec85d741
  - name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - name: serde
    version: 1.0.188
    sha: cf9e0fcba69a370eed61bcf2b728575f726b50b55cba78064753d708ddc7549e
  - name: serde-value
    version: 0.7.0
    sha: f3a1a3341211875ef120e117ea7fd5228530ae7e7036a779fdc9117be6b3282c
  - name: serde_derive
    version: 1.0.188
    sha: 4eca7ac642d82aa35b60049a6eccb4be6be75e599bd2e9adb5f875a737654af2
  - name: serde_json
    version: 1.0.107
    sha: 6b420ce6e3d8bd882e9b243c6eed35dbc9a6110c9769e74b584e0d68d1f20c65
  - name: serde_repr
    version: 0.1.16
    sha: 8725e1dfadb3a50f7e5ce0b1a540466f6ed3fe7a0fca2ac2b8b831d31316bd00
  - name: sha1
    version: 0.10.6
    sha: e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba
  - name: sha2
    version: 0.10.7
    sha: 479fb9d862239e610720565ca91403019f2f00410f1864c5aa7479b950a76ed8
  - name: signal-hook-registry
    version: 1.4.1
    sha: d8229b473baa5980ac72ef434c4415e70c4b5e71b423043adb4ba059f89c99a1
  - name: slab
    version: 0.4.9
    sha: 8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67
  - name: smallvec
    version: 1.11.1
    sha: 942b4a808e05215192e39f4ab80813e599068285906cc91aa64f923db842bd5a
  - name: socket2
    version: 0.4.9
    sha: 64a4a911eed85daf18834cfaa86a79b7d266ff93ff5ba14005426219480ed662
  - name: socket2
    version: 0.5.4
    sha: 4031e820eb552adee9295814c0ced9e5cf38ddf1e8b7d566d6de8e2538ea989e
  - name: static_assertions
    version: 1.1.0
    sha: a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f
  - name: strsim
    version: 0.10.0
    sha: 73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623
  - name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - name: syn
    version: 2.0.37
    sha: 7303ef2c05cd654186cb250d29049a24840ca25d2747c25c0381c8d9e2f582e8
  - name: sync_wrapper
    version: 0.1.2
    sha: 2047c6ded9c721764247e62cd3b03c09ffc529b2ba5b10ec482ae507a4a70160
  - name: sysctl
    version: 0.5.4
    sha: ed66d6a2ccbd656659289bc90767895b7abbdec897a0fc6031aca3ed1cb51d3e
  - name: tempfile
    version: 3.8.0
    sha: cb94d2f3cc536af71caac6b6fcebf65860b347e7ce0cc9ebe8f70d3e521054ef
  - name: termcolor
    version: 1.3.0
    sha: 6093bad37da69aab9d123a8091e4be0aa4a03e4d601ec641c327398315f62b64
  - name: thiserror
    version: 1.0.48
    sha: 9d6d7a740b8a666a7e828dd00da9c0dc290dff53154ea77ac109281de90589b7
  - name: thiserror-impl
    version: 1.0.48
    sha: 49922ecae66cc8a249b77e68d1d0623c1b2c514f0060c27cdc68bd62a1219d35
  - name: tinyvec
    version: 1.6.0
    sha: 87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50
  - name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - name: tokio
    version: 1.32.0
    sha: 17ed6077ed6cd6c74735e21f37eb16dc3935f96878b1fe961074089cc80893f9
  - name: tokio-io-timeout
    version: 1.2.0
    sha: 30b74022ada614a1b4834de765f9bb43877f910cc8ce4be40e89042c9223a8bf
  - name: tokio-macros
    version: 2.1.0
    sha: 630bdcf245f78637c13ec01ffae6187cca34625e8c63150d424b59e55af2675e
  - name: tokio-stream
    version: 0.1.14
    sha: 397c988d37662c7dda6d2208364a706264bf3d6138b11d436cbac0ad38832842
  - name: tokio-util
    version: 0.7.9
    sha: 1d68074620f57a0b21594d9735eb2e98ab38b17f80d3fcb189fca266771ca60d
  - name: toml_datetime
    version: 0.6.3
    sha: 7cda73e2f1397b1262d6dfdcef8aafae14d1de7748d66822d3bfeeb6d03e5e4b
  - name: toml_edit
    version: 0.19.15
    sha: 1b5bb770da30e5cbfde35a2d7b9b8a2c4b8ef89548a7a6aeab5c9a576e3e7421
  - name: tonic
    version: 0.10.1
    sha: 14c00bc15e49625f3d2f20b17082601e5e17cf27ead69e805174026c194b6664
  - name: tonic-build
    version: 0.10.1
    sha: c9d37bb15da06ae9bb945963066baca6561b505af93a52e949a85d28558459a2
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
    version: 0.1.37
    sha: 8ce8c33a8d48bd45d624a6e523445fd21ec13d3653cd51f681abf67418f54eb8
  - name: tracing-attributes
    version: 0.1.26
    sha: 5f4f31f56159e98206da9efd823404b79b6ef3143b4a7ab76e67b1751b25a4ab
  - name: tracing-core
    version: 0.1.31
    sha: 0955b8137a1df6f1a2e9a37d8a6656291ff0297c1a97c24e0d8425fe2312f79a
  - name: trust-dns-proto
    version: 0.22.0
    sha: 4f7f83d1e4a0e4358ac54c5c3681e5d7da5efc5a7a632c90bb6d6669ddd9bc26
  - name: try-lock
    version: 0.2.4
    sha: 3528ecfd12c466c6f163363caf2d02a71161dd5e1cc6ae7b34207ea2d42d81ed
  - name: typenum
    version: 1.17.0
    sha: 42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825
  - name: uds_windows
    version: 1.0.2
    sha: ce65604324d3cce9b966701489fbd0cf318cb1f7bd9dd07ac9a4ee6fb791930d
  - name: unicode-bidi
    version: 0.3.13
    sha: 92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460
  - name: unicode-ident
    version: 1.0.12
    sha: 3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b
  - name: unicode-normalization
    version: 0.1.22
    sha: 5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921
  - name: url
    version: 2.4.1
    sha: 143b538f18257fac9cad154828a57c6bf5157e1aa604d4816b5995bf6de87ae5
  - name: utf8parse
    version: 0.2.1
    sha: 711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a
  - name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - name: waker-fn
    version: 1.1.1
    sha: f3c4517f54858c779bbcbf228f4fca63d121bf85fbecb2dc578cdf4a39395690
  - name: walkdir
    version: 2.4.0
    sha: d71d857dc86794ca4c280d616f7da00d2dbfd8cd788846559a6813e6aa4b54ee
  - name: want
    version: 0.3.1
    sha: bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e
  - name: wasi
    version: 0.11.0+wasi-snapshot-preview1
    sha: 9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423
  - name: wasm-bindgen
    version: 0.2.87
    sha: 7706a72ab36d8cb1f80ffbf0e071533974a60d0a308d01a5d0375bf60499a342
  - name: wasm-bindgen-backend
    version: 0.2.87
    sha: 5ef2b6d3c510e9625e5fe6f509ab07d66a760f0885d858736483c32ed7809abd
  - name: wasm-bindgen-macro
    version: 0.2.87
    sha: dee495e55982a3bd48105a7b947fd2a9b4a8ae3010041b9e0faab3f9cd028f1d
  - name: wasm-bindgen-macro-support
    version: 0.2.87
    sha: 54681b18a46765f095758388f2d0cf16eb8d4169b639ab575a8f5693af210c7b
  - name: wasm-bindgen-shared
    version: 0.2.87
    sha: ca6ad05a4870b2bf5fe995117d3728437bd27d7cd5f06f13c17443ef369775a1
  - name: which
    version: 4.4.2
    sha: 87ba24419a2078cd2b0f2ede2691b6c66d8e47836da3b6db8265ebad47afbfc7
  - name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - name: winapi-util
    version: 0.1.6
    sha: f29e6f9198ba0d26b4c9f07dbe6f9ed633e1f3d5b8b414090084349e46a52596
  - name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - name: windows
    version: 0.48.0
    sha: e686886bc078bc1b0b600cac0147aadb815089b6e4da64016cbd754b6342700f
  - name: windows-sys
    version: 0.48.0
    sha: 677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9
  - name: windows-targets
    version: 0.48.5
    sha: 9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c
  - name: windows_aarch64_gnullvm
    version: 0.48.5
    sha: 2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8
  - name: windows_aarch64_msvc
    version: 0.48.5
    sha: dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc
  - name: windows_i686_gnu
    version: 0.48.5
    sha: a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e
  - name: windows_i686_msvc
    version: 0.48.5
    sha: 8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406
  - name: windows_x86_64_gnu
    version: 0.48.5
    sha: 53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e
  - name: windows_x86_64_gnullvm
    version: 0.48.5
    sha: 0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc
  - name: windows_x86_64_msvc
    version: 0.48.5
    sha: ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538
  - name: winnow
    version: 0.5.15
    sha: 7c2e3184b9c4e92ad5167ca73039d0c42476302ab603e2fec4487511f38ccefc
  - name: xdg-home
    version: 1.0.0
    sha: 2769203cd13a0c6015d515be729c526d041e9cf2c0cc478d57faee85f40c6dcd
  - name: zbus
    version: 3.14.1
    sha: 31de390a2d872e4cd04edd71b425e29853f786dc99317ed72d73d6fcf5ebb948
  - name: zbus_macros
    version: 3.14.1
    sha: 41d1794a946878c0e807f55a397187c11fc7a038ba5d868e7db4f3bd7760bc9d
  - name: zbus_names
    version: 2.6.0
    sha: fb80bb776dbda6e23d705cf0123c3b95df99c4ebeaec6c2599d4a5419902b4a9
  - name: zvariant
    version: 3.15.0
    sha: 44b291bee0d960c53170780af148dca5fa260a63cdd24f1962fa82e03e53338c
  - name: zvariant_derive
    version: 3.15.0
    sha: 934d7a7dfc310d6ee06c87ffe88ef4eca7d3e37bb251dece2ef93da8f17d8ecd
  - name: zvariant_utils
    version: 1.0.1
    sha: 7234f0d811589db492d16893e3f21e8e2fd282e6d01b0cddee310322062cc200
