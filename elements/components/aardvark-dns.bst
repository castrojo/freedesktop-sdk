kind: make

build-depends:
- components/rust.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:containers/aardvark-dns.git
  track: v*
  ref: v1.7.0-0-gd27d3b39b519d4a2db3ae322c0d62846772a8624
- kind: cargo
  url: crates:crates
  ref:
  - name: addr2line
    version: 0.19.0
    sha: a76fd60b23679b7d19bd066031410fb7e458ccc5e958eb5c325888ce4baedc97
  - name: adler
    version: 1.0.2
    sha: f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe
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
    version: 1.0.0
    sha: 41ed9a86bf92ae6580e0a31281f65a1b1d867c0cc68d5346e2ae128dddfa6a7d
  - name: anstyle-parse
    version: 0.2.0
    sha: e765fd216e48e067936442276d1d57399e37bce53c264d6fefbe298080cb57ee
  - name: anstyle-query
    version: 1.0.0
    sha: 5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b
  - name: anstyle-wincon
    version: 1.0.1
    sha: 180abfa45703aebe0093f79badacc01b8fd4ea2e35118747e5811127f926e188
  - name: anyhow
    version: 1.0.71
    sha: 9c7d0618f0e0b7e8ff11427422b64564d5fb0be1940354bfe2e0529b18a9d9b8
  - name: async-broadcast
    version: 0.5.1
    sha: 7c48ccdbf6ca6b121e0f586cbc0e73ae440e56c67c30fa0873b4e110d9c26d2b
  - name: async-trait
    version: 0.1.68
    sha: b9ccdd8f2a161be9bd5c023df56f1b2a0bd1d83872ae53b71a84a12c9bf6e842
  - name: autocfg
    version: 1.1.0
    sha: d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa
  - name: backtrace
    version: 0.3.67
    sha: 233d376d6d185f2a3093e58f283f60f880315b6c60075b01f36b3b85154564ca
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: bumpalo
    version: 3.13.0
    sha: a3e2c3daef883ecc1b5d58c15adae93470a91d425f3532ba1695849656af3fc1
  - name: bytes
    version: 1.4.0
    sha: 89b2fd2a0dcf38d7971e2194b6b6eebab45ae01067456a7fd93d5547a61b70be
  - name: cc
    version: 1.0.79
    sha: 50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: chrono
    version: 0.4.26
    sha: ec837a71355b28f6556dbd569b37b3f363091c0bd4b2e735674521b4c5fd9bc5
  - name: clap
    version: 4.3.8
    sha: d9394150f5b4273a1763355bd1c2ec54cc5a2593f790587bcd6b2c947cfa9211
  - name: clap_builder
    version: 4.3.8
    sha: 9a78fbdd3cc2914ddf37ba444114bc7765bbdcb55ec9cbe6fa054f0137400717
  - name: clap_derive
    version: 4.3.2
    sha: b8cd2b2a819ad6eec39e8f1d6b53001af1e5469f8c177579cdaeb313115b825f
  - name: clap_lex
    version: 0.5.0
    sha: 2da6da31387c7e4ef160ffab6d5e7f00c42626fe39aea70a7b0f1773f7dd6c1b
  - name: colorchoice
    version: 1.0.0
    sha: acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7
  - name: core-foundation-sys
    version: 0.8.4
    sha: e496a50fda8aacccc86d7529e2c1e0892dbd0f898a6b5645b5561b89c3210efa
  - name: data-encoding
    version: 2.4.0
    sha: c2e66c9d817f1720209181c316d28635c050fa304f9c79e47a520882661b7308
  - name: endian-type
    version: 0.1.2
    sha: c34f04666d835ff5d62e058c3995147c06f42fe86ff053337632bca83e42702d
  - name: enum-as-inner
    version: 0.5.1
    sha: c9720bba047d567ffc8a3cba48bf19126600e249ab7f128e9233e6376976a116
  - name: errno
    version: 0.3.1
    sha: 4bcfec3a70f97c962c307b2d2c56e358cf1d00b558d74262b5f929ee8cc7e73a
  - name: errno-dragonfly
    version: 0.1.2
    sha: aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf
  - name: error-chain
    version: 0.12.4
    sha: 2d2f06b9cac1506ece98fe3231e3cc9c4410ec3d5b1f24ae1c8946f0742cdefc
  - name: event-listener
    version: 2.5.3
    sha: 0206175f82b8d6bf6652ff7d71a1e27fd2e4efde587fd368662814d6ec1d9ce0
  - name: form_urlencoded
    version: 1.2.0
    sha: a62bc1cf6f830c2ec14a513a9fb124d0a213a629668a4186f329db21fe045652
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
  - name: futures-task
    version: 0.3.28
    sha: 76d3d132be6c0e6aa1534069c705a74a5997a356c0dc2f86a47765e5617c5b65
  - name: futures-util
    version: 0.3.28
    sha: 26b01e40b772d54cf6c6d721c1d1abd0647a0106a12ecaa1c186273392a69533
  - name: getrandom
    version: 0.2.10
    sha: be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427
  - name: gimli
    version: 0.27.3
    sha: b6c80984affa11d98d1b88b66ac8853f143217b399d3c74116778ff8fdb4ed2e
  - name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - name: hermit-abi
    version: 0.2.6
    sha: ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7
  - name: hermit-abi
    version: 0.3.1
    sha: fed44880c466736ef9a5c5b5facefb5ed0785676d0c02d612db14e54f0d84286
  - name: hostname
    version: 0.3.1
    sha: 3c731c3e10504cc8ed35cfe2f1db4c9274c3d35fa486e3b31df46f068ef3e867
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
  - name: io-lifetimes
    version: 1.0.11
    sha: eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2
  - name: ipnet
    version: 2.7.2
    sha: 12b6ee2129af8d4fb011108c73d99a1b83a85977f23b82460c0ae2e25bb4b57f
  - name: is-terminal
    version: 0.4.7
    sha: adcf93614601c8129ddf72e2d5633df827ba6551541c6d8c59520a371475be1f
  - name: itoa
    version: 1.0.6
    sha: 453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6
  - name: js-sys
    version: 0.3.64
    sha: c5f195fe497f702db0f318b07fdd68edb16955aed830df8363d837542f8f935a
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: libc
    version: 0.2.146
    sha: f92be4933c13fd498862a9e02a3055f8a8d9c039ce33db97306fd5a6caa7f29b
  - name: linux-raw-sys
    version: 0.3.8
    sha: ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519
  - name: log
    version: 0.4.19
    sha: b06a4cde4c0f271a446782e3eff8de789548ce57dbc8eca9292c27f4a42004b4
  - name: match_cfg
    version: 0.1.0
    sha: ffbee8634e0d45d258acb448e7eaab3fce7a0a467395d4d9f228e3c1f01fb2e4
  - name: matches
    version: 0.1.10
    sha: 2532096657941c2fea9c289d370a250971c689d4f143798ff67113ec042024a5
  - name: memchr
    version: 2.5.0
    sha: 2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d
  - name: memoffset
    version: 0.7.1
    sha: 5de893c32cde5f383baa4c04c5d6dbdd735cfd4a794b0debdb2bb1b421da5ff4
  - name: miniz_oxide
    version: 0.6.2
    sha: b275950c28b37e794e8c55d88aeb5e139d0ce23fdbbeda68f8d7174abdf9e8fa
  - name: mio
    version: 0.8.8
    sha: 927a765cd3fc26206e66b296465fa9d3e5ab003e651c1b3c060e7956d96b19d2
  - name: nibble_vec
    version: 0.1.0
    sha: 77a5d83df9f36fe23f0c3648c6bbb8b0298bb5f1939c8f2704431371f4b84d43
  - name: nix
    version: 0.26.2
    sha: bfdda3d196821d6af13126e40375cdf7da646a96114af134d5f417a9a1dc8e1a
  - name: num-traits
    version: 0.2.15
    sha: 578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd
  - name: num_cpus
    version: 1.15.0
    sha: 0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b
  - name: num_threads
    version: 0.1.6
    sha: 2819ce041d2ee131036f4fc9d6ae7ae125a3a40e97ba64d04fe799ad9dabbb44
  - name: object
    version: 0.30.4
    sha: 03b4680b86d9cfafba8fc491dc9b6df26b68cf40e9e6cd73909194759a63c385
  - name: once_cell
    version: 1.18.0
    sha: dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d
  - name: percent-encoding
    version: 2.3.0
    sha: 9b2a4787296e9989611394c33f193f676704af1686e70b8f8033ab5ba9a35a94
  - name: pin-project-lite
    version: 0.2.9
    sha: e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116
  - name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - name: ppv-lite86
    version: 0.2.17
    sha: 5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de
  - name: proc-macro2
    version: 1.0.60
    sha: dec2b086b7a862cf4de201096214fa870344cf922b2b30c167badb3af3195406
  - name: quick-error
    version: 1.2.3
    sha: a1d01941d82fa2ab50be1e79e6714289dd7cde78eba4c074bc5a4374f650dfe0
  - name: quote
    version: 1.0.28
    sha: 1b9ab9c7eadfd8df19006f1cf1a4aed13540ed5cbc047010ece5826e10825488
  - name: radix_trie
    version: 0.2.1
    sha: c069c179fcdc6a2fe24d8d18305cf085fdbd4f922c041943e203685d6a1c58fd
  - name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - name: resolv-conf
    version: 0.7.0
    sha: 52e44394d2086d010551b14b53b1f24e31647570cd1deb0379e2c21b329aba00
  - name: rustc-demangle
    version: 0.1.23
    sha: d626bb9dae77e28219937af045c257c28bfd3f69333c512553507f5f9798cb76
  - name: rustix
    version: 0.37.20
    sha: b96e891d04aa506a6d1f318d2771bcb1c7dfda84e126660ace067c9b474bb2c0
  - name: serde
    version: 1.0.164
    sha: 9e8c8cf938e98f769bc164923b06dce91cea1751522f46f8466461af04c9027d
  - name: serde_derive
    version: 1.0.164
    sha: d9735b638ccc51c28bf6914d90a2e9725b377144fc612c49a611fddd1b631d68
  - name: signal-hook
    version: 0.3.15
    sha: 732768f1176d21d09e076c23a93123d40bba92d50c4058da34d45c8de8e682b9
  - name: signal-hook-registry
    version: 1.4.1
    sha: d8229b473baa5980ac72ef434c4415e70c4b5e71b423043adb4ba059f89c99a1
  - name: slab
    version: 0.4.8
    sha: 6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d
  - name: smallvec
    version: 1.10.0
    sha: a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0
  - name: socket2
    version: 0.4.9
    sha: 64a4a911eed85daf18834cfaa86a79b7d266ff93ff5ba14005426219480ed662
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
    version: 2.0.18
    sha: 32d41677bcbe24c20c52e7c70b0d8db04134c5d1066bf98662e2871ad200ea3e
  - name: syslog
    version: 6.1.0
    sha: 7434e95bcccce1215d30f4bf84fe8c00e8de1b9be4fb736d747ca53d36e7f96f
  - name: thiserror
    version: 1.0.40
    sha: 978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac
  - name: thiserror-impl
    version: 1.0.40
    sha: f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f
  - name: time
    version: 0.1.45
    sha: 1b797afad3f312d1c66a56d11d0316f916356d11bd158fbc6ca6389ff6bf805a
  - name: time
    version: 0.3.22
    sha: ea9e1b3cf1243ae005d9e74085d4d542f3125458f3a81af210d901dcd7411efd
  - name: time-core
    version: 0.1.1
    sha: 7300fbefb4dadc1af235a9cef3737cea692a9d97e1b9cbcd4ebdae6f8868e6fb
  - name: time-macros
    version: 0.2.9
    sha: 372950940a5f07bf38dbe211d7283c9e6d7327df53794992d293e534c733d09b
  - name: tinyvec
    version: 1.6.0
    sha: 87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50
  - name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - name: tokio
    version: 1.29.0
    sha: 374442f06ee49c3a28a8fc9f01a2596fed7559c6b99b31279c3261778e77d84f
  - name: tokio-macros
    version: 2.1.0
    sha: 630bdcf245f78637c13ec01ffae6187cca34625e8c63150d424b59e55af2675e
  - name: toml
    version: 0.5.11
    sha: f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234
  - name: tracing
    version: 0.1.37
    sha: 8ce8c33a8d48bd45d624a6e523445fd21ec13d3653cd51f681abf67418f54eb8
  - name: tracing-attributes
    version: 0.1.24
    sha: 0f57e3ca2a01450b1a921183a9c9cbfda207fd822cef4ccb00a65402cbba7a74
  - name: tracing-core
    version: 0.1.31
    sha: 0955b8137a1df6f1a2e9a37d8a6656291ff0297c1a97c24e0d8425fe2312f79a
  - name: trust-dns-client
    version: 0.22.0
    sha: 6c408c32e6a9dbb38037cece35740f2cf23c875d8ca134d33631cec83f74d3fe
  - name: trust-dns-proto
    version: 0.22.0
    sha: 4f7f83d1e4a0e4358ac54c5c3681e5d7da5efc5a7a632c90bb6d6669ddd9bc26
  - name: trust-dns-server
    version: 0.22.1
    sha: 99022f9befa6daec2a860be68ac28b1f0d9d7ccf441d8c5a695e35a58d88840d
  - name: unicode-bidi
    version: 0.3.13
    sha: 92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460
  - name: unicode-ident
    version: 1.0.9
    sha: b15811caf2415fb889178633e7724bad2509101cde276048e013b9def5e51fa0
  - name: unicode-normalization
    version: 0.1.22
    sha: 5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921
  - name: url
    version: 2.4.0
    sha: 50bff7831e19200a85b17131d085c25d7811bc4e186efdaf54bbd132994a88cb
  - name: utf8parse
    version: 0.2.1
    sha: 711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a
  - name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - name: wasi
    version: 0.10.0+wasi-snapshot-preview1
    sha: 1a143597ca7c7793eff794def352d41792a93c481eb1042423ff7ff72ba2c31f
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
  - name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
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
    version: 0.48.0
    sha: 7b1eb6f0cd7c80c79759c929114ef071b87354ce476d9d94271031c0497adfd5
  - name: windows_aarch64_gnullvm
    version: 0.48.0
    sha: 91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc
  - name: windows_aarch64_msvc
    version: 0.48.0
    sha: b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3
  - name: windows_i686_gnu
    version: 0.48.0
    sha: 622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241
  - name: windows_i686_msvc
    version: 0.48.0
    sha: 4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00
  - name: windows_x86_64_gnu
    version: 0.48.0
    sha: ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1
  - name: windows_x86_64_gnullvm
    version: 0.48.0
    sha: 7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953
  - name: windows_x86_64_msvc
    version: 0.48.0
    sha: 1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a
