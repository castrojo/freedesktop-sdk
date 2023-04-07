kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/pkg-config.bst
- components/python3-setuptools-rust.bst
- components/rust.bst

depends:
- components/python3.bst
- components/python3-cffi.bst

sources:
- kind: pypi
  name: cryptography
  ref:
    sha256sum: 2803f2f8b1e95f614419926c7e6f55d828afc614ca5ed61543877ae668cc3472
    suffix: 15/d9/c679e9eda76bfc0d60c9d7a4084ca52d0631d9f24ef04f818012f6d1282e/cryptography-40.0.1.tar.gz
- kind: cargo
  url: crates:crates
  cargo-lock: src/rust/Cargo.lock
  ref:
  - name: Inflector
    version: 0.11.4
    sha: fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3
  - name: aliasable
    version: 0.1.3
    sha: 250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd
  - name: android_system_properties
    version: 0.1.5
    sha: 819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311
  - name: asn1
    version: 0.13.0
    sha: 2affba5e62ee09eeba078f01a00c4aed45ac4287e091298eccbb0d4802efbdc5
  - name: asn1_derive
    version: 0.13.0
    sha: bfab79c195875e5aef2bd20b4c8ed8d43ef9610bcffefbbcf66f88f555cc78af
  - name: autocfg
    version: 1.1.0
    sha: d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa
  - name: base64
    version: 0.13.1
    sha: 9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: bumpalo
    version: 3.10.0
    sha: 37ccbd214614c6783386c1af30caf03192f17891059cecc394b4fb119e363de3
  - name: cc
    version: 1.0.79
    sha: 50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: chrono
    version: 0.4.24
    sha: 4e3c5919066adf22df73762e50cffcde3a758f2a848b113b586d1f86728b673b
  - name: codespan-reporting
    version: 0.11.1
    sha: 3538270d33cc669650c4b093848450d380def10c331d38c768e34cac80576e6e
  - name: core-foundation-sys
    version: 0.8.3
    sha: 5827cebf4670468b8772dd191856768aedcb1b0278a04f989f7766351917b9dc
  - name: cxx
    version: 1.0.86
    sha: 51d1075c37807dcf850c379432f0df05ba52cc30f279c5cfc43cc221ce7f8579
  - name: cxx-build
    version: 1.0.86
    sha: 5044281f61b27bc598f2f6647d480aed48d2bf52d6eb0b627d84c0361b17aa70
  - name: cxxbridge-flags
    version: 1.0.86
    sha: 61b50bc93ba22c27b0d31128d2d130a0a6b3d267ae27ef7e4fae2167dfe8781c
  - name: cxxbridge-macro
    version: 1.0.86
    sha: 39e61fda7e62115119469c7b3591fd913ecca96fb766cfd3f2e2502ab7bc87a5
  - name: foreign-types
    version: 0.3.2
    sha: f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1
  - name: foreign-types-shared
    version: 0.1.1
    sha: 00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b
  - name: iana-time-zone
    version: 0.1.54
    sha: 0c17cc76786e99f8d2f055c11159e7f0091c42474dcc3189fbab96072e873e6d
  - name: iana-time-zone-haiku
    version: 0.1.1
    sha: 0703ae284fc167426161c2e3f1da3ea71d94b21bedbcc9494e92b28e334e3dca
  - name: indoc
    version: 0.3.6
    sha: 47741a8bc60fb26eb8d6e0238bbb26d8575ff623fdc97b1a2c00c050b9684ed8
  - name: indoc-impl
    version: 0.3.6
    sha: ce046d161f000fffde5f432a0d034d0341dc152643b2598ed5bfce44c4f3a8f0
  - name: instant
    version: 0.1.12
    sha: 7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c
  - name: js-sys
    version: 0.3.61
    sha: 445dde2150c55e483f3d8416706b97ec8e8237c307e5b7b4b8dd15e6af2a0730
  - name: libc
    version: 0.2.140
    sha: 99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f80c
  - name: link-cplusplus
    version: 1.0.8
    sha: ecd207c9c713c34f95a097a5b029ac2ce6010530c7b49d7fea24d977dede04f5
  - name: lock_api
    version: 0.4.9
    sha: 435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df
  - name: log
    version: 0.4.17
    sha: abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e
  - name: num-integer
    version: 0.1.45
    sha: 225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9
  - name: num-traits
    version: 0.2.15
    sha: 578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd
  - name: once_cell
    version: 1.14.0
    sha: 2f7254b99e31cad77da24b08ebf628882739a608578bb1bcdfc1f9c21260d7c0
  - name: openssl
    version: 0.10.48
    sha: 518915b97df115dd36109bfa429a48b8f737bd05508cf9588977b599648926d2
  - name: openssl-macros
    version: 0.1.0
    sha: b501e44f11665960c7e7fcf062c7d96a14ade4aa98116c004b2e37b5be7d736c
  - name: openssl-sys
    version: 0.9.83
    sha: 666416d899cf077260dac8698d60a60b435a46d57e82acb1be3d0dad87284e5b
  - name: ouroboros
    version: 0.15.6
    sha: e1358bd1558bd2a083fed428ffeda486fbfb323e698cdda7794259d592ca72db
  - name: ouroboros_macro
    version: 0.15.6
    sha: 5f7d21ccd03305a674437ee1248f3ab5d4b1db095cf1caf49f1713ddf61956b7
  - name: parking_lot
    version: 0.11.2
    sha: 7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99
  - name: parking_lot_core
    version: 0.8.6
    sha: 60a2cfe6f0ad2bfc16aefa463b497d5c7a5ecd44a23efa72aa342d90177356dc
  - name: paste
    version: 0.1.18
    sha: 45ca20c77d80be666aef2b45486da86238fabe33e38306bd3118fe4af33fa880
  - name: paste-impl
    version: 0.1.18
    sha: d95a7db200b97ef370c8e6de0088252f7e0dfff7d047a28528e47456c0fc98b6
  - name: pem
    version: 1.1.1
    sha: a8835c273a76a90455d7344889b0964598e3316e2a79ede8e36f16bdcf2228b8
  - name: pkg-config
    version: 0.3.26
    sha: 6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160
  - name: proc-macro-error
    version: 1.0.4
    sha: da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c
  - name: proc-macro-error-attr
    version: 1.0.4
    sha: a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869
  - name: proc-macro-hack
    version: 0.5.20+deprecated
    sha: dc375e1527247fe1a97d8b7156678dfe7c1af2fc075c9a4db3690ecd2a148068
  - name: proc-macro2
    version: 1.0.53
    sha: ba466839c78239c09faf015484e5cc04860f88242cff4d03eb038f04b4699b73
  - name: pyo3
    version: 0.15.2
    sha: d41d50a7271e08c7c8a54cd24af5d62f73ee3a6f6a314215281ebdec421d5752
  - name: pyo3-build-config
    version: 0.15.2
    sha: 779239fc40b8e18bc8416d3a37d280ca9b9fb04bda54b98037bb6748595c2410
  - name: pyo3-macros
    version: 0.15.2
    sha: 00b247e8c664be87998d8628e86f282c25066165f1f8dda66100c48202fdb93a
  - name: pyo3-macros-backend
    version: 0.15.2
    sha: 5a8c2812c412e00e641d99eeb79dd478317d981d938aa60325dfa7157b607095
  - name: quote
    version: 1.0.26
    sha: 4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc
  - name: redox_syscall
    version: 0.2.16
    sha: fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a
  - name: scopeguard
    version: 1.1.0
    sha: d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd
  - name: scratch
    version: 1.0.5
    sha: 1792db035ce95be60c3f8853017b3999209281c24e2ba5bc8e59bf97a0c590c1
  - name: smallvec
    version: 1.10.0
    sha: a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0
  - name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - name: termcolor
    version: 1.2.0
    sha: be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6
  - name: unicode-ident
    version: 1.0.8
    sha: e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4
  - name: unicode-width
    version: 0.1.10
    sha: c0edd1e5b14653f783770bce4a4dabb4a5108a5370a5f5d8cfe8710c361f6c8b
  - name: unindent
    version: 0.1.11
    sha: e1766d682d402817b5ac4490b3c3002d91dfa0d22812f341609f97b08757359c
  - name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
  - name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - name: wasm-bindgen
    version: 0.2.84
    sha: 31f8dcbc21f30d9b8f2ea926ecb58f6b91192c17e9d33594b3df58b2007ca53b
  - name: wasm-bindgen-backend
    version: 0.2.84
    sha: 95ce90fd5bcc06af55a641a86428ee4229e44e07033963a2290a8e241607ccb9
  - name: wasm-bindgen-macro
    version: 0.2.84
    sha: 4c21f77c0bedc37fd5dc21f897894a5ca01e7bb159884559461862ae90c0b4c5
  - name: wasm-bindgen-macro-support
    version: 0.2.84
    sha: 2aff81306fcac3c7515ad4e177f521b5c9a15f2b08f4e32d823066102f35a5f6
  - name: wasm-bindgen-shared
    version: 0.2.84
    sha: 0046fef7e28c3804e5e38bfa31ea2a0f73905319b677e57ebe37e49358989b5d
  - name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - name: winapi-util
    version: 0.1.5
    sha: 70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178
  - name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - name: windows
    version: 0.46.0
    sha: cdacb41e6a96a052c6cb63a144f24900236121c6f63f4f8219fef5977ecb0c25
  - name: windows-targets
    version: 0.42.2
    sha: 8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071
  - name: windows_aarch64_gnullvm
    version: 0.42.2
    sha: 597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8
  - name: windows_aarch64_msvc
    version: 0.42.2
    sha: e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43
  - name: windows_i686_gnu
    version: 0.42.2
    sha: c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f
  - name: windows_i686_msvc
    version: 0.42.2
    sha: 44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060
  - name: windows_x86_64_gnu
    version: 0.42.2
    sha: 8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36
  - name: windows_x86_64_gnullvm
    version: 0.42.2
    sha: 26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3
  - name: windows_x86_64_msvc
    version: 0.42.2
    sha: 9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0
