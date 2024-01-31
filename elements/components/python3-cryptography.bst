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
    sha256sum: e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc8c93827c57eab6cf888
    suffix: 
      0f/6f/40f1b5c6bafc809dd21a9e577458ecc1d8062a7e10148d140f402b535eaa/cryptography-42.0.2.tar.gz
- kind: cargo
  url: crates:crates
  cargo-lock: src/rust/Cargo.lock
  ref:
  - name: asn1
    version: 0.15.5
    sha: ae3ecbce89a22627b5e8e6e11d69715617138290289e385cde773b1fe50befdb
  - name: asn1_derive
    version: 0.15.5
    sha: 861af988fac460ac69a09f41e6217a8fb9178797b76fcc9478444be6a59be19c
  - name: autocfg
    version: 1.1.0
    sha: d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa
  - name: base64
    version: 0.21.7
    sha: 9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: bitflags
    version: 2.4.2
    sha: ed570934406eb16438a4e976b1b4500774099c13b8cb96eec99f620f05090ddf
  - name: cc
    version: 1.0.83
    sha: f1174fb0b6ec23863f8b971027804a42614e347eafb0a95bf0b12cdae21fc4d0
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: foreign-types
    version: 0.3.2
    sha: f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1
  - name: foreign-types-shared
    version: 0.1.1
    sha: 00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b
  - name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - name: indoc
    version: 2.0.4
    sha: 1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8
  - name: libc
    version: 0.2.152
    sha: 13e3bf6590cbc649f4d1a3eefc9d5d6eb746f5200ffb04e5e142700b8faa56e7
  - name: lock_api
    version: 0.4.11
    sha: 3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45
  - name: memoffset
    version: 0.9.0
    sha: 5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c
  - name: once_cell
    version: 1.19.0
    sha: 3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92
  - name: openssl
    version: 0.10.63
    sha: 15c9d69dd87a29568d4d017cfe8ec518706046a05184e5aea92d0af890b803c8
  - name: openssl-macros
    version: 0.1.1
    sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
  - name: openssl-sys
    version: 0.9.99
    sha: 22e1bf214306098e4832460f797824c05d25aacdf896f64a985fb0fd992454ae
  - name: parking_lot
    version: 0.12.1
    sha: 3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f
  - name: parking_lot_core
    version: 0.9.9
    sha: 4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e
  - name: pem
    version: 3.0.3
    sha: 1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310
  - name: pkg-config
    version: 0.3.29
    sha: 2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb
  - name: proc-macro2
    version: 1.0.78
    sha: e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae
  - name: pyo3
    version: 0.20.2
    sha: 9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0
  - name: pyo3-build-config
    version: 0.20.2
    sha: 07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be
  - name: pyo3-ffi
    version: 0.20.2
    sha: dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1
  - name: pyo3-macros
    version: 0.20.2
    sha: 05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3
  - name: pyo3-macros-backend
    version: 0.20.2
    sha: 0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f
  - name: quote
    version: 1.0.35
    sha: 291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef
  - name: redox_syscall
    version: 0.4.1
    sha: 4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa
  - name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - name: self_cell
    version: 1.0.3
    sha: 58bf37232d3bb9a2c4e641ca2a11d83b5062066f88df7fed36c28772046d65ba
  - name: smallvec
    version: 1.13.1
    sha: e6ecd384b10a64542d77071bd64bd7b231f4ed5940fba55e98c3de13824cf3d7
  - name: syn
    version: 2.0.48
    sha: 0f3531638e407dfc0814761abb7c00a5b54992b849452a0646b7f65c9f770f3f
  - name: target-lexicon
    version: 0.12.13
    sha: 69758bda2e78f098e4ccb393021a0963bb3442eac05f135c30f61b7370bbafae
  - name: unicode-ident
    version: 1.0.12
    sha: 3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b
  - name: unindent
    version: 0.2.3
    sha: c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce
  - name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
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
