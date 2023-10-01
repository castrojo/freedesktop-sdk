kind: make

build-depends:
- components/rust.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:containers/aardvark-dns.git
  track: v*
  ref: v1.8.0-0-g1ed940206e0f39887fc35943ab852387dec9f794
- kind: cargo
  url: crates:crates
  ref:
  - name: addr2line
    version: 0.21.0
    sha: 8a30b2e23b9e17a9f90641c7ab1549cd9b44f296d3ccbf309d2863cfe398a0cb
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
  - name: async-broadcast
    version: 0.5.1
    sha: 7c48ccdbf6ca6b121e0f586cbc0e73ae440e56c67c30fa0873b4e110d9c26d2b
  - name: async-trait
    version: 0.1.73
    sha: bc00ceb34980c03614e35a3a4e218276a0a824e911d07651cd0d858a51e8c0f0
  - name: autocfg
    version: 1.1.0
    sha: d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa
  - name: backtrace
    version: 0.3.69
    sha: 2089b7e3f35b9dd2d0ed921ead4f6d318c27680d4a5bd167b3ee120edb105837
  - name: bitflags
    version: 2.4.0
    sha: b4682ae6287fcf752ecaabbfcc7b6f9b72aa33933dc23a554d853aea8eea8635
  - name: bumpalo
    version: 3.14.0
    sha: 7f30e7476521f6f8af1a1c4c0b8cc94f0bee37d91763d0ca2665f299b6cd8aec
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
  - name: core-foundation-sys
    version: 0.8.4
    sha: e496a50fda8aacccc86d7529e2c1e0892dbd0f898a6b5645b5561b89c3210efa
  - name: data-encoding
    version: 2.4.0
    sha: c2e66c9d817f1720209181c316d28635c050fa304f9c79e47a520882661b7308
  - name: drain
    version: 0.1.1
    sha: 2f1a0abf3fcefad9b4dd0e414207a7408e12b68414a01e6bb19b897d5bd7632d
  - name: endian-type
    version: 0.1.2
    sha: c34f04666d835ff5d62e058c3995147c06f42fe86ff053337632bca83e42702d
  - name: enum-as-inner
    version: 0.6.0
    sha: 5ffccbb6966c05b32ef8fbac435df276c4ae4d3dc55a8cd0eb9745e6c12f546a
  - name: equivalent
    version: 1.0.1
    sha: 5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5
  - name: errno
    version: 0.3.3
    sha: 136526188508e25c6fef639d7927dfb3e0e3084488bf202267829cf7fc23dbdd
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
    version: 0.28.0
    sha: 6fb8d784f27acf97159b40fc4db5ecd8aa23b9ad5ef69cdd136d3bc80665f0c0
  - name: hashbrown
    version: 0.14.0
    sha: 2c6201b9ff9fd90a5a3bac2e56a830d0caa509576f0e503818ee82c181b3437a
  - name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - name: hermit-abi
    version: 0.3.3
    sha: d77f7ec81a6d05a3abb01ab6eb7590f6083d08449fe5a1c8b1e620283546ccb7
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
    version: 0.4.0
    sha: 7d20d6b07bfbc108882d88ed8e37d39636dcc260e15e30c45e6ba089610b917c
  - name: indexmap
    version: 2.0.0
    sha: d5477fe2230a79769d8dc68e0eabf5437907c0457a5614a9e8dddb67f65eb65d
  - name: ipnet
    version: 2.8.0
    sha: 28b29a3cd74f0f4598934efe3aeba42bae0eb4680554128851ebbecb02af14e6
  - name: is-terminal
    version: 0.4.9
    sha: cb0889898416213fab133e1d33a0e5858a48177452750691bde3666d0fdbaf8b
  - name: itoa
    version: 1.0.9
    sha: af150ab688ff2122fcef229be89cb50dd66af9e01a4ff320cc137eecc9bacc38
  - name: js-sys
    version: 0.3.64
    sha: c5f195fe497f702db0f318b07fdd68edb16955aed830df8363d837542f8f935a
  - name: libc
    version: 0.2.148
    sha: 9cdc71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b
  - name: linux-raw-sys
    version: 0.4.7
    sha: 1a9bad9f94746442c783ca431b22403b519cd7fbeed0533fdd6328b2f2212128
  - name: log
    version: 0.4.20
    sha: b5e6163cb8c49088c2c36f57875e58ccd8c87c7427f7fbd50ea6710b2f3f2e8f
  - name: match_cfg
    version: 0.1.0
    sha: ffbee8634e0d45d258acb448e7eaab3fce7a0a467395d4d9f228e3c1f01fb2e4
  - name: memchr
    version: 2.6.3
    sha: 8f232d6ef707e1956a43342693d2a31e72989554d58299d7a88738cc95b0d35c
  - name: miniz_oxide
    version: 0.7.1
    sha: e7810e0be55b428ada41041c41f32c9f1a42817901b4ccf45fa3d4b6561e74c7
  - name: mio
    version: 0.8.8
    sha: 927a765cd3fc26206e66b296465fa9d3e5ab003e651c1b3c060e7956d96b19d2
  - name: nibble_vec
    version: 0.1.0
    sha: 77a5d83df9f36fe23f0c3648c6bbb8b0298bb5f1939c8f2704431371f4b84d43
  - name: nix
    version: 0.27.1
    sha: 2eb04e9c688eff1c89d72b407f168cf79bb9e867a9d3323ed6c01519eb9cc053
  - name: num-traits
    version: 0.2.16
    sha: f30b0abd723be7e2ffca1272140fac1a2f084c77ec3e123c192b66af1ee9e6c2
  - name: num_cpus
    version: 1.16.0
    sha: 4161fcb6d602d4d2081af7c3a45852d875a03dd337a6bfdd6e06407b61342a43
  - name: num_threads
    version: 0.1.6
    sha: 2819ce041d2ee131036f4fc9d6ae7ae125a3a40e97ba64d04fe799ad9dabbb44
  - name: object
    version: 0.32.1
    sha: 9cf5f9dd3933bd50a9e1f149ec995f39ae2c496d31fd772c1fd45ebc27e902b0
  - name: once_cell
    version: 1.18.0
    sha: dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d
  - name: percent-encoding
    version: 2.3.0
    sha: 9b2a4787296e9989611394c33f193f676704af1686e70b8f8033ab5ba9a35a94
  - name: pin-project-lite
    version: 0.2.13
    sha: 8afb450f006bf6385ca15ef45d71d2288452bc3683ce2e2cacc0d18e4be60b58
  - name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - name: ppv-lite86
    version: 0.2.17
    sha: 5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de
  - name: proc-macro2
    version: 1.0.67
    sha: 3d433d9f1a3e8c1263d9456598b16fec66f4acc9a74dacffd35c7bb09b3a1328
  - name: quick-error
    version: 1.2.3
    sha: a1d01941d82fa2ab50be1e79e6714289dd7cde78eba4c074bc5a4374f650dfe0
  - name: quote
    version: 1.0.33
    sha: 5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae
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
    version: 0.38.14
    sha: 747c788e9ce8e92b12cd485c49ddf90723550b654b32508f979b71a7b1ecda4f
  - name: serde
    version: 1.0.188
    sha: cf9e0fcba69a370eed61bcf2b728575f726b50b55cba78064753d708ddc7549e
  - name: serde_derive
    version: 1.0.188
    sha: 4eca7ac642d82aa35b60049a6eccb4be6be75e599bd2e9adb5f875a737654af2
  - name: serde_spanned
    version: 0.6.3
    sha: 96426c9936fd7a0124915f9185ea1d20aa9445cc9821142f0a73bc9207a2e186
  - name: signal-hook
    version: 0.3.17
    sha: 8621587d4798caf8eb44879d42e56b9a93ea5dcd315a6487c357130095b62801
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
    version: 0.5.4
    sha: 4031e820eb552adee9295814c0ced9e5cf38ddf1e8b7d566d6de8e2538ea989e
  - name: strsim
    version: 0.10.0
    sha: 73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623
  - name: syn
    version: 2.0.37
    sha: 7303ef2c05cd654186cb250d29049a24840ca25d2747c25c0381c8d9e2f582e8
  - name: syslog
    version: 6.1.0
    sha: 7434e95bcccce1215d30f4bf84fe8c00e8de1b9be4fb736d747ca53d36e7f96f
  - name: thiserror
    version: 1.0.48
    sha: 9d6d7a740b8a666a7e828dd00da9c0dc290dff53154ea77ac109281de90589b7
  - name: thiserror-impl
    version: 1.0.48
    sha: 49922ecae66cc8a249b77e68d1d0623c1b2c514f0060c27cdc68bd62a1219d35
  - name: time
    version: 0.3.23
    sha: 59e399c068f43a5d116fedaf73b203fa4f9c519f17e2b34f63221d3792f81446
  - name: time-core
    version: 0.1.1
    sha: 7300fbefb4dadc1af235a9cef3737cea692a9d97e1b9cbcd4ebdae6f8868e6fb
  - name: time-macros
    version: 0.2.10
    sha: 96ba15a897f3c86766b757e5ac7221554c6750054d74d5b28844fce5fb36a6c4
  - name: tinyvec
    version: 1.6.0
    sha: 87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50
  - name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - name: tokio
    version: 1.32.0
    sha: 17ed6077ed6cd6c74735e21f37eb16dc3935f96878b1fe961074089cc80893f9
  - name: tokio-macros
    version: 2.1.0
    sha: 630bdcf245f78637c13ec01ffae6187cca34625e8c63150d424b59e55af2675e
  - name: toml
    version: 0.7.8
    sha: dd79e69d3b627db300ff956027cc6c3798cef26d22526befdfcd12feeb6d2257
  - name: toml_datetime
    version: 0.6.3
    sha: 7cda73e2f1397b1262d6dfdcef8aafae14d1de7748d66822d3bfeeb6d03e5e4b
  - name: toml_edit
    version: 0.19.15
    sha: 1b5bb770da30e5cbfde35a2d7b9b8a2c4b8ef89548a7a6aeab5c9a576e3e7421
  - name: tracing
    version: 0.1.37
    sha: 8ce8c33a8d48bd45d624a6e523445fd21ec13d3653cd51f681abf67418f54eb8
  - name: tracing-attributes
    version: 0.1.26
    sha: 5f4f31f56159e98206da9efd823404b79b6ef3143b4a7ab76e67b1751b25a4ab
  - name: tracing-core
    version: 0.1.31
    sha: 0955b8137a1df6f1a2e9a37d8a6656291ff0297c1a97c24e0d8425fe2312f79a
  - name: trust-dns-client
    version: 0.23.0
    sha: 8e1bcca49cb7115ce70857db94ebff3f2903b50e3e5c20b1def5cf9b1273455f
  - name: trust-dns-proto
    version: 0.23.0
    sha: 0dc775440033cb114085f6f2437682b194fa7546466024b1037e82a48a052a69
  - name: trust-dns-server
    version: 0.23.0
    sha: 0f2863cefc06d1d5605ea937bfd8939e23687bb44dd5d136217ad9378582f9cc
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
