kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-rust.bst
- components/rust.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:PyO3/maturin.git
  track: v*
  exclude:
  - "*beta*"
  ref: v1.7.7-0-g89e9ca1e10864edb96693c8d605bf78d125acbe0
- kind: cargo
  cargo-lock: Cargo.lock
  ref:
  - name: adler2
    version: 2.0.0
    sha: 512761e0bb2578dd7380c6baaa0f4ce03e84f95e960231d1dec8bf4d7d6e2627
  - name: ahash
    version: 0.8.11
    sha: e89da841a80418a9b391ebaea17f5c112ffaaa96f621d2c285b5174da76b9011
  - name: aho-corasick
    version: 1.1.3
    sha: 8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916
  - name: allocator-api2
    version: 0.2.18
    sha: 5c6cb57a04249c6480766f7f7cef5467412af1490f8d1e243141daddada3264f
  - name: anstream
    version: 0.6.14
    sha: 418c75fa768af9c03be99d17643f93f79bbba589895012a80e3452a19ddda15b
  - name: anstyle
    version: 1.0.7
    sha: 038dfcf04a5feb68e9c60b21c9625a54c2c0616e79b72b0fd87075a056ae1d1b
  - name: anstyle-parse
    version: 0.2.4
    sha: c03a11a9034d92058ceb6ee011ce58af4a9bf61491aa7e1e59ecd24bd40d22d4
  - name: anstyle-query
    version: 1.1.0
    sha: ad186efb764318d35165f1758e7dcef3b10628e26d41a44bc5550652e6804391
  - name: anstyle-wincon
    version: 3.0.3
    sha: 61a38449feb7068f52bb06c12759005cf459ee52bb4adc1d5a7c4322d716fb19
  - name: anyhow
    version: 1.0.89
    sha: 86fdf8605db99b54d3cd748a44c6d04df638eb5dafb219b135d0149bd0db01f6
  - name: arbitrary
    version: 1.4.1
    sha: dde20b3d026af13f561bdd0f15edf01fc734f0dafcedbaf42bba506a9517f223
  - name: autocfg
    version: 1.3.0
    sha: 0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0
  - name: automod
    version: 1.0.14
    sha: edf3ee19dbc0a46d740f6f0926bde8c50f02bdbc7b536842da28f6ac56513a8b
  - name: base64
    version: 0.21.7
    sha: 9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567
  - name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: bitflags
    version: 2.5.0
    sha: cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1
  - name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - name: bstr
    version: 1.10.0
    sha: 40723b8fb387abc38f4f4a37c09073622e41dd12327033091ef8950659e6dc0c
  - name: bumpalo
    version: 3.16.0
    sha: 79296716171880943b8470b5f8d03aa55eb2e645a4874bdbb28adb49162e012c
  - name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - name: bytes
    version: 1.7.1
    sha: 8318a53db07bb3f8dca91a600466bdb3f2eaadeedfdbcf02e1accbad9271ba50
  - name: bytesize
    version: 1.3.0
    sha: a3e368af43e418a04d52505cf3dbc23dda4e3407ae2fa99fd0e4f308ce546acc
  - name: bzip2
    version: 0.4.4
    sha: bdb116a6ef3f6c3698828873ad02c3014b3c85cadb88496095628e3ef1e347f8
  - name: bzip2-sys
    version: 0.1.11+1.0.8
    sha: 736a955f3fa7875102d57c82b8cac37ec45224a07fd32d58f9f7a186b6cd4cdc
  - name: cab
    version: 0.6.0
    sha: 171228650e6721d5acc0868a462cd864f49ac5f64e4a42cde270406e64e404d2
  - name: camino
    version: 1.1.9
    sha: 8b96ec4966b5813e2c0507c1f86115c8c5abaadc3980879c3424042a02fd1ad3
  - name: cargo-config2
    version: 0.1.26
    sha: d83ce0be8bd1479e5de6202def660e6c7e27e4e0599bffa4fed05bd380ec2ede
  - name: cargo-options
    version: 0.7.4
    sha: f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f
  - name: cargo-platform
    version: 0.1.8
    sha: 24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc
  - name: cargo-xwin
    version: 0.17.5
    sha: 9cfe03fae5d4f7192f1a573f84d12b11f20877d43941ea3730289cc7af050531
  - name: cargo-zigbuild
    version: 0.19.5
    sha: 5eb13fbc2ba490ac9eb0b359cf46ba265255424c04a172f1c1772a8b9532283d
  - name: cargo_metadata
    version: 0.19.0
    sha: afc309ed89476c8957c50fb818f56fe894db857866c3e163335faa91dc34eb85
  - name: cbindgen
    version: 0.27.0
    sha: 3fce8dd7fcfcbf3a0a87d8f515194b49d6135acab73e18bd380d1d93bb1a15eb
  - name: cc
    version: 1.1.21
    sha: 07b1695e2c7e8fc85310cde85aeaab7e3097f593c91d209d3f9df76c928100f0
  - name: cfb
    version: 0.10.0
    sha: d8a4f8e55be323b378facfcf1f06aa97f6ec17cf4ac84fb17325093aaf62da41
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: charset
    version: 0.1.5
    sha: f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e
  - name: chumsky
    version: 0.9.3
    sha: 8eebd66744a15ded14960ab4ccdbfb51ad3b81f51f3f04a80adac98c985396c9
  - name: clap
    version: 4.5.7
    sha: 5db83dced34638ad474f39f250d7fea9598bdd239eaced1bdf45d597da0f433f
  - name: clap_builder
    version: 4.5.7
    sha: f7e204572485eb3fbf28f871612191521df159bc3e15a9f5064c66dba3a8c05f
  - name: clap_complete
    version: 4.5.5
    sha: d2020fa13af48afc65a9a87335bda648309ab3d154cd03c7ff95b378c7ed39c4
  - name: clap_complete_command
    version: 0.6.1
    sha: da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62
  - name: clap_complete_nushell
    version: 4.5.2
    sha: 1accf1b463dee0d3ab2be72591dccdab8bef314958340447c882c4c72acfe2a3
  - name: clap_derive
    version: 4.5.5
    sha: c780290ccf4fb26629baa7a1081e68ced113f1d3ec302fa5948f1c381ebf06c6
  - name: clap_lex
    version: 0.7.1
    sha: 4b82cf0babdbd58558212896d1a4272303a57bdb245c2bf1147185fb45640e70
  - name: cli-table
    version: 0.4.7
    sha: adfbb116d9e2c4be7011360d0c0bee565712c11e969c9609b25b619366dc379d
  - name: colorchoice
    version: 1.0.1
    sha: 0b6a852b24ab71dffc585bcb46eaf7959d175cb865a7152e35b348d1b2960422
  - name: configparser
    version: 3.1.0
    sha: e57e3272f0190c3f1584272d613719ba5fc7df7f4942fe542e63d949cf3a649b
  - name: console
    version: 0.15.8
    sha: 0e1f83fc076bd6dd27517eacdf25fef6c4dfe5f1d7448bafaaf3a26f13b5e4eb
  - name: content_inspector
    version: 0.2.4
    sha: b7bda66e858c683005a53a9a60c69a4aca7eeaa45d124526e389f7aec8e62f38
  - name: core-foundation
    version: 0.9.4
    sha: 91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f
  - name: core-foundation-sys
    version: 0.8.6
    sha: 06ea2b9bc92be3c2baa9334a323ebca2d6f074ff852cd1d7b11064035cd3868f
  - name: cpufeatures
    version: 0.2.12
    sha: 53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504
  - name: crc
    version: 3.2.1
    sha: 69e6e4d7b33a94f0991c26729976b10ebde1d34c3ee82408fb536164fa10d636
  - name: crc-catalog
    version: 2.4.0
    sha: 19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5
  - name: crc32fast
    version: 1.4.2
    sha: a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3
  - name: crossbeam-channel
    version: 0.5.13
    sha: 33480d6946193aa8033910124896ca395333cae7e2d1113d1fef6c3272217df2
  - name: crossbeam-deque
    version: 0.8.5
    sha: 613f8cc01fe9cf1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d
  - name: crossbeam-epoch
    version: 0.9.18
    sha: 5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e
  - name: crossbeam-utils
    version: 0.8.20
    sha: 22ec99545bb0ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80
  - name: crypto-common
    version: 0.1.6
    sha: 1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3
  - name: data-encoding
    version: 2.6.0
    sha: e8566979429cf69b49a5c740c60791108e86440e8be149bbea4fe54d2c32d6e2
  - name: deranged
    version: 0.3.11
    sha: b42b6fa04a440b495c8b04d0e71b707c585f83cb9cb28cf8cd0d976c315e31b4
  - name: derivative
    version: 2.2.0
    sha: fcc3dd5e9e9c0b295d6e1e4d811fb6f157d5ffd784b8d202fc62eac8035a770b
  - name: derive_arbitrary
    version: 1.4.1
    sha: 30542c1ad912e0e3d22a1935c290e12e8a29d704a420177a31faad4a601a0800
  - name: dialoguer
    version: 0.11.0
    sha: 658bce805d770f407bc62102fca7c2c64ceef2fbcb2b8bd19d2765ce093980de
  - name: diff
    version: 0.1.13
    sha: 56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8
  - name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - name: dirs
    version: 5.0.1
    sha: 44c45a9d03d6676652bcb5e724c7e988de1acad23a711b5217ab9cbecbec2225
  - name: dirs-sys
    version: 0.4.1
    sha: 520f05a5cbd335fae5a99ff7a6ab8627577660ee5cfd6a94a6a929b52ff0321c
  - name: displaydoc
    version: 0.2.5
    sha: 97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0
  - name: dissimilar
    version: 1.0.9
    sha: 59f8e79d1fbf76bdfbde321e902714bf6c49df88a7dda6fc682fc2979226962d
  - name: dunce
    version: 1.0.5
    sha: 92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813
  - name: dyn-clone
    version: 1.0.17
    sha: 0d6ef0072f8a535281e4876be788938b528e9a1d43900b82c2569af7da799125
  - name: either
    version: 1.13.0
    sha: 60b1af1c220855b6ceac025d3f6ecdd2b7c4894bfe9cd9bda4fbb4bc7c0d4cf0
  - name: encode_unicode
    version: 0.3.6
    sha: a357d28ed41a50f9c765dbfe56cbc04a64e53e5fc58ba79fbc34c10ef3df831f
  - name: encoding_rs
    version: 0.8.34
    sha: b45de904aa0b010bce2ab45264d0631681847fa7b6f2eaa7dab7619943bc4f59
  - name: equivalent
    version: 1.0.1
    sha: 5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5
  - name: errno
    version: 0.3.9
    sha: 534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba
  - name: expect-test
    version: 1.5.0
    sha: 9e0be0a561335815e06dab7c62e50353134c796e7a6155402a64bcff66b6a5e0
  - name: fastrand
    version: 2.1.0
    sha: 9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a
  - name: fat-macho
    version: 0.4.9
    sha: 4c9c45caa6c6edfaee4cb3bd84ea9686e115df7f0efb530e15fb466eccb0b345
  - name: filetime
    version: 0.2.23
    sha: 1ee447700ac8aa0b2f2bd7bc4462ad686ba06baa6727ac149a2d6277f0d240fd
  - name: flate2
    version: 1.0.33
    sha: 324a1be68054ef05ad64b861cc9eaf1d623d2d8cb25b4bf2cb9cdd902b4bf253
  - name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
  - name: foreign-types
    version: 0.3.2
    sha: f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1
  - name: foreign-types-shared
    version: 0.1.1
    sha: 00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b
  - name: form_urlencoded
    version: 1.2.1
    sha: e13624c2627564efccf4934284bdd98cbaa14e79b0b5a141218e507b3a823456
  - name: fs-err
    version: 2.11.0
    sha: 88a41f105fe1d5b6b34b2055e3dc59bb79b46b48b2040b9e6c7b4b5de097aa41
  - name: fs-err
    version: 3.0.0
    sha: 8bb60e7409f34ef959985bc9d9c5ee8f5db24ee46ed9775850548021710f807f
  - name: fs4
    version: 0.11.1
    sha: e871a4cfa68bb224863b53149d973df1ac8d1ed2fa1d1bfc37ac1bb65dd37207
  - name: futures
    version: 0.3.30
    sha: 645c6916888f6cb6350d2550b80fb63e734897a8498abe35cfb732b6487804b0
  - name: futures-channel
    version: 0.3.31
    sha: 2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10
  - name: futures-core
    version: 0.3.31
    sha: 05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e
  - name: futures-executor
    version: 0.3.30
    sha: a576fc72ae164fca6b9db127eaa9a9dda0d61316034f33a0a0d4eda41f02b01d
  - name: futures-io
    version: 0.3.31
    sha: 9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6
  - name: futures-macro
    version: 0.3.31
    sha: 162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650
  - name: futures-sink
    version: 0.3.31
    sha: e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7
  - name: futures-task
    version: 0.3.31
    sha: f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988
  - name: futures-timer
    version: 3.0.3
    sha: f288b0a4f20f9a56b5d1da57e2227c661b7b16168e2f72365f57b63326e29b24
  - name: futures-util
    version: 0.3.31
    sha: 9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81
  - name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - name: getrandom
    version: 0.2.15
    sha: c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7
  - name: glob
    version: 0.3.1
    sha: d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b
  - name: globset
    version: 0.4.15
    sha: 15f1ce686646e7f1e19bf7d5533fe443a45dbfb990e00629110797578b42fb19
  - name: goblin
    version: 0.9.2
    sha: 53ab3f32d1d77146981dea5d6b1e8fe31eedcb7013e5e00d6ccd1259a4b4d923
  - name: hashbrown
    version: 0.14.5
    sha: e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1
  - name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - name: home
    version: 0.5.9
    sha: e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5
  - name: humantime
    version: 2.1.0
    sha: 9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4
  - name: humantime-serde
    version: 1.1.1
    sha: 57a3db5ea5923d99402c94e9feb261dc5ee9b4efa158b0315f788cf549cc200c
  - name: idna
    version: 0.5.0
    sha: 634d9b1461af396cad843f47fdba5597a4f9e6ddd4bfb6ff5d85028c25cb12f6
  - name: ignore
    version: 0.4.23
    sha: 6d89fd380afde86567dfba715db065673989d6253f42b88179abd3eae47bda4b
  - name: indexmap
    version: 2.5.0
    sha: 68b900aa2f7301e21c36462b170ee99994de34dff39a4a6a528e80e7376d07e5
  - name: indicatif
    version: 0.17.8
    sha: 763a5a8f45087d6bcea4222e7b72c291a054edf80e4ef6efd2a4979878c7bea3
  - name: indoc
    version: 2.0.5
    sha: b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5
  - name: instant
    version: 0.1.13
    sha: e0242819d153cba4b4b05a5a8f2a7e9bbf97b6055b2a002b395c96b5ff3c0222
  - name: is_terminal_polyfill
    version: 1.70.0
    sha: f8478577c03552c21db0e2724ffb8986a5ce7af88107e6be5d2ee6e158c12800
  - name: itertools
    version: 0.12.1
    sha: ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569
  - name: itoa
    version: 1.0.11
    sha: 49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b
  - name: keyring
    version: 2.3.3
    sha: 363387f0019d714aa60cc30ab4fe501a747f4c08fc58f069dd14be971bd495a0
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: lddtree
    version: 0.3.7
    sha: e0779ac94bd7b6ab781fa12388dbf79ac45ec1fa433e7d25521753be8227b08e
  - name: libc
    version: 0.2.158
    sha: d8adc4bb1803a324070e64a98ae98f38934d91957a99cfb3a43dcbc01bc56439
  - name: libmimalloc-sys
    version: 0.1.38
    sha: 0e7bb23d733dfcc8af652a78b7bf232f0e967710d044732185e561e47c0336b6
  - name: libredox
    version: 0.1.3
    sha: c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d
  - name: linux-keyutils
    version: 0.2.4
    sha: 761e49ec5fd8a5a463f9b84e877c373d888935b71c6be78f3767fe2ae6bed18e
  - name: linux-raw-sys
    version: 0.4.14
    sha: 78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89
  - name: litemap
    version: 0.7.3
    sha: 643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e1e71bc420f4688a3a704
  - name: lock_api
    version: 0.4.12
    sha: 07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17
  - name: lockfree-object-pool
    version: 0.1.6
    sha: 9374ef4228402d4b7e403e5838cb880d9ee663314b0a900d5a6aabf0c213552e
  - name: log
    version: 0.4.21
    sha: 90ed8c1e510134f979dbc4f070f87d4313098b704861a105fe34231c70a3901c
  - name: lzxd
    version: 0.2.5
    sha: 5de7336a183103429ad66d11d56d8bdc9c4a2916f6b85a8f11e5b127bde12001
  - name: mailparse
    version: 0.15.0
    sha: 3da03d5980411a724e8aaf7b61a7b5e386ec55a7fb49ee3d0ff79efc7e5e7c7e
  - name: matchers
    version: 0.1.0
    sha: 8263075bb86c5a1b1427b5ae862e8889656f126e9f77c484496e8b47cf5c5558
  - name: memchr
    version: 2.7.2
    sha: 6c8640c5d730cb13ebd907d8d04b52f55ac9a2eec55b440c8892f40d56c76c1d
  - name: mimalloc
    version: 0.1.42
    sha: e9186d86b79b52f4a77af65604b51225e8db1d6ee7e3f41aec1e40829c71a176
  - name: mime
    version: 0.3.17
    sha: 6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a
  - name: mime_guess
    version: 2.0.4
    sha: 4192263c238a5f0d0c6bfd21f336a313a4ce1c450542449ca191bb657b4642ef
  - name: minijinja
    version: 2.5.0
    sha: 2c37e1b517d1dcd0e51dc36c4567b9d5a29262b3ec8da6cb5d35e27a8fb529b5
  - name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - name: miniz_oxide
    version: 0.8.0
    sha: e2d80299ef12ff69b16a84bb182e3b9df68b5a91574d3d4fa6e41b65deec4df1
  - name: msi
    version: 0.8.0
    sha: 4a2332f87a064dea9cce571408c879e0da8dc193b3af06a2b3b2604ee4182a32
  - name: multipart
    version: 0.18.0
    sha: 00dec633863867f29cb39df64a397cdf4a6354708ddd7759f70c7fb51c5f9182
  - name: native-tls
    version: 0.2.12
    sha: a8614eb2c83d59d1c8cc974dd3f920198647674a0a035e1af1fa58707e317466
  - name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - name: normalize-line-endings
    version: 0.3.0
    sha: 61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be
  - name: normpath
    version: 1.2.0
    sha: 5831952a9476f2fed74b77d74182fa5ddc4d21c72ec45a333b250e3ed0272804
  - name: nu-ansi-term
    version: 0.46.0
    sha: 77a8165726e8236064dbb45459242600304b42a5ea24ee2948e18e023bf7ba84
  - name: num-conv
    version: 0.1.0
    sha: 51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9
  - name: number_prefix
    version: 0.4.0
    sha: 830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3
  - name: once_cell
    version: 1.19.0
    sha: 3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92
  - name: openssl
    version: 0.10.66
    sha: 9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1
  - name: openssl-macros
    version: 0.1.1
    sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
  - name: openssl-probe
    version: 0.1.5
    sha: ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf
  - name: openssl-sys
    version: 0.9.103
    sha: 7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6
  - name: option-ext
    version: 0.2.0
    sha: 04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d
  - name: os_pipe
    version: 1.2.0
    sha: 29d73ba8daf8fac13b0501d1abeddcfe21ba7401ada61a819144b6c2a4f32209
  - name: overload
    version: 0.1.1
    sha: b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39
  - name: parking_lot
    version: 0.12.3
    sha: f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27
  - name: parking_lot_core
    version: 0.9.10
    sha: 1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8
  - name: paste
    version: 1.0.15
    sha: 57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a
  - name: path-slash
    version: 0.2.1
    sha: 1e91099d4268b0e11973f036e885d652fb0b21fedcf69738c627f94db6a44f42
  - name: pep440_rs
    version: 0.6.6
    sha: 466eada3179c2e069ca897b99006cbb33f816290eaeec62464eea907e22ae385
  - name: pep508_rs
    version: 0.6.1
    sha: 3f8877489a99ccc80012333123e434f84e645fe1ede3b30e9d3b815887a12979
  - name: percent-encoding
    version: 2.3.1
    sha: e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e
  - name: pin-project-lite
    version: 0.2.14
    sha: bda66fc9667c18cb2758a2ac84d1167245054bcf85d5d1aaa6923f45801bdd02
  - name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - name: pkg-config
    version: 0.3.30
    sha: d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec
  - name: plain
    version: 0.2.3
    sha: b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6
  - name: platform-info
    version: 2.0.3
    sha: d5ff316b9c4642feda973c18f0decd6c8b0919d4722566f6e4337cce0dd88217
  - name: portable-atomic
    version: 1.6.0
    sha: 7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0
  - name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - name: ppv-lite86
    version: 0.2.17
    sha: 5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de
  - name: pretty_assertions
    version: 1.4.1
    sha: 3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d
  - name: proc-macro-crate
    version: 3.1.0
    sha: 6d37c51ca738a55da99dc0c4a34860fd675453b8b36209178c2249bb13651284
  - name: proc-macro2
    version: 1.0.85
    sha: 22244ce15aa966053a896d1accb3a6e68469b97c7f33f284b99f0d576879fc23
  - name: psm
    version: 0.1.21
    sha: 5787f7cda34e3033a72192c018bc5883100330f362ef279a8cbccfce8bb4e874
  - name: pyproject-toml
    version: 0.11.0
    sha: ef7061023bcb58a0fc4a4bbe9819c13b0dca7c2abc14da14f5ecc1532ab3a36a
  - name: python-pkginfo
    version: 0.6.3
    sha: ba3f3f0d552c7efdde2b6898bf21b49c4e76b3e6071ff196dfe52109804db896
  - name: quote
    version: 1.0.36
    sha: 0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7
  - name: quoted_printable
    version: 0.5.0
    sha: 79ec282e887b434b68c18fe5c121d38e72a5cf35119b59e54ec5b992ea9c8eb0
  - name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - name: rayon
    version: 1.10.0
    sha: b418a60154510ca1a002a752ca9714984e21e4241e804d32555251faf8b78ffa
  - name: rayon-core
    version: 1.12.1
    sha: 1465873a3dfdaa8ae7cb14b4383657caab0b3e8a0aa9ae8e04b044854c8dfce2
  - name: redox_syscall
    version: 0.4.1
    sha: 4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa
  - name: redox_syscall
    version: 0.5.1
    sha: 469052894dcb553421e483e4209ee581a45100d31b4018de03e5a7ad86374a7e
  - name: redox_users
    version: 0.4.5
    sha: bd283d9651eeda4b2a83a43c1c91b266c40fd76ecd39a50a8c630ae69dc72891
  - name: regex
    version: 1.10.6
    sha: 4219d74c6b67a3654a9fbebc4b419e22126d13d2f3c4a07ee0cb61ff79a79619
  - name: regex-automata
    version: 0.1.10
    sha: 6c230d73fb8d8c1b9c0b3135c5142a8acee3a0558fb8db5cf1cb65f8d7862132
  - name: regex-automata
    version: 0.4.7
    sha: 38caf58cc5ef2fed281f89292ef23f6365465ed9a41b7a7754eb4e26496c92df
  - name: regex-syntax
    version: 0.6.29
    sha: f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1
  - name: regex-syntax
    version: 0.8.4
    sha: 7a66a03ae7c801facd77a29370b4faec201768915ac14a721ba36f20bc9c209b
  - name: relative-path
    version: 1.9.3
    sha: ba39f3699c378cd8970968dcbff9c43159ea4cfbd88d43c00b22f2ef10a435d2
  - name: rfc2047-decoder
    version: 1.0.5
    sha: e90a668c463c412c3118ae1883e18b53d812c349f5af7a06de3ba4bb0c17cc73
  - name: ring
    version: 0.17.8
    sha: c17fa4cb658e3583423e915b9f3acc01cceaee1860e33d59ebae66adc3a2dc0d
  - name: rstest
    version: 0.22.0
    sha: 7b423f0e62bdd61734b67cd21ff50871dfaeb9cc74f869dcd6af974fbcb19936
  - name: rstest_macros
    version: 0.22.0
    sha: c5e1711e7d14f74b12a58411c542185ef7fb7f2e7f8ee6e2940a883628522b42
  - name: rustc_version
    version: 0.4.1
    sha: cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92
  - name: rustflags
    version: 0.1.6
    sha: d7fc92159fb50a431c5da366f7627751fe7263cf867f8a30f27fa6063ba02ac0
  - name: rustix
    version: 0.38.34
    sha: 70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f
  - name: rustls
    version: 0.23.19
    sha: 934b404430bb06b3fae2cba809eb45a1ab1aecd64491213d7c3301b88393f8d1
  - name: rustls-pemfile
    version: 2.1.3
    sha: 196fe16b00e106300d3e45ecfcb764fa292a535d7326a29a5875c579c7417425
  - name: rustls-pki-types
    version: 1.10.0
    sha: 16f1201b3c9a7ee8039bcadc17b7e605e2945b27eee7631788c1bd2b0643674b
  - name: rustls-webpki
    version: 0.102.8
    sha: 64ca1bc8749bd4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9
  - name: rustversion
    version: 1.0.17
    sha: 955d28af4278de8121b7ebeb796b6a45735dc01436d898801014aced2773a3d6
  - name: ryu
    version: 1.0.18
    sha: f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f
  - name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - name: schannel
    version: 0.1.23
    sha: fbc91545643bcf3a0bbb6569265615222618bdf33ce4ffbbd13c4bbd4c093534
  - name: schemars
    version: 0.8.21
    sha: 09c024468a378b7e36765cd36702b7a90cc3cba11654f6685c8f233408e89e92
  - name: schemars_derive
    version: 0.8.21
    sha: b1eee588578aff73f856ab961cd2f79e36bc45d7ded33a7562adba4667aecc0e
  - name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - name: scroll
    version: 0.12.0
    sha: 6ab8598aa408498679922eff7fa985c25d58a90771bd6be794434c5277eab1a6
  - name: scroll_derive
    version: 0.12.0
    sha: 7f81c2fde025af7e69b1d1420531c8a8811ca898919db177141a85313b1cb932
  - name: security-framework
    version: 2.11.0
    sha: c627723fd09706bacdb5cf41499e95098555af3c3c29d014dc3c458ef6be11c0
  - name: security-framework-sys
    version: 2.11.0
    sha: 317936bbbd05227752583946b9e66d7ce3b489f84e11a94a510b4437fef407d7
  - name: semver
    version: 1.0.23
    sha: 61697e0a1c7e512e84a621326239844a24d8207b4669b41bc18b32ea5cbf988b
  - name: serde
    version: 1.0.210
    sha: c8e3592472072e6e22e0a54d5904d9febf8508f65fb8552499a1abc7d1078c3a
  - name: serde_derive
    version: 1.0.210
    sha: 243902eda00fad750862fc144cea25caca5e20d615af0a81bee94ca738f1df1f
  - name: serde_derive_internals
    version: 0.29.1
    sha: 18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711
  - name: serde_json
    version: 1.0.128
    sha: 6ff5456707a1de34e7e37f2a6fd3d3f808c318259cbd01ab6377795054b483d8
  - name: serde_spanned
    version: 0.6.6
    sha: 79e674e01f999af37c49f70a6ede167a8a60b2503e56c5599532a65baa5969a0
  - name: sha2
    version: 0.10.8
    sha: 793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8
  - name: sharded-slab
    version: 0.1.7
    sha: f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6
  - name: shell-words
    version: 1.1.0
    sha: 24188a676b6ae68c3b2cb3a01be17fbf7240ce009799bb56d5b1409051e78fde
  - name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - name: simd-adler32
    version: 0.3.7
    sha: d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe
  - name: similar
    version: 2.5.0
    sha: fa42c91313f1d05da9b26f267f931cf178d4aba455b4c4622dd7355eb80c6640
  - name: slab
    version: 0.4.9
    sha: 8f92a496fb766b417c996b9c5e57daf2f7ad3b0bebe1ccfca4856390e3d3bb67
  - name: smallvec
    version: 1.13.2
    sha: 3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67
  - name: smawk
    version: 0.3.2
    sha: b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c
  - name: snapbox
    version: 0.6.16
    sha: 027c936207f85d10d015e21faf5c676c7e08c453ed371adf55c0874c443ca77a
  - name: snapbox-macros
    version: 0.3.10
    sha: 16569f53ca23a41bb6f62e0a5084aa1661f4814a67fa33696a79073e03a664af
  - name: socks
    version: 0.3.4
    sha: f0c3dbbd9ae980613c6dd8e28a9407b50509d3803b57624d5dfe8315218cd58b
  - name: spin
    version: 0.9.8
    sha: 6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67
  - name: stable_deref_trait
    version: 1.2.0
    sha: a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3
  - name: stacker
    version: 0.1.15
    sha: c886bd4480155fd3ef527d45e9ac8dd7118a898a46530b7b94c3e21866259fce
  - name: static_assertions
    version: 1.1.0
    sha: a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f
  - name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - name: subtle
    version: 2.5.0
    sha: 81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc
  - name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - name: syn
    version: 2.0.87
    sha: 25aa4ce346d03a6dcd68dd8b4010bcb74e54e62c90c573f394c46eae99aba32d
  - name: tar
    version: 0.4.42
    sha: 4ff6c40d3aedb5e06b57c6f669ad17ab063dd1e63d977c6a88e7f4dfa4f04020
  - name: target-lexicon
    version: 0.12.16
    sha: 61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1
  - name: tempfile
    version: 3.11.0
    sha: b8fcd239983515c23a32fb82099f97d0b11b8c72f654ed659363a95c3dad7a53
  - name: termcolor
    version: 1.4.1
    sha: 06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755
  - name: terminal_size
    version: 0.3.0
    sha: 21bebf2b7c9e0a515f6e0f8c51dc0f8e4696391e6f1ff30379559f8365fb0df7
  - name: textwrap
    version: 0.16.1
    sha: 23d434d3f8967a09480fb04132ebe0a3e088c173e6d0ee7897abbdf4eab0f8b9
  - name: thiserror
    version: 1.0.64
    sha: d50af8abc119fb8bb6dbabcfa89656f46f84aa0ac7688088608076ad2b459a84
  - name: thiserror
    version: 2.0.3
    sha: c006c85c7651b3cf2ada4584faa36773bd07bac24acfb39f3c431b36d7e667aa
  - name: thiserror-impl
    version: 1.0.64
    sha: 08904e7672f5eb876eaaf87e0ce17857500934f4981c4a0ab2b4aa98baac7fc3
  - name: thiserror-impl
    version: 2.0.3
    sha: f077553d607adc1caf65430528a576c757a71ed73944b66ebb58ef2bbd243568
  - name: thread_local
    version: 1.1.8
    sha: 8b9ef9bad013ada3808854ceac7b46812a6465ba368859a37e2100283d2d719c
  - name: time
    version: 0.3.36
    sha: 5dfd88e563464686c916c7e46e623e520ddc6d79fa6641390f2e3fa86e83e885
  - name: time-core
    version: 0.1.2
    sha: ef927ca75afb808a4d64dd374f00a2adf8d0fcff8e7b184af886c3c87ec4a3f3
  - name: time-macros
    version: 0.2.18
    sha: 3f252a68540fde3a3877aeea552b832b40ab9a69e318efd078774a01ddee1ccf
  - name: tinyvec
    version: 1.7.0
    sha: ce6b6a2fb3a985e99cebfaefa9faa3024743da73304ca1c683a36429613d3d22
  - name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - name: toml
    version: 0.8.15
    sha: ac2caab0bf757388c6c0ae23b3293fdb463fee59434529014f85e3263b995c28
  - name: toml_datetime
    version: 0.6.6
    sha: 4badfd56924ae69bcc9039335b2e017639ce3f9b001c393c1b2d1ef846ce2cbf
  - name: toml_edit
    version: 0.21.1
    sha: 6a8534fd7f78b5405e860340ad6575217ce99f38d4d5c8f2442cb5ecb50090e1
  - name: toml_edit
    version: 0.22.16
    sha: 278f3d518e152219c994ce877758516bca5e118eaed6996192a774fb9fbf0788
  - name: tracing
    version: 0.1.40
    sha: c3523ab5a71916ccf420eebdf5521fcef02141234bbc0b8a49f2fdc4544364ef
  - name: tracing-attributes
    version: 0.1.27
    sha: 34704c8d6ebcbc939824180af020566b01a7c01f80641264eba0999f6c2b6be7
  - name: tracing-core
    version: 0.1.32
    sha: c06d3da6113f116aaee68e4d601191614c9053067f9ab7f6edbcb161237daa54
  - name: tracing-log
    version: 0.2.0
    sha: ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3
  - name: tracing-serde
    version: 0.1.3
    sha: bc6b213177105856957181934e4920de57730fc69bf42c37ee5bb664d406d9e1
  - name: tracing-subscriber
    version: 0.3.18
    sha: ad0f048c97dbd9faa9b7df56362b8ebcaa52adb06b498c050d2f4e32f90a7a8b
  - name: trycmd
    version: 0.15.6
    sha: 3e8673f1dc45acdff8e25a06cc62f8e529563e8acd84237ce83d5a28e2befa12
  - name: twox-hash
    version: 1.6.3
    sha: 97fee6b57c6a41524a810daee9286c02d7752c4253064d0b05472833a438f675
  - name: typenum
    version: 1.17.0
    sha: 42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825
  - name: unicase
    version: 2.7.0
    sha: f7d2d4dafb69621809a81864c9c1b864479e1235c0dd4e199924b9742439ed89
  - name: unicode-bidi
    version: 0.3.15
    sha: 08f95100a766bf4f8f28f90d77e0a5461bbdb219042e7679bebe79004fed8d75
  - name: unicode-ident
    version: 1.0.12
    sha: 3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b
  - name: unicode-linebreak
    version: 0.1.5
    sha: 3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f
  - name: unicode-normalization
    version: 0.1.23
    sha: a56d1686db2308d901306f92a263857ef59ea39678a5458e7cb17f01415101f5
  - name: unicode-width
    version: 0.1.13
    sha: 0336d538f7abc86d282a4189614dfaa90810dfc2c6f6427eaf88e16311dd225d
  - name: unicode-xid
    version: 0.2.6
    sha: ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853
  - name: unscanny
    version: 0.1.0
    sha: e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47
  - name: untrusted
    version: 0.9.0
    sha: 8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1
  - name: ureq
    version: 2.11.0
    sha: b30e6f97efe1fa43535ee241ee76967d3ff6ff3953ebb430d8d55c5393029e7b
  - name: url
    version: 2.5.2
    sha: 22784dbdf76fdde8af1aeda5622b546b422b6fc585325248a2bf9f5e41e94d6c
  - name: urlencoding
    version: 2.1.3
    sha: daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da
  - name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - name: uuid
    version: 1.8.0
    sha: a183cf7feeba97b4dd1c0d46788634f6221d87fa961b305bed08c851829efcc0
  - name: valuable
    version: 0.1.0
    sha: 830b7e5d4d90034032940e4ace0d9a9a057e7a45cd94e6c007832e39edb82f6d
  - name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
  - name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - name: versions
    version: 6.2.0
    sha: 38a8931f8d167b6448076020e70b9de46dcf5ea1731212481a092d0071c4ac5b
  - name: wait-timeout
    version: 0.2.0
    sha: 9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6
  - name: walkdir
    version: 2.5.0
    sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
  - name: wasi
    version: 0.11.0+wasi-snapshot-preview1
    sha: 9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423
  - name: webpki-roots
    version: 0.26.2
    sha: 3c452ad30530b54a4d8e71952716a212b08efd0f3562baa66c29a618b07da7c3
  - name: which
    version: 7.0.0
    sha: c9cad3279ade7346b96e38731a641d7343dd6a53d55083dd54eadfa5a1b38c6b
  - name: wild
    version: 2.2.1
    sha: a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1
  - name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - name: winapi-util
    version: 0.1.8
    sha: 4d4cc384e1e73b93bafa6fb4f1df8c41695c8a91cf9c4c64358067d15a7b6c6b
  - name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - name: windows-sys
    version: 0.48.0
    sha: 677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9
  - name: windows-sys
    version: 0.52.0
    sha: 282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d
  - name: windows-targets
    version: 0.48.5
    sha: 9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c
  - name: windows-targets
    version: 0.52.5
    sha: 6f0713a46559409d202e70e28227288446bf7841d3211583a4b53e3f6d96e7eb
  - name: windows_aarch64_gnullvm
    version: 0.48.5
    sha: 2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8
  - name: windows_aarch64_gnullvm
    version: 0.52.5
    sha: 7088eed71e8b8dda258ecc8bac5fb1153c5cffaf2578fc8ff5d61e23578d3263
  - name: windows_aarch64_msvc
    version: 0.48.5
    sha: dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc
  - name: windows_aarch64_msvc
    version: 0.52.5
    sha: 9985fd1504e250c615ca5f281c3f7a6da76213ebd5ccc9561496568a2752afb6
  - name: windows_i686_gnu
    version: 0.48.5
    sha: a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e
  - name: windows_i686_gnu
    version: 0.52.5
    sha: 88ba073cf16d5372720ec942a8ccbf61626074c6d4dd2e745299726ce8b89670
  - name: windows_i686_gnullvm
    version: 0.52.5
    sha: 87f4261229030a858f36b459e748ae97545d6f1ec60e5e0d6a3d32e0dc232ee9
  - name: windows_i686_msvc
    version: 0.48.5
    sha: 8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406
  - name: windows_i686_msvc
    version: 0.52.5
    sha: db3c2bf3d13d5b658be73463284eaf12830ac9a26a90c717b7f771dfe97487bf
  - name: windows_x86_64_gnu
    version: 0.48.5
    sha: 53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e
  - name: windows_x86_64_gnu
    version: 0.52.5
    sha: 4e4246f76bdeff09eb48875a0fd3e2af6aada79d409d33011886d3e1581517d9
  - name: windows_x86_64_gnullvm
    version: 0.48.5
    sha: 0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc
  - name: windows_x86_64_gnullvm
    version: 0.52.5
    sha: 852298e482cd67c356ddd9570386e2862b5673c85bd5f88df9ab6802b334c596
  - name: windows_x86_64_msvc
    version: 0.48.5
    sha: ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538
  - name: windows_x86_64_msvc
    version: 0.52.5
    sha: bec47e5bfd1bff0eeaf6d8b485cc1074891a197ab4225d504cb7a1ab88b02bf0
  - name: winnow
    version: 0.5.40
    sha: f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876
  - name: winnow
    version: 0.6.13
    sha: 59b5e5f6c299a3c7890b876a2a587f3115162487e704907d9b6cd29473052ba1
  - name: winsafe
    version: 0.0.19
    sha: d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904
  - name: xattr
    version: 1.3.1
    sha: 8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f
  - name: xwin
    version: 0.6.5
    sha: ca7e4546db1514c186778f0a257d89732ed9ed75587d0953ac25be7519d9f0d1
  - name: yansi
    version: 1.0.1
    sha: cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049
  - name: yoke
    version: 0.7.4
    sha: 6c5b1314b079b0930c31e3af543d8ee1757b1951ae1e1565ec704403a7240ca5
  - name: zerocopy
    version: 0.7.34
    sha: ae87e3fcd617500e5d106f0380cf7b77f3c6092aae37191433159dda23cfb087
  - name: zerocopy-derive
    version: 0.7.34
    sha: 15e934569e47891f7d9411f1a451d947a60e000ab3bd24fbb970f000387d1b3b
  - name: zerofrom
    version: 0.1.4
    sha: 91ec111ce797d0e0784a1116d0ddcdbea84322cd79e5d5ad173daeba4f93ab55
  - name: zeroize
    version: 1.8.1
    sha: ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde
  - name: zip
    version: 0.6.6
    sha: 760394e246e4c28189f19d488c058bf16f564016aefac5d32bb1f3b51d5e9261
  - name: zip
    version: 2.1.6
    sha: 40dd8c92efc296286ce1fbd16657c5dbefff44f1b4ca01cc5f517d8b7b3d3e2e
  - name: zopfli
    version: 0.8.1
    sha: e5019f391bac5cf252e93bbcc53d039ffd62c7bfb7c150414d61369afe57e946
