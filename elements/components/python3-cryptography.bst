kind: pip

build-depends:
- public-stacks/buildsystem-python.bst
- components/python3-setuptools-rust.bst
- components/rust.bst

depends:
- components/python3.bst
- components/python3-cffi.bst

sources:
- kind: pypi
  name: cryptography
  ref:
    sha256sum: f964c7dcf7802d133e8dbd1565914fa0194f9d683d82411989889ecd701e8adf
    suffix: 12/e3/c46c274cf466b24e5d44df5d5cd31a31ff23e57f074a2bb30931a8c9b01a/cryptography-39.0.0.tar.gz
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
    version: 1.0.78
    sha: a20104e2335ce8a659d6dd92a51a767a0c062599c73b343fd152cb401e828c3d
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: chrono
    version: 0.4.23
    sha: 16b0a3d9ed01224b22057780a37bb8c5dbfe1be8ba48678e7bf57ec4b385411f
  - name: codespan-reporting
    version: 0.11.1
    sha: 3538270d33cc669650c4b093848450d380def10c331d38c768e34cac80576e6e
  - name: core-foundation-sys
    version: 0.8.3
    sha: 5827cebf4670468b8772dd191856768aedcb1b0278a04f989f7766351917b9dc
  - name: cxx
    version: 1.0.85
    sha: 5add3fc1717409d029b20c5b6903fc0c0b02fa6741d820054f4a2efa5e5816fd
  - name: cxx-build
    version: 1.0.85
    sha: b4c87959ba14bc6fbc61df77c3fcfe180fc32b93538c4f1031dd802ccb5f2ff0
  - name: cxxbridge-flags
    version: 1.0.85
    sha: 69a3e162fde4e594ed2b07d0f83c6c67b745e7f28ce58c6df5e6b6bef99dfb59
  - name: cxxbridge-macro
    version: 1.0.85
    sha: 3e7e2adeb6a0d4a282e581096b06e1791532b7d576dcde5ccd9382acf55db8e6
  - name: iana-time-zone
    version: 0.1.53
    sha: 64c122667b287044802d6ce17ee2ddf13207ed924c712de9a66a5814d5b64765
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
    version: 0.3.60
    sha: 49409df3e3bf0856b916e2ceaca09ee28e6871cf7d9ce97a692cacfdb2a25a47
  - name: libc
    version: 0.2.139
    sha: 201de327520df007757c1f0adce6e827fe8562fbc28bfd9c15571c66ca1f5f79
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
  - name: ouroboros
    version: 0.15.5
    sha: dfbb50b356159620db6ac971c6d5c9ab788c9cc38a6f49619fca2a27acb062ca
  - name: ouroboros_macro
    version: 0.15.5
    sha: 4a0d9d1a6191c4f391f87219d1ea42b23f09ee84d64763cd05ee6ea88d9f384d
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
    version: 1.1.0
    sha: 03c64931a1a212348ec4f3b4362585eca7159d0d09cbdf4a7f74f02173596fd4
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
    version: 1.0.49
    sha: 57a8eca9f9c4ffde41714334dee777596264c7825420f521abc92b5b5deb63a5
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
    version: 1.0.23
    sha: 8856d8364d252a14d474036ea1358d63c9e6965c8e5c1885c18f73d70bff9c7b
  - name: redox_syscall
    version: 0.2.16
    sha: fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a
  - name: scopeguard
    version: 1.1.0
    sha: d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd
  - name: scratch
    version: 1.0.3
    sha: ddccb15bcce173023b3fedd9436f882a0739b8dfb45e4f6b6002bee5929f61b2
  - name: smallvec
    version: 1.10.0
    sha: a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0
  - name: syn
    version: 1.0.107
    sha: 1f4064b5b16e03ae50984a5a8ed5d4f8803e6bc1fd170a3cda91a1be4b18e3f5
  - name: termcolor
    version: 1.1.3
    sha: bab24d30b911b2376f3a13cc2cd443142f0c81dda04c118693e35b3835757755
  - name: unicode-ident
    version: 1.0.6
    sha: 84a22b9f218b40614adcb3f4ff08b703773ad44fa9423e4e0d346d5db86e4ebc
  - name: unicode-width
    version: 0.1.10
    sha: c0edd1e5b14653f783770bce4a4dabb4a5108a5370a5f5d8cfe8710c361f6c8b
  - name: unindent
    version: 0.1.11
    sha: e1766d682d402817b5ac4490b3c3002d91dfa0d22812f341609f97b08757359c
  - name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - name: wasm-bindgen
    version: 0.2.83
    sha: eaf9f5aceeec8be17c128b2e93e031fb8a4d469bb9c4ae2d7dc1888b26887268
  - name: wasm-bindgen-backend
    version: 0.2.83
    sha: 4c8ffb332579b0557b52d268b91feab8df3615f265d5270fec2a8c95b17c1142
  - name: wasm-bindgen-macro
    version: 0.2.83
    sha: 052be0f94026e6cbc75cdefc9bae13fd6052cdcaf532fa6c45e7ae33a1e6c810
  - name: wasm-bindgen-macro-support
    version: 0.2.83
    sha: 07bc0c051dc5f23e307b13285f9d75df86bfdf816c5721e573dec1f9b8aa193c
  - name: wasm-bindgen-shared
    version: 0.2.83
    sha: 1c38c045535d93ec4f0b4defec448e4291638ee608530863b1e2ba115d4fff7f
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
