kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-rust.bst

depends:
- components/python3.bst
- components/rust.bst

sources:
- kind: git_repo
  url: github:PyO3/maturin.git
  track: v*
  exclude:
  - "*beta*"
  ref: v1.8.7-0-g53def9f880e0a6b5e20ed831cdbfd62a6fb0bc6a
- kind: cargo2
  cargo-lock: Cargo.lock
  ref:
  - kind: registry
    name: adler2
    version: 2.0.0
    sha: 512761e0bb2578dd7380c6baaa0f4ce03e84f95e960231d1dec8bf4d7d6e2627
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
    version: 1.0.89
    sha: 86fdf8605db99b54d3cd748a44c6d04df638eb5dafb219b135d0149bd0db01f6
  - kind: registry
    name: arbitrary
    version: 1.4.1
    sha: dde20b3d026af13f561bdd0f15edf01fc734f0dafcedbaf42bba506a9517f223
  - kind: registry
    name: autocfg
    version: 1.3.0
    sha: 0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0
  - kind: registry
    name: automod
    version: 1.0.14
    sha: edf3ee19dbc0a46d740f6f0926bde8c50f02bdbc7b536842da28f6ac56513a8b
  - kind: registry
    name: base64
    version: 0.21.7
    sha: 9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.5.0
    sha: cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: boxcar
    version: 0.2.8
    sha: 2721c3c5a6f0e7f7e607125d963fedeb765f545f67adc9d71ed934693881eb42
  - kind: registry
    name: bstr
    version: 1.10.0
    sha: 40723b8fb387abc38f4f4a37c09073622e41dd12327033091ef8950659e6dc0c
  - kind: registry
    name: bumpalo
    version: 3.16.0
    sha: 79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c
  - kind: registry
    name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - kind: registry
    name: bytes
    version: 1.9.0
    sha: 325918d6fe32f23b19878fe4b34794ae41fc19ddbe53b10571a4874d44ffd39b
  - kind: registry
    name: bytesize
    version: 1.3.0
    sha: a3e368af43e418a04d52505cf3dbc23dda4e3407ae2fa99fd0e4f308ce546acc
  - kind: registry
    name: bzip2
    version: 0.5.2
    sha: 49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47
  - kind: registry
    name: bzip2-sys
    version: 0.1.13+1.0.8
    sha: 225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14
  - kind: registry
    name: cab
    version: 0.6.0
    sha: 171228650e6721d5acc0868a462cd864f49ac5f64e4a42cde270406e64e404d2
  - kind: registry
    name: camino
    version: 1.1.9
    sha: 8b96ec4966b5813e2c0507c1f86115c8c5abaadc3980879c3424042a02fd1ad3
  - kind: registry
    name: cargo-config2
    version: 0.1.26
    sha: d83ce0be8bd1479e5de6202def660e6c7e27e4e0599bffa4fed05bd380ec2ede
  - kind: registry
    name: cargo-options
    version: 0.7.4
    sha: f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f
  - kind: registry
    name: cargo-platform
    version: 0.1.8
    sha: 24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc
  - kind: registry
    name: cargo-xwin
    version: 0.18.6
    sha: 5dff83aad332bd6ee29072dd874b48892cd22c58e233c25735eb4417b3999685
  - kind: registry
    name: cargo-zigbuild
    version: 0.20.0
    sha: 3f6e9e856390d5b0a859acaeda16528f8a61c964bdb894c3216c254908f1c2ea
  - kind: registry
    name: cargo_metadata
    version: 0.19.0
    sha: afc309ed89476c8957c50fb818f56fe894db857866c3e163335faa91dc34eb85
  - kind: registry
    name: cbindgen
    version: 0.29.0
    sha: 975982cdb7ad6a142be15bdf84aea7ec6a9e5d4d797c004d43185b24cfe4e684
  - kind: registry
    name: cc
    version: 1.2.16
    sha: be714c154be609ec7f5dad223a33bf1482fff90472de28f7362806e6d4832b8c
  - kind: registry
    name: cfb
    version: 0.10.0
    sha: d8a4f8e55be323b378facfcf1f06aa97f6ec17cf4ac84fb17325093aaf62da41
  - kind: registry
    name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - kind: registry
    name: charset
    version: 0.1.5
    sha: f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e
  - kind: registry
    name: chumsky
    version: 0.9.3
    sha: 8eebd66744a15ded14960ab4ccdbfb51ad3b81f51f3f04a80adac98c985396c9
  - kind: registry
    name: clap
    version: 4.5.7
    sha: 5db83dced34638ad474f39f250d7fea9598bdd239eaced1bdf45d597da0f433f
  - kind: registry
    name: clap_builder
    version: 4.5.7
    sha: f7e204572485eb3fbf28f871612191521df159bc3e15a9f5064c66dba3a8c05f
  - kind: registry
    name: clap_complete
    version: 4.5.5
    sha: d2020fa13af48afc65a9a87335bda648309ab3d154cd03c7ff95b378c7ed39c4
  - kind: registry
    name: clap_complete_command
    version: 0.6.1
    sha: da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62
  - kind: registry
    name: clap_complete_nushell
    version: 4.5.2
    sha: 1accf1b463dee0d3ab2be72591dccdab8bef314958340447c882c4c72acfe2a3
  - kind: registry
    name: clap_derive
    version: 4.5.5
    sha: c780290ccf4fb26629baa7a1081e68ced113f1d3ec302fa5948f1c381ebf06c6
  - kind: registry
    name: clap_lex
    version: 0.7.1
    sha: 4b82cf0babdbd58558212896d1a4272303a57bdb245c2bf1147185fb45640e70
  - kind: registry
    name: cli-table
    version: 0.4.7
    sha: adfbb116d9e2c4be7011360d0c0bee565712c11e969c9609b25b619366dc379d
  - kind: registry
    name: colorchoice
    version: 1.0.1
    sha: 0b6a852b24ab71dffc585bcb46eaf7959d175cb865a7152e35b348d1b2960422
  - kind: registry
    name: configparser
    version: 3.1.0
    sha: e57e3272f0190c3f1584272d613719ba5fc7df7f4942fe542e63d949cf3a649b
  - kind: registry
    name: console
    version: 0.15.8
    sha: 0e1f83fc076bd6dd27517eacdf25fef6c4dfe5f1d7448bafaaf3a26f13b5e4eb
  - kind: registry
    name: content_inspector
    version: 0.2.4
    sha: b7bda66e858c683005a53a9a60c69a4aca7eeaa45d124526e389f7aec8e62f38
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
    name: crc
    version: 3.2.1
    sha: 69e6e4d7b33a94f0991c26729976b10ebde1d34c3ee82408fb536164fa10d636
  - kind: registry
    name: crc-catalog
    version: 2.4.0
    sha: 19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5
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
    name: crypto-common
    version: 0.1.6
    sha: 1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3
  - kind: registry
    name: data-encoding
    version: 2.6.0
    sha: e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2
  - kind: registry
    name: deranged
    version: 0.3.11
    sha: b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4
  - kind: registry
    name: derive_arbitrary
    version: 1.4.1
    sha: 30542c1ad912e0e3d22a1935c290e12e8a29d704a420177a31faad4a601a0800
  - kind: registry
    name: dialoguer
    version: 0.11.0
    sha: 658bce805d770f407bc62102fca7c2c64ceef2fbcb2b8bd19d2765ce093980de
  - kind: registry
    name: diff
    version: 0.1.13
    sha: 56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8
  - kind: registry
    name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - kind: registry
    name: dirs
    version: 5.0.1
    sha: 44c45a9d03d6676652bcb5e724c7e988de1acad23a711b5217ab9cbecbec2225
  - kind: registry
    name: dirs-sys
    version: 0.4.1
    sha: 520f05a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c
  - kind: registry
    name: displaydoc
    version: 0.2.5
    sha: 97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0
  - kind: registry
    name: dissimilar
    version: 1.0.9
    sha: 59f8e79d1fbf76bdfbde321e902714bf6c49df88a7dda6fc682fc2979226962d
  - kind: registry
    name: dunce
    version: 1.0.5
    sha: 92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813
  - kind: registry
    name: dyn-clone
    version: 1.0.17
    sha: 0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125
  - kind: registry
    name: either
    version: 1.13.0
    sha: 60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0
  - kind: registry
    name: encode_unicode
    version: 0.3.6
    sha: a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f
  - kind: registry
    name: encoding_rs
    version: 0.8.34
    sha: b45de904aa0b010bce2ab45264d0631681847fa7b6f2eaa7dab7619943bc4f59
  - kind: registry
    name: equivalent
    version: 1.0.1
    sha: 5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5
  - kind: registry
    name: errno
    version: 0.3.9
    sha: 534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba
  - kind: registry
    name: expect-test
    version: 1.5.0
    sha: 9e0be0a561335815e06dab7c62e50353134c796e7a6155402a64bcff66b6a5e0
  - kind: registry
    name: fastrand
    version: 2.1.0
    sha: 9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a
  - kind: registry
    name: fat-macho
    version: 0.4.9
    sha: 4c9c45caa6c6edfaee4cb3bd84ea9686e115df7f0efb530e15fb466eccb0b345
  - kind: registry
    name: filetime
    version: 0.2.23
    sha: 1ee447700ac8aa0b2f2bd7bc4462ad686ba06baa6727ac149a2d6277f0d240fd
  - kind: registry
    name: flate2
    version: 1.0.33
    sha: 324a1be68054ef05ad64b861cc9eaf1d623d2d8cb25b4bf2cb9cdd902b4bf253
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
    name: fs-err
    version: 3.0.0
    sha: 8bb60e7409f34ef959985bc9d9c5ee8f5db24ee46ed9775850548021710f807f
  - kind: registry
    name: fs4
    version: 0.12.0
    sha: c29c30684418547d476f0b48e84f4821639119c483b1eccd566c8cd0cd05f521
  - kind: registry
    name: futures
    version: 0.3.30
    sha: 645c6916888f6cb6350d2550b80fb63e734897a8498abe35cfb732b6487804b0
  - kind: registry
    name: futures-channel
    version: 0.3.31
    sha: 2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10
  - kind: registry
    name: futures-core
    version: 0.3.31
    sha: 05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e
  - kind: registry
    name: futures-executor
    version: 0.3.30
    sha: a576fc72ae164fca6b9db127eaa9a9dda0d61316034f33a0a0d4eda41f02b01d
  - kind: registry
    name: futures-io
    version: 0.3.31
    sha: 9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6
  - kind: registry
    name: futures-macro
    version: 0.3.31
    sha: 162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650
  - kind: registry
    name: futures-sink
    version: 0.3.31
    sha: e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7
  - kind: registry
    name: futures-task
    version: 0.3.31
    sha: f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988
  - kind: registry
    name: futures-timer
    version: 3.0.3
    sha: f288b0a4f20f9a56b5d1da57e2227c661b7b16168e2f72365f57b63326e29b24
  - kind: registry
    name: futures-util
    version: 0.3.31
    sha: 9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81
  - kind: registry
    name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - kind: registry
    name: getrandom
    version: 0.2.15
    sha: c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7
  - kind: registry
    name: getrandom
    version: 0.3.3
    sha: 26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4
  - kind: registry
    name: glob
    version: 0.3.1
    sha: d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b
  - kind: registry
    name: globset
    version: 0.4.15
    sha: 15f1ce686646e7f1e19bf7d5533fe443a45dbfb990e00629110797578b42fb19
  - kind: registry
    name: goblin
    version: 0.9.2
    sha: 53ab3f32d1d77146981dea5d6b1e8fe31eedcb7013e5e00d6ccd1259a4b4d923
  - kind: registry
    name: hashbrown
    version: 0.14.5
    sha: e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1
  - kind: registry
    name: hashbrown
    version: 0.15.2
    sha: bf151400ff0baff5465007dd2f3e717f3fe502074ca563069ce3a6629d07b289
  - kind: registry
    name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - kind: registry
    name: home
    version: 0.5.9
    sha: e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5
  - kind: registry
    name: humantime
    version: 2.1.0
    sha: 9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4
  - kind: registry
    name: humantime-serde
    version: 1.1.1
    sha: 57a3db5ea5923d99402c94e9feb261dc5ee9b4efa158b0315f788cf549cc200c
  - kind: registry
    name: icu_collections
    version: 1.5.0
    sha: db2fa452206ebee18c4b5c2274dbf1de17008e874b4dc4f0aea9d01ca79e4526
  - kind: registry
    name: icu_locid
    version: 1.5.0
    sha: 13acbb8371917fc971be86fc8057c41a64b521c184808a698c02acc242dbf637
  - kind: registry
    name: icu_locid_transform
    version: 1.5.0
    sha: 01d11ac35de8e40fdeda00d9e1e9d92525f3f9d887cdd7aa81d727596788b54e
  - kind: registry
    name: icu_locid_transform_data
    version: 1.5.0
    sha: fdc8ff3388f852bede6b579ad4e978ab004f139284d7b28715f773507b946f6e
  - kind: registry
    name: icu_normalizer
    version: 1.5.0
    sha: 19ce3e0da2ec68599d193c93d088142efd7f9c5d6fc9b803774855747dc6a84f
  - kind: registry
    name: icu_normalizer_data
    version: 1.5.0
    sha: f8cafbf7aa791e9b22bec55a167906f9e1215fd475cd22adfcf660e03e989516
  - kind: registry
    name: icu_properties
    version: 1.5.1
    sha: 93d6020766cfc6302c15dbbc9c8778c37e62c14427cb7f6e601d849e092aeef5
  - kind: registry
    name: icu_properties_data
    version: 1.5.0
    sha: 67a8effbc3dd3e4ba1afa8ad918d5684b8868b3b26500753effea8d2eed19569
  - kind: registry
    name: icu_provider
    version: 1.5.0
    sha: 6ed421c8a8ef78d3e2dbc98a973be2f3770cb42b606e3ab18d6237c4dfde68d9
  - kind: registry
    name: icu_provider_macros
    version: 1.5.0
    sha: 1ec89e9337638ecdc08744df490b221a7399bf8d164eb52a665454e60e075ad6
  - kind: registry
    name: idna
    version: 1.0.3
    sha: 686f825264d630750a544639377bae737628043f20d38bbc029e8f29ea968a7e
  - kind: registry
    name: idna_adapter
    version: 1.2.0
    sha: daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71
  - kind: registry
    name: ignore
    version: 0.4.23
    sha: 6d89fd380afde86567dfba715db065673989d6253f42b88179abd3eae47bda4b
  - kind: registry
    name: indexmap
    version: 2.6.0
    sha: 707907fe3c25f5424cce2cb7e1cbcafee6bdbe735ca90ef77c29e84591e5b9da
  - kind: registry
    name: indicatif
    version: 0.17.9
    sha: cbf675b85ed934d3c67b5c5469701eec7db22689d0a2139d856e0925fa28b281
  - kind: registry
    name: indoc
    version: 2.0.5
    sha: b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5
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
    version: 0.1.33
    sha: 38f262f097c174adebe41eb73d66ae9c06b2844fb0da69969647bbddd9b0538a
  - kind: registry
    name: js-sys
    version: 0.3.73
    sha: fb15147158e79fd8b8afd0252522769c4f48725460b37338544d8379d94fc8f9
  - kind: registry
    name: keyring
    version: 2.3.3
    sha: 363387f0019d714aa60cc30ab4fe501a747f4c08fc58f069dd14be971bd495a0
  - kind: registry
    name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - kind: registry
    name: lddtree
    version: 0.3.7
    sha: e0779ac94bd7b6ab781fa12388dbf79ac45ec1fa433e7d25521753be8227b08e
  - kind: registry
    name: libc
    version: 0.2.172
    sha: d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa
  - kind: registry
    name: libmimalloc-sys
    version: 0.1.39
    sha: 23aa6811d3bd4deb8a84dde645f943476d13b248d818edcf8ce0b2f37f036b44
  - kind: registry
    name: libredox
    version: 0.1.3
    sha: c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d
  - kind: registry
    name: linux-keyutils
    version: 0.2.4
    sha: 761e49ec5fd8a5a463f9b84e877c373d888935b71c6be78f3767fe2ae6bed18e
  - kind: registry
    name: linux-raw-sys
    version: 0.4.14
    sha: 78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89
  - kind: registry
    name: litemap
    version: 0.7.3
    sha: 643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704
  - kind: registry
    name: lock_api
    version: 0.4.12
    sha: 07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17
  - kind: registry
    name: lockfree-object-pool
    version: 0.1.6
    sha: 9374ef4228402d4b7e403e5838cb880d9ee663314b0a900d5a6aabf0c213552e
  - kind: registry
    name: log
    version: 0.4.22
    sha: a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24
  - kind: registry
    name: lzma-rs
    version: 0.3.0
    sha: 297e814c836ae64db86b36cf2a557ba54368d03f6afcd7d947c266692f71115e
  - kind: registry
    name: lzma-sys
    version: 0.1.20
    sha: 5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27
  - kind: registry
    name: lzxd
    version: 0.2.5
    sha: 5de7336a183103429ad66d11d56d8bdc9c4a2916f6b85a8f11e5b127bde12001
  - kind: registry
    name: mailparse
    version: 0.15.0
    sha: 3da03d5980411a724e8aaf7b61a7b5e386ec55a7fb49ee3d0ff79efc7e5e7c7e
  - kind: registry
    name: matchers
    version: 0.1.0
    sha: 8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558
  - kind: registry
    name: memchr
    version: 2.7.4
    sha: 78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3
  - kind: registry
    name: mimalloc
    version: 0.1.43
    sha: 68914350ae34959d83f732418d51e2427a794055d0b9529f48259ac07af65633
  - kind: registry
    name: mime
    version: 0.3.17
    sha: 6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a
  - kind: registry
    name: mime_guess
    version: 2.0.4
    sha: 4192263c238a5f0d0c6bfd21f336a313a4ce1c450542449ca191bb657b4642ef
  - kind: registry
    name: minijinja
    version: 2.5.0
    sha: 2c37e1b517d1dcd0e51dc36c4567b9d5a29262b3ec8da6cb5d35e27a8fb529b5
  - kind: registry
    name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - kind: registry
    name: miniz_oxide
    version: 0.8.0
    sha: e2d80299ef12ff69b16a84bb182e3b9df68b5a91574d3d4fa6e41b65deec4df1
  - kind: registry
    name: msi
    version: 0.8.0
    sha: 4a2332f87a064dea9cce571408c879e0da8dc193b3af06a2b3b2604ee4182a32
  - kind: registry
    name: multipart
    version: 0.18.0
    sha: 00dec633863867f29cb39df64a397cdf4a6354708ddd7759f70c7fb51c5f9182
  - kind: registry
    name: native-tls
    version: 0.2.12
    sha: a8614eb2c83d59d1c8cc974dd3f920198647674a0a035e1af1fa58707e317466
  - kind: registry
    name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - kind: registry
    name: normalize-line-endings
    version: 0.3.0
    sha: 61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be
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
    name: number_prefix
    version: 0.4.0
    sha: 830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3
  - kind: registry
    name: once_cell
    version: 1.20.2
    sha: 1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775
  - kind: registry
    name: openssl
    version: 0.10.72
    sha: fedfea7d58a1f73118430a55da6a286e7b044961736ce96a16a17068ea25e5da
  - kind: registry
    name: openssl-macros
    version: 0.1.1
    sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
  - kind: registry
    name: openssl-probe
    version: 0.1.5
    sha: ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf
  - kind: registry
    name: openssl-sys
    version: 0.9.107
    sha: 8288979acd84749c744a9014b4382d42b8f7b2592847b5afb2ed29e5d16ede07
  - kind: registry
    name: option-ext
    version: 0.2.0
    sha: 04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d
  - kind: registry
    name: os_pipe
    version: 1.2.0
    sha: 29d73ba8daf8fac13b0501d1abeddcfe21ba7401ada61a819144b6c2a4f32209
  - kind: registry
    name: overload
    version: 0.1.1
    sha: b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39
  - kind: registry
    name: parking_lot
    version: 0.12.3
    sha: f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27
  - kind: registry
    name: parking_lot_core
    version: 0.9.10
    sha: 1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8
  - kind: registry
    name: paste
    version: 1.0.15
    sha: 57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a
  - kind: registry
    name: path-slash
    version: 0.2.1
    sha: 1e91099d4268b0e11973f036e885d652fb0b21fedcf69738c627f94db6a44f42
  - kind: registry
    name: pep440_rs
    version: 0.7.3
    sha: 31095ca1f396e3de32745f42b20deef7bc09077f918b085307e8eab6ddd8fb9c
  - kind: registry
    name: pep508_rs
    version: 0.9.2
    sha: faee7227064121fcadcd2ff788ea26f0d8f2bd23a0574da11eca23bc935bcc05
  - kind: registry
    name: percent-encoding
    version: 2.3.1
    sha: e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e
  - kind: registry
    name: pin-project-lite
    version: 0.2.15
    sha: 915a1e146535de9163f3987b8944ed8cf49a18bb0056bcebcdcece385cece4ff
  - kind: registry
    name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - kind: registry
    name: pkg-config
    version: 0.3.30
    sha: d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec
  - kind: registry
    name: plain
    version: 0.2.3
    sha: b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6
  - kind: registry
    name: platform-info
    version: 2.0.3
    sha: d5ff316b9c4642feda973c18f0decd6c8b0919d4722566f6e4337cce0dd88217
  - kind: registry
    name: portable-atomic
    version: 1.6.0
    sha: 7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - kind: registry
    name: ppv-lite86
    version: 0.2.17
    sha: 5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de
  - kind: registry
    name: pretty_assertions
    version: 1.4.1
    sha: 3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d
  - kind: registry
    name: proc-macro-crate
    version: 3.1.0
    sha: 6d37c51ca738a55da99dc0c4a34860fd675453b8b36209178c2249bb13651284
  - kind: registry
    name: proc-macro2
    version: 1.0.92
    sha: 37d3544b3f2748c54e147655edb5025752e2303145b5aefb3c3ea2c78b973bb0
  - kind: registry
    name: psm
    version: 0.1.21
    sha: 5787f7cda34e3033a72192c018bc5883100330f362ef279a8cbccfce8bb4e874
  - kind: registry
    name: pyproject-toml
    version: 0.13.4
    sha: 643af57c3f36ba90a8b53e972727d8092f7408a9ebfbaf4c3d2c17b07c58d835
  - kind: registry
    name: python-pkginfo
    version: 0.6.5
    sha: c21f58880fc45e91d29b2f639ab4051aaa6a2b054534c2d343a953347d0dd600
  - kind: registry
    name: quote
    version: 1.0.37
    sha: b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af
  - kind: registry
    name: quoted_printable
    version: 0.5.0
    sha: 79ec282e887b434b68c18fe5c121d38e72a5cf35119b59e54ec5b992ea9c8eb0
  - kind: registry
    name: r-efi
    version: 5.2.0
    sha: 74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5
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
    name: rayon
    version: 1.10.0
    sha: b418a60154510ca1a002a752ca9714984e21e4241e804d32555251faf8b78ffa
  - kind: registry
    name: rayon-core
    version: 1.12.1
    sha: 1465873a3dfdaa8ae7cb14b4383657caab0b3e8a0aa9ae8e04b044854c8dfce2
  - kind: registry
    name: redox_syscall
    version: 0.4.1
    sha: 4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa
  - kind: registry
    name: redox_syscall
    version: 0.5.1
    sha: 469052894dcb553421e483e4209ee581a45100d31b4018de03e5a7ad86374a7e
  - kind: registry
    name: redox_users
    version: 0.4.5
    sha: bd283d9651eeda4b2a83a43c1c91b266c40fd76ecd39a50a8c630ae69dc72891
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
    name: relative-path
    version: 1.9.3
    sha: ba39f3699c378cd8970968dcbff9c43159ea4cfbd88d43c00b22f2ef10a435d2
  - kind: registry
    name: rfc2047-decoder
    version: 1.0.6
    sha: bc36545d1021456a751b573517cb52e8c339b2f662e6b2778ef629282678de29
  - kind: registry
    name: ring
    version: 0.17.13
    sha: 70ac5d832aa16abd7d1def883a8545280c20a60f523a370aa3a9617c2b8550ee
  - kind: registry
    name: rstest
    version: 0.22.0
    sha: 7b423f0e62bdd61734b67cd21ff50871dfaeb9cc74f869dcd6af974fbcb19936
  - kind: registry
    name: rstest_macros
    version: 0.22.0
    sha: c5e1711e7d14f74b12a58411c542185ef7fb7f2e7f8ee6e2940a883628522b42
  - kind: registry
    name: rustc-hash
    version: 2.0.0
    sha: 583034fd73374156e66797ed8e5b0d5690409c9226b22d87cb7f19821c05d152
  - kind: registry
    name: rustc_version
    version: 0.4.1
    sha: cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92
  - kind: registry
    name: rustflags
    version: 0.1.6
    sha: d7fc92159fb50a431c5da366f7627751fe7263cf867f8a30f27fa6063ba02ac0
  - kind: registry
    name: rustix
    version: 0.38.41
    sha: d7f649912bc1495e167a6edee79151c84b1bad49748cb4f1f1167f459f6224f6
  - kind: registry
    name: rustls
    version: 0.23.19
    sha: 934b404430bb06b3fae2cba809eb45a1ab1aecd64491213d7c3301b88393f8d1
  - kind: registry
    name: rustls-pemfile
    version: 2.1.3
    sha: 196fe16b00e106300d3e45ecfcb764fa292a535d7326a29a5875c579c7417425
  - kind: registry
    name: rustls-pki-types
    version: 1.10.0
    sha: 16f1201b3c9a7ee8039bcadc17b7e605e2945b27eee7631788c1bd2b0643674b
  - kind: registry
    name: rustls-webpki
    version: 0.102.8
    sha: 64ca1bc8749bd4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9
  - kind: registry
    name: rustversion
    version: 1.0.18
    sha: 0e819f2bc632f285be6d7cd36e25940d45b2391dd6d9b939e79de557f7014248
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
    name: schemars
    version: 0.8.21
    sha: 09c024468a378b7e36765cd36702b7a90cc3cba11654f6685c8f233408e89e92
  - kind: registry
    name: schemars_derive
    version: 0.8.21
    sha: b1eee588578aff73f856ab961cd2f79e36bc45d7ded33a7562adba4667aecc0e
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - kind: registry
    name: scroll
    version: 0.12.0
    sha: 6ab8598aa408498679922eff7fa985c25d58a90771bd6be794434c5277eab1a6
  - kind: registry
    name: scroll_derive
    version: 0.12.0
    sha: 7f81c2fde025af7e69b1d1420531c8a8811ca898919db177141a85313b1cb932
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
    version: 1.0.217
    sha: 02fc4265df13d6fa1d00ecff087228cc0a2b5f3c0e87e258d8b94a156e984c70
  - kind: registry
    name: serde_derive
    version: 1.0.217
    sha: 5a9bf7cf98d04a2b28aead066b7496853d4779c9cc183c440dbac457641e19a0
  - kind: registry
    name: serde_derive_internals
    version: 0.29.1
    sha: 18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711
  - kind: registry
    name: serde_json
    version: 1.0.135
    sha: 2b0d7ba2887406110130a978386c4e1befb98c674b4fba677954e4db976630d9
  - kind: registry
    name: serde_spanned
    version: 0.6.8
    sha: 87607cb1398ed59d48732e575a4c28a7a8ebf2454b964fe3f224f2afc07909e1
  - kind: registry
    name: sha2
    version: 0.10.8
    sha: 793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8
  - kind: registry
    name: sharded-slab
    version: 0.1.7
    sha: f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6
  - kind: registry
    name: shell-words
    version: 1.1.0
    sha: 24188a676b6ae68c3b2cb3a01be17fbf7240ce009799bb56d5b1409051e78fde
  - kind: registry
    name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - kind: registry
    name: simd-adler32
    version: 0.3.7
    sha: d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe
  - kind: registry
    name: similar
    version: 2.5.0
    sha: fa42c91313f1d05da9b26f267f931cf178d4aba455b4c4622dd7355eb80c6640
  - kind: registry
    name: slab
    version: 0.4.9
    sha: 8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67
  - kind: registry
    name: smallvec
    version: 1.13.2
    sha: 3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67
  - kind: registry
    name: smawk
    version: 0.3.2
    sha: b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c
  - kind: registry
    name: snapbox
    version: 0.6.16
    sha: 027c936207f85d10d015e21faf5c676c7e08c453ed371adf55c0874c443ca77a
  - kind: registry
    name: snapbox-macros
    version: 0.3.10
    sha: 16569f53ca23a41bb6f62e0a5084aa1661f4814a67fa33696a79073e03a664af
  - kind: registry
    name: socks
    version: 0.3.4
    sha: f0c3dbbd9ae980613c6dd8e28a9407b50509d3803b57624d5dfe8315218cd58b
  - kind: registry
    name: stable_deref_trait
    version: 1.2.0
    sha: a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3
  - kind: registry
    name: stacker
    version: 0.1.15
    sha: c886bd4480155fd3ef527d45e9ac8dd7118a898a46530b7b94c3e21866259fce
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
    version: 2.5.0
    sha: 81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc
  - kind: registry
    name: syn
    version: 2.0.90
    sha: 919d3b74a5dd0ccd15aeb8f93e7006bd9e14c295087c9896a110f490752bcf31
  - kind: registry
    name: synstructure
    version: 0.13.1
    sha: c8af7666ab7b6390ab78131fb5b0fce11d6b7a6951602017c35fa82800708971
  - kind: registry
    name: tar
    version: 0.4.43
    sha: c65998313f8e17d0d553d28f91a0df93e4dbbbf770279c7bc21ca0f09ea1a1f6
  - kind: registry
    name: target-lexicon
    version: 0.13.1
    sha: dc12939a1c9b9d391e0b7135f72fd30508b73450753e28341fed159317582a77
  - kind: registry
    name: tempfile
    version: 3.11.0
    sha: b8fcd239983515c23a32fb82099f97d0b11b8c72f654ed659363a95c3dad7a53
  - kind: registry
    name: termcolor
    version: 1.4.1
    sha: 06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755
  - kind: registry
    name: terminal_size
    version: 0.3.0
    sha: 21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7
  - kind: registry
    name: textwrap
    version: 0.16.1
    sha: 23d434d3f8967a09480fb04132ebe0a3e088c173e6d0ee7897abbdf4eab0f8b9
  - kind: registry
    name: thiserror
    version: 1.0.69
    sha: b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52
  - kind: registry
    name: thiserror
    version: 2.0.3
    sha: c006c85c7651b3cf2ada4584faa36773bd07bac24acfb39f3c431b36d7e667aa
  - kind: registry
    name: thiserror-impl
    version: 1.0.69
    sha: 4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1
  - kind: registry
    name: thiserror-impl
    version: 2.0.3
    sha: f077553d607adc1caf65430528a576c757a71ed73944b66ebb58ef2bbd243568
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
    name: tinystr
    version: 0.7.6
    sha: 9117f5d4db391c1cf6927e7bea3db74b9a1c1add8f7eda9ffd5364f40f57b82f
  - kind: registry
    name: toml
    version: 0.8.19
    sha: a1ed1f98e3fdc28d6d910e6737ae6ab1a93bf1985935a1193e68f93eeb68d24e
  - kind: registry
    name: toml_datetime
    version: 0.6.8
    sha: 0dd7358ecb8fc2f8d014bf86f6f638ce72ba252a2c3a2572f2a795f1d23efb41
  - kind: registry
    name: toml_edit
    version: 0.21.1
    sha: 6a8534fd7f78b5405e860340ad6575217ce99f38d4d5c8f2442cb5ecb50090e1
  - kind: registry
    name: toml_edit
    version: 0.22.22
    sha: 4ae48d6208a266e853d946088ed816055e556cc6028c5e8e2b84d9fa5dd7c7f5
  - kind: registry
    name: tracing
    version: 0.1.41
    sha: 784e0ac535deb450455cbfa28a6f0df145ea1bb7ae51b821cf5e7927fdcfbdd0
  - kind: registry
    name: tracing-attributes
    version: 0.1.28
    sha: 395ae124c09f9e6918a2310af6038fba074bcf474ac352496d5910dd59a2226d
  - kind: registry
    name: tracing-core
    version: 0.1.33
    sha: e672c95779cf947c5311f83787af4fa8fffd12fb27e4993211a84bdfd9610f9c
  - kind: registry
    name: tracing-log
    version: 0.2.0
    sha: ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3
  - kind: registry
    name: tracing-serde
    version: 0.2.0
    sha: 704b1aeb7be0d0a84fc9828cae51dab5970fee5088f83d1dd7ee6f6246fc6ff1
  - kind: registry
    name: tracing-subscriber
    version: 0.3.19
    sha: e8189decb5ac0fa7bc8b96b7cb9b2701d60d48805aca84a238004d665fcc4008
  - kind: registry
    name: trycmd
    version: 0.15.6
    sha: 3e8673f1dc45acdff8e25a06cc62f8e529563e8acd84237ce83d5a28e2befa12
  - kind: registry
    name: twox-hash
    version: 1.6.3
    sha: 97fee6b57c6a41524a810daee9286c02d7752c4253064d0b05472833a438f675
  - kind: registry
    name: typenum
    version: 1.17.0
    sha: 42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825
  - kind: registry
    name: unicase
    version: 2.7.0
    sha: f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89
  - kind: registry
    name: unicode-ident
    version: 1.0.12
    sha: 3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b
  - kind: registry
    name: unicode-linebreak
    version: 0.1.5
    sha: 3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f
  - kind: registry
    name: unicode-width
    version: 0.1.13
    sha: 0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d
  - kind: registry
    name: unicode-width
    version: 0.2.0
    sha: 1fc81956842c57dac11422a97c3b8195a1ff727f06e85c84ed2e8aa277c9a0fd
  - kind: registry
    name: unicode-xid
    version: 0.2.6
    sha: ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853
  - kind: registry
    name: unscanny
    version: 0.1.0
    sha: e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47
  - kind: registry
    name: untrusted
    version: 0.9.0
    sha: 8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1
  - kind: registry
    name: ureq
    version: 2.11.0
    sha: b30e6f97efe1fa43535ee241ee76967d3ff6ff3953ebb430d8d55c5393029e7b
  - kind: registry
    name: url
    version: 2.5.4
    sha: 32f8b686cadd1473f4bd0117a5d28d36b1ade384ea9b5069a1c40aefed7fda60
  - kind: registry
    name: urlencoding
    version: 2.1.3
    sha: daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da
  - kind: registry
    name: utf16_iter
    version: 1.0.5
    sha: c8232dd3cdaed5356e0f716d285e4b40b932ac434100fe9b7e0e8e935b9e6246
  - kind: registry
    name: utf8_iter
    version: 1.0.4
    sha: b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be
  - kind: registry
    name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - kind: registry
    name: uuid
    version: 1.8.0
    sha: a183cf7feeba97b4dd1c0d46788634f6221d87fa961b305bed08c851829efcc0
  - kind: registry
    name: valuable
    version: 0.1.0
    sha: 830b7e5d4d90034032940e4ace0d9a9a057e7a45cd94e6c007832e39edb82f6d
  - kind: registry
    name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
  - kind: registry
    name: version-ranges
    version: 0.1.1
    sha: f8d079415ceb2be83fc355adbadafe401307d5c309c7e6ade6638e6f9f42f42d
  - kind: registry
    name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - kind: registry
    name: versions
    version: 6.2.0
    sha: 38a8931f8d167b6448076020e70b9de46dcf5ea1731212481a092d0071c4ac5b
  - kind: registry
    name: wait-timeout
    version: 0.2.0
    sha: 9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6
  - kind: registry
    name: walkdir
    version: 2.5.0
    sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
  - kind: registry
    name: wasi
    version: 0.11.0+wasi-snapshot-preview1
    sha: 9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423
  - kind: registry
    name: wasi
    version: 0.14.2+wasi-0.2.4
    sha: 9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3
  - kind: registry
    name: wasm-bindgen
    version: 0.2.96
    sha: 21d3b25c3ea1126a2ad5f4f9068483c2af1e64168f847abe863a526b8dbfe00b
  - kind: registry
    name: wasm-bindgen-backend
    version: 0.2.96
    sha: 52857d4c32e496dc6537646b5b117081e71fd2ff06de792e3577a150627db283
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.96
    sha: 920b0ffe069571ebbfc9ddc0b36ba305ef65577c94b06262ed793716a1afd981
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.96
    sha: bf59002391099644be3524e23b781fa43d2be0c5aa0719a18c0731b9d195cab6
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.96
    sha: e5047c5392700766601942795a436d7d2599af60dcc3cc1248c9120bfb0827b0
  - kind: registry
    name: web-time
    version: 1.1.0
    sha: 5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb
  - kind: registry
    name: webpki-roots
    version: 0.26.2
    sha: 3c452ad30530b54a4d8e71952716a212b08efd0f3562baa66c29a618b07da7c3
  - kind: registry
    name: which
    version: 7.0.0
    sha: c9cad3279ade7346b96e38731a641d7343dd6a53d55083dd54eadfa5a1b38c6b
  - kind: registry
    name: wild
    version: 2.2.1
    sha: a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1
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
    version: 0.5.40
    sha: f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876
  - kind: registry
    name: winnow
    version: 0.6.20
    sha: 36c1fec1a2bb5866f07c25f68c26e565c4c200aebb96d7e55710c19d3e8ac49b
  - kind: registry
    name: winsafe
    version: 0.0.19
    sha: d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904
  - kind: registry
    name: wit-bindgen-rt
    version: 0.39.0
    sha: 6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1
  - kind: registry
    name: write16
    version: 1.0.0
    sha: d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936
  - kind: registry
    name: writeable
    version: 0.5.5
    sha: 1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51
  - kind: registry
    name: xattr
    version: 1.3.1
    sha: 8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f
  - kind: registry
    name: xwin
    version: 0.6.5
    sha: ca7e4546db1514c186778f0a257d89732ed9ed75587d0953ac25be7519d9f0d1
  - kind: registry
    name: xz2
    version: 0.1.7
    sha: 388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2
  - kind: registry
    name: yansi
    version: 1.0.1
    sha: cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049
  - kind: registry
    name: yoke
    version: 0.7.4
    sha: 6c5b1314b079b0930c31e3af543d8ee1757b1951ae1e1565ec704403a7240ca5
  - kind: registry
    name: yoke-derive
    version: 0.7.5
    sha: 2380878cad4ac9aac1e2435f3eb4020e8374b5f13c296cb75b4620ff8e229154
  - kind: registry
    name: zerocopy
    version: 0.7.35
    sha: 1b9b4fd18abc82b8136838da5d50bae7bdea537c574d8dc1a34ed098d6c166f0
  - kind: registry
    name: zerocopy-derive
    version: 0.7.35
    sha: fa4f8080344d4671fb4e831a13ad1e68092748387dfc4f55e356242fae12ce3e
  - kind: registry
    name: zerofrom
    version: 0.1.4
    sha: 91ec111ce797d0e0784a1116d0ddcdbea84322cd79e5d5ad173daeba4f93ab55
  - kind: registry
    name: zerofrom-derive
    version: 0.1.5
    sha: 595eed982f7d355beb85837f651fa22e90b3c044842dc7f2c2842c086f295808
  - kind: registry
    name: zeroize
    version: 1.8.1
    sha: ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde
  - kind: registry
    name: zerovec
    version: 0.10.4
    sha: aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079
  - kind: registry
    name: zerovec-derive
    version: 0.10.3
    sha: 6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6
  - kind: registry
    name: zip
    version: 2.3.0
    sha: 84e9a772a54b54236b9b744aaaf8d7be01b4d6e99725523cb82cb32d1c81b1d7
  - kind: registry
    name: zopfli
    version: 0.8.1
    sha: e5019f391bac5cf252e93bbcc53d039ffd62c7bfb7c150414d61369afe57e946
  - kind: registry
    name: zstd
    version: 0.13.3
    sha: e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a
  - kind: registry
    name: zstd-safe
    version: 7.2.4
    sha: 8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d
  - kind: registry
    name: zstd-sys
    version: 2.0.15+zstd.1.5.7
    sha: eb81183ddd97d0c74cedf1d50d85c8d08c1b8b68ee863bdee9e706eedba1a237
