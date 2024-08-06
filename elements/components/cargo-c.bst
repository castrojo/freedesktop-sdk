kind: manual

build-depends:
- components/rust.bst
- components/pkg-config.bst

depends:
- bootstrap-import.bst
- components/openssl.bst
- components/curl.bst

config:
  build-commands:
  - cargo build --release --frozen --offline --jobs %{max-jobs}

  install-commands:
  - |
    find "target/release" -maxdepth 1 -type f -executable -exec install -Dm755 -t "%{install-root}%{bindir}" {} +

sources:
- kind: tar
  url: crates:crates/cargo-c/cargo-c-0.10.2+cargo-0.80.0.crate
  ref: f5ff442d62b32a034028df9cb303770ed0bc0ef0f1426fe463f0554907dbdcd0
- kind: cargo2
  ref:
  - kind: registry
    name: adler
    version: 1.0.2
    sha: f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe
  - kind: registry
    name: ahash
    version: 0.8.11
    sha: e89da841a80418a9b391ebaea17f5c112ffaaa96f621d2c285b5174da76b9011
  - kind: registry
    name: aho-corasick
    version: 1.1.3
    sha: 8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916
  - kind: registry
    name: allocator-api2
    version: 0.2.18
    sha: 5c6cb57a04249c6480766f7f7cef5467412af1490f8d1e243141daddada3264f
  - kind: registry
    name: annotate-snippets
    version: 0.11.4
    sha: 24e35ed54e5ea7997c14ed4c70ba043478db1112e98263b3b035907aa197d991
  - kind: registry
    name: anstream
    version: 0.6.14
    sha: 418c75fa768af9c03be99d17643f93f79bbba589895012a80e3452a19ddda15b
  - kind: registry
    name: anstyle
    version: 1.0.7
    sha: 038dfcf04a5feb68e9c60b21c9625a54c2c0616e79b72b0fd87075a056ae1d1b
  - kind: registry
    name: anstyle-parse
    version: 0.2.4
    sha: c03a11a9034d92058ceb6ee011ce58af4a9bf61491aa7e1e59ecd24bd40d22d4
  - kind: registry
    name: anstyle-query
    version: 1.1.0
    sha: ad186efb764318d35165f1758e7dcef3b10628e26d41a44bc5550652e6804391
  - kind: registry
    name: anstyle-wincon
    version: 3.0.3
    sha: 61a38449feb7068f52bb06c12759005cf459ee52bb4adc1d5a7c4322d716fb19
  - kind: registry
    name: anyhow
    version: 1.0.86
    sha: b3d1d046238990b9cf5bcde22a3fb3584ee5cf65fb2765f454ed428c7a0063da
  - kind: registry
    name: arc-swap
    version: 1.7.1
    sha: 69f7f8c3906b62b754cd5326047894316021dcfe5a194c8ea52bdd94934a3457
  - kind: registry
    name: autocfg
    version: 1.3.0
    sha: 0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0
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
    version: 1.6.0
    sha: 8c3c1a368f70d6cf7302d78f8f7093da241fb8e8807c05cc9e51a125895a6d5b
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.6.0
    sha: b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de
  - kind: registry
    name: bitmaps
    version: 2.1.0
    sha: 031043d04099746d8db04daf1fa424b2bc8bd69d92b25962dcde24da39ab64a2
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: bstr
    version: 1.9.1
    sha: 05efc5cfd9110c8416e471df0e96702d58690178e206e61b7173706673c93706
  - kind: registry
    name: bumpalo
    version: 3.16.0
    sha: 79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c
  - kind: registry
    name: bytes
    version: 1.6.0
    sha: 514de17de45fdb8dc022b1a7975556c53c86f9f0aa5f534b98977b171857c2c9
  - kind: registry
    name: bytesize
    version: 1.3.0
    sha: a3e368af43e418a04d52505cf3dbc23dda4e3407ae2fa99fd0e4f308ce546acc
  - kind: registry
    name: cargo
    version: 0.80.0
    sha: 8967aca23ff1827ae659451d066dcfbce4a762d5d423f01a8170b02458ff309f
  - kind: registry
    name: cargo-credential
    version: 0.4.5
    sha: 2008bf0dbde294afcd35f2ded601e98470fcae2fbde6a3f18e959d592edf3721
  - kind: registry
    name: cargo-credential-libsecret
    version: 0.4.5
    sha: 64b34d170c3c6e6925eca04c6a0023ffeca3ab3807a61577a98e013a771bf9df
  - kind: registry
    name: cargo-credential-macos-keychain
    version: 0.4.5
    sha: 29e700381f03699522f7af86504e1e3e246db75d5ad4af0c2bcc58e991c862f9
  - kind: registry
    name: cargo-credential-wincred
    version: 0.4.5
    sha: 3346aa82d2cf5874925510efd78cbbd766e19918909197de0bb947bca1d09180
  - kind: registry
    name: cargo-platform
    version: 0.1.8
    sha: 24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc
  - kind: registry
    name: cargo-util
    version: 0.2.12
    sha: 7b0ade8eec3675f2a0962c3b4c1e1d40f83a8005ed536091d98ed2440bba5254
  - kind: registry
    name: cargo-util-schemas
    version: 0.3.1
    sha: 161d4f7828830c7893180528e121e701bb8070b80c0f97f793a930d285b315a6
  - kind: registry
    name: cbindgen
    version: 0.26.0
    sha: da6bc11b07529f16944307272d5bd9b22530bc7d05751717c9d416586cedab49
  - kind: registry
    name: cc
    version: 1.0.103
    sha: 2755ff20a1d93490d26ba33a6f092a38a508398a5320df5d4b3014fcccce9410
  - kind: registry
    name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - kind: registry
    name: clap
    version: 4.5.8
    sha: 84b3edb18336f4df585bc9aa31dd99c036dfa5dc5e9a2939a722a188f3a8970d
  - kind: registry
    name: clap_builder
    version: 4.5.8
    sha: c1c09dd5ada6c6c78075d6fd0da3f90d8080651e2d6cc8eb2f1aaa4034ced708
  - kind: registry
    name: clap_derive
    version: 4.5.8
    sha: 2bac35c6dafb060fd4d275d9a4ffae97917c13a6327903a8be2153cd964f7085
  - kind: registry
    name: clap_lex
    version: 0.7.1
    sha: 4b82cf0babdbd58558212896d1a4272303a57bdb245c2bf1147185fb45640e70
  - kind: registry
    name: clru
    version: 0.6.2
    sha: cbd0f76e066e64fdc5631e3bb46381254deab9ef1158292f27c8c57e3bf3fe59
  - kind: registry
    name: color-print
    version: 0.3.6
    sha: 1ee543c60ff3888934877a5671f45494dd27ed4ba25c6670b9a7576b7ed7a8c0
  - kind: registry
    name: color-print-proc-macro
    version: 0.3.6
    sha: 77ff1a80c5f3cb1ca7c06ffdd71b6a6dd6d8f896c42141fbd43f50ed28dcdb93
  - kind: registry
    name: colorchoice
    version: 1.0.1
    sha: 0b6a852b24ab71dffc585bcb46eaf7959d175cb865a7152e35b348d1b2960422
  - kind: registry
    name: const-oid
    version: 0.9.6
    sha: c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8
  - kind: registry
    name: core-foundation
    version: 0.9.4
    sha: 91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f
  - kind: registry
    name: core-foundation-sys
    version: 0.8.6
    sha: 06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f
  - kind: registry
    name: cpufeatures
    version: 0.2.12
    sha: 53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504
  - kind: registry
    name: crates-io
    version: 0.40.2
    sha: 36c9c92a030fe475a7666452bab6cee7ff9357d9086bfa341ace645c03fec059
  - kind: registry
    name: crc32fast
    version: 1.4.2
    sha: a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3
  - kind: registry
    name: crossbeam-channel
    version: 0.5.13
    sha: 33480d6946193aa8033910124896ca395333cae7e2d1113d1fef6c3272217df2
  - kind: registry
    name: crossbeam-deque
    version: 0.8.5
    sha: 613f8cc01fe9cf1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d
  - kind: registry
    name: crossbeam-epoch
    version: 0.9.18
    sha: 5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e
  - kind: registry
    name: crossbeam-utils
    version: 0.8.20
    sha: 22ec99545bb0ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80
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
    version: 1.1.1
    sha: f3b7eb4404b8195a9abb6356f4ac07d8ba267045c8d6d220ac4dc992e6cc75df
  - kind: registry
    name: curl
    version: 0.4.46
    sha: 1e2161dd6eba090ff1594084e95fd67aeccf04382ffea77999ea94ed42ec67b6
  - kind: registry
    name: curl-sys
    version: 0.4.73+curl-8.8.0
    sha: 450ab250ecf17227c39afb9a2dd9261dc0035cb80f2612472fc0c4aac2dcb84d
  - kind: registry
    name: dbus
    version: 0.9.7
    sha: 1bb21987b9fb1613058ba3843121dd18b163b254d8a6e797e144cbac14d96d1b
  - kind: registry
    name: der
    version: 0.7.9
    sha: f55bf8e7b65898637379c1b74eb1551107c8294ed26d855ceb9fd1a09cfc9bc0
  - kind: registry
    name: deranged
    version: 0.3.11
    sha: b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4
  - kind: registry
    name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - kind: registry
    name: dunce
    version: 1.0.4
    sha: 56ce8c6da7551ec6c462cbaf3bfbc75131ebbfa1c944aeaa9dab51ca1c5f0c3b
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
    version: 1.13.0
    sha: 60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0
  - kind: registry
    name: elliptic-curve
    version: 0.13.8
    sha: b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47
  - kind: registry
    name: encoding_rs
    version: 0.8.34
    sha: b45de904aa0b010bce2ab45264d0631681847fa7b6f2eaa7dab7619943bc4f59
  - kind: registry
    name: equivalent
    version: 1.0.1
    sha: 5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5
  - kind: registry
    name: erased-serde
    version: 0.4.5
    sha: 24e2389d65ab4fab27dc2a5de7b191e1f6617d1f1c8855c0dc569c94a4cbb18d
  - kind: registry
    name: errno
    version: 0.3.9
    sha: 534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba
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
    version: 0.9.0
    sha: a2a2b11eda1d40935b26cf18f6833c526845ae8c41e58d09af6adeb6f0269183
  - kind: registry
    name: fastrand
    version: 2.1.0
    sha: 9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a
  - kind: registry
    name: ff
    version: 0.13.0
    sha: ded41244b729663b1e574f1b4fb731469f69f79c17667b5d776b16cda0479449
  - kind: registry
    name: fiat-crypto
    version: 0.2.9
    sha: 28dea519a9695b9977216879a3ebfddf92f1c08c05d984f8996aecd6ecdc811d
  - kind: registry
    name: filetime
    version: 0.2.23
    sha: 1ee447700ac8aa0b2f2bd7bc4462ad686ba06baa6727ac149a2d6277f0d240fd
  - kind: registry
    name: flate2
    version: 1.0.30
    sha: 5f54427cfd1c7829e2a139fcefea601bf088ebca651d2bf53ebc600eac295dae
  - kind: registry
    name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
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
    version: 0.2.15
    sha: c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7
  - kind: registry
    name: git2
    version: 0.18.3
    sha: 232e6a7bfe35766bf715e55a88b39a700596c0ccfd88cd3680b4cdb40d66ef70
  - kind: registry
    name: git2-curl
    version: 0.19.0
    sha: 78e26b61608c573ffd26fc79061a823aa5147449a1afe1f61679a21e2031f7c3
  - kind: registry
    name: gix
    version: 0.63.0
    sha: 984c5018adfa7a4536ade67990b3ebc6e11ab57b3d6cd9968de0947ca99b4b06
  - kind: registry
    name: gix-actor
    version: 0.31.3
    sha: e0f52455500a0fac1fd62a1cf42d9121cfddef8cb3ded2f9e7adb5775deb1fc9
  - kind: registry
    name: gix-attributes
    version: 0.22.2
    sha: eefb48f42eac136a4a0023f49a54ec31be1c7a9589ed762c45dcb9b953f7ecc8
  - kind: registry
    name: gix-bitmap
    version: 0.2.11
    sha: a371db66cbd4e13f0ed9dc4c0fea712d7276805fccc877f77e96374d317e87ae
  - kind: registry
    name: gix-chunk
    version: 0.4.8
    sha: 45c8751169961ba7640b513c3b24af61aa962c967aaf04116734975cd5af0c52
  - kind: registry
    name: gix-command
    version: 0.3.7
    sha: 6c22e086314095c43ffe5cdc5c0922d5439da4fd726f3b0438c56147c34dc225
  - kind: registry
    name: gix-commitgraph
    version: 0.24.2
    sha: f7b102311085da4af18823413b5176d7c500fb2272eaf391cfa8635d8bcb12c4
  - kind: registry
    name: gix-config
    version: 0.37.0
    sha: 53fafe42957e11d98e354a66b6bd70aeea00faf2f62dd11164188224a507c840
  - kind: registry
    name: gix-config-value
    version: 0.14.6
    sha: fbd06203b1a9b33a78c88252a625031b094d9e1b647260070c25b09910c0a804
  - kind: registry
    name: gix-credentials
    version: 0.24.2
    sha: 5c70146183bd3c7119329a3c7392d1aa0e0adbe48d727f4df31828fe6d8fdaa1
  - kind: registry
    name: gix-date
    version: 0.8.7
    sha: 9eed6931f21491ee0aeb922751bd7ec97b4b2fe8fbfedcb678e2a2dce5f3b8c0
  - kind: registry
    name: gix-diff
    version: 0.44.0
    sha: 40b9bd8b2d07b6675a840b56a6c177d322d45fa082672b0dad8f063b25baf0a4
  - kind: registry
    name: gix-dir
    version: 0.5.0
    sha: 60c99f8c545abd63abe541d20ab6cda347de406c0a3f1c80aadc12d9b0e94974
  - kind: registry
    name: gix-discover
    version: 0.32.0
    sha: fc27c699b63da66b50d50c00668bc0b7e90c3a382ef302865e891559935f3dbf
  - kind: registry
    name: gix-features
    version: 0.38.2
    sha: ac7045ac9fe5f9c727f38799d002a7ed3583cd777e3322a7c4b43e3cf437dc69
  - kind: registry
    name: gix-filter
    version: 0.11.2
    sha: 00ce6ea5ac8fca7adbc63c48a1b9e0492c222c386aa15f513405f1003f2f4ab2
  - kind: registry
    name: gix-fs
    version: 0.11.1
    sha: c3338ff92a2164f5209f185ec0cd316f571a72676bb01d27e22f2867ba69f77a
  - kind: registry
    name: gix-glob
    version: 0.16.3
    sha: c2a29ad0990cf02c48a7aac76ed0dbddeb5a0d070034b83675cc3bbf937eace4
  - kind: registry
    name: gix-hash
    version: 0.14.2
    sha: f93d7df7366121b5018f947a04d37f034717e113dcf9ccd85c34b58e57a74d5e
  - kind: registry
    name: gix-hashtable
    version: 0.5.2
    sha: 7ddf80e16f3c19ac06ce415a38b8591993d3f73aede049cb561becb5b3a8e242
  - kind: registry
    name: gix-ignore
    version: 0.11.2
    sha: 640dbeb4f5829f9fc14d31f654a34a0350e43a24e32d551ad130d99bf01f63f1
  - kind: registry
    name: gix-index
    version: 0.33.0
    sha: 2d8c5a5f1c58edcbc5692b174cda2703aba82ed17d7176ff4c1752eb48b1b167
  - kind: registry
    name: gix-lock
    version: 14.0.0
    sha: e3bc7fe297f1f4614774989c00ec8b1add59571dc9b024b4c00acb7dedd4e19d
  - kind: registry
    name: gix-macros
    version: 0.1.5
    sha: 999ce923619f88194171a67fb3e6d613653b8d4d6078b529b15a765da0edcc17
  - kind: registry
    name: gix-negotiate
    version: 0.13.1
    sha: d57dec54544d155a495e01de947da024471e1825d7d3f2724301c07a310d6184
  - kind: registry
    name: gix-object
    version: 0.42.2
    sha: 1fe2dc4a41191c680c942e6ebd630c8107005983c4679214fdb1007dcf5ae1df
  - kind: registry
    name: gix-odb
    version: 0.61.0
    sha: e92b9790e2c919166865d0825b26cc440a387c175bed1b43a2fa99c0e9d45e98
  - kind: registry
    name: gix-pack
    version: 0.51.0
    sha: 7a8da51212dbff944713edb2141ed7e002eea326b8992070374ce13a6cb610b3
  - kind: registry
    name: gix-packetline
    version: 0.17.5
    sha: b70486beda0903b6d5b65dfa6e40585098cdf4e6365ca2dff4f74c387354a515
  - kind: registry
    name: gix-packetline-blocking
    version: 0.17.4
    sha: c31d42378a3d284732e4d589979930d0d253360eccf7ec7a80332e5ccb77e14a
  - kind: registry
    name: gix-path
    version: 0.10.8
    sha: ca987128ffb056d732bd545db5db3d8b103d252fbf083c2567bb0796876619a4
  - kind: registry
    name: gix-pathspec
    version: 0.7.5
    sha: a76cab098dc10ba2d89f634f66bf196dea4d7db4bf10b75c7a9c201c55a2ee19
  - kind: registry
    name: gix-prompt
    version: 0.8.5
    sha: fddabbc7c51c241600ab3c4623b19fa53bde7c1a2f637f61043ed5fcadf000cc
  - kind: registry
    name: gix-protocol
    version: 0.45.1
    sha: 3c140d4c6d209048826bad78f021a01b612830f89da356efeb31afe8957f8bee
  - kind: registry
    name: gix-quote
    version: 0.4.12
    sha: cbff4f9b9ea3fa7a25a70ee62f545143abef624ac6aa5884344e70c8b0a1d9ff
  - kind: registry
    name: gix-ref
    version: 0.44.1
    sha: 3394a2997e5bc6b22ebc1e1a87b41eeefbcfcff3dbfa7c4bd73cb0ac8f1f3e2e
  - kind: registry
    name: gix-refspec
    version: 0.23.0
    sha: dde848865834a54fe4d9b4573f15d0e9a68eaf3d061b42d3ed52b4b8acf880b2
  - kind: registry
    name: gix-revision
    version: 0.27.1
    sha: 63e08f8107ed1f93a83bcfbb4c38084c7cb3f6cd849793f1d5eec235f9b13b2b
  - kind: registry
    name: gix-revwalk
    version: 0.13.1
    sha: 4181db9cfcd6d1d0fd258e91569dbb61f94cb788b441b5294dd7f1167a3e788f
  - kind: registry
    name: gix-sec
    version: 0.10.6
    sha: fddc27984a643b20dd03e97790555804f98cf07404e0e552c0ad8133266a79a1
  - kind: registry
    name: gix-submodule
    version: 0.11.0
    sha: 921cd49924ac14b6611b22e5fb7bbba74d8780dc7ad26153304b64d1272460ac
  - kind: registry
    name: gix-tempfile
    version: 14.0.0
    sha: d3b0e276cd08eb2a22e9f286a4f13a222a01be2defafa8621367515375644b99
  - kind: registry
    name: gix-trace
    version: 0.1.9
    sha: f924267408915fddcd558e3f37295cc7d6a3e50f8bd8b606cee0808c3915157e
  - kind: registry
    name: gix-transport
    version: 0.42.1
    sha: eb0ffa5f869977f5b9566399154055902f05d7e85c787d5eacf551acdd0c4adf
  - kind: registry
    name: gix-traverse
    version: 0.39.1
    sha: f20cb69b63eb3e4827939f42c05b7756e3488ef49c25c412a876691d568ee2a0
  - kind: registry
    name: gix-url
    version: 0.27.3
    sha: 0db829ebdca6180fbe32be7aed393591df6db4a72dbbc0b8369162390954d1cf
  - kind: registry
    name: gix-utils
    version: 0.1.12
    sha: 35192df7fd0fa112263bad8021e2df7167df4cc2a6e6d15892e1e55621d3d4dc
  - kind: registry
    name: gix-validate
    version: 0.8.5
    sha: 82c27dd34a49b1addf193c92070bcbf3beaf6e10f16a78544de6372e146a0acf
  - kind: registry
    name: gix-worktree
    version: 0.34.0
    sha: 53f6b7de83839274022aff92157d7505f23debf739d257984a300a35972ca94e
  - kind: registry
    name: glob
    version: 0.3.1
    sha: d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b
  - kind: registry
    name: globset
    version: 0.4.14
    sha: 57da3b9b5b85bd66f31093f8c408b90a74431672542466497dcbdfdc02034be1
  - kind: registry
    name: group
    version: 0.13.0
    sha: f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63
  - kind: registry
    name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - kind: registry
    name: hashbrown
    version: 0.14.5
    sha: e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1
  - kind: registry
    name: hashlink
    version: 0.9.1
    sha: 6ba4ff7128dee98c7dc9794b6a411377e1404dba1c97deb8d1a55297bd25d8af
  - kind: registry
    name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
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
    version: 0.5.9
    sha: e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5
  - kind: registry
    name: http-auth
    version: 0.1.9
    sha: 643c9bbf6a4ea8a656d6b4cd53d34f79e3f841ad5203c1a55fb7d761923bc255
  - kind: registry
    name: humantime
    version: 2.1.0
    sha: 9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4
  - kind: registry
    name: idna
    version: 0.5.0
    sha: 634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6
  - kind: registry
    name: ignore
    version: 0.4.22
    sha: b46810df39e66e925525d6e38ce1e7f6e1d208f72dc39757880fcb66e2c58af1
  - kind: registry
    name: im-rc
    version: 15.1.0
    sha: af1955a75fa080c677d3972822ec4bad316169ab1cfc6c257a942c2265dbe5fe
  - kind: registry
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.2.6
    sha: 168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26
  - kind: registry
    name: is_terminal_polyfill
    version: 1.70.0
    sha: f8478577c03552c21db0e2724ffb8986a5ce7af88107e6be5d2ee6e158c12800
  - kind: registry
    name: itertools
    version: 0.12.1
    sha: ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569
  - kind: registry
    name: itertools
    version: 0.13.0
    sha: 413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186
  - kind: registry
    name: itoa
    version: 1.0.11
    sha: 49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b
  - kind: registry
    name: jobserver
    version: 0.1.31
    sha: d2b099aaa34a9751c5bf0878add70444e1ed2dd73f347be99003d4577277de6e
  - kind: registry
    name: js-sys
    version: 0.3.69
    sha: 29c15563dc2726973df627357ce0c9ddddbea194836909d655df6a75d2cf296d
  - kind: registry
    name: kstring
    version: 2.0.0
    sha: ec3066350882a1cd6d950d055997f379ac37fd39f81cd4d8ed186032eb3c5747
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
    version: 0.2.155
    sha: 97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c
  - kind: registry
    name: libdbus-sys
    version: 0.2.5
    sha: 06085512b750d640299b79be4bad3d2fa90a9c00b1fd9e1b46364f66f0485c72
  - kind: registry
    name: libgit2-sys
    version: 0.16.2+1.7.2
    sha: ee4126d8b4ee5c9d9ea891dd875cfdc1e9d0950437179104b183d7d8a74d24e8
  - kind: registry
    name: libloading
    version: 0.8.4
    sha: e310b3a6b5907f99202fcdb4960ff45b93735d7c7d96b760fcff8db2dc0e103d
  - kind: registry
    name: libnghttp2-sys
    version: 0.1.10+1.61.0
    sha: 959c25552127d2e1fa72f0e52548ec04fc386e827ba71a7bd01db46a447dc135
  - kind: registry
    name: libsqlite3-sys
    version: 0.28.0
    sha: 0c10584274047cb335c23d3e61bcef8e323adae7c5c8c760540f73610177fc3f
  - kind: registry
    name: libssh2-sys
    version: 0.3.0
    sha: 2dc8a030b787e2119a731f1951d6a773e2280c660f8ec4b0f5e1505a386e71ee
  - kind: registry
    name: libz-sys
    version: 1.1.18
    sha: c15da26e5af7e25c90b37a2d75cdbf940cf4a55316de9d84c679c9b8bfabf82e
  - kind: registry
    name: linux-raw-sys
    version: 0.4.14
    sha: 78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89
  - kind: registry
    name: lock_api
    version: 0.4.12
    sha: 07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17
  - kind: registry
    name: log
    version: 0.4.22
    sha: a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24
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
    version: 2.7.4
    sha: 78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3
  - kind: registry
    name: memmap2
    version: 0.9.4
    sha: fe751422e4a8caa417e13c3ea66452215d7d63e19e604f4980461212f3ae1322
  - kind: registry
    name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - kind: registry
    name: miniz_oxide
    version: 0.7.4
    sha: b8a240ddb74feaf34a79a7add65a741f3167852fba007066dcac1ca548d89c08
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
    version: 1.2.0
    sha: 5831952a9476f2fed74b77d74182fa5ddc4d21c72ec45a333b250e3ed0272804
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
    name: num_threads
    version: 0.1.7
    sha: 5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9
  - kind: registry
    name: once_cell
    version: 1.19.0
    sha: 3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92
  - kind: registry
    name: opener
    version: 0.7.1
    sha: f8df34be653210fbe9ffaff41d3b92721c56ce82dfee58ee684f9afb5e3a90c0
  - kind: registry
    name: openssl
    version: 0.10.64
    sha: 95a0481286a310808298130d22dd1fef0fa571e05a8f44ec801801e84b216b1f
  - kind: registry
    name: openssl-macros
    version: 0.1.1
    sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
  - kind: registry
    name: openssl-probe
    version: 0.1.5
    sha: ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf
  - kind: registry
    name: openssl-src
    version: 300.3.1+3.3.1
    sha: 7259953d42a81bf137fbbd73bd30a8e1914d6dce43c2b90ed575783a22608b91
  - kind: registry
    name: openssl-sys
    version: 0.9.102
    sha: c597637d56fbc83893a35eb0dd04b2b8e7a50c91e64e9493e398b5df4fb45fa2
  - kind: registry
    name: ordered-float
    version: 2.10.1
    sha: 68f19d67e5a2795c94e73e0bb1cc1a7edeb2e28efd39e2e1c9b7a40c1108b11c
  - kind: registry
    name: orion
    version: 0.17.6
    sha: 7abdb10181903c8c4b016ba45d6d6d5af1a1e2a461aa4763a83b87f5df4695e5
  - kind: registry
    name: os_info
    version: 3.8.2
    sha: ae99c7fa6dd38c7cafe1ec085e804f8f555a2f8659b0dbe03f1f9963a9b51092
  - kind: registry
    name: overload
    version: 0.1.1
    sha: b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39
  - kind: registry
    name: p384
    version: 0.13.0
    sha: 70786f51bcc69f6a4c0360e063a4cac5419ef7c5cd5b3c99ad70f3be5ba79209
  - kind: registry
    name: parking_lot
    version: 0.12.3
    sha: f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27
  - kind: registry
    name: parking_lot_core
    version: 0.9.10
    sha: 1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8
  - kind: registry
    name: pasetors
    version: 0.6.8
    sha: 6b36d47c66f2230dd1b7143d9afb2b4891879020210eddf2ccb624e529b96dba
  - kind: registry
    name: pathdiff
    version: 0.2.1
    sha: 8835116a5c179084a830efb3adc117ab007512b535bc1a21c991d3b32a6b44dd
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
    version: 0.2.14
    sha: bda66fc9667c18cb2758a2ac84d1167245054bcf85d5d1aaa6923f45801bdd02
  - kind: registry
    name: pkcs8
    version: 0.10.2
    sha: f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7
  - kind: registry
    name: pkg-config
    version: 0.3.30
    sha: d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - kind: registry
    name: ppv-lite86
    version: 0.2.17
    sha: 5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de
  - kind: registry
    name: primeorder
    version: 0.13.6
    sha: 353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6
  - kind: registry
    name: proc-macro2
    version: 1.0.86
    sha: 5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77
  - kind: registry
    name: prodash
    version: 28.0.0
    sha: 744a264d26b88a6a7e37cbad97953fa233b94d585236310bcbc88474b4092d79
  - kind: registry
    name: quote
    version: 1.0.36
    sha: 0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7
  - kind: registry
    name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - kind: registry
    name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - kind: registry
    name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - kind: registry
    name: rand_xoshiro
    version: 0.6.0
    sha: 6f97cdb2a36ed4183de61b2f824cc45c9f1037f28afe0a322e9fff4c108b5aaa
  - kind: registry
    name: redox_syscall
    version: 0.4.1
    sha: 4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa
  - kind: registry
    name: redox_syscall
    version: 0.5.2
    sha: c82cf8cff14456045f55ec4241383baeff27af886adb72ffb2162f99911de0fd
  - kind: registry
    name: regex
    version: 1.10.5
    sha: b91213439dad192326a0d7c6ee3955910425f441d7038e0d6933b0aec5c4517f
  - kind: registry
    name: regex-automata
    version: 0.1.10
    sha: 6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132
  - kind: registry
    name: regex-automata
    version: 0.4.7
    sha: 38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df
  - kind: registry
    name: regex-syntax
    version: 0.6.29
    sha: f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1
  - kind: registry
    name: regex-syntax
    version: 0.8.4
    sha: 7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b
  - kind: registry
    name: rfc6979
    version: 0.4.0
    sha: f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2
  - kind: registry
    name: rusqlite
    version: 0.31.0
    sha: b838eba278d213a8beaf485bd313fd580ca4505a00d5871caeb1457c55322cae
  - kind: registry
    name: rustfix
    version: 0.8.4
    sha: 4cef0c817217c330b3ef879e06455d726c1cffc800eaf7734d3b4ac63213636b
  - kind: registry
    name: rustix
    version: 0.38.34
    sha: 70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f
  - kind: registry
    name: ryu
    version: 1.0.18
    sha: f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f
  - kind: registry
    name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - kind: registry
    name: schannel
    version: 0.1.23
    sha: fbc91545643bcf3a0bbb6569265615222618bdf33ce4ffbbd13c4bbd4c093534
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
    version: 2.11.0
    sha: c627723fd09706bacdb5cf41499e95098555af3c3c29d014dc3c458ef6be11c0
  - kind: registry
    name: security-framework-sys
    version: 2.11.0
    sha: 317936bbbd05227752583946b9e66d7ce3b489f84e11a94a510b4437fef407d7
  - kind: registry
    name: semver
    version: 1.0.23
    sha: 61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b
  - kind: registry
    name: serde
    version: 1.0.203
    sha: 7253ab4de971e72fb7be983802300c30b5a7f0c2e56fab8abfc6a214307c0094
  - kind: registry
    name: serde-untagged
    version: 0.1.6
    sha: 2676ba99bd82f75cae5cbd2c8eda6fa0b8760f18978ea840e980dd5567b5c5b6
  - kind: registry
    name: serde-value
    version: 0.7.0
    sha: f3a1a3341211875ef120e117ea7fd5228530ae7e7036a779fdc9117be6b3282c
  - kind: registry
    name: serde_derive
    version: 1.0.203
    sha: 500cbc0ebeb6f46627f50f3f5811ccf6bf00643be300b4c3eabc0ef55dc5b5ba
  - kind: registry
    name: serde_ignored
    version: 0.1.10
    sha: a8e319a36d1b52126a0d608f24e93b2d81297091818cd70625fcf50a15d84ddf
  - kind: registry
    name: serde_json
    version: 1.0.118
    sha: d947f6b3163d8857ea16c4fa0dd4840d52f3041039a85decd46867eb1abef2e4
  - kind: registry
    name: serde_spanned
    version: 0.6.6
    sha: 79e674e01f999af37c49f70a6ede167a8a60b2503e56c5599532a65baa5969a0
  - kind: registry
    name: sha1
    version: 0.10.6
    sha: e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba
  - kind: registry
    name: sha1_smol
    version: 1.0.0
    sha: ae1a47186c03a32177042e55dbc5fd5aee900b8e0069a8d70fba96a9375cd012
  - kind: registry
    name: sha2
    version: 0.10.8
    sha: 793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8
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
    name: signature
    version: 2.2.0
    sha: 77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de
  - kind: registry
    name: sized-chunks
    version: 0.6.5
    sha: 16d69225bde7a69b235da73377861095455d298f2b970996eec25ddbb42b3d1e
  - kind: registry
    name: smallvec
    version: 1.13.2
    sha: 3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67
  - kind: registry
    name: socket2
    version: 0.5.7
    sha: ce305eb0b4296696835b71df73eb912e0f1ffd2556a501fcede6e0c50349191c
  - kind: registry
    name: spki
    version: 0.7.3
    sha: d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d
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
    version: 3.0.0
    sha: 2c0a1e5168041f5f3ff68ff7d95dcb9c8749df29f6e7e89ada40dd4c9de404ee
  - kind: registry
    name: supports-unicode
    version: 3.0.0
    sha: b7401a30af6cb5818bb64852270bb722533397edcfc7344954a38f420819ece2
  - kind: registry
    name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - kind: registry
    name: syn
    version: 2.0.68
    sha: 901fa70d88b9d6c98022e23b4136f9f3e54e4662c3bc1bd1d84a42a9a0f0c1e9
  - kind: registry
    name: tar
    version: 0.4.41
    sha: cb797dad5fb5b76fcf519e702f4a589483b5ef06567f160c392832c1f5e44909
  - kind: registry
    name: tempfile
    version: 3.10.1
    sha: 85b77fafb263dd9d05cbeac119526425676db3784113aa9295c88498cbf8bff1
  - kind: registry
    name: terminal_size
    version: 0.3.0
    sha: 21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7
  - kind: registry
    name: thiserror
    version: 1.0.61
    sha: c546c80d6be4bc6a00c0f01730c08df82eaa7a7a61f11d656526506112cc1709
  - kind: registry
    name: thiserror-impl
    version: 1.0.61
    sha: 46c3384250002a6d5af4d114f2845d37b57521033f30d5c3f46c4d70e1197533
  - kind: registry
    name: thread_local
    version: 1.1.8
    sha: 8b9ef9bad013ada3808854ceac7b46812a6465ba368859a37e2100283d2d719c
  - kind: registry
    name: time
    version: 0.3.36
    sha: 5dfd88e563464686c916c7e46e623e520ddc6d79fa6641390f2e3fa86e83e885
  - kind: registry
    name: time-core
    version: 0.1.2
    sha: ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3
  - kind: registry
    name: time-macros
    version: 0.2.18
    sha: 3f252a68540fde3a3877aeea552b832b40ab9a69e318efd078774a01ddee1ccf
  - kind: registry
    name: tinyvec
    version: 1.6.1
    sha: c55115c6fbe2d2bef26eb09ad74bde02d8255476fc0c7b515ef09fbb35742d82
  - kind: registry
    name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - kind: registry
    name: toml
    version: 0.5.11
    sha: f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234
  - kind: registry
    name: toml
    version: 0.8.14
    sha: 6f49eb2ab21d2f26bd6db7bf383edc527a7ebaee412d17af4d40fdccd442f335
  - kind: registry
    name: toml_datetime
    version: 0.6.6
    sha: 4badfd56924ae69bcc9039335b2e017639ce3f9b001c393c1b2d1ef846ce2cbf
  - kind: registry
    name: toml_edit
    version: 0.22.14
    sha: f21c7aaf97f1bd9ca9d4f9e73b0a6c74bd5afef56f2bc931943a6e1c37e04e38
  - kind: registry
    name: tracing
    version: 0.1.40
    sha: c3523ab5a71916ccf420eebdf5521fcef02141234bbc0b8a49f2fdc4544364ef
  - kind: registry
    name: tracing-attributes
    version: 0.1.27
    sha: 34704c8d6ebcbc939824180af020566b01a7c01f80641264eba0999f6c2b6be7
  - kind: registry
    name: tracing-chrome
    version: 0.7.2
    sha: bf0a738ed5d6450a9fb96e86a23ad808de2b727fd1394585da5cdd6788ffe724
  - kind: registry
    name: tracing-core
    version: 0.1.32
    sha: c06d3da6113f116aaee68e4d601191614c9053067f9ab7f6edbcb161237daa54
  - kind: registry
    name: tracing-log
    version: 0.2.0
    sha: ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3
  - kind: registry
    name: tracing-subscriber
    version: 0.3.18
    sha: ad0f048c97dbd9faa9b7df56362b8ebcaa52adb06b498c050d2f4e32f90a7a8b
  - kind: registry
    name: typeid
    version: 1.0.0
    sha: 059d83cc991e7a42fc37bd50941885db0888e34209f8cfd9aab07ddec03bc9cf
  - kind: registry
    name: typenum
    version: 1.17.0
    sha: 42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825
  - kind: registry
    name: unicase
    version: 2.7.0
    sha: f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89
  - kind: registry
    name: unicode-bidi
    version: 0.3.15
    sha: 08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75
  - kind: registry
    name: unicode-bom
    version: 2.0.3
    sha: 7eec5d1121208364f6793f7d2e222bf75a915c19557537745b195b253dd64217
  - kind: registry
    name: unicode-ident
    version: 1.0.12
    sha: 3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b
  - kind: registry
    name: unicode-normalization
    version: 0.1.23
    sha: a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415101f5
  - kind: registry
    name: unicode-width
    version: 0.1.13
    sha: 0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d
  - kind: registry
    name: unicode-xid
    version: 0.2.4
    sha: f962df74c8c05a667b5ee8bcf162993134c104e96440b663c8daa176dc772d8c
  - kind: registry
    name: url
    version: 2.5.2
    sha: 22784dbdf76fdde8af1aeda5622b546b422b6fc585325248a2bf9f5e41e94d6c
  - kind: registry
    name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - kind: registry
    name: valuable
    version: 0.1.0
    sha: 830b7e5d4d90034032940e4ace0d9a9a057e7a45cd94e6c007832e39edb82f6d
  - kind: registry
    name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
  - kind: registry
    name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - kind: registry
    name: walkdir
    version: 2.5.0
    sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
  - kind: registry
    name: wasi
    version: 0.11.0+wasi-snapshot-preview1
    sha: 9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423
  - kind: registry
    name: wasm-bindgen
    version: 0.2.92
    sha: 4be2531df63900aeb2bca0daaaddec08491ee64ceecbee5076636a3b026795a8
  - kind: registry
    name: wasm-bindgen-backend
    version: 0.2.92
    sha: 614d787b966d3989fa7bb98a654e369c762374fd3213d212cfc0251257e747da
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.92
    sha: a1f8823de937b71b9460c0c34e25f3da88250760bec0ebac694b49997550d726
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.92
    sha: e94f17b526d0a461a191c78ea52bbce64071ed5c04c9ffe424dcb38f74171bb7
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.92
    sha: af190c94f2773fdb3729c55b007a722abb5384da03bc0986df4c289bf5567e96
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
    version: 0.1.8
    sha: 4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91cf9c4c64358067d15a7b6c6b
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
    name: windows-targets
    version: 0.48.5
    sha: 9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c
  - kind: registry
    name: windows-targets
    version: 0.52.5
    sha: 6f0713a46559409d202e70e28227288446bf7841d3211583a4b53e3f6d96e7eb
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.48.5
    sha: 2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.52.5
    sha: 7088eed71e8b8dda258ecc8bac5fb1153c5cffaf2578fc8ff5d61e23578d3263
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.48.5
    sha: dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.52.5
    sha: 9985fd1504e250c615ca5f281c3f7a6da76213ebd5ccc9561496568a2752afb6
  - kind: registry
    name: windows_i686_gnu
    version: 0.48.5
    sha: a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e
  - kind: registry
    name: windows_i686_gnu
    version: 0.52.5
    sha: 88ba073cf16d5372720ec942a8ccbf61626074c6d4dd2e745299726ce8b89670
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.52.5
    sha: 87f4261229030a858f36b459e748ae97545d6f1ec60e5e0d6a3d32e0dc232ee9
  - kind: registry
    name: windows_i686_msvc
    version: 0.48.5
    sha: 8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406
  - kind: registry
    name: windows_i686_msvc
    version: 0.52.5
    sha: db3c2bf3d13d5b658be73463284eaf12830ac9a26a90c717b7f771dfe97487bf
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.48.5
    sha: 53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.52.5
    sha: 4e4246f76bdeff09eb48875a0fd3e2af6aada79d409d33011886d3e1581517d9
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.48.5
    sha: 0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.52.5
    sha: 852298e482cd67c356ddd9570386e2862b5673c85bd5f88df9ab6802b334c596
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.48.5
    sha: ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.52.5
    sha: bec47e5bfd1bff0eeaf6d8b485cc1074891a197ab4225d504cb7a1ab88b02bf0
  - kind: registry
    name: winnow
    version: 0.6.13
    sha: 59b5e5f6c299a3c7890b876a2a587f3115162487e704907d9b6cd29473052ba1
  - kind: registry
    name: zerocopy
    version: 0.7.34
    sha: ae87e3fcd617500e5d106f0380cf7b77f3c6092aae37191433159dda23cfb087
  - kind: registry
    name: zerocopy-derive
    version: 0.7.34
    sha: 15e934569e47891f7d9411f1a451d947a60e000ab3bd24fbb970f000387d1b3b
  - kind: registry
    name: zeroize
    version: 1.8.1
    sha: ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde
