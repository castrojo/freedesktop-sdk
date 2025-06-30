kind: manual

build-depends:
- components/rust.bst
- components/pkg-config.bst

depends:
- bootstrap-import.bst
- components/openssl.bst
- components/curl.bst

environment:
  MAXJOBS: "%{max-jobs}"

environment-nocache:
- MAXJOBS

config:
  build-commands:
  - cargo build --release --frozen --offline --jobs "${MAXJOBS}"

  install-commands:
  - |
    find "target/release" -maxdepth 1 -type f -executable -exec install -Dm755 -t "%{install-root}%{bindir}" {} +

sources:
- kind: git_repo
  url: github:lu-zero/cargo-c.git
  track: v*.*.*
  ref: v0.10.14-0-gd1da3c27a0defdceba12c2b2762094cdde6c0337
- kind: remote
  url: github_files:lu-zero/cargo-c/releases/download/v0.10.14/Cargo.lock
  ref: 0af99496210d7e5cb70de6643b571a8882120148e628d7a75327937b64fd9841
- kind: cargo2
  ref:
  - kind: registry
    name: adler2
    version: 2.0.1
    sha: 320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa
  - kind: registry
    name: ahash
    version: 0.8.12
    sha: 5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75
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
    version: 2.9.1
    sha: 1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967
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
    version: 0.89.0
    sha: 4ffb868a2869728e8cad2afd836cf7f287f5e9379f2e857deea187abfd7c5cfd
  - kind: registry
    name: cargo-credential
    version: 0.4.8
    sha: ac1ef5080adde1db190e901884d2c400990856c2a23201c5a181b910a6dbdf2a
  - kind: registry
    name: cargo-credential-libsecret
    version: 0.4.14
    sha: d4c6e10380bfa25a4f1495e6ca7256332857e3ef7bb16adf376641e6af03acaf
  - kind: registry
    name: cargo-credential-macos-keychain
    version: 0.4.14
    sha: 123e3570992ff3f899a62eefd482e131dea655df8c08150ae559bda2ff492836
  - kind: registry
    name: cargo-credential-wincred
    version: 0.4.14
    sha: 0310db795786db4bbe6cc00f30099ff6a157bb78f9f590376e5e1005866a68d3
  - kind: registry
    name: cargo-platform
    version: 0.3.0
    sha: 8abf5d501fd757c2d2ee78d0cc40f606e92e3a63544420316565556ed28485e2
  - kind: registry
    name: cargo-util
    version: 0.2.21
    sha: c95ec8b2485b20aed818bd7460f8eecc6c87c35c84191b353a3aba9aa1736c36
  - kind: registry
    name: cargo-util-schemas
    version: 0.8.2
    sha: 7dc1a6f7b5651af85774ae5a34b4e8be397d9cf4bc063b7e6dbd99a841837830
  - kind: registry
    name: cbindgen
    version: 0.29.0
    sha: 975982cdb7ad6a142be15bdf84aea7ec6a9e5d4d797c004d43185b24cfe4e684
  - kind: registry
    name: cc
    version: 1.2.27
    sha: d487aa071b5f64da6f19a3e848e3578944b726ee5a4854b82172f02aa876bfdc
  - kind: registry
    name: cfg-if
    version: 1.0.1
    sha: 9555578bc9e57714c812a1f84e4fc5b4d21fcb063490c624de019f7464c91268
  - kind: registry
    name: clap
    version: 4.5.40
    sha: 40b6887a1d8685cebccf115538db5c0efe625ccac9696ad45c409d96566e910f
  - kind: registry
    name: clap_builder
    version: 4.5.40
    sha: e0c66c08ce9f0c698cbce5c0279d0bb6ac936d8674174fe48f736533b964f59e
  - kind: registry
    name: clap_complete
    version: 4.5.54
    sha: aad5b1b4de04fead402672b48897030eec1f3bfe1550776322f59f6d6e6a5677
  - kind: registry
    name: clap_derive
    version: 4.5.40
    sha: d2c7947ae4cc3d851207c1adb5b5e260ff0cca11446b1d6d1423788e442257ce
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
    version: 0.40.11
    sha: 9d8912d1316660f138aa2dec2c20e38633449fb7a3b2b8fcbf1698ac31941b8e
  - kind: registry
    name: crc32fast
    version: 1.4.2
    sha: a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3
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
    version: 0.4.48
    sha: 9e2d5c8f48d9c0c23250e52b55e82a6ab4fdba6650c931f5a0a57a43abda812b
  - kind: registry
    name: curl-sys
    version: 0.4.82+curl-8.14.1
    sha: c4d63638b5ec65f1a4ae945287b3fd035be4554bbaf211901159c9a2a74fb5be
  - kind: registry
    name: dbus
    version: 0.9.7
    sha: 1bb21987b9fb1613058ba3843121dd18b163b254d8a6e797e144cbac14d96d1b
  - kind: registry
    name: der
    version: 0.7.10
    sha: e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb
  - kind: registry
    name: deranged
    version: 0.4.0
    sha: 9c9e6a11ca8224451684bc0d7d5a7adbf8f2fd6887261a1cfc3c0432f9d4068e
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
    version: 0.4.6
    sha: e004d887f51fcb9fef17317a2f3525c887d8aa3f4f50fed920816a688284a5b7
  - kind: registry
    name: errno
    version: 0.3.13
    sha: 778e2ac28f6c47af28e4907f13ffd1e1ddbd400980a9abd7c8df189bf578a5ad
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
    name: faster-hex
    version: 0.9.0
    sha: a2a2b11eda1d40935b26cf18f6833c526845ae8c41e58d09af6adeb6f0269183
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
    version: 0.2.25
    sha: 35c0522e981e68cbfa8c3f978441a5f34b30b96e146b33cd3359176b50fe8586
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
    version: 1.2.1
    sha: e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456
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
    version: 0.71.0
    sha: a61e71ec6817fc3c9f12f812682cfe51ee6ea0d2e27e02fc3849c35524617435
  - kind: registry
    name: gix-actor
    version: 0.34.0
    sha: f438c87d4028aca4b82f82ba8d8ab1569823cfb3e5bc5fa8456a71678b2a20e7
  - kind: registry
    name: gix-attributes
    version: 0.25.0
    sha: e4e25825e0430aa11096f8b65ced6780d4a96a133f81904edceebb5344c8dd7f
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
    version: 0.5.0
    sha: c0378995847773a697f8e157fe2963ecf3462fe64be05b7b3da000b3b472def8
  - kind: registry
    name: gix-commitgraph
    version: 0.27.0
    sha: 043cbe49b7a7505150db975f3cb7c15833335ac1e26781f615454d9d640a28fe
  - kind: registry
    name: gix-config
    version: 0.44.0
    sha: 9c6f830bf746604940261b49abf7f655d2c19cadc9f4142ae9379e3a316e8cfa
  - kind: registry
    name: gix-config-value
    version: 0.14.12
    sha: 8dc2c844c4cf141884678cabef736fd91dd73068b9146e6f004ba1a0457944b6
  - kind: registry
    name: gix-credentials
    version: 0.28.0
    sha: 25322308aaf65789536b860d21137c3f7b69004ac4971c15c1abb08d3951c062
  - kind: registry
    name: gix-date
    version: 0.9.4
    sha: daa30058ec7d3511fbc229e4f9e696a35abd07ec5b82e635eff864a2726217e4
  - kind: registry
    name: gix-diff
    version: 0.51.0
    sha: a2c975dad2afc85e4e233f444d1efbe436c3cdcf3a07173984509c436d00a3f8
  - kind: registry
    name: gix-dir
    version: 0.13.0
    sha: 5879497bd3815d8277ed864ec8975290a70de5b62bb92d2d666a4cefc5d4793b
  - kind: registry
    name: gix-discover
    version: 0.39.0
    sha: f7fb8a4349b854506a3915de18d3341e5f1daa6b489c8affc9ca0d69efe86781
  - kind: registry
    name: gix-features
    version: 0.41.1
    sha: 016d6050219458d14520fe22bdfdeb9cb71631dec9bc2724767c983f60109634
  - kind: registry
    name: gix-features
    version: 0.42.1
    sha: 56f4399af6ec4fd9db84dd4cf9656c5c785ab492ab40a7c27ea92b4241923fed
  - kind: registry
    name: gix-filter
    version: 0.18.0
    sha: cb2b2bbffdc5cc9b2b82fc82da1b98163c9b423ac2b45348baa83a947ac9ab89
  - kind: registry
    name: gix-fs
    version: 0.14.0
    sha: 951e886120dc5fa8cac053e5e5c89443f12368ca36811b2e43d1539081f9c111
  - kind: registry
    name: gix-fs
    version: 0.15.0
    sha: 67a0637149b4ef24d3ea55f81f77231401c8463fae6da27331c987957eb597c7
  - kind: registry
    name: gix-glob
    version: 0.19.0
    sha: 20972499c03473e773a2099e5fd0c695b9b72465837797a51a43391a1635a030
  - kind: registry
    name: gix-hash
    version: 0.17.0
    sha: 834e79722063958b03342edaa1e17595cd2939bb2b3306b3225d0815566dcb49
  - kind: registry
    name: gix-hash
    version: 0.18.0
    sha: 8d4900562c662852a6b42e2ef03442eccebf24f047d8eab4f23bc12ef0d785d8
  - kind: registry
    name: gix-hashtable
    version: 0.8.1
    sha: b5b5cb3c308b4144f2612ff64e32130e641279fcf1a84d8d40dad843b4f64904
  - kind: registry
    name: gix-ignore
    version: 0.14.0
    sha: 9a27c8380f493a10d1457f756a3f81924d578fc08d6535e304dfcafbf0261d18
  - kind: registry
    name: gix-index
    version: 0.39.0
    sha: 855bece2d4153453aa5d0a80d51deea1ce8cd6a3b4cf213da85ac344ccb908a7
  - kind: registry
    name: gix-lock
    version: 17.1.0
    sha: 570f8b034659f256366dc90f1a24924902f20acccd6a15be96d44d1269e7a796
  - kind: registry
    name: gix-negotiate
    version: 0.19.0
    sha: dad912acf5a68a7defa4836014337ff4381af8c3c098f41f818a8c524285e57b
  - kind: registry
    name: gix-object
    version: 0.48.0
    sha: 4943fcdae6ffc135920c9ea71e0362ed539182924ab7a85dd9dac8d89b0dd69a
  - kind: registry
    name: gix-odb
    version: 0.68.0
    sha: 50306d40dcc982eb6b7593103f066ea6289c7b094cb9db14f3cd2be0b9f5e610
  - kind: registry
    name: gix-pack
    version: 0.58.0
    sha: 9b65fffb09393c26624ca408d32cfe8776fb94cd0a5cdf984905e1d2f39779cb
  - kind: registry
    name: gix-packetline
    version: 0.18.4
    sha: 123844a70cf4d5352441dc06bab0da8aef61be94ec239cb631e0ba01dc6d3a04
  - kind: registry
    name: gix-packetline-blocking
    version: 0.18.3
    sha: 1ecf3ea2e105c7e45587bac04099824301262a6c43357fad5205da36dbb233b3
  - kind: registry
    name: gix-path
    version: 0.10.18
    sha: 567f65fec4ef10dfab97ae71f26a27fd4d7fe7b8e3f90c8a58551c41ff3fb65b
  - kind: registry
    name: gix-pathspec
    version: 0.10.0
    sha: fef8422c3c9066d649074b24025125963f85232bfad32d6d16aea9453b82ec14
  - kind: registry
    name: gix-prompt
    version: 0.10.0
    sha: fbf9cbf6239fd32f2c2c9c57eeb4e9b28fa1c9b779fa0e3b7c455eb1ca49d5f0
  - kind: registry
    name: gix-protocol
    version: 0.49.0
    sha: 5678ddae1d62880bc30e2200be1b9387af3372e0e88e21f81b4e7f8367355b5a
  - kind: registry
    name: gix-quote
    version: 0.5.0
    sha: 1b005c550bf84de3b24aa5e540a23e6146a1c01c7d30470e35d75a12f827f969
  - kind: registry
    name: gix-ref
    version: 0.51.0
    sha: b2e1f7eb6b7ce82d2d19961f74bd637bab3ea79b1bc7bfb23dbefc67b0415d8b
  - kind: registry
    name: gix-refspec
    version: 0.29.0
    sha: 1d8587b21e2264a6e8938d940c5c99662779c13a10741a5737b15fc85c252ffc
  - kind: registry
    name: gix-revision
    version: 0.33.0
    sha: 342caa4e158df3020cadf62f656307c3948fe4eacfdf67171d7212811860c3e9
  - kind: registry
    name: gix-revwalk
    version: 0.19.0
    sha: 2dc7c3d7e5cdc1ab8d35130106e4af0a4f9f9eca0c81f4312b690780e92bde0d
  - kind: registry
    name: gix-sec
    version: 0.10.12
    sha: 47aeb0f13de9ef2f3033f5ff218de30f44db827ac9f1286f9ef050aacddd5888
  - kind: registry
    name: gix-shallow
    version: 0.3.0
    sha: cc0598aacfe1d52575a21c9492fee086edbb21e228ec36c819c42ab923f434c3
  - kind: registry
    name: gix-submodule
    version: 0.18.0
    sha: 78c7390c2059505c365e9548016d4edc9f35749c6a9112b7b1214400bbc68da2
  - kind: registry
    name: gix-tempfile
    version: 17.1.0
    sha: c750e8c008453a2dba67a2b0d928b7716e05da31173a3f5e351d5457ad4470aa
  - kind: registry
    name: gix-trace
    version: 0.1.12
    sha: 7c396a2036920c69695f760a65e7f2677267ccf483f25046977d87e4cb2665f7
  - kind: registry
    name: gix-transport
    version: 0.46.0
    sha: b3f68c2870bfca8278389d2484a7f2215b67d0b0cc5277d3c72ad72acf41787e
  - kind: registry
    name: gix-traverse
    version: 0.45.0
    sha: 36c0b049f8bdb61b20016694102f7b507f2e1727e83e9c5e6dad4f7d84ff7384
  - kind: registry
    name: gix-url
    version: 0.30.0
    sha: 48dfe23f93f1ddb84977d80bb0dd7aa09d1bf5d5afc0c9b6820cccacc25ae860
  - kind: registry
    name: gix-utils
    version: 0.2.0
    sha: 189f8724cf903e7fd57cfe0b7bc209db255cacdcb22c781a022f52c3a774f8d0
  - kind: registry
    name: gix-utils
    version: 0.3.0
    sha: 5351af2b172caf41a3728eb4455326d84e0d70fe26fc4de74ab0bd37df4191c5
  - kind: registry
    name: gix-validate
    version: 0.10.0
    sha: 77b9e00cacde5b51388d28ed746c493b18a6add1f19b5e01d686b3b9ece66d4d
  - kind: registry
    name: gix-validate
    version: 0.9.4
    sha: 34b5f1253109da6c79ed7cf6e1e38437080bb6d704c76af14c93e2f255234084
  - kind: registry
    name: gix-worktree
    version: 0.40.0
    sha: f7760dbc4b79aa274fed30adc0d41dca6b917641f26e7867c4071b1fb4dc727b
  - kind: registry
    name: glob
    version: 0.3.2
    sha: a8d1add55171497b4705a648c6b583acafb01d58050a51727785f0b2c8e0a2b2
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
    version: 0.15.4
    sha: 5971ac85611da7067dbfcabef3c70ebb5606018acd9e2a3903a0da507521e0d5
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
    version: 1.0.3
    sha: 686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e
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
    name: implib
    version: 0.3.5
    sha: 598bf7096215f835b0f70c94d7b033da3cbf66181b619f25e54d65adaf825e62
  - kind: registry
    name: indexmap
    version: 2.10.0
    sha: fe4cd85333e22411419a0bcae1297d25e58c9443848b11dc6a86fefe8c78a661
  - kind: registry
    name: is_executable
    version: 1.0.4
    sha: d4a1b5bad6f9072935961dfbf1cced2f3d129963d091b6f69f007fe04e758ae2
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
    version: 0.1.33
    sha: 38f262f097c174adebe41eb73d66ae9c06b2844fb0da69969647bbddd9b0538a
  - kind: registry
    name: js-sys
    version: 0.3.77
    sha: 1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f
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
    version: 0.2.174
    sha: 1171693293099992e19cddea4e8b849964e9846f4acee11b3948bcc337be8776
  - kind: registry
    name: libdbus-sys
    version: 0.2.5
    sha: 06085512b750d640299b79be4bad3d2fa90a9c00b1fd9e1b46364f66f0485c72
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
    version: 0.1.4
    sha: 1580801010e535496706ba011c15f8532df6b42297d2e471fec38ceadd8c0638
  - kind: registry
    name: libsqlite3-sys
    version: 0.32.0
    sha: fbb8270bb4060bd76c6e96f20c52d80620f1d82a3470885694e41e0f81ef6fe7
  - kind: registry
    name: libssh2-sys
    version: 0.3.1
    sha: 220e4f05ad4a218192533b300327f5150e809b54c4ec83b5a1d91833601811b9
  - kind: registry
    name: libz-rs-sys
    version: 0.5.1
    sha: 172a788537a2221661b480fee8dc5f96c580eb34fa88764d3205dc356c7e4221
  - kind: registry
    name: libz-sys
    version: 1.1.22
    sha: 8b70e7a7df205e92a1a4cd9aaae7898dac0aa555503cc0a649494d0d60e7651d
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
    name: lock_api
    version: 0.4.13
    sha: 96936507f153605bddfcda068dd804796c84324ed2510809e5b2a624c81da765
  - kind: registry
    name: log
    version: 0.4.27
    sha: 13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94
  - kind: registry
    name: matchers
    version: 0.1.0
    sha: 8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558
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
    version: 0.9.5
    sha: fd3f7eed9d3848f8b98834af67102b720745c4ec028fcd0aa0239277e7de374f
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
    version: 0.6.0
    sha: 359f76430b20a79f9e20e115b3428614e654f04fab314482fc0fda0ebd3c6044
  - kind: registry
    name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - kind: registry
    name: normpath
    version: 1.3.0
    sha: c8911957c4b1549ac0dc74e30db9c8b0e66ddcd6d7acc33098f4c63a64a6d7ed
  - kind: registry
    name: nu-ansi-term
    version: 0.46.0
    sha: 77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84
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
    version: 0.36.7
    sha: 62948e14d923ea95ea2c7c86c71013138b66525b86bdc08d2dcc262bdb497b87
  - kind: registry
    name: object
    version: 0.37.1
    sha: 03fd943161069e1768b4b3d050890ba48730e590f57e56d4aa04e7e090e61b4a
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
    version: 0.7.2
    sha: d0812e5e4df08da354c851a3376fead46db31c2214f849d3de356d774d057681
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
    version: 300.5.0+3.5.0
    sha: e8ce546f549326b0e6052b649198487d91320875da901e7bd11a06d1ee3f9c2f
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
    name: overload
    version: 0.1.1
    sha: b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39
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
    version: 0.7.6
    sha: 8c1c6d47c07a08cb59ddad44d53cb5729855e35f7d993184cec3aa37ccdb7008
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
    version: 2.3.1
    sha: e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e
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
    version: 1.7.2
    sha: 3d77244ce2d584cd84f6a15f86195b8c9b2a0dfbfd817c09e0464244091a58ed
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
    name: primeorder
    version: 0.13.6
    sha: 353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6
  - kind: registry
    name: proc-macro2
    version: 1.0.95
    sha: 02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778
  - kind: registry
    name: prodash
    version: 29.0.2
    sha: f04bb108f648884c23b98a0e940ebc2c93c0c3b89f04dbaf7eb8256ce617d1bc
  - kind: registry
    name: quick-xml
    version: 0.37.5
    sha: 331e97a1af0bf59823e6eadffe373d7b27f485be8748f71471c662c1f269b7fb
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
    version: 0.9.1
    sha: 9fbfd9d094a40bf3ae768db9361049ace4c0e04a4fd6b359518bd7b73a73dd97
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
    version: 0.5.13
    sha: 0d04b7d0ee6b4a0207a0a7adb104d23ecb0b47d6beae7152d0fa34b692b29fd6
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
    name: regex-syntax
    version: 0.6.29
    sha: f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1
  - kind: registry
    name: regex-syntax
    version: 0.8.5
    sha: 2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c
  - kind: registry
    name: rfc6979
    version: 0.4.0
    sha: f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2
  - kind: registry
    name: rusqlite
    version: 0.34.0
    sha: 37e34486da88d8e051c7c0e23c3f15fd806ea8546260aa2fec247e97242ec143
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
    version: 0.9.1
    sha: 8abe01883100061761642e19324f87514bcaed7ddaab2dfd68041c992987b289
  - kind: registry
    name: rustix
    version: 0.38.44
    sha: fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154
  - kind: registry
    name: rustix
    version: 1.0.7
    sha: c71e83d6afe7ff64890ec6b71d6a69bb8a610ab78ce364b3352876bb4c801266
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
    version: 0.1.27
    sha: 1f29ebaa345f945cec9fbbc532eb307f0fdad8161f281b6369539c8d84876b3d
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
    name: serde-untagged
    version: 0.1.7
    sha: 299d9c19d7d466db4ab10addd5703e4c615dec2a5a16dbbafe191045e87ee66e
  - kind: registry
    name: serde-value
    version: 0.7.0
    sha: f3a1a3341211875ef120e117ea7fd5228530ae7e7036a779fdc9117be6b3282c
  - kind: registry
    name: serde_derive
    version: 1.0.219
    sha: 5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00
  - kind: registry
    name: serde_ignored
    version: 0.1.12
    sha: b516445dac1e3535b6d658a7b528d771153dfb272ed4180ca4617a20550365ff
  - kind: registry
    name: serde_json
    version: 1.0.140
    sha: 20068b6e96dc6c9bd23e01df8827e6c7e1f2fddd43c21810382803c136b99373
  - kind: registry
    name: serde_spanned
    version: 0.6.9
    sha: bf41e0cfaf7226dca15e8197172c295a782857fcb97fad1808a166870dee75a3
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
    version: 0.5.10
    sha: e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678
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
    version: 2.0.104
    sha: 17b6f705963418cdb9927482fa304bc562ece2fdd4f616084c50b7023b435a40
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
    version: 3.20.0
    sha: e8a64e3985349f2441a1a9ef0b853f869006c3855f2cda6862a94d26ebb9d6a1
  - kind: registry
    name: terminal_size
    version: 0.4.2
    sha: 45c6481c4829e4cc63825e62c49186a34538b7b2750b73b266581ffb612fb5ed
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
    name: toml
    version: 0.8.23
    sha: dc1beb996b9d83529a9e75c17a1686767d148d70663143c7854d8b4a09ced362
  - kind: registry
    name: toml_datetime
    version: 0.6.11
    sha: 22cddaf88f4fbc13c51aebbf5f8eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c
  - kind: registry
    name: toml_edit
    version: 0.22.27
    sha: 41fe8c660ae4257887cf66394862d21dbca4a6ddd26f04a3560410406a2f819a
  - kind: registry
    name: toml_write
    version: 0.1.2
    sha: 5d99f8c9a7727884afe522e9bd5edbfc91a3312b36a77b5fb8926e4c31a41801
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
    version: 0.3.19
    sha: e8189decb5ac0fa7bc8b96b7cb9b2701d60d48805aca84a238004d665fcc4008
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
    version: 1.0.18
    sha: 5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512
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
    version: 2.5.4
    sha: 32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60
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
    version: 0.7.11
    sha: 74c7b26e3480b707944fc872477815d29a8e429d2f93a1ce000f5fa84a15cbcd
  - kind: registry
    name: wit-bindgen-rt
    version: 0.39.0
    sha: 6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1
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
    version: 0.8.26
    sha: 1039dd0d3c310cf05de012d8a39ff557cb0d23087fd44cad61df08fc31907a2f
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
  - kind: registry
    name: zlib-rs
    version: 0.5.1
    sha: 626bd9fa9734751fc50d6060752170984d7053f5a39061f524cda68023d4db8a
