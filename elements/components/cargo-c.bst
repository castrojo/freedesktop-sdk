kind: manual

build-depends:
- components/rust.bst
- components/pkg-config.bst
- bootstrap/findutils.bst
- components/gcc.bst
- components/stripper.bst

depends:
- public-stacks/runtime-minimal.bst
- components/openssl.bst
- components/curl.bst

config:
  build-commands:
  - cargo build --release --frozen --offline

  install-commands:
  - |
    find "target/release" -maxdepth 1 -type f -executable -exec install -Dm755 -t "%{install-root}%{bindir}" {} +

  - |
    %{install-extra}

sources:
- kind: git_repo
  url: github:lu-zero/cargo-c.git
  track: v*.*.*
  ref: v0.10.16-0-g5091d9613fc6536f2beb0e7e037597fe0e0146bf
- kind: remote
  url: github_files:lu-zero/cargo-c/releases/download/v0.10.16/Cargo.lock
  ref: 5b4201d68d52bd9cbf928d48ae9274131c604fe7b21149841fd07cc78a50b36e
- kind: cargo2
  ref:
  - kind: registry
    name: adler2
    version: 2.0.1
    sha: 320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa
  - kind: registry
    name: aho-corasick
    version: 1.1.3
    sha: 8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916
  - kind: registry
    name: allocator-api2
    version: 0.2.21
    sha: 683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923
  - kind: registry
    name: annotate-snippets
    version: 0.11.5
    sha: 710e8eae58854cdc1790fcb56cca04d712a17be849eeb81da2a724bf4bae2bc4
  - kind: registry
    name: anstream
    version: 0.6.20
    sha: 3ae563653d1938f79b1ab1b5e668c87c76a9930414574a6583a7b7e11a8e6192
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
    version: 1.1.4
    sha: 9e231f6134f61b71076a3eab506c379d4f36122f2af15a9ff04415ea4c3339e2
  - kind: registry
    name: anstyle-wincon
    version: 3.0.10
    sha: 3e0633414522a32ffaac8ac6cc8f748e090c5717661fddeea04219e2344f5f2a
  - kind: registry
    name: anyhow
    version: 1.0.100
    sha: a23eb6b1614318a8071c9b2521f36b424b2c83db5eb3a0fead4a6c0809af6e61
  - kind: registry
    name: arc-swap
    version: 1.7.1
    sha: 69f7f8c3906b62b754cd5326047894316021dcfe5a194c8ea52bdd94934a3457
  - kind: registry
    name: arrayref
    version: 0.3.9
    sha: 76a2e8124351fda1ef8aaaa3bbd7ebbcb486bbcd4225aca0aa0d84bb2db8fecb
  - kind: registry
    name: arrayvec
    version: 0.7.6
    sha: 7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50
  - kind: registry
    name: autocfg
    version: 1.5.0
    sha: c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8
  - kind: registry
    name: base16ct
    version: 0.2.0
    sha: 4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: base64ct
    version: 1.8.0
    sha: 55248b47b0caf0546f7988906588779981c43bb1bc9d0c44087278f80cdb44ba
  - kind: registry
    name: bitflags
    version: 2.9.4
    sha: 2261d10cca569e4643e526d8dc2e62e433cc8aba21ab764233731f8d369bf394
  - kind: registry
    name: bitmaps
    version: 2.1.0
    sha: 031043d04099746d8db04daf1fa424b2bc8bd69d92b25962dcde24da39ab64a2
  - kind: registry
    name: blake3
    version: 1.8.2
    sha: 3888aaa89e4b2a40fca9848e400f6a658a5a3978de7be858e209cafa8be9a4a0
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: bstr
    version: 1.12.0
    sha: 234113d19d0d7d613b40e86fb654acf958910802bcceab913a4f9e7cda03b1a4
  - kind: registry
    name: bumpalo
    version: 3.19.0
    sha: 46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43
  - kind: registry
    name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - kind: registry
    name: bytes
    version: 1.10.1
    sha: d71b6127be86fdcfddb610f7182ac57211d4b18a3e9c82eb2d17662f2227ad6a
  - kind: registry
    name: cargo
    version: 0.91.0
    sha: 0f46c7f53180bf46c220e2af1ceff951e2ce088184fa9009ad6915efee25915d
  - kind: registry
    name: cargo-credential
    version: 0.4.9
    sha: e36f089041deadf16226478a7737a833864fbda09408c7af237b9d615eeb6d69
  - kind: registry
    name: cargo-credential-libsecret
    version: 0.5.1
    sha: 2bad275302dfd55e54dcd555c7129cd76a4b4d7236c6a779370683014cba0a90
  - kind: registry
    name: cargo-credential-macos-keychain
    version: 0.4.16
    sha: a9f95d842bd047476c65e1d4a5f681f1d158f8c784edfc4ae245a2430ca09f02
  - kind: registry
    name: cargo-credential-wincred
    version: 0.4.16
    sha: 1c238839b7d5e5b62836277b4c83c9ed17d9ca7334b298c814c223b2e691ff76
  - kind: registry
    name: cargo-platform
    version: 0.3.1
    sha: 122ec45a44b270afd1402f351b782c676b173e3c3fb28d86ff7ebfb4d86a4ee4
  - kind: registry
    name: cargo-util
    version: 0.2.23
    sha: 5fbac95faac578313b0ba60f9a5594a97cae42692f23b133ecd17615dedca50e
  - kind: registry
    name: cargo-util-schemas
    version: 0.10.0
    sha: b45c9672203db3caf908423f25bc31f3b6a814a9d22f2380048236498a312e75
  - kind: registry
    name: cbindgen
    version: 0.29.0
    sha: 975982cdb7ad6a142be15bdf84aea7ec6a9e5d4d797c004d43185b24cfe4e684
  - kind: registry
    name: cc
    version: 1.2.38
    sha: 80f41ae168f955c12fb8960b057d70d0ca153fb83182b57d86380443527be7e9
  - kind: registry
    name: cfg-if
    version: 1.0.3
    sha: 2fd1289c04a9ea8cb22300a459a72a385d7c73d3259e2ed7dcb2af674838cfa9
  - kind: registry
    name: clap
    version: 4.5.48
    sha: e2134bb3ea021b78629caa971416385309e0131b351b25e01dc16fb54e1b5fae
  - kind: registry
    name: clap_builder
    version: 4.5.48
    sha: c2ba64afa3c0a6df7fa517765e31314e983f51dda798ffba27b988194fb65dc9
  - kind: registry
    name: clap_complete
    version: 4.5.58
    sha: 75bf0b32ad2e152de789bb635ea4d3078f6b838ad7974143e99b99f45a04af4a
  - kind: registry
    name: clap_derive
    version: 4.5.47
    sha: bbfd7eae0b0f1a6e63d4b13c9c478de77c2eb546fba158ad50b4203dc24b9f9c
  - kind: registry
    name: clap_lex
    version: 0.7.5
    sha: b94f61472cee1439c0b966b47e3aca9ae07e45d070759512cd390ea2bebc6675
  - kind: registry
    name: clru
    version: 0.6.2
    sha: cbd0f76e066e64fdc5631e3bb46381254deab9ef1158292f27c8c57e3bf3fe59
  - kind: registry
    name: color-print
    version: 0.3.7
    sha: 3aa954171903797d5623e047d9ab69d91b493657917bdfb8c2c80ecaf9cdb6f4
  - kind: registry
    name: color-print-proc-macro
    version: 0.3.7
    sha: 692186b5ebe54007e45a59aea47ece9eb4108e141326c304cdc91699a7118a22
  - kind: registry
    name: colorchoice
    version: 1.0.4
    sha: b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75
  - kind: registry
    name: const-oid
    version: 0.9.6
    sha: c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8
  - kind: registry
    name: constant_time_eq
    version: 0.3.1
    sha: 7c74b8349d32d297c9134b8c88677813a227df8f779daa29bfc29c183fe3dca6
  - kind: registry
    name: core-foundation
    version: 0.10.1
    sha: b2a6cd9ae233e7f62ba4e9353e81a88df7fc8a5987b8d445b4d90c879bd156f6
  - kind: registry
    name: core-foundation-sys
    version: 0.8.7
    sha: 773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b
  - kind: registry
    name: cpufeatures
    version: 0.2.17
    sha: 59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280
  - kind: registry
    name: crates-io
    version: 0.40.13
    sha: 1986712716d18d860258fdbd03fd9d9e20f1ffb974d8a203816c58b68c6b9012
  - kind: registry
    name: crc32fast
    version: 1.5.0
    sha: 9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511
  - kind: registry
    name: crossbeam-channel
    version: 0.5.15
    sha: 82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2
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
    version: 0.5.5
    sha: 0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76
  - kind: registry
    name: crypto-common
    version: 0.1.6
    sha: 1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3
  - kind: registry
    name: ct-codecs
    version: 1.1.6
    sha: 9b10589d1a5e400d61f9f38f12f884cfd080ff345de8f17efda36fe0e4a02aa8
  - kind: registry
    name: curl
    version: 0.4.49
    sha: 79fc3b6dd0b87ba36e565715bf9a2ced221311db47bd18011676f24a6066edbc
  - kind: registry
    name: curl-sys
    version: 0.4.83+curl-8.15.0
    sha: 5830daf304027db10c82632a464879d46a3f7c4ba17a31592657ad16c719b483
  - kind: registry
    name: dashmap
    version: 6.1.0
    sha: 5041cc499144891f3790297212f32a74fb938e5136a14943f338ef9e0ae276cf
  - kind: registry
    name: der
    version: 0.7.10
    sha: e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb
  - kind: registry
    name: deranged
    version: 0.5.3
    sha: d630bccd429a5bb5a64b5e94f693bfc48c9f8566418fda4c494cc94f911f87cc
  - kind: registry
    name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - kind: registry
    name: displaydoc
    version: 0.2.5
    sha: 97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0
  - kind: registry
    name: dunce
    version: 1.0.5
    sha: 92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813
  - kind: registry
    name: ecdsa
    version: 0.16.9
    sha: ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca
  - kind: registry
    name: ed25519-compact
    version: 2.1.1
    sha: e9b3460f44bea8cd47f45a0c70892f1eff856d97cd55358b2f73f663789f6190
  - kind: registry
    name: either
    version: 1.15.0
    sha: 48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719
  - kind: registry
    name: elliptic-curve
    version: 0.13.8
    sha: b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47
  - kind: registry
    name: encoding_rs
    version: 0.8.35
    sha: 75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3
  - kind: registry
    name: equivalent
    version: 1.0.2
    sha: 877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f
  - kind: registry
    name: erased-serde
    version: 0.4.8
    sha: 259d404d09818dec19332e31d94558aeb442fea04c817006456c24b5460bbd4b
  - kind: registry
    name: errno
    version: 0.3.14
    sha: 39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb
  - kind: registry
    name: fallible-iterator
    version: 0.3.0
    sha: 2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649
  - kind: registry
    name: fallible-streaming-iterator
    version: 0.1.9
    sha: 7360491ce676a36bf9bb3c56c1aa791658183a54d2744120f27285738d90465a
  - kind: registry
    name: faster-hex
    version: 0.10.0
    sha: 7223ae2d2f179b803433d9c830478527e92b8117eab39460edae7f1614d9fb73
  - kind: registry
    name: fastrand
    version: 2.3.0
    sha: 37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be
  - kind: registry
    name: ff
    version: 0.13.1
    sha: c0b50bfb653653f9ca9095b427bed08ab8d75a137839d9ad64eb11810d5b6393
  - kind: registry
    name: fiat-crypto
    version: 0.3.0
    sha: 64cd1e32ddd350061ae6edb1b082d7c54915b5c672c389143b9a63403a109f24
  - kind: registry
    name: filetime
    version: 0.2.26
    sha: bc0505cd1b6fa6580283f6bdf70a73fcf4aba1184038c90902b92b3dd0df63ed
  - kind: registry
    name: find-msvc-tools
    version: 0.1.2
    sha: 1ced73b1dacfc750a6db6c0a0c3a3853c8b41997e2e2c563dc90804ae6867959
  - kind: registry
    name: flate2
    version: 1.1.2
    sha: 4a3d7db9596fecd151c5f638c0ee5d5bd487b6e0ea232e5dc96d5250f6f94b1d
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
    version: 1.2.2
    sha: cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf
  - kind: registry
    name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - kind: registry
    name: getrandom
    version: 0.2.16
    sha: 335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592
  - kind: registry
    name: getrandom
    version: 0.3.3
    sha: 26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4
  - kind: registry
    name: git2
    version: 0.20.2
    sha: 2deb07a133b1520dc1a5690e9bd08950108873d7ed5de38dcc74d3b5ebffa110
  - kind: registry
    name: git2-curl
    version: 0.21.0
    sha: be8dcabbc09ece4d30a9aa983d5804203b7e2f8054a171f792deff59b56d31fa
  - kind: registry
    name: gix
    version: 0.73.0
    sha: 514c29cc879bdc0286b0cbc205585a49b252809eb86c69df4ce4f855ee75f635
  - kind: registry
    name: gix-actor
    version: 0.35.4
    sha: 2d36dcf9efe32b51b12dfa33cedff8414926124e760a32f9e7a6b5580d280967
  - kind: registry
    name: gix-attributes
    version: 0.27.0
    sha: 45442188216d08a5959af195f659cb1f244a50d7d2d0c3873633b1cd7135f638
  - kind: registry
    name: gix-bitmap
    version: 0.2.14
    sha: b1db9765c69502650da68f0804e3dc2b5f8ccc6a2d104ca6c85bc40700d37540
  - kind: registry
    name: gix-chunk
    version: 0.4.11
    sha: 0b1f1d8764958699dc764e3f727cef280ff4d1bd92c107bbf8acd85b30c1bd6f
  - kind: registry
    name: gix-command
    version: 0.6.2
    sha: 6b31b65ca48a352ae86312b27a514a0c661935f96b481ac8b4371f65815eb196
  - kind: registry
    name: gix-commitgraph
    version: 0.29.0
    sha: 6bb23121e952f43a5b07e3e80890336cb847297467a410475036242732980d06
  - kind: registry
    name: gix-config
    version: 0.46.0
    sha: 5dfb898c5b695fd4acfc3c0ab638525a65545d47706064dcf7b5ead6cdb136c0
  - kind: registry
    name: gix-config-value
    version: 0.15.1
    sha: 9f012703eb67e263c6c1fc96649fec47694dd3e5d2a91abfc65e4a6a6dc85309
  - kind: registry
    name: gix-credentials
    version: 0.30.0
    sha: 0039dd3ac606dd80b16353a41b61fc237ca5cb8b612f67a9f880adfad4be4e05
  - kind: registry
    name: gix-date
    version: 0.10.5
    sha: 996b6b90bafb287330af92b274c3e64309dc78359221d8612d11cd10c8b9fe1c
  - kind: registry
    name: gix-diff
    version: 0.53.0
    sha: de854852010d44a317f30c92d67a983e691c9478c8a3fb4117c1f48626bcdea8
  - kind: registry
    name: gix-dir
    version: 0.15.0
    sha: dad34e4f373f94902df1ba1d2a1df3a1b29eacd15e316ac5972d842e31422dd7
  - kind: registry
    name: gix-discover
    version: 0.41.0
    sha: ffb180c91ca1a2cf53e828bb63d8d8f8fa7526f49b83b33d7f46cbeb5d79d30a
  - kind: registry
    name: gix-features
    version: 0.43.1
    sha: cd1543cd9b8abcbcebaa1a666a5c168ee2cda4dea50d3961ee0e6d1c42f81e5b
  - kind: registry
    name: gix-filter
    version: 0.20.0
    sha: aa6571a3927e7ab10f64279a088e0dae08e8da05547771796d7389bbe28ad9ff
  - kind: registry
    name: gix-fs
    version: 0.16.1
    sha: 9a4d90307d064fa7230e0f87b03231be28f8ba63b913fc15346f489519d0c304
  - kind: registry
    name: gix-glob
    version: 0.21.0
    sha: b947db8366823e7a750c254f6bb29e27e17f27e457bf336ba79b32423db62cd5
  - kind: registry
    name: gix-hash
    version: 0.19.0
    sha: 251fad79796a731a2a7664d9ea95ee29a9e99474de2769e152238d4fdb69d50e
  - kind: registry
    name: gix-hashtable
    version: 0.9.0
    sha: c35300b54896153e55d53f4180460931ccd69b7e8d2f6b9d6401122cdedc4f07
  - kind: registry
    name: gix-ignore
    version: 0.16.0
    sha: 564d6fddf46e2c981f571b23d6ad40cb08bddcaf6fc7458b1d49727ad23c2870
  - kind: registry
    name: gix-index
    version: 0.41.0
    sha: 2af39fde3ce4ce11371d9ce826f2936ec347318f2d1972fe98c2e7134e267e25
  - kind: registry
    name: gix-lock
    version: 18.0.0
    sha: b9fa71da90365668a621e184eb5b979904471af1b3b09b943a84bc50e8ad42ed
  - kind: registry
    name: gix-negotiate
    version: 0.21.0
    sha: 1d58d4c9118885233be971e0d7a589f5cfb1a8bd6cb6e2ecfb0fc6b1b293c83b
  - kind: registry
    name: gix-object
    version: 0.50.2
    sha: d69ce108ab67b65fbd4fb7e1331502429d78baeb2eee10008bdef55765397c07
  - kind: registry
    name: gix-odb
    version: 0.70.0
    sha: 9c9d7af10fda9df0bb4f7f9bd507963560b3c66cb15a5b825caf752e0eb109ac
  - kind: registry
    name: gix-pack
    version: 0.60.0
    sha: d8571df89bfca5abb49c3e3372393f7af7e6f8b8dbe2b96303593cef5b263019
  - kind: registry
    name: gix-packetline
    version: 0.19.1
    sha: 2592fbd36249a2fea11056f7055cc376301ef38d903d157de41998335bbf1f93
  - kind: registry
    name: gix-packetline-blocking
    version: 0.19.1
    sha: fc4e706f328cd494cc8f932172e123a72b9a4711b0db5e411681432a89bd4c94
  - kind: registry
    name: gix-path
    version: 0.10.20
    sha: 06d37034a4c67bbdda76f7bcd037b2f7bc0fba0c09a6662b19697a5716e7b2fd
  - kind: registry
    name: gix-pathspec
    version: 0.12.0
    sha: daedead611c9bd1f3640dc90a9012b45f790201788af4d659f28d94071da7fba
  - kind: registry
    name: gix-prompt
    version: 0.11.1
    sha: 6ffa1a7a34c81710aaa666a428c142b6c5d640492fcd41267db0740d923c7906
  - kind: registry
    name: gix-protocol
    version: 0.51.0
    sha: 12b4b807c47ffcf7c1e5b8119585368a56449f3493da93b931e1d4239364e922
  - kind: registry
    name: gix-quote
    version: 0.6.0
    sha: 4a375a75b4d663e8bafe3bf4940a18a23755644c13582fa326e99f8f987d83fd
  - kind: registry
    name: gix-ref
    version: 0.53.1
    sha: b966f578079a42f4a51413b17bce476544cca1cf605753466669082f94721758
  - kind: registry
    name: gix-refspec
    version: 0.31.0
    sha: 7d29cae1ae31108826e7156a5e60bffacab405f4413f5bc0375e19772cce0055
  - kind: registry
    name: gix-revision
    version: 0.35.0
    sha: f651f2b1742f760bb8161d6743229206e962b73d9c33c41f4e4aefa6586cbd3d
  - kind: registry
    name: gix-revwalk
    version: 0.21.0
    sha: 06e74f91709729e099af6721bd0fa7d62f243f2005085152301ca5cdd86ec02c
  - kind: registry
    name: gix-sec
    version: 0.12.0
    sha: 09f7053ed7c66633b56c57bc6ed3377be3166eaf3dc2df9f1c5ec446df6fdf2c
  - kind: registry
    name: gix-shallow
    version: 0.5.0
    sha: d936745103243ae4c510f19e0760ce73fb0f08096588fdbe0f0d7fb7ce8944b7
  - kind: registry
    name: gix-status
    version: 0.20.0
    sha: 2a4afff9b34eeececa8bdc32b42fb318434b6b1391d9f8d45fe455af08dc2d35
  - kind: registry
    name: gix-submodule
    version: 0.20.0
    sha: 657cc5dd43cbc7a14d9c5aaf02cfbe9c2a15d077cded3f304adb30ef78852d3e
  - kind: registry
    name: gix-tempfile
    version: 18.0.0
    sha: 666c0041bcdedf5fa05e9bef663c897debab24b7dc1741605742412d1d47da57
  - kind: registry
    name: gix-trace
    version: 0.1.13
    sha: e2ccaf54b0b1743a695b482ca0ab9d7603744d8d10b2e5d1a332fef337bee658
  - kind: registry
    name: gix-transport
    version: 0.48.0
    sha: 12f7cc0179fc89d53c54e1f9ce51229494864ab4bf136132d69db1b011741ca3
  - kind: registry
    name: gix-traverse
    version: 0.47.0
    sha: c7cdc82509d792ba0ad815f86f6b469c7afe10f94362e96c4494525a6601bdd5
  - kind: registry
    name: gix-url
    version: 0.32.0
    sha: 1b76a9d266254ad287ffd44467cd88e7868799b08f4d52e02d942b93e514d16f
  - kind: registry
    name: gix-utils
    version: 0.3.0
    sha: 5351af2b172caf41a3728eb4455326d84e0d70fe26fc4de74ab0bd37df4191c5
  - kind: registry
    name: gix-validate
    version: 0.10.0
    sha: 77b9e00cacde5b51388d28ed746c493b18a6add1f19b5e01d686b3b9ece66d4d
  - kind: registry
    name: gix-worktree
    version: 0.42.0
    sha: 55f625ac9126c19bef06dbc6d2703cdd7987e21e35b497bb265ac37d383877b1
  - kind: registry
    name: glob
    version: 0.3.3
    sha: 0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280
  - kind: registry
    name: globset
    version: 0.4.16
    sha: 54a1028dfc5f5df5da8a56a73e6c153c9a9708ec57232470703592a3f18e49f5
  - kind: registry
    name: group
    version: 0.13.0
    sha: f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63
  - kind: registry
    name: hash32
    version: 0.3.1
    sha: 47d60b12902ba28e2730cd37e95b8c9223af2808df9e902d4df49588d1470606
  - kind: registry
    name: hashbrown
    version: 0.14.5
    sha: e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1
  - kind: registry
    name: hashbrown
    version: 0.15.5
    sha: 9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1
  - kind: registry
    name: hashbrown
    version: 0.16.0
    sha: 5419bdc4f6a9207fbeba6d11b604d481addf78ecd10c11ad51e76c2f6482748d
  - kind: registry
    name: hashlink
    version: 0.10.0
    sha: 7382cf6263419f2d8df38c55d7da83da5c18aef87fc7a7fc1fb1e344edfe14c1
  - kind: registry
    name: heapless
    version: 0.8.0
    sha: 0bfb9eb618601c89945a70e254898da93b13be0388091d42117462b265bb3fad
  - kind: registry
    name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - kind: registry
    name: hex
    version: 0.4.3
    sha: 7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70
  - kind: registry
    name: hkdf
    version: 0.12.4
    sha: 7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7
  - kind: registry
    name: hmac
    version: 0.12.1
    sha: 6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e
  - kind: registry
    name: home
    version: 0.5.11
    sha: 589533453244b0995c858700322199b2becb13b627df2851f64a2775d024abcf
  - kind: registry
    name: http-auth
    version: 0.1.10
    sha: 150fa4a9462ef926824cf4519c84ed652ca8f4fbae34cb8af045b5cbcaf98822
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
    name: idna
    version: 1.1.0
    sha: 3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de
  - kind: registry
    name: idna_adapter
    version: 1.2.1
    sha: 3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344
  - kind: registry
    name: ignore
    version: 0.4.23
    sha: 6d89fd380afde86567dfba715db065673989d6253f42b88179abd3eae47bda4b
  - kind: registry
    name: im-rc
    version: 15.1.0
    sha: af1955a75fa080c677d3972822ec4bad316169ab1cfc6c257a942c2265dbe5fe
  - kind: registry
    name: imara-diff
    version: 0.1.8
    sha: 17d34b7d42178945f775e84bc4c36dde7c1c6cdfea656d3354d009056f2bb3d2
  - kind: registry
    name: implib
    version: 0.4.0
    sha: 7923c255262a0e44362e221f8b74b931fe21484b83f27386aa45f021a379caf6
  - kind: registry
    name: indexmap
    version: 2.11.4
    sha: 4b0f83760fb341a774ed326568e19f5a863af4a952def8c39f9ab92fd95b88e5
  - kind: registry
    name: is_executable
    version: 1.0.5
    sha: baabb8b4867b26294d818bf3f651a454b6901431711abb96e296245888d6e8c4
  - kind: registry
    name: is_terminal_polyfill
    version: 1.70.1
    sha: 7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf
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
    name: jiff-tzdb
    version: 0.1.4
    sha: c1283705eb0a21404d2bfd6eef2a7593d240bc42a0bdb39db0ad6fa2ec026524
  - kind: registry
    name: jiff-tzdb-platform
    version: 0.1.3
    sha: 875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8
  - kind: registry
    name: jobserver
    version: 0.1.34
    sha: 9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33
  - kind: registry
    name: js-sys
    version: 0.3.80
    sha: 852f13bec5eba4ba9afbeb93fd7c13fe56147f055939ae21c43a29a0ecb2702e
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
    name: libc
    version: 0.2.175
    sha: 6a82ae493e598baaea5209805c49bbf2ea7de956d50d7da0da1164f9c6d28543
  - kind: registry
    name: libgit2-sys
    version: 0.18.2+1.9.1
    sha: 1c42fe03df2bd3c53a3a9c7317ad91d80c81cd1fb0caec8d7cc4cd2bfa10c222
  - kind: registry
    name: libloading
    version: 0.8.8
    sha: 07033963ba89ebaf1584d767badaa2e8fcec21aedea6b8c0346d487d49c28667
  - kind: registry
    name: libnghttp2-sys
    version: 0.1.11+1.64.0
    sha: 1b6c24e48a7167cffa7119da39d577fa482e66c688a4aac016bee862e1a713c4
  - kind: registry
    name: libredox
    version: 0.1.10
    sha: 416f7e718bdb06000964960ffa43b4335ad4012ae8b99060261aa4a8088d5ccb
  - kind: registry
    name: libsqlite3-sys
    version: 0.34.0
    sha: 91632f3b4fb6bd1d72aa3d78f41ffecfcf2b1a6648d8c241dbe7dbfaf4875e15
  - kind: registry
    name: libssh2-sys
    version: 0.3.1
    sha: 220e4f05ad4a218192533b300327f5150e809b54c4ec83b5a1d91833601811b9
  - kind: registry
    name: libz-rs-sys
    version: 0.5.2
    sha: 840db8cf39d9ec4dd794376f38acc40d0fc65eec2a8f484f7fd375b84602becd
  - kind: registry
    name: libz-sys
    version: 1.1.22
    sha: 8b70e7a7df205e92a1a4cd9aaae7898dac0aa555503cc0a649494d0d60e7651d
  - kind: registry
    name: linux-raw-sys
    version: 0.11.0
    sha: df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039
  - kind: registry
    name: litemap
    version: 0.8.0
    sha: 241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956
  - kind: registry
    name: lock_api
    version: 0.4.13
    sha: 96936507f153605bddfcda068dd804796c84324ed2510809e5b2a624c81da765
  - kind: registry
    name: log
    version: 0.4.28
    sha: 34080505efa8e45a4b816c349525ebe327ceaa8559756f0356cba97ef3bf7432
  - kind: registry
    name: matchers
    version: 0.2.0
    sha: d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9
  - kind: registry
    name: maybe-async
    version: 0.2.10
    sha: 5cf92c10c7e361d6b99666ec1c6f9805b0bea2c3bd8c78dc6fe98ac5bd78db11
  - kind: registry
    name: memchr
    version: 2.7.5
    sha: 32a282da65faaf38286cf3be983213fcf1d2e2a58700e808f83f4ea9a4804bc0
  - kind: registry
    name: memmap2
    version: 0.9.8
    sha: 843a98750cd611cc2965a8213b53b43e715f13c37a9e096c6408e69990961db7
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - kind: registry
    name: miniz_oxide
    version: 0.8.9
    sha: 1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316
  - kind: registry
    name: miow
    version: 0.6.1
    sha: 536bfad37a309d62069485248eeaba1e8d9853aaf951caaeaed0585a95346f08
  - kind: registry
    name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - kind: registry
    name: normpath
    version: 1.4.0
    sha: c178369371fd7db523726931e50d430b560e3059665abc537ba3277e9274c9c4
  - kind: registry
    name: nu-ansi-term
    version: 0.50.1
    sha: d4a28e057d01f97e61255210fcff094d74ed0466038633e95017f5beb68e4399
  - kind: registry
    name: num-conv
    version: 0.1.0
    sha: 51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9
  - kind: registry
    name: num-traits
    version: 0.2.19
    sha: 071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841
  - kind: registry
    name: object
    version: 0.37.3
    sha: ff76201f031d8863c38aa7f905eca4f53abbfa15f609db4277d44cd8938f33fe
  - kind: registry
    name: once_cell
    version: 1.21.3
    sha: 42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d
  - kind: registry
    name: once_cell_polyfill
    version: 1.70.1
    sha: a4895175b425cb1f87721b59f0f286c2092bd4af812243672510e1ac53e2e0ad
  - kind: registry
    name: opener
    version: 0.8.3
    sha: cb9024962ab91e00c89d2a14352a8d0fc1a64346bf96f1839b45c09149564e47
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
    name: openssl-src
    version: 300.5.2+3.5.2
    sha: d270b79e2926f5150189d475bc7e9d2c69f9c4697b185fa917d5a32b792d21b4
  - kind: registry
    name: openssl-sys
    version: 0.9.109
    sha: 90096e2e47630d78b7d1c20952dc621f957103f8bc2c8359ec81290d75238571
  - kind: registry
    name: ordered-float
    version: 2.10.1
    sha: 68f19d67e5a2795c94e73e0bb1cc1a7edeb2e28efd39e2e1c9b7a40c1108b11c
  - kind: registry
    name: orion
    version: 0.17.11
    sha: 21b3da83b2b4cdc74ab6a556b2e7b473da046d5aa4008c0a7a3ae96b1b4aabb4
  - kind: registry
    name: os_info
    version: 3.12.0
    sha: d0e1ac5fde8d43c34139135df8ea9ee9465394b2d8d20f032d38998f64afffc3
  - kind: registry
    name: p384
    version: 0.13.1
    sha: fe42f1670a52a47d448f14b6a5c61dd78fce51856e68edaa38f7ae3a46b8d6b6
  - kind: registry
    name: parking_lot
    version: 0.12.4
    sha: 70d58bf43669b5795d1576d0641cfb6fbb2057bf629506267a92807158584a13
  - kind: registry
    name: parking_lot_core
    version: 0.9.11
    sha: bc838d2a56b5b1a6c25f55575dfc605fabb63bb2365f6c2353ef9159aa69e4a5
  - kind: registry
    name: pasetors
    version: 0.7.7
    sha: 03e1ed71dcdf863d9f66d9de86de714db38aedc2fcabc1a60207d1fde603e2d5
  - kind: registry
    name: pathdiff
    version: 0.2.3
    sha: df94ce210e5bc13cb6651479fa48d14f601d9858cfe0467f43ae157023b938d3
  - kind: registry
    name: pem-rfc7468
    version: 0.7.0
    sha: 88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412
  - kind: registry
    name: percent-encoding
    version: 2.3.2
    sha: 9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220
  - kind: registry
    name: pin-project-lite
    version: 0.2.16
    sha: 3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b
  - kind: registry
    name: pkcs8
    version: 0.10.2
    sha: f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7
  - kind: registry
    name: pkg-config
    version: 0.3.32
    sha: 7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c
  - kind: registry
    name: plist
    version: 1.8.0
    sha: 740ebea15c5d1428f910cd1a5f52cebf8d25006245ed8ade92702f4943d91e07
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
    version: 0.1.3
    sha: 84df19adbe5b5a0782edcab45899906947ab039ccf4573713735ee7de1e6b08a
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - kind: registry
    name: ppv-lite86
    version: 0.2.21
    sha: 85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9
  - kind: registry
    name: primeorder
    version: 0.13.6
    sha: 353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6
  - kind: registry
    name: proc-macro2
    version: 1.0.101
    sha: 89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de
  - kind: registry
    name: prodash
    version: 30.0.1
    sha: 5a6efc566849d3d9d737c5cb06cc50e48950ebe3d3f9d70631490fff3a07b139
  - kind: registry
    name: quick-xml
    version: 0.38.3
    sha: 42a232e7487fc2ef313d96dde7948e7a3c05101870d8985e4fd8d26aedd27b89
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
    version: 0.9.2
    sha: 6db2770f06117d490610c7488547d543617b21bfa07796d7a12f6f1bd53850d1
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
    name: rand_xoshiro
    version: 0.6.0
    sha: 6f97cdb2a36ed4183de61b2f824cc45c9f1037f28afe0a322e9fff4c108b5aaa
  - kind: registry
    name: redox_syscall
    version: 0.5.17
    sha: 5407465600fb0548f1442edf71dd20683c6ed326200ace4b1ef0763521bb3b77
  - kind: registry
    name: regex
    version: 1.11.2
    sha: 23d7fd106d8c02486a8d64e778353d1cffe08ce79ac2e82f540c86d0facf6912
  - kind: registry
    name: regex-automata
    version: 0.4.10
    sha: 6b9458fa0bfeeac22b5ca447c63aaf45f28439a709ccd244698632f9aa6394d6
  - kind: registry
    name: regex-syntax
    version: 0.8.6
    sha: caf4aa5b0f434c91fe5c7f1ecb6a5ece2130b02ad2a590589dda5146df959001
  - kind: registry
    name: rfc6979
    version: 0.4.0
    sha: f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2
  - kind: registry
    name: rusqlite
    version: 0.36.0
    sha: 3de23c3319433716cf134eed225fe9986bc24f63bed9be9f20c329029e672dc7
  - kind: registry
    name: rustc-hash
    version: 2.1.1
    sha: 357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d
  - kind: registry
    name: rustc-stable-hash
    version: 0.1.2
    sha: 781442f29170c5c93b7185ad559492601acdc71d5bb0706f5868094f45cfcd08
  - kind: registry
    name: rustfix
    version: 0.9.2
    sha: 662decac6b0486a3bfb3723a0621eb12f5ae199488ddf87582d09f8c7b3e9889
  - kind: registry
    name: rustix
    version: 1.1.2
    sha: cd15f8a2c5551a84d56efdc1cd049089e409ac19a3072d5037a17fd70719ff3e
  - kind: registry
    name: ryu
    version: 1.0.20
    sha: 28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f
  - kind: registry
    name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - kind: registry
    name: schannel
    version: 0.1.28
    sha: 891d81b926048e76efe18581bf793546b4c0eaf8448d72be8de2bbee5fd166e1
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - kind: registry
    name: sec1
    version: 0.7.3
    sha: d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc
  - kind: registry
    name: security-framework
    version: 3.4.0
    sha: 60b369d18893388b345804dc0007963c99b7d665ae71d275812d828c6f089640
  - kind: registry
    name: security-framework-sys
    version: 2.15.0
    sha: cc1f0cbffaac4852523ce30d8bd3c5cdc873501d96ff467ca09b6767bb8cd5c0
  - kind: registry
    name: semver
    version: 1.0.27
    sha: d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2
  - kind: registry
    name: serde
    version: 1.0.226
    sha: 0dca6411025b24b60bfa7ec1fe1f8e710ac09782dca409ee8237ba74b51295fd
  - kind: registry
    name: serde-untagged
    version: 0.1.9
    sha: f9faf48a4a2d2693be24c6289dbe26552776eb7737074e6722891fadbe6c5058
  - kind: registry
    name: serde-value
    version: 0.7.0
    sha: f3a1a3341211875ef120e117ea7fd5228530ae7e7036a779fdc9117be6b3282c
  - kind: registry
    name: serde_core
    version: 1.0.226
    sha: ba2ba63999edb9dac981fb34b3e5c0d111a69b0924e253ed29d83f7c99e966a4
  - kind: registry
    name: serde_derive
    version: 1.0.226
    sha: 8db53ae22f34573731bafa1db20f04027b2d25e02d8205921b569171699cdb33
  - kind: registry
    name: serde_ignored
    version: 0.1.14
    sha: 115dffd5f3853e06e746965a20dcbae6ee747ae30b543d91b0e089668bb07798
  - kind: registry
    name: serde_json
    version: 1.0.145
    sha: 402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c
  - kind: registry
    name: serde_spanned
    version: 0.6.9
    sha: bf41e0cfaf7226dca15e8197172c295a782857fcb97fad1808a166870dee75a3
  - kind: registry
    name: serde_spanned
    version: 1.0.2
    sha: 5417783452c2be558477e104686f7de5dae53dba813c28435e0e70f82d9b04ee
  - kind: registry
    name: sha1
    version: 0.10.6
    sha: e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba
  - kind: registry
    name: sha1-checked
    version: 0.10.0
    sha: 89f599ac0c323ebb1c6082821a54962b839832b03984598375bff3975b804423
  - kind: registry
    name: sha2
    version: 0.10.9
    sha: a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283
  - kind: registry
    name: sharded-slab
    version: 0.1.7
    sha: f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6
  - kind: registry
    name: shell-escape
    version: 0.1.5
    sha: 45bb67a18fa91266cc7807181f62f9178a6873bfad7dc788c42e6430db40184f
  - kind: registry
    name: shell-words
    version: 1.1.0
    sha: 24188a676b6ae68c3b2cb3a01be17fbf7240ce009799bb56d5b1409051e78fde
  - kind: registry
    name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - kind: registry
    name: signature
    version: 2.2.0
    sha: 77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de
  - kind: registry
    name: sized-chunks
    version: 0.6.5
    sha: 16d69225bde7a69b235da73377861095455d298f2b970996eec25ddbb42b3d1e
  - kind: registry
    name: smallvec
    version: 1.15.1
    sha: 67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03
  - kind: registry
    name: socket2
    version: 0.6.0
    sha: 233504af464074f9d066d7b5416c5f9b894a5862a6506e306f7b816cdd6f1807
  - kind: registry
    name: spki
    version: 0.7.3
    sha: d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d
  - kind: registry
    name: stable_deref_trait
    version: 1.2.0
    sha: a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3
  - kind: registry
    name: static_assertions
    version: 1.1.0
    sha: a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f
  - kind: registry
    name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: subtle
    version: 2.6.1
    sha: 13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292
  - kind: registry
    name: supports-hyperlinks
    version: 3.1.0
    sha: 804f44ed3c63152de6a9f90acbea1a110441de43006ea51bcce8f436196a288b
  - kind: registry
    name: supports-unicode
    version: 3.0.0
    sha: b7401a30af6cb5818bb64852270bb722533397edcfc7344954a38f420819ece2
  - kind: registry
    name: syn
    version: 2.0.106
    sha: ede7c438028d4436d71104916910f5bb611972c5cfd7f89b8300a8186e6fada6
  - kind: registry
    name: synstructure
    version: 0.13.2
    sha: 728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2
  - kind: registry
    name: tar
    version: 0.4.44
    sha: 1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a
  - kind: registry
    name: tempfile
    version: 3.22.0
    sha: 84fa4d11fadde498443cca10fd3ac23c951f0dc59e080e9f4b93d4df4e4eea53
  - kind: registry
    name: terminal_size
    version: 0.4.3
    sha: 60b8cb979cb11c32ce1603f8137b22262a9d131aaa5c37b5678025f22b8becd0
  - kind: registry
    name: thiserror
    version: 2.0.16
    sha: 3467d614147380f2e4e374161426ff399c91084acd2363eaf549172b3d5e60c0
  - kind: registry
    name: thiserror-impl
    version: 2.0.16
    sha: 6c5e1be1c48b9172ee610da68fd9cd2770e7a4056cb3fc98710ee6906f0c7960
  - kind: registry
    name: thread_local
    version: 1.1.9
    sha: f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185
  - kind: registry
    name: time
    version: 0.3.44
    sha: 91e7d9e3bb61134e77bde20dd4825b97c010155709965fedf0f49bb138e52a9d
  - kind: registry
    name: time-core
    version: 0.1.6
    sha: 40868e7c1d2f0b8d73e4a8c7f0ff63af4f6d19be117e90bd73eb1d62cf831c6b
  - kind: registry
    name: time-macros
    version: 0.2.24
    sha: 30cfb0125f12d9c277f35663a0a33f8c30190f4e4574868a330595412d34ebf3
  - kind: registry
    name: tinystr
    version: 0.8.1
    sha: 5d4f6d1145dcb577acf783d4e601bc1d76a13337bb54e6233add580b07344c8b
  - kind: registry
    name: tinyvec
    version: 1.10.0
    sha: bfa5fdc3bce6191a1dbc8c02d5c8bffcf557bafa17c124c5264a458f1b0613fa
  - kind: registry
    name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - kind: registry
    name: toml
    version: 0.8.23
    sha: dc1beb996b9d83529a9e75c17a1686767d148d70663143c7854d8b4a09ced362
  - kind: registry
    name: toml
    version: 0.9.7
    sha: 00e5e5d9bf2475ac9d4f0d9edab68cc573dc2fd644b0dba36b0c30a92dd9eaa0
  - kind: registry
    name: toml_datetime
    version: 0.6.11
    sha: 22cddaf88f4fbc13c51aebbf5f8eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c
  - kind: registry
    name: toml_datetime
    version: 0.7.2
    sha: 32f1085dec27c2b6632b04c80b3bb1b4300d6495d1e129693bdda7d91e72eec1
  - kind: registry
    name: toml_edit
    version: 0.22.27
    sha: 41fe8c660ae4257887cf66394862d21dbca4a6ddd26f04a3560410406a2f819a
  - kind: registry
    name: toml_edit
    version: 0.23.6
    sha: f3effe7c0e86fdff4f69cdd2ccc1b96f933e24811c5441d44904e8683e27184b
  - kind: registry
    name: toml_parser
    version: 1.0.3
    sha: 4cf893c33be71572e0e9aa6dd15e6677937abd686b066eac3f8cd3531688a627
  - kind: registry
    name: toml_write
    version: 0.1.2
    sha: 5d99f8c9a7727884afe522e9bd5edbfc91a3312b36a77b5fb8926e4c31a41801
  - kind: registry
    name: toml_writer
    version: 1.0.3
    sha: d163a63c116ce562a22cda521fcc4d79152e7aba014456fb5eb442f6d6a10109
  - kind: registry
    name: tracing
    version: 0.1.41
    sha: 784e0ac535deb450455cbfa28a6f0df145ea1bb7ae51b821cf5e7927fdcfbdd0
  - kind: registry
    name: tracing-attributes
    version: 0.1.30
    sha: 81383ab64e72a7a8b8e13130c49e3dab29def6d0c7d76a03087b3cf71c5c6903
  - kind: registry
    name: tracing-chrome
    version: 0.7.2
    sha: bf0a738ed5d6450a9fb96e86a23ad808de2b727fd1394585da5cdd6788ffe724
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
    version: 0.3.20
    sha: 2054a14f5307d601f88daf0553e1cbf472acc4f2c51afab632431cdcd72124d5
  - kind: registry
    name: typeid
    version: 1.0.3
    sha: bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c
  - kind: registry
    name: typenum
    version: 1.18.0
    sha: 1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f
  - kind: registry
    name: unicase
    version: 2.8.1
    sha: 75b844d17643ee918803943289730bec8aac480150456169e647ed0b576ba539
  - kind: registry
    name: unicode-bom
    version: 2.0.3
    sha: 7eec5d1121208364f6793f7d2e222bf75a915c19557537745b195b253dd64217
  - kind: registry
    name: unicode-ident
    version: 1.0.19
    sha: f63a545481291138910575129486daeaf8ac54aee4387fe7906919f7830c7d9d
  - kind: registry
    name: unicode-normalization
    version: 0.1.24
    sha: 5033c97c4262335cded6d6fc3e5c18ab755e1a3dc96376350f3d8e9f009ad956
  - kind: registry
    name: unicode-width
    version: 0.2.1
    sha: 4a1a07cc7db3810833284e8d372ccdc6da29741639ecc70c9ec107df0fa6154c
  - kind: registry
    name: unicode-xid
    version: 0.2.6
    sha: ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853
  - kind: registry
    name: url
    version: 2.5.7
    sha: 08bc136a29a3d1758e07a9cca267be308aeebf5cfd5a10f3f67ab2097683ef5b
  - kind: registry
    name: utf8_iter
    version: 1.0.4
    sha: b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be
  - kind: registry
    name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - kind: registry
    name: valuable
    version: 0.1.1
    sha: ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65
  - kind: registry
    name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
  - kind: registry
    name: version_check
    version: 0.9.5
    sha: 0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a
  - kind: registry
    name: walkdir
    version: 2.5.0
    sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
  - kind: registry
    name: wasi
    version: 0.11.1+wasi-snapshot-preview1
    sha: ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b
  - kind: registry
    name: wasi
    version: 0.14.7+wasi-0.2.4
    sha: 883478de20367e224c0090af9cf5f9fa85bed63a95c1abf3afc5c083ebc06e8c
  - kind: registry
    name: wasip2
    version: 1.0.1+wasi-0.2.4
    sha: 0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7
  - kind: registry
    name: wasm-bindgen
    version: 0.2.103
    sha: ab10a69fbd0a177f5f649ad4d8d3305499c42bab9aef2f7ff592d0ec8f833819
  - kind: registry
    name: wasm-bindgen-backend
    version: 0.2.103
    sha: 0bb702423545a6007bbc368fde243ba47ca275e549c8a28617f56f6ba53b1d1c
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.103
    sha: fc65f4f411d91494355917b605e1480033152658d71f722a90647f56a70c88a0
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.103
    sha: ffc003a991398a8ee604a401e194b6b3a39677b3173d6e74495eb51b82e99a32
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.103
    sha: 293c37f4efa430ca14db3721dfbe48d8c33308096bd44d80ebaa775ab71ba1cf
  - kind: registry
    name: winapi-util
    version: 0.1.11
    sha: c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22
  - kind: registry
    name: windows-link
    version: 0.1.3
    sha: 5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a
  - kind: registry
    name: windows-link
    version: 0.2.0
    sha: 45e46c0661abb7180e7b9c281db115305d49ca1709ab8242adf09666d2173c65
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
    name: windows-sys
    version: 0.61.0
    sha: e201184e40b2ede64bc2ea34968b28e33622acdbbf37104f0e4a33f7abe657aa
  - kind: registry
    name: windows-targets
    version: 0.52.6
    sha: 9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973
  - kind: registry
    name: windows-targets
    version: 0.53.3
    sha: d5fe6031c4041849d7c496a8ded650796e7b6ecc19df1a431c1a363342e5dc91
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
    version: 0.52.6
    sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.53.0
    sha: c7651a1f62a11b8cbd5e0d42526e55f2c99886c77e007179efff86c2b137e66c
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
    version: 0.52.6
    sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
  - kind: registry
    name: windows_i686_msvc
    version: 0.53.0
    sha: 581fee95406bb13382d2f65cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d
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
    version: 0.52.6
    sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.53.0
    sha: 0a6e035dd0599267ce1ee132e51c27dd29437f63325753051e71dd9e42406c57
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
    version: 0.7.13
    sha: 21a0236b59786fed61e2a80582dd500fe61f18b5dca67a4a067d0bc9039339cf
  - kind: registry
    name: wit-bindgen
    version: 0.46.0
    sha: f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59
  - kind: registry
    name: writeable
    version: 0.6.1
    sha: ea2f10b9bb0928dfb1b42b65e1f9e36f7f54dbdf08457afefb38afcdec4fa2bb
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
    version: 0.8.27
    sha: 0894878a5fa3edfd6da3f88c4805f4c8558e2b996227a3d864f47fe11e38282c
  - kind: registry
    name: zerocopy-derive
    version: 0.8.27
    sha: 88d2b8d9c68ad2b9e4340d7832716a4d21a22a1154777ad56ea55c51a9cf3831
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
    version: 0.11.4
    sha: e7aa2bd55086f1ab526693ecbe444205da57e25f4489879da80635a46d90e73b
  - kind: registry
    name: zerovec-derive
    version: 0.11.1
    sha: 5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f
  - kind: registry
    name: zlib-rs
    version: 0.5.2
    sha: 2f06ae92f42f5e5c42443fd094f245eb656abf56dd7cce9b8b263236565e00f2
