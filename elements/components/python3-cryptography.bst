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
    sha256sum: 392cb88b597247177172e02da6b7a63deeff1937fa6fec3bbf902ebd75d97ec7
    suffix: 
      16/a7/38fdcdd634515f589c8c723608c0f0b38d66c6c2320b3095967486f3045a/cryptography-41.0.5.tar.gz
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
  - name: asn1
    version: 0.15.2
    sha: 28c19b9324de5b815b6487e0f8098312791b09de0dbf3d5c2db1fe2d95bab973
  - name: asn1_derive
    version: 0.15.2
    sha: a045c3ccad89f244a86bd1e6cf1a7bf645296e7692698b056399b6efd4639407
  - name: autocfg
    version: 1.1.0
    sha: d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa
  - name: base64
    version: 0.13.1
    sha: 9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: cc
    version: 1.0.79
    sha: 50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: foreign-types
    version: 0.3.2
    sha: f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1
  - name: foreign-types-shared
    version: 0.1.1
    sha: 00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b
  - name: indoc
    version: 1.0.9
    sha: bfa799dd5ed20a7e349f3b4639aa80d74549c81716d9ec4f994c9b5815598306
  - name: libc
    version: 0.2.144
    sha: 2b00cc1c228a6782d0f076e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1
  - name: lock_api
    version: 0.4.9
    sha: 435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df
  - name: memoffset
    version: 0.8.0
    sha: d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1
  - name: once_cell
    version: 1.17.2
    sha: 9670a07f94779e00908f3e686eab508878ebb390ba6e604d3a284c00e8d0487b
  - name: openssl
    version: 0.10.54
    sha: 69b3f656a17a6cbc115b5c7a40c616947d213ba182135b014d6051b73ab6f019
  - name: openssl-macros
    version: 0.1.1
    sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
  - name: openssl-sys
    version: 0.9.88
    sha: c2ce0f250f34a308dcfdbb351f511359857d4ed2134ba715a4eadd46e1ffd617
  - name: ouroboros
    version: 0.15.6
    sha: e1358bd1558bd2a083fed428ffeda486fbfb323e698cdda7794259d592ca72db
  - name: ouroboros_macro
    version: 0.15.6
    sha: 5f7d21ccd03305a674437ee1248f3ab5d4b1db095cf1caf49f1713ddf61956b7
  - name: parking_lot
    version: 0.12.1
    sha: 3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f
  - name: parking_lot_core
    version: 0.9.7
    sha: 9069cbb9f99e3a5083476ccb29ceb1de18b9118cafa53e90c9551235de2b9521
  - name: pem
    version: 1.1.1
    sha: a8835c273a76a90455d7344889b0964598e3316e2a79ede8e36f16bdcf2228b8
  - name: pkg-config
    version: 0.3.27
    sha: 26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964
  - name: proc-macro-error
    version: 1.0.4
    sha: da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c
  - name: proc-macro-error-attr
    version: 1.0.4
    sha: a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869
  - name: proc-macro2
    version: 1.0.64
    sha: 78803b62cbf1f46fde80d7c0e803111524b9877184cfe7c3033659490ac7a7da
  - name: pyo3
    version: 0.18.3
    sha: e3b1ac5b3731ba34fdaa9785f8d74d17448cd18f30cf19e0c7e7b1fdb5272109
  - name: pyo3-build-config
    version: 0.18.3
    sha: 9cb946f5ac61bb61a5014924910d936ebd2b23b705f7a4a3c40b05c720b079a3
  - name: pyo3-ffi
    version: 0.18.3
    sha: fd4d7c5337821916ea2a1d21d1092e8443cf34879e53a0ac653fbb98f44ff65c
  - name: pyo3-macros
    version: 0.18.3
    sha: a9d39c55dab3fc5a4b25bbd1ac10a2da452c4aca13bb450f22818a002e29648d
  - name: pyo3-macros-backend
    version: 0.18.3
    sha: 97daff08a4c48320587b5224cc98d609e3c27b6d437315bd40b605c98eeb5918
  - name: quote
    version: 1.0.28
    sha: 1b9ab9c7eadfd8df19006f1cf1a4aed13540ed5cbc047010ece5826e10825488
  - name: redox_syscall
    version: 0.2.16
    sha: fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a
  - name: scopeguard
    version: 1.1.0
    sha: d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd
  - name: smallvec
    version: 1.10.0
    sha: a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0
  - name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - name: syn
    version: 2.0.18
    sha: 32d41677bcbe24c20c52e7c70b0d8db04134c5d1066bf98662e2871ad200ea3e
  - name: target-lexicon
    version: 0.12.7
    sha: fd1ba337640d60c3e96bc6f0638a939b9c9a7f2c316a1598c279828b3d1dc8c5
  - name: unicode-ident
    version: 1.0.9
    sha: b15811caf2415fb889178633e7724bad2509101cde276048e013b9def5e51fa0
  - name: unindent
    version: 0.1.11
    sha: e1766d682d402817b5ac4490b3c3002d91dfa0d22812f341609f97b08757359c
  - name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
  - name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - name: windows-sys
    version: 0.45.0
    sha: 75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0
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
