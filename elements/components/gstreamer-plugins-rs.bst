# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-autotools.bst
- public-stacks/buildsystem-cmake.bst
- public-stacks/buildsystem-meson.bst
- components/cargo-c.bst
- components/hotdoc.bst
- components/rust.bst

depends:
- components/gstreamer-plugins-bad.bst
- components/dav1d.bst

# disable everything by default to prevent new plugins getting added
# on updates, only enable plugins which are in use by apps
variables:
  arch-conf: ''

  (?):
  - target_arch != "i686":
      arch-conf: -Dspotify=enabled

  meson-local: >-
    -Dauto_features=disabled
    -Dtests=disabled
    -Ddoc=enabled
    -Drtp=enabled
    -Dgif=enabled
    -Dhlssink3=enabled
    -Ddav1d=enabled
    %{arch-conf}

sources:
- kind: git_repo
  url: freedesktop:gstreamer/gst-plugins-rs.git
  track: '*.*'
  exclude:
  - "gstreamer-*"
  - "*alpha*"
  ref: 0.15.4-0-g1afff3711855238433862c0ce3bf34918e500386
- kind: cargo2
  ref:
  - kind: registry
    name: addr2line
    version: 0.25.1
    sha: 1b5d307320b3181d6d7954e663bd7c774a838b8220fe0593c86d9fb09f498b4b
  - kind: registry
    name: adler2
    version: 2.0.1
    sha: 320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa
  - kind: registry
    name: aes
    version: 0.8.4
    sha: b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0
  - kind: registry
    name: aes
    version: 0.9.3
    sha: 35f0f96ce78e38c3dc6d8948aa8163d06385be74000f3c7a95bf1eef35d3ea32
  - kind: registry
    name: ahash
    version: 0.8.12
    sha: 5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75
  - kind: registry
    name: aho-corasick
    version: 1.1.5
    sha: c982642fa9e8606056828ee9a8505737230110bb1099153c79efe865c59d12ba
  - kind: registry
    name: aligned
    version: 0.4.3
    sha: ee4508988c62edf04abd8d92897fca0c2995d907ce1dfeaf369dac3716a40685
  - kind: registry
    name: aligned-vec
    version: 0.6.4
    sha: dc890384c8602f339876ded803c97ad529f3842aba97f6392b3dba0dd171769b
  - kind: registry
    name: allocator-api2
    version: 0.2.21
    sha: 683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923
  - kind: registry
    name: android_system_properties
    version: 0.1.6
    sha: ae221649c9976a6f6c56ae1facf410f3ddb33cc661c4b7b61020a912d4237fbc
  - kind: registry
    name: anstream
    version: 1.0.0
    sha: 824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d
  - kind: registry
    name: anstyle
    version: 1.0.14
    sha: 940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000
  - kind: registry
    name: anstyle-parse
    version: 1.0.0
    sha: 52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e
  - kind: registry
    name: anstyle-query
    version: 1.1.5
    sha: 40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc
  - kind: registry
    name: anstyle-wincon
    version: 3.0.11
    sha: 291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d
  - kind: registry
    name: anyhow
    version: 1.0.104
    sha: 330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470
  - kind: registry
    name: anymap3
    version: 1.1.0
    sha: fb5dfbc6d8d2675589ccbe4d0fd61df2419075625f8c1a62325e718e2b0049f9
  - kind: registry
    name: arbitrary
    version: 1.4.2
    sha: c3d036a3c4ab069c7b410a2ce876bd74808d2d0888a82667669f8e783a898bf1
  - kind: registry
    name: arc-swap
    version: 1.9.2
    sha: c049c0be4daef0b145cb3555416b3b8ef5b7888a38aea1a3a155801fe7b0810b
  - kind: registry
    name: arg_enum_proc_macro
    version: 0.3.4
    sha: 0ae92a5119aa49cdbcf6b9f893fe4e1d98b04ccbf82ee0584ad948a44a734dea
  - kind: registry
    name: array-init
    version: 2.1.0
    sha: 3d62b7694a562cdf5a74227903507c56ab2cc8bdd1f781ed5cb4cf9c9f810bfc
  - kind: registry
    name: arrayvec
    version: 0.7.8
    sha: d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56
  - kind: registry
    name: as-slice
    version: 0.2.1
    sha: 516b6b4f0e40d50dcda9365d53964ec74560ad4284da2e7fc97122cd83174516
  - kind: registry
    name: ash
    version: 0.38.0+1.3.281
    sha: 0bb44936d800fea8f016d7f2311c6a4f97aebd5dc86f09906139ec848cf3a46f
  - kind: registry
    name: asn1-rs
    version: 0.7.2
    sha: b7f43a50ac4fdca5df8e885c21b835997f0a1cdee65494a6847694a98652d9d8
  - kind: registry
    name: asn1-rs-derive
    version: 0.6.0
    sha: 3109e49b1e4909e9db6515a30c633684d68cdeaa252f215214cb4fa1a5bfee2c
  - kind: registry
    name: asn1-rs-impl
    version: 0.2.0
    sha: 7b18050c2cd6fe86c3a76584ef5e0baf286d038cda203eb6223df2cc413565f7
  - kind: registry
    name: async-channel
    version: 2.5.0
    sha: 924ed96dd52d1b75e9c1a3e6275715fd320f5f9439fb5a4a11fa51f4221158d2
  - kind: registry
    name: async-compression
    version: 0.4.48
    sha: fb61aea1a7def73ee7c350a184f0e70b32c182344e2e75bf70c9b621b83417fd
  - kind: registry
    name: async-lock
    version: 3.4.2
    sha: 290f7f2596bd5b78a9fec8088ccd89180d7f9f55b94b0576823bbbdc72ee8311
  - kind: registry
    name: async-recursion
    version: 1.1.1
    sha: 3b43422f69d8ff38f95f1b2bb76517c91589a924d1559a0e935d7c8ce0274c11
  - kind: registry
    name: async-stream
    version: 0.3.6
    sha: 0b5a71a6f37880a80d1d7f19efd781e4b5de42c88f0722cc13bcb6cc2cfe8476
  - kind: registry
    name: async-stream-impl
    version: 0.3.6
    sha: c7c24de15d275a1ecfd47a380fb4d5ec9bfe0933f309ed5e705b775596a3574d
  - kind: registry
    name: async-task
    version: 4.7.1
    sha: 8b75356056920673b02621b35afd0f7dda9306d03c79a30f5c56c44cf256e3de
  - kind: registry
    name: async-trait
    version: 0.1.92
    sha: 82f6aeea286b8eb4dd3431a1be1b59d290ace00f5bfd8e2a159bc2a05e2c1667
  - kind: registry
    name: async-tungstenite
    version: 0.35.0
    sha: d6ab5b7664abf9ccae07576888c72bc93750c7090c1ff4ffee9317cc05d11618
  - kind: registry
    name: atomic-waker
    version: 1.1.2
    sha: 1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0
  - kind: registry
    name: atomic_float
    version: 1.1.0
    sha: 628d228f918ac3b82fe590352cc719d30664a0c13ca3a60266fe02c7132d480a
  - kind: registry
    name: atomic_refcell
    version: 0.1.14
    sha: 21e4227379beff4205943696e6c3e0cd809bacdf3f0edd6e3dd153e2269571a4
  - kind: registry
    name: autocfg
    version: 1.5.1
    sha: f2032f911046de80f0a198e0901378627c33f59ea0ac00e363d481118bd70a53
  - kind: registry
    name: av-data
    version: 0.4.4
    sha: fca67ba5d317924c02180c576157afd54babe48a76ebc66ce6d34bb8ba08308e
  - kind: registry
    name: av-scenechange
    version: 0.14.1
    sha: 0f321d77c20e19b92c39e7471cf986812cbb46659d2af674adc4331ef3f18394
  - kind: registry
    name: av1-grain
    version: 0.2.5
    sha: 8cfddb07216410377231960af4fcab838eaa12e013417781b78bd95ee22077f8
  - kind: registry
    name: avif-serialize
    version: 0.8.9
    sha: e7178fe5f7d460b13895ebb9dcb28a3a6216d2df2574a0806cb51b555d297f38
  - kind: registry
    name: aws-config
    version: 1.8.18
    sha: e33f815b73a3899c03b380d543532e5865f230dce9678d108dc10732a8682275
  - kind: registry
    name: aws-credential-types
    version: 1.2.14
    sha: 8f20799b373a1be121fe3005fba0c2090af9411573878f224df44b42727fcaf7
  - kind: registry
    name: aws-lc-rs
    version: 1.18.1
    sha: b281d307588d634de920874890732659e2e7672f72b5e10e81badc1a8a83621e
  - kind: registry
    name: aws-lc-sys
    version: 0.45.0
    sha: 9bff6c3b54fad79a2e60b8102caf565819711497c1f5f092f49508e2f5c31b27
  - kind: registry
    name: aws-runtime
    version: 1.7.5
    sha: 6c9b9de216a988dd54b754a82a7660cfe14cee4f6782ae4524470972fa0ccb39
  - kind: registry
    name: aws-sdk-kinesisvideo
    version: 1.105.0
    sha: 109f1389274684249fc2ad7254a0bdb7bf289c058a584d1bd31a14e861f5f696
  - kind: registry
    name: aws-sdk-kinesisvideosignaling
    version: 1.102.0
    sha: 49f4af3cadf2b571c6009152711977d42e7e1d43f541f4f099f3bb8f1342a6e7
  - kind: registry
    name: aws-sdk-polly
    version: 1.110.0
    sha: 5412b92cce334c5f9ee5d2957c8cf7bd9838e626d0ee4ceefe3491c893dc2918
  - kind: registry
    name: aws-sdk-s3
    version: 1.137.0
    sha: c2dd7213994e2ff9382ff100403b78c30d1b74cdfcd8fa9d0d1dc3a94a5c4874
  - kind: registry
    name: aws-sdk-sso
    version: 1.102.0
    sha: 8c82b3ac19f1431854f7ace3a7531674633e286bfdde21976893bfee36fd493b
  - kind: registry
    name: aws-sdk-sts
    version: 1.107.0
    sha: 3d0d328ba962af23ecfa3c9f23b98d3d35e325fa218d7f13d17a6bf522f8a560
  - kind: registry
    name: aws-sdk-transcribestreaming
    version: 1.108.0
    sha: 8ba0fac04a869881b31a465ceed3d7eb786bc1f64018ecaf77a4437ee17be4e3
  - kind: registry
    name: aws-sdk-translate
    version: 1.102.0
    sha: e7aedfa889a3ba2c94cfe8c98854407a49c6f06f6679701f1ce8e498e34e9f66
  - kind: registry
    name: aws-sigv4
    version: 1.4.5
    sha: bae38512beae0ffee7010fc24e7a8a123c53efdfef42a61e80fda4882418dc71
  - kind: registry
    name: aws-smithy-async
    version: 1.2.14
    sha: 2ffcaf626bdda484571968400c326a244598634dc75fd451325a54ad1a59acfc
  - kind: registry
    name: aws-smithy-checksums
    version: 0.64.8
    sha: e9e8e65f4f81fcccdeb6c3eca2af17ac21d421a1786a26a394aecf421d616d3a
  - kind: registry
    name: aws-smithy-eventstream
    version: 0.60.21
    sha: 78d8391e65fcea47c586a22e1a41f173b38615b112b2c6b7a44e80cec3e6b706
  - kind: registry
    name: aws-smithy-http
    version: 0.63.6
    sha: ba1ab2dc1c2c3749ead27180d333c42f11be8b0e934058fb4b2258ee8dbe5231
  - kind: registry
    name: aws-smithy-http-client
    version: 1.1.13
    sha: 5c3ef8931ad1c98aa6a55b4256f847f3116090819844e0dd41ea682cac5dd2d3
  - kind: registry
    name: aws-smithy-json
    version: 0.62.7
    sha: 701a947f4797e52a911e114a898667c746c39feea467bbd1abd7b3721f702ffa
  - kind: registry
    name: aws-smithy-observability
    version: 0.2.6
    sha: a06c2315d173edbf1920da8ba3a7189695827002e4c0fc961973ab1c54abca9c
  - kind: registry
    name: aws-smithy-query
    version: 0.60.15
    sha: 1a56d79744fb3edb5d722ef79d86081e121d3b9422cb209eb03aea6aa4f21ebd
  - kind: registry
    name: aws-smithy-runtime
    version: 1.11.3
    sha: b8e6f5caf6fea86f8c2206541ab5857cfcda9013426cdbe8fa0098b9e2d32182
  - kind: registry
    name: aws-smithy-runtime-api
    version: 1.12.3
    sha: 9db177daa6ba8afb9ee1aefcf548c907abcf52065e394ee11a92780057fe0e8c
  - kind: registry
    name: aws-smithy-runtime-api-macros
    version: 1.0.0
    sha: 8d7396fd9500589e62e460e987ecb671bad374934e55ec3b5f498cc7a8a8a7b7
  - kind: registry
    name: aws-smithy-schema
    version: 0.1.0
    sha: 7442cb268338f0eb8278140a107c046756aa01093d8ef5e99628d34ae09c94f5
  - kind: registry
    name: aws-smithy-types
    version: 1.5.0
    sha: 32b42fcf341259d85ca10fac9a2f6448a8ec691c6955a18e45bc3b71a85fab85
  - kind: registry
    name: aws-smithy-xml
    version: 0.60.15
    sha: 0ce02add1aa3677d022f8adf81dcbe3046a95f17a1b1e8979c145cd21d3d22b3
  - kind: registry
    name: aws-types
    version: 1.3.16
    sha: d16bf10b03a3c01e6b3b7d47cd964e873ffe9e7d4e80fad16bd4c077cb068531
  - kind: registry
    name: backtrace
    version: 0.3.76
    sha: bb531853791a215d7c62a30daf0dde835f381ab5de4589cfe7c649d2cbe92bd6
  - kind: registry
    name: base16ct
    version: 0.2.0
    sha: 4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf
  - kind: registry
    name: base32
    version: 0.5.1
    sha: 022dfe9eb35f19ebbcb51e0b40a5ab759f46ad60cadf7297e0bd085afb50e076
  - kind: registry
    name: base64
    version: 0.21.7
    sha: 9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: base64
    version: 0.23.1
    sha: ac07cdecf99051d9a5238b80f35af32cdeba5b336e55d957b318b50137e18da5
  - kind: registry
    name: base64-simd
    version: 0.8.0
    sha: 339abbe78e73178762e23bea9dfd08e697eb3f3301cd4be981c0f78ba5859195
  - kind: registry
    name: base64ct
    version: 1.8.3
    sha: 2af50177e190e07a26ab74f8b1efbfe2ef87da2116221318cb1c2e82baf7de06
  - kind: registry
    name: bincode
    version: 1.3.3
    sha: b1f45e9417d87227c7a56d22e471c6206462cba514c7590c09aff4cf6d1ddcad
  - kind: registry
    name: bincode
    version: 2.0.1
    sha: 36eaf5d7b090263e8150820482d5d93cd964a81e4019913c972f4edcc6edb740
  - kind: registry
    name: bindgen
    version: 0.70.1
    sha: f49d8fed880d473ea71efb9bf597651e77201bdd4893efe54c9e5d65ae04ce6f
  - kind: registry
    name: bindgen
    version: 0.71.1
    sha: 5f58bf3d7db68cfbac37cfc485a8d711e87e064c3d0fe0435b92f7a407f9d6b3
  - kind: registry
    name: bindgen
    version: 0.72.1
    sha: 993776b509cfb49c750f11b8f07a46fa23e0a1386ffc01fb1e7d343efc387895
  - kind: registry
    name: bit-set
    version: 0.9.1
    sha: 34ddef2995421ab6a5c779542c81ee77c115206f4ad9d5a8e05f4ff49716a3dd
  - kind: registry
    name: bit-vec
    version: 0.9.1
    sha: b71798fca2c1fe1086445a7258a4bc81e6e49dcd24c8d0dd9a1e57395b603f51
  - kind: registry
    name: bit_field
    version: 0.10.3
    sha: 1e4b40c7323adcfc0a41c4b88143ed58346ff65a288fc144329c5c45e05d70c6
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.13.2
    sha: 3ded4057c258ba199e2d26386d3af3780957ecaee6c4ef4041c6b4b8b97c0b06
  - kind: registry
    name: bitreader
    version: 0.3.11
    sha: 886559b1e163d56c765bc3a985febb4eee8009f625244511d8ee3c432e08c066
  - kind: registry
    name: bitstream-io
    version: 4.10.0
    sha: 7eff00be299a18769011411c9def0d827e8f2d7bf0c3dbf53633147a8867fd1f
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: block-buffer
    version: 0.12.1
    sha: d2f6c7dbe95a6ed67ad9f18e57daf93a2f034c524b99fd2b76d18fdfeb6660aa
  - kind: registry
    name: block2
    version: 0.6.2
    sha: cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5
  - kind: registry
    name: bon
    version: 3.10.1
    sha: 60eafe0d77c3a2fc292c1d1346c3041b33c0a108085a2afabf672b70f69dbbc9
  - kind: registry
    name: bon-macros
    version: 3.10.1
    sha: bd0f9631d8aaaee112c41985d675ef269e02acbd4f33122836af4f0c5f699ff6
  - kind: registry
    name: bs58
    version: 0.5.1
    sha: bf88ba1141d185c399bee5288d850d63b8369520c1eafc32a0430b5b6c287bf4
  - kind: registry
    name: bstr
    version: 1.13.1
    sha: 6bb31b46c14244e20ee9984b11bf5c992b91fb6939fea616e3512c8baecdbe5f
  - kind: registry
    name: built
    version: 0.8.1
    sha: 5c0e531d93d39c34eef561e929e8a7f86d77a5af08aac4f6d6e39976c51858e9
  - kind: registry
    name: bumpalo
    version: 3.20.3
    sha: 72f5acc6cb2ba439de613abc23857ec3d78374d8ed5ac84e9d11336e87da8649
  - kind: registry
    name: burn
    version: 0.21.0
    sha: 39474be398d30e08681f1f6a8ff446b1e4f1403b5cf7749649a8871fd5945f3a
  - kind: registry
    name: burn-backend
    version: 0.21.0
    sha: 64491519ac0867f550fa9c726cd443e5db94608c629050986cf2614c8c5ad39f
  - kind: registry
    name: burn-core
    version: 0.21.0
    sha: 5bde1e3b8e7e39b0aa71cd5905207ceea5c3478bec47bdb64acf72dcd0d6f978
  - kind: registry
    name: burn-cpu
    version: 0.21.0
    sha: 681478c5438ab6c753a55b85f5b42e5bd4c1f69a8564f2afa2f698ac396ba556
  - kind: registry
    name: burn-cubecl
    version: 0.21.0
    sha: 26efbec96ca3f691593c966fa90f98ef8a72867f62627904920b619ba3a9e6b6
  - kind: registry
    name: burn-cubecl-fusion
    version: 0.21.0
    sha: 6993d15b8ed588f55626e835ca768c1c3c7aa7a79d59beff4c987c40fc82d1f4
  - kind: registry
    name: burn-derive
    version: 0.21.0
    sha: dce7be43cdfc9903c43dbaf3f4821543e0497d79047d8fc9ee9084e448844446
  - kind: registry
    name: burn-dispatch
    version: 0.21.0
    sha: c2087b9e12323e0d25cc0ebdccfee40427dfdec4a23fa6d3f49ba2aa1f94ac17
  - kind: registry
    name: burn-fusion
    version: 0.21.0
    sha: 95e58fcfd52a60cdf2f7da34fbebf0ed38f960fbd8675d384bacd5795cf2bdf2
  - kind: registry
    name: burn-ir
    version: 0.21.0
    sha: a81a55c32f35c2265d9e15ba2e796013d9780d5a49f9e21ea0ac4d29609dbf13
  - kind: registry
    name: burn-ndarray
    version: 0.21.0
    sha: dceb9692e292782bab7ad0259e8e8f5ee80ba2b0329a78f0ba589a26a9633dd6
  - kind: registry
    name: burn-nn
    version: 0.21.0
    sha: 93e4acd90806fa8663610f1071f3a8992eb98637d2d0816ee3062b334f61af00
  - kind: registry
    name: burn-optim
    version: 0.21.0
    sha: 4c5ea466ae0b85bf18f7656cdc152050dc8c581057fbbe33bbed267e22600228
  - kind: registry
    name: burn-std
    version: 0.21.0
    sha: 81c7eb60eb2c316854af5b214fd55f59fc7b0e25dfde7db671f09cc49f269048
  - kind: registry
    name: burn-store
    version: 0.21.0
    sha: 2f64a4fe2a0616d18f07d1d0d19c79e655e70e1828cbcb5e9df7b52211091023
  - kind: registry
    name: burn-tensor
    version: 0.21.0
    sha: 223ed3804bb9436e401fc57b87e44c86267070b870813520ed9f706c80c81442
  - kind: registry
    name: burn-vision
    version: 0.21.0
    sha: 38b5a3e9096977462cd22bf713087f9777e427f7693508871f86f5b1e8347a70
  - kind: registry
    name: burn-wgpu
    version: 0.21.0
    sha: 6eb009254af15922cb37814f3b3b61043046193ba2fde97c3879a25fbd51a92e
  - kind: registry
    name: byte-slice-cast
    version: 1.2.3
    sha: 7575182f7272186991736b70173b0ea045398f984bf5ebbb3804736ce1330c9d
  - kind: registry
    name: bytemuck
    version: 1.25.2
    sha: 95832e849adfb21180ccb6826a99da14e5d266ae5c2e668e1602cf234f153797
  - kind: registry
    name: bytemuck_derive
    version: 1.12.1
    sha: 6a1f896587b6f2c069c73d2f0913e2d590c3990285cd2f0b6aa02b786b4c679c
  - kind: registry
    name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - kind: registry
    name: byteorder-lite
    version: 0.1.0
    sha: 8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495
  - kind: registry
    name: byteorder_slice
    version: 3.0.0
    sha: 0b294e30387378958e8bf8f4242131b930ea615ff81e8cac2440cea0a6013190
  - kind: registry
    name: bytes
    version: 1.12.1
    sha: fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04
  - kind: registry
    name: bytes-utils
    version: 0.1.4
    sha: 7dafe3a8757b027e2be6e4e5601ed563c55989fcf1546e933c66c8eb3a058d35
  - kind: registry
    name: bzip2
    version: 0.6.1
    sha: f3a53fac24f34a81bc9954b5d6cfce0c21e18ec6959f44f56e8e90e4bb7c346c
  - kind: registry
    name: c2rust-bitfields
    version: 0.20.0
    sha: 46dc7d2bffa0d0b3d47eb2dc69973466858281446c2ac9f6d8a10e92ab1017df
  - kind: registry
    name: c2rust-bitfields-derive
    version: 0.20.0
    sha: ebe1117afa5937ce280034e31fa1e84ed1824a252f75380327eed438535333f8
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: cairo-rs
    version: 0.22.10
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: cairo-sys-rs
    version: 0.22.10
  - kind: registry
    name: caseless
    version: 0.2.2
    sha: 8b6fd507454086c8edfd769ca6ada439193cdb209c7681712ef6275cccbfe5d8
  - kind: registry
    name: cc
    version: 1.4.7
    sha: 54413ede23c2daf518f35156dfde027feb2374004d63bd497f983c8db9c0e313
  - kind: registry
    name: cdg
    version: 0.1.0
    sha: d254b2c9fc971518da5d652aee7edc6b9bb96fa32de28f166895faf69d9926e6
  - kind: registry
    name: cdg_renderer
    version: 0.8.0
    sha: 0070ec0e6be4ed55d28bcfc499ecd479cb3764181eee2018dc661d8efd4e3f71
  - kind: registry
    name: cdp-types
    version: 0.3.0
    sha: 332ca05a88e143d80a245f9aa6c65b6e6383ee3e332017005647c27c6a62f902
  - kind: registry
    name: cea608-types
    version: 0.1.4
    sha: 5dfc9d3f5161702cf339e6337203ac26b64279383468247e45b36e221cb06cae
  - kind: registry
    name: cea708-types
    version: 0.4.1
    sha: de28b1d549e7f8f53a746fb36ae4c10c776a8e004950b527be1669a58667ae0b
  - kind: registry
    name: cesu8
    version: 1.1.0
    sha: 6d43a04d8753f35258c91f8ec639f792891f748a1edbd759cf1dcea3382ad83c
  - kind: registry
    name: cexpr
    version: 0.6.0
    sha: 6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766
  - kind: registry
    name: cfg-expr
    version: 0.20.9
    sha: fe4ece8474b5f766c63426647e7b4b316b67431ade1036a8313cee24a03ae917
  - kind: registry
    name: cfg-if
    version: 1.0.5
    sha: 4e7648175b45a9a48536d676f68d918270699102aa8dab5496df06904c914600
  - kind: registry
    name: cfg_aliases
    version: 0.2.2
    sha: f079e83a288787bcd14a6aea84cee5c87a67c5a3e660c30f557a3d24761b3527
  - kind: registry
    name: chacha20
    version: 0.10.2
    sha: 65c35e4b699c7e15ccbe7ee35c005e4fc0a278d22238a2857e6ce2dadeda1b06
  - kind: registry
    name: chrono
    version: 0.4.45
    sha: 1aa79e62e7697b8e29b513a68abacf485adcd1fe8284a4316c5ae868e6633327
  - kind: registry
    name: ciborium
    version: 0.2.2
    sha: 42e69ffd6f0917f5c029256a24d0161db17cea3997d185db0d35926308770f0e
  - kind: registry
    name: ciborium-io
    version: 0.2.2
    sha: 05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757
  - kind: registry
    name: ciborium-ll
    version: 0.2.2
    sha: 57663b653d948a338bfb3eeba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9
  - kind: registry
    name: cipher
    version: 0.4.4
    sha: 773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad
  - kind: registry
    name: cipher
    version: 0.5.2
    sha: e8cf2a2c93cd704877c0858356ed03480ff301ee950b43f1cbe4573b088bfa6c
  - kind: registry
    name: clang-sys
    version: 1.9.1
    sha: 157a8ba7b480713b56f4c09fd13fc3e0a22a5dfab8097ba61cbc5feef950788a
  - kind: registry
    name: clap
    version: 4.6.7
    sha: aa8876b300ab35ba921adea3dfd70157a46249b33f95c9084ae5709785478946
  - kind: registry
    name: clap_builder
    version: 4.6.7
    sha: ec0797fb7aeb1406c84efac526901f7ec3ead2124f946b494e72879d4b54704d
  - kind: registry
    name: clap_derive
    version: 4.6.7
    sha: f9c751b79415d4e559e3d1fcf128e09e720eb673a06d26cf6f392d37d75b66e0
  - kind: registry
    name: clap_lex
    version: 1.1.1
    sha: 1c133bc6a41be0d194c306b5506d15e6feeea7b1d6604bd3f8310dfb2ca96486
  - kind: registry
    name: claxon
    version: 0.4.3
    sha: 4bfbf56724aa9eca8afa4fcfadeb479e722935bb2a0900c2d37e0cc477af0688
  - kind: registry
    name: cmake
    version: 0.1.58
    sha: c0f78a02292a74a88ac736019ab962ece0bc380e3f977bf72e376c5d78ff0678
  - kind: registry
    name: cmov
    version: 0.5.4
    sha: 0c9ea0ac24bc397ab3c98583a3c9ba74fa56b09a4449bbe172b9b1ddb016027a
  - kind: registry
    name: codespan-reporting
    version: 0.13.1
    sha: af491d569909a7e4dee0ad7db7f5341fef5c614d5b8ec8cf765732aba3cff681
  - kind: registry
    name: color-name
    version: 1.2.0
    sha: 2980f82525cf4a0eb43a7dcc1396bbea824897a98ef4948bd150310469acb432
  - kind: registry
    name: color-thief
    version: 0.2.2
    sha: e6460d760cf38ce67c9e0318f896538820acc54f2d0a3bfc5b2c557211066c98
  - kind: registry
    name: color_quant
    version: 1.1.0
    sha: 3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b
  - kind: registry
    name: colorchoice
    version: 1.0.5
    sha: 1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570
  - kind: registry
    name: colored
    version: 3.1.1
    sha: faf9468729b8cbcea668e36183cb69d317348c2e08e994829fb56ebfdfbaac34
  - kind: registry
    name: combine
    version: 4.6.8
    sha: cfc320937d09e6de266b31b9afb480f197d7a861be86be7cb2ea7e5d1bfffc5e
  - kind: registry
    name: compression-codecs
    version: 0.4.43
    sha: bef16c47ba2797aa6a909cc37d39911f3a6743811fe7408ac0b0cc0276b656e9
  - kind: registry
    name: compression-core
    version: 0.4.33
    sha: 6e8ccc4ea9f6acc32d102c0f6d471d11d913ad15f20c04de743374861fa1d414
  - kind: registry
    name: comrak
    version: 0.39.1
    sha: 2fefab951771fc3beeed0773ce66a4f7b706273fc6c4c95b08dd1615744abcf5
  - kind: registry
    name: concurrent-queue
    version: 2.5.0
    sha: 4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973
  - kind: registry
    name: console
    version: 0.16.6
    sha: e96a4956774c13c126a8b5af4daa79384f4d826534c95a02d76afb39e2ab64e3
  - kind: registry
    name: const-oid
    version: 0.10.2
    sha: a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c
  - kind: registry
    name: const-oid
    version: 0.9.6
    sha: c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8
  - kind: registry
    name: const-random
    version: 0.1.18
    sha: 87e00182fe74b066627d63b85fd550ac2998d4b0bd86bfed477a0ae4c7c71359
  - kind: registry
    name: const-random-macro
    version: 0.1.16
    sha: f9d839f2a20b0aee515dc581a6172f2321f96cab76c1a38a4c584a194955390e
  - kind: registry
    name: constant_time_eq
    version: 0.4.2
    sha: 3d52eff69cd5e647efe296129160853a42795992097e8af39800e1060caeea9b
  - kind: registry
    name: constcat
    version: 0.6.1
    sha: 136d3e02915a2cea4d74caa8681e2d44b1c3254bdbf17d11d41d587ff858832c
  - kind: registry
    name: convert_case
    version: 0.10.0
    sha: 633458d4ef8c78b72454de2d54fd6ab2e60f9e02be22f3c6104cdc8a4e0fceb9
  - kind: registry
    name: convert_case
    version: 0.8.0
    sha: baaaa0ecca5b51987b9423ccdc971514dd8b0bb7b4060b983d3664dad3f1f89f
  - kind: registry
    name: cookie
    version: 0.18.2
    sha: 1a373e3602691c3cdea496d2f0ee5935151e6168fe87739483c463db1b2f2f87
  - kind: registry
    name: cookie-factory
    version: 0.3.3
    sha: 9885fa71e26b8ab7855e2ec7cae6e9b380edff76cd052e07c683a0319d51b3a2
  - kind: registry
    name: cookie_store
    version: 0.22.1
    sha: 15b2c103cf610ec6cae3da84a766285b42fd16aad564758459e6ecf128c75206
  - kind: registry
    name: core-foundation
    version: 0.10.1
    sha: b2a6cd9ae233e7f62ba4e9353e81a88df7fc8a5987b8d445b4d90c879bd156f6
  - kind: registry
    name: core-foundation
    version: 0.9.4
    sha: 91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f
  - kind: registry
    name: core-foundation-sys
    version: 0.8.7
    sha: 773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b
  - kind: registry
    name: core_detect
    version: 1.0.0
    sha: 7f8f80099a98041a3d1622845c271458a2d73e688351bf3cb999266764b81d48
  - kind: registry
    name: cpubits
    version: 0.1.1
    sha: 15b85f9c39137c3a891689859392b1bd49812121d0d61c9caf00d46ed5ce06ae
  - kind: registry
    name: cpufeatures
    version: 0.2.17
    sha: 59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280
  - kind: registry
    name: cpufeatures
    version: 0.3.1
    sha: 5ca28b0ae3115b884660db4118d803791fd6756b6e88f39c0f3f7859060d7566
  - kind: registry
    name: crc-fast
    version: 1.10.0
    sha: e75b2483e97a5a7da73ac68a05b629f9c53cff58d8ed1c77866079e18b00dba5
  - kind: registry
    name: crc32fast
    version: 1.5.2
    sha: 01a7799fd6b852db0e61728dde9a204c423b44d689dbd432522543614b490e78
  - kind: registry
    name: critical-section
    version: 1.2.0
    sha: 790eea4361631c5e7d22598ecd5723ff611904e3344ce8720784c93e3d83d40b
  - kind: registry
    name: crossbeam-deque
    version: 0.8.8
    sha: 622f3fc73690be383c7214310406f28a90e6edeadc3cea882f9d71e495b9711a
  - kind: registry
    name: crossbeam-epoch
    version: 0.9.21
    sha: dc74980687109a3b14c72fd458107bf0baa1da1a1a805e178d15501ba9b86d9d
  - kind: registry
    name: crossbeam-utils
    version: 0.8.23
    sha: a31eee39dddec8330830986fcd7625edb5a24ec90ea038215273bbc3adb08ac6
  - kind: registry
    name: crunchy
    version: 0.2.4
    sha: 460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5
  - kind: registry
    name: crypto-bigint
    version: 0.5.5
    sha: 0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76
  - kind: registry
    name: crypto-common
    version: 0.1.7
    sha: 78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a
  - kind: registry
    name: crypto-common
    version: 0.2.2
    sha: ce6e4c961d6cd6c9a86db418387425e8bdeaf05b3c8bc1411e6dca4c252f1453
  - kind: registry
    name: csound
    version: 0.1.8
    sha: 8d49045d7365f5c2cadb1f20932189a0da101ac86c8dbe891975814b2348d57d
  - kind: registry
    name: csound-sys
    version: 0.1.2
    sha: 86b11869eaed111b64d29e66cc5c7de9f172d5b623b716eb74c5dd841dbcfe39
  - kind: registry
    name: ctr
    version: 0.9.2
    sha: 0369ee1ad671834580515889b80f2ea915f23b8be8d0daa4bbaf2ac5c7590835
  - kind: registry
    name: ctrlc
    version: 3.5.2
    sha: e0b1fab2ae45819af2d0731d60f2afe17227ebb1a1538a236da84c93e9a60162
  - kind: registry
    name: ctutils
    version: 0.4.2
    sha: 7d5515a3834141de9eafb9717ad39eea8247b5674e6066c404e8c4b365d2a29e
  - kind: registry
    name: cubecl
    version: 0.10.0
    sha: fd203fef6e359472e4cb8f6c0ef3eca062815a1edd560eb6d6c1d5c1397838d9
  - kind: registry
    name: cubecl-common
    version: 0.10.0
    sha: cc956c2dcc993f16f748d03bfdbd900f75cab4d469f4e5d8924f8ee128e861ad
  - kind: registry
    name: cubecl-core
    version: 0.10.0
    sha: a7522e7acf25d7848032c7b5270780f9f2abe84e13c7ed6345aa27ba70c312ca
  - kind: registry
    name: cubecl-cpp
    version: 0.10.0
    sha: 411af04828cbf4583ecd388579fb30cd7a644eec19a334bb8f0d9d08522e1458
  - kind: registry
    name: cubecl-cpu
    version: 0.10.0
    sha: f572143f54e42a49ee0635a4ec36005f639e62be029e4f49890c808985981b35
  - kind: registry
    name: cubecl-cuda
    version: 0.10.0
    sha: b6b0a69ff45688d322ad8e92c8bf645167b9ca490fa8fa087fc6adac8c5e46be
  - kind: registry
    name: cubecl-hip
    version: 0.10.0
    sha: 3c6b510a9348f06ecd56b32cf10eb6241639e927a87f5c09ec61cc7a7610d5a3
  - kind: registry
    name: cubecl-hip-sys
    version: 7.14.6085001
    sha: 3ba92853ebdf935ce68fdf96e4631a121ab72ce078201371ce7ace26603597f6
  - kind: registry
    name: cubecl-ir
    version: 0.10.0
    sha: d28a897a40c8ee6c57a8b8d76d8823ba2e97f4c2b83db9338f17a0752132d486
  - kind: registry
    name: cubecl-macros
    version: 0.10.0
    sha: 77aa6df563e8e6a0926d2e9eeacb968737940a0e1ae9be819f6a65a341006e12
  - kind: registry
    name: cubecl-macros-internal
    version: 0.10.0
    sha: a515651a5a91e25d87f71f311f80a088e6cf815798b9922560a97636da6b8740
  - kind: registry
    name: cubecl-opt
    version: 0.10.0
    sha: 0a599c6c3efefdcee8636994c90e58ef696c7efbed2d18b5b5ad8d5f29923abb
  - kind: registry
    name: cubecl-runtime
    version: 0.10.0
    sha: b68491bf5b3e997ae36bdc4e63b4ccd6d2f0e86b3b596a5d7a48d2b9e92622a0
  - kind: registry
    name: cubecl-spirv
    version: 0.10.0
    sha: cd12ded588654255e94e3d80a58e0988fdf50dd6b80365795072b04b99884f88
  - kind: registry
    name: cubecl-std
    version: 0.10.0
    sha: b391b584a4897683dd9fc0767f96337ac712b733126ce0f68a9ee8a2df073d2d
  - kind: registry
    name: cubecl-wgpu
    version: 0.10.0
    sha: 4d3663c6e1a86187172b2cee495b6b533e7d91a2cb37e26f421649e315fe4c3a
  - kind: registry
    name: cubecl-zspace
    version: 0.10.0
    sha: 04054d95698afab785a4dda9f949e297831dd9e4cc6d036a93e6603f88e88b07
  - kind: registry
    name: cubek
    version: 0.2.0
    sha: ba62fb5043d5eb723017415eec57c541f41901beea984500e2e16b57d75fa717
  - kind: registry
    name: cubek-attention
    version: 0.2.0
    sha: 75ca5c363f05a9297b9d1c0e90959cc5f9fd90bc596e4e537f26f20602ec63a5
  - kind: registry
    name: cubek-convolution
    version: 0.2.0
    sha: 70f2755a8eb9ea5509c17edac78e4a9dc4be89c433d8e2ee709703a93b96f749
  - kind: registry
    name: cubek-fft
    version: 0.2.0
    sha: 8dd7c2972363332dc4609067a2ccc21856308d98089e676d3f0c52747ae61a5b
  - kind: registry
    name: cubek-matmul
    version: 0.2.0
    sha: 83a4cea5f0f439907dc953c7638a6204b3f055f1bcbd10db91dfc5faa030ac1c
  - kind: registry
    name: cubek-quant
    version: 0.2.0
    sha: 802ff1b5f19597a7b7cb308c7c69e9eef28b78d57dab7794c816bb8f7d3d1b85
  - kind: registry
    name: cubek-random
    version: 0.2.0
    sha: 8dfecce959bdbeb3b355120e586d1ea9e45a0fc7f2ca354f4260a571952551be
  - kind: registry
    name: cubek-reduce
    version: 0.2.0
    sha: 86758b84452b06e9121f25200da13b4909ecd6235cefb5f33f459bea24dac41a
  - kind: registry
    name: cubek-std
    version: 0.2.0
    sha: a587d0a44b6f14f4c3711ac10717179b48adb59203b2b2bffe334876bf713187
  - kind: registry
    name: cudarc
    version: 0.19.9
    sha: 804764d10e844da09765a7b2ca9641a0851523d1702efb0d7299d73e31b86e80
  - kind: registry
    name: curve25519-dalek
    version: 4.1.3
    sha: 97fb8b7c4503de7d6ae7b42ab72a5a59857b4c937ec27a3d4539dba95b5ab2be
  - kind: registry
    name: curve25519-dalek-derive
    version: 0.1.1
    sha: f46882e17999c6cc590af592290432be3bce0428cb0d5f8b6715e4dc7b383eb3
  - kind: registry
    name: darling
    version: 0.20.11
    sha: fc7f46116c46ff9ab3eb1597a45688b6715c6e628b5c133e288e709a29bcb4ee
  - kind: registry
    name: darling
    version: 0.21.3
    sha: 9cdf337090841a411e2a7f3deb9187445851f91b309c0c0a29e05f74a00a48c0
  - kind: registry
    name: darling
    version: 0.23.0
    sha: 25ae13da2f202d56bd7f91c25fba009e7717a1e4a1cc98a76d844b65ae912e9d
  - kind: registry
    name: darling
    version: 0.24.1
    sha: ed17f5901b6630b993ca003def43f2f8ef4014fc13b047b57aad617ff32bc2ec
  - kind: registry
    name: darling_core
    version: 0.20.11
    sha: 0d00b9596d185e565c2207a0b01f8bd1a135483d02d9b7b0a54b11da8d53412e
  - kind: registry
    name: darling_core
    version: 0.21.3
    sha: 1247195ecd7e3c85f83c8d2a366e4210d588e802133e1e355180a9870b517ea4
  - kind: registry
    name: darling_core
    version: 0.23.0
    sha: 9865a50f7c335f53564bb694ef660825eb8610e0a53d3e11bf1b0d3df31e03b0
  - kind: registry
    name: darling_core
    version: 0.24.1
    sha: 6837e2cf7485aaae18f86181d2f0e9a7ed297a025e220aeabf63fdebd3a2ddff
  - kind: registry
    name: darling_macro
    version: 0.20.11
    sha: fc34b93ccb385b40dc71c6fceac4b2ad23662c7eeb248cf10d529b7e055b6ead
  - kind: registry
    name: darling_macro
    version: 0.21.3
    sha: d38308df82d1080de0afee5d069fa14b0326a88c14f15c5ccda35b4a6c414c81
  - kind: registry
    name: darling_macro
    version: 0.23.0
    sha: ac3984ec7bd6cfa798e62b4a642426a5be0e68f9401cfc2a01e3fa9ea2fcdb8d
  - kind: registry
    name: darling_macro
    version: 0.24.1
    sha: 2ac7135c3ef02b2f7833bbeb1be5ba7f966dcde8a87c6b87f65a778d71a02785
  - kind: registry
    name: dash-mpd
    version: 0.20.5
    sha: 644360055f889ca6a0b1071dccc333b8b809469bdddba8452bbf7008badc2079
  - kind: registry
    name: dasp
    version: 0.11.0
    sha: 7381b67da416b639690ac77c73b86a7b5e64a29e31d1f75fb3b1102301ef355a
  - kind: registry
    name: dasp_envelope
    version: 0.11.0
    sha: 8ec617ce7016f101a87fe85ed44180839744265fae73bb4aa43e7ece1b7668b6
  - kind: registry
    name: dasp_frame
    version: 0.11.0
    sha: b2a3937f5fe2135702897535c8d4a5553f8b116f76c1529088797f2eee7c5cd6
  - kind: registry
    name: dasp_interpolate
    version: 0.11.0
    sha: 7fc975a6563bb7ca7ec0a6c784ead49983a21c24835b0bc96eea11ee407c7486
  - kind: registry
    name: dasp_peak
    version: 0.11.0
    sha: 5cf88559d79c21f3d8523d91250c397f9a15b5fc72fbb3f87fdb0a37b79915bf
  - kind: registry
    name: dasp_ring_buffer
    version: 0.11.0
    sha: 07d79e19b89618a543c4adec9c5a347fe378a19041699b3278e616e387511ea1
  - kind: registry
    name: dasp_rms
    version: 0.11.0
    sha: a6c5dcb30b7e5014486e2822537ea2beae50b19722ffe2ed7549ab03774575aa
  - kind: registry
    name: dasp_sample
    version: 0.11.0
    sha: 0c87e182de0887fd5361989c677c4e8f5000cd9491d6d563161a8f3a5519fc7f
  - kind: registry
    name: dasp_signal
    version: 0.11.0
    sha: aa1ab7d01689c6ed4eae3d38fe1cea08cba761573fbd2d592528d55b421077e7
  - kind: registry
    name: dasp_slice
    version: 0.11.0
    sha: 4e1c7335d58e7baedafa516cb361360ff38d6f4d3f9d9d5ee2a2fc8e27178fa1
  - kind: registry
    name: dasp_window
    version: 0.11.1
    sha: 99ded7b88821d2ce4e8b842c9f1c86ac911891ab89443cc1de750cae764c5076
  - kind: registry
    name: data-encoding
    version: 2.11.1
    sha: 4583a4551df46e2792f82ceeac45e850d2e2d5debba0b91f102385cda5b11f06
  - kind: registry
    name: dav1d
    version: 0.11.1
    sha: 3ee89cb860616069c67520dcd66cacdb900b57c799f634a0eb6d91f6e2a82b61
  - kind: registry
    name: dav1d-sys
    version: 0.8.3
    sha: c3c91aea6668645415331133ed6f8ddf0e7f40160cd97a12d59e68716a58704b
  - kind: registry
    name: deepgram
    version: 0.11.0
    sha: f2d5e8b85dc63bb8a23f80ad7ff9a76d362708b60d965e3fdfb975599eb8019b
  - kind: registry
    name: deflate64
    version: 0.1.12
    sha: ac6b926516df9c60bfa16e107b21086399f8285a44ca9711344b9e553c5146e2
  - kind: registry
    name: defmt
    version: 1.1.1
    sha: e2953bfe4f93bbd20cc71198842756f77d161884c99ebbabc41d80231ded88d1
  - kind: registry
    name: defmt-macros
    version: 1.1.1
    sha: bad9c72e7ca2137e0dc3813245a0d282fd6daad32fd800af018306a9169b5fe8
  - kind: registry
    name: defmt-parser
    version: 1.0.0
    sha: 10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e
  - kind: registry
    name: der
    version: 0.7.10
    sha: e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb
  - kind: registry
    name: der-parser
    version: 10.0.0
    sha: 07da5016415d5a3c4dd39b11ed26f915f52fc4e0dc197d87908bc916e51bc1a6
  - kind: registry
    name: deranged
    version: 0.5.8
    sha: 7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c
  - kind: registry
    name: derive-into-owned
    version: 0.2.0
    sha: 2c9d94d81e3819a7b06a8638f448bc6339371ca9b6076a99d4a43eece3c4c923
  - kind: registry
    name: derive-new
    version: 0.7.0
    sha: 2cdc8d50f426189eef89dac62fabfa0abb27d5cc008f25bf4156a0203325becc
  - kind: registry
    name: derive_builder
    version: 0.20.2
    sha: 507dfb09ea8b7fa618fcf76e953f4f5e192547945816d5358edffe39f6f94947
  - kind: registry
    name: derive_builder_core
    version: 0.20.2
    sha: 2d5bcf7b024d6835cfb3d473887cd966994907effbe9227e8c8219824d06c4e8
  - kind: registry
    name: derive_builder_macro
    version: 0.20.2
    sha: ab63b0e2bf4d5928aff72e83a7dace85d7bba5fe12dcc3c5a572d78caffd3f3c
  - kind: registry
    name: derive_more
    version: 2.1.1
    sha: d751e9e49156b02b44f9c1815bcb94b984cdcc4396ecc32521c739452808b134
  - kind: registry
    name: derive_more-impl
    version: 2.1.1
    sha: 799a97264921d8623a957f6c3b9011f3b5492f557bbb7a5a19b7fa6d06ba8dcb
  - kind: registry
    name: deunicode
    version: 1.6.2
    sha: abd57806937c9cc163efc8ea3910e00a62e2aeb0b8119f1793a978088f8f6b04
  - kind: registry
    name: device-info
    version: 0.1.1
    sha: a2ca8e71544c1b67dcdbc2699ab258828aff985e5bc8d5f6b486d90d7df2f848
  - kind: registry
    name: diff
    version: 0.1.13
    sha: 56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8
  - kind: registry
    name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - kind: registry
    name: digest
    version: 0.11.3
    sha: f1dd6dbb5841937940781866fa1281a1ff7bd3bf827091440879f9994983d5c2
  - kind: registry
    name: dirs
    version: 6.0.0
    sha: c3e8aa94d75141228480295a7d0e7feb620b1a5ad9f12bc40be62411e38cce4e
  - kind: registry
    name: dirs
    version: 7.0.0
    sha: 8d57d423b3c82e89b9a24ca3091fee61f456a26edbd28d26c65906f4bc1dcd8f
  - kind: registry
    name: dirs-sys
    version: 0.5.0
    sha: e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab
  - kind: registry
    name: dispatch2
    version: 0.3.1
    sha: 1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38
  - kind: registry
    name: displaydoc
    version: 0.2.7
    sha: c6232dd377dcc64799954cbd3a9bb882e9cdc1308ccd87b1c098f1fb2eaf82a8
  - kind: registry
    name: dlib
    version: 0.5.3
    sha: ab8ecd87370524b461f8557c119c405552c396ed91fc0a8eec68679eab26f94a
  - kind: registry
    name: document-features
    version: 0.2.12
    sha: d4b8a88685455ed29a21542a33abd9cb6510b6b129abadabdcef0f4c55bc8f61
  - kind: registry
    name: dssim-core
    version: 3.5.1
    sha: f2186fbf554f956fbd6206e3b2554978062558ace6572c317b34d0c03a2dbdff
  - kind: registry
    name: dunce
    version: 1.0.5
    sha: 92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813
  - kind: registry
    name: dyn-clone
    version: 1.0.20
    sha: d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555
  - kind: registry
    name: easyfft
    version: 0.4.2
    sha: 767e39eef2ad8a3b6f1d733be3ec70364d21d437d06d4f18ea76ce08df20b75f
  - kind: registry
    name: ebml-iterable
    version: 0.7.1
    sha: 152f8f4a13024011b26457b8b21040d9a9eb1222e693993ef037db391cd0c004
  - kind: registry
    name: ebml-iterable-specification
    version: 0.4.0
    sha: f56467af159a98735d44231f53eaa505e919e6003266f103b99649a93f106784
  - kind: registry
    name: ebml-iterable-specification-derive
    version: 0.4.0
    sha: b066b81018300fdce40f71c4db355a102699324af96fad28f25ab1b5f87de066
  - kind: registry
    name: ebur128
    version: 0.1.10
    sha: e227cc62d64d6fe01abbef48134b9c1f17d470cef1e7a56337ad05b1f81df7f9
  - kind: registry
    name: ecdsa
    version: 0.16.9
    sha: ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca
  - kind: registry
    name: ed25519
    version: 1.5.3
    sha: 91cff35c70bba8a626e3185d8cd48cc11b5437e1a5bcd15b9b5fa3c64b6dfee7
  - kind: registry
    name: edit-distance
    version: 2.2.2
    sha: 324d428080b707bac399325341bd61af5ded1b30f33b7c949792ca464733c2d5
  - kind: registry
    name: either
    version: 1.18.0
    sha: 252afb9ae5eaa683babdc6a068b3f5726eb19e05070c731f9b2a23a7c3e8ed34
  - kind: registry
    name: elliptic-curve
    version: 0.13.8
    sha: b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47
  - kind: registry
    name: embassy-futures
    version: 0.1.2
    sha: dc2d050bdc5c21e0862a89256ed8029ae6c290a93aecefc73084b3002cdebb01
  - kind: registry
    name: embassy-time
    version: 0.5.1
    sha: 592b0c143ec626e821d4d90da51a2bd91d559d6c442b7c74a47d368c9e23d97a
  - kind: registry
    name: embassy-time-driver
    version: 0.2.2
    sha: 6ee71af1b3a0deaa53eaf2d39252f83504c853646e472400b763060389b9fcc9
  - kind: registry
    name: embedded-hal
    version: 0.2.7
    sha: 35949884794ad573cf46071e41c9b60efb0cb311e3ca01f7af807af1debc66ff
  - kind: registry
    name: embedded-hal
    version: 1.0.0
    sha: 361a90feb7004eca4019fb28352a9465666b24f840f5c3cddf0ff13920590b89
  - kind: registry
    name: embedded-hal-async
    version: 1.0.0
    sha: 0c4c685bbef7fe13c3c6dd4da26841ed3980ef33e841cddfa15ce8a8fb3f1884
  - kind: registry
    name: encode_unicode
    version: 1.0.0
    sha: 34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0
  - kind: registry
    name: encoding_rs
    version: 0.8.41
    sha: 7b5ef0006ac9ab233c38522f5ae99cae3625151de8f706cacee1cba4b8e2832a
  - kind: registry
    name: entities
    version: 1.0.1
    sha: b5320ae4c3782150d900b79807611a59a99fc9a1d61d686faafc24b93fc8d7ca
  - kind: registry
    name: enumn
    version: 0.1.14
    sha: 2f9ed6b3789237c8a0c1c505af1c7eb2c560df6186f01b098c3a1064ea532f38
  - kind: registry
    name: enumset
    version: 1.1.14
    sha: ccc5801fd11762e24d1e420d01d2ac518f2a2ca4329d4fbb6639f2412b6204e0
  - kind: registry
    name: enumset_derive
    version: 0.15.0
    sha: 4bd536557b58c682b217b8fb199afdff47cd3eff260623f19e77074eb073d63a
  - kind: registry
    name: env_filter
    version: 2.0.0
    sha: 900d271a03799a1ee8d1ca9b19893b48ca674a9284fefcfb85f05e74ed314217
  - kind: registry
    name: env_logger
    version: 0.11.11
    sha: de671bd27a75a797dc9ae289ba1e77276e75e2026408aab65185384e2d5cd3f6
  - kind: registry
    name: equator
    version: 0.4.2
    sha: 4711b213838dfee0117e3be6ac926007d7f433d7bbe33595975d4190cb07e6fc
  - kind: registry
    name: equator-macro
    version: 0.4.2
    sha: 44f23cf4b44bfce11a86ace86f8a73ffdec849c9fd00a386a53d278bd9e81fb3
  - kind: registry
    name: equivalent
    version: 1.0.2
    sha: 877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f
  - kind: registry
    name: errno
    version: 0.3.14
    sha: 39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb
  - kind: registry
    name: etherparse
    version: 0.21.0
    sha: 17304d06addb3283cdc4bd528e42dd95e73c8ee2d6492ffce415e93660885449
  - kind: registry
    name: event-listener
    version: 5.4.2
    sha: 5a23add41df1562121a9393cb065eab5146a1242410f23a644851e90cfd669d2
  - kind: registry
    name: event-listener-strategy
    version: 0.5.4
    sha: 8be9f3dfaaffdae2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93
  - kind: registry
    name: exr
    version: 1.74.2
    sha: 711fe42c9964295e01ee3fba3f9fe0e1d24b98886950d68efe81b1c76e21adf3
  - kind: registry
    name: fallible-iterator
    version: 0.3.0
    sha: 2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649
  - kind: registry
    name: fastbloom
    version: 0.17.0
    sha: ef975e30683b2d965054bb0a836f8973857c4ebf6acf274fe46617cd285060d8
  - kind: registry
    name: fastrand
    version: 2.5.0
    sha: da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223
  - kind: registry
    name: fax
    version: 0.2.7
    sha: caf1079563223d5d59d83c85886a56e586cfd5c1a26292e971a0fa266531ac5a
  - kind: registry
    name: fdeflate
    version: 0.3.7
    sha: 1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c
  - kind: registry
    name: ff
    version: 0.13.1
    sha: c0b50bfb653653f9ca9095b427bed08ab8d75a137839d9ad64eb11810d5b6393
  - kind: git
    commit: bd9eabfc14c9ad53c37b32279e276619f4390ab8
    repo: github:rust-av/ffv1.git
    query:
      rev: bd9eabfc14c9ad53c37b32279e276619f4390ab8
    name: ffv1
    version: 0.0.0
  - kind: registry
    name: fiat-crypto
    version: 0.2.9
    sha: 28dea519a9695b9977216879a3ebfddf92f1c08c05d984f8996aecd6ecdc811d
  - kind: registry
    name: field-offset
    version: 0.3.6
    sha: 38e2275cc4e4fc009b0669731a1e5ab7ebf11f469eaede2bab9309a5b4d6057f
  - kind: registry
    name: filetime
    version: 0.2.29
    sha: 5c287a33c7f0a620c38e641e7f60827713987b3c0f26e8ddc9462cc69cf75759
  - kind: registry
    name: find-msvc-tools
    version: 0.1.13
    sha: ef25905e51abafe4dcea6c15fec58c57b601cdbd0ee53d22ea1d3016c587d39b
  - kind: registry
    name: fixedbitset
    version: 0.4.2
    sha: 0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80
  - kind: registry
    name: fixedbitset
    version: 0.5.7
    sha: 1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99
  - kind: registry
    name: flate2
    version: 1.1.10
    sha: 6e634e2e0ebac1ee034020da1ca582e17ffe4e0f5e985823721e168928136dcb
  - kind: git
    commit: 833508af656d298c269f2397c8541a084264d992
    repo: github:rust-av/flavors
    name: flavors
    version: 0.2.0
  - kind: registry
    name: float-ord
    version: 0.3.2
    sha: 8ce81f49ae8a0482e4c55ea62ebbd7e5a686af544c00b9d090bba3ff9be97b3d
  - kind: registry
    name: float4
    version: 0.2.0
    sha: 9a5404bf31d22893d61cf24d4dda149d8e6b2ff07601c3cb3be651031f61a4ed
  - kind: registry
    name: float8
    version: 0.7.0
    sha: c2d1f04709a8ac06e8e8042875a3c466cc4832d3c1a18dbcb9dba3c6e83046bc
  - kind: registry
    name: flume
    version: 0.12.0
    sha: 5e139bc46ca777eb5efaf62df0ab8cc5fd400866427e56c68b22e414e53bd3be
  - kind: registry
    name: fnv
    version: 1.0.7
    sha: 3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1
  - kind: registry
    name: foldhash
    version: 0.1.5
    sha: d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2
  - kind: registry
    name: foldhash
    version: 0.2.0
    sha: 77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb
  - kind: registry
    name: form_urlencoded
    version: 1.2.2
    sha: cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf
  - kind: registry
    name: fs_extra
    version: 1.3.0
    sha: 42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c
  - kind: registry
    name: fslock
    version: 0.2.1
    sha: 04412b8935272e3a9bae6f48c7bfff74c2911f60525404edfdd28e49884c3bfb
  - kind: registry
    name: fst
    version: 0.4.7
    sha: 7ab85b9b05e3978cc9a9cf8fea7f01b494e1a09ed3037e16ba39edc7a29eb61a
  - kind: registry
    name: futures
    version: 0.3.34
    sha: 9a31d2a3fbaaeb2af2368bbdd904aa8e812d3c04a1ee10d3171f52d556e5d0a3
  - kind: registry
    name: futures-channel
    version: 0.3.34
    sha: b1f9e3d69d39e4862ffed03ed071a76f9a13ba1d9109d355b0f0aa6b15e393c4
  - kind: registry
    name: futures-core
    version: 0.3.34
    sha: 92d699e522242e69e3003b94ecc1f960f3a5e015aa7c5d7486e65ad01dd94f5e
  - kind: registry
    name: futures-executor
    version: 0.3.34
    sha: 031b47cf1a3c6cc8bc2fc76cd437f521619387907d469316e7c0bc278f1f5432
  - kind: registry
    name: futures-io
    version: 0.3.34
    sha: 53c0fa8157de1303bfffdaa1cc2a673bfffb60102f76b0ef4441659124373fed
  - kind: registry
    name: futures-lite
    version: 2.6.1
    sha: f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad
  - kind: registry
    name: futures-macro
    version: 0.3.34
    sha: 9fb9654ba8355388abeb8dcb4fc62f511300867002afc858860463bdd9fe0c44
  - kind: registry
    name: futures-sink
    version: 0.3.34
    sha: 1944426bf7d03f1d14f708785e4b33efd750b36d48a157b836b3efc15ede8e1d
  - kind: registry
    name: futures-task
    version: 0.3.34
    sha: cd417de3d1d015fc3bfd2b1ea46dfc7bab72ef86f1cc7cc9c78e728b34a6d1fd
  - kind: registry
    name: futures-timer
    version: 3.0.4
    sha: af43fadb8a98512d547e37b4e92e0ced13e205c061b87b4623eff01d918d6968
  - kind: registry
    name: futures-util
    version: 0.3.34
    sha: 0d50a92467f8ba5dd6e3ee5d4bd04d73ab2e4e1c44474a0674821dfce14b79bc
  - kind: registry
    name: g2gen
    version: 1.2.2
    sha: c5a7e0eb46f83a20260b850117d204366674e85d3a908d90865c78df9a6b1dfc
  - kind: registry
    name: g2p
    version: 1.2.2
    sha: 539e2644c030d3bf4cd208cb842d2ce2f80e82e6e8472390bcef83ceba0d80ad
  - kind: registry
    name: g2poly
    version: 1.2.2
    sha: 312d2295c7302019c395cfb90dacd00a82a2eabd700429bba9c7a3f38dbbe11b
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gdk-pixbuf
    version: 0.22.10
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gdk-pixbuf-sys
    version: 0.22.10
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4
    version: 0.11.5
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-sys
    version: 0.11.5
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-wayland
    version: 0.11.5
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-wayland-sys
    version: 0.11.5
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-win32
    version: 0.11.5
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-win32-sys
    version: 0.11.5
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-x11
    version: 0.11.5
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-x11-sys
    version: 0.11.5
  - kind: registry
    name: generator
    version: 0.8.10
    sha: 54ade96dc9003043bce7c035c85a9df5a858bfb2039c5a2e6fdf00f324f6c551
  - kind: registry
    name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - kind: registry
    name: generic_singleton
    version: 0.5.3
    sha: ab6e923c8e978e57cf63e2e200ca967d1d20f0ea2662b28f6d4e11c44aa6ab16
  - kind: registry
    name: getifaddrs
    version: 0.6.2
    sha: a542e1b7ac1f3d62c5777d430d66eca9cb59e813c46b86e29fa9ce94ff9a4810
  - kind: registry
    name: getrandom
    version: 0.2.17
    sha: ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0
  - kind: registry
    name: getrandom
    version: 0.3.4
    sha: 899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd
  - kind: registry
    name: getrandom
    version: 0.4.3
    sha: 300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099
  - kind: registry
    name: gif
    version: 0.14.2
    sha: ee8cfcc411d9adbbaba82fb72661cc1bcca13e8bba98b364e62b2dba8f960159
  - kind: registry
    name: gimli
    version: 0.32.3
    sha: e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gio
    version: 0.22.10
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gio-sys
    version: 0.22.10
  - kind: registry
    name: gl_generator
    version: 0.14.0
    sha: 1a95dfc23a2b4a9a2f5ab41d194f8bfda3cabec42af4e39f08c339eb2a0c124d
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: glib
    version: 0.22.10
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: glib-macros
    version: 0.22.10
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: glib-sys
    version: 0.22.10
  - kind: registry
    name: glob
    version: 0.3.4
    sha: e4eba85ea1d0a966a983acd07deee566e67395d2d96b6fb39e62b5a833f1eb0b
  - kind: registry
    name: glow
    version: 0.17.0
    sha: 29038e1c483364cc6bb3cf78feee1816002e127c331a1eec55a4d202b9e1adb5
  - kind: registry
    name: glutin_wgl_sys
    version: 0.6.1
    sha: 2c4ee00b289aba7a9e5306d57c2d05499b2e5dc427f84ac708bd2c090212cf3e
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gobject-sys
    version: 0.22.10
  - kind: registry
    name: governor
    version: 0.10.4
    sha: 9efcab3c1958580ff1f25a2a41be1668f7603d849bb63af523b208a3cc1223b8
  - kind: registry
    name: gpu-allocator
    version: 0.28.0
    sha: 51255ea7cfaadb6c5f1528d43e92a82acb2b96c43365989a28b2d44ee38f8795
  - kind: registry
    name: gpu-descriptor
    version: 0.3.2
    sha: b89c83349105e3732062a895becfc71a8f921bb71ecbbdd8ff99263e3b53a0ca
  - kind: registry
    name: gpu-descriptor-types
    version: 0.2.0
    sha: fdf242682df893b86f33a73828fb09ca4b2d3bb6cc95249707fc684d27484b91
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: graphene-rs
    version: 0.22.10
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: graphene-sys
    version: 0.22.10
  - kind: registry
    name: group
    version: 0.13.0
    sha: f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gsk4
    version: 0.11.5
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gsk4-sys
    version: 0.11.5
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-allocators
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-allocators-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-analytics
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-analytics-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-app
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-app-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-audio
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-audio-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-base
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-base-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-check
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-check-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-egl
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-egl-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-wayland
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-wayland-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-x11
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-x11-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-net
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-net-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-pbutils
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-pbutils-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-rtp
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-rtp-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-sdp
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-sdp-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-tag
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-tag-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-utils
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-validate
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-validate-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-video
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-video-sys
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-webrtc
    version: 0.25.3
  - kind: git
    commit: 50d71e64ce6153a4dda06fc03f09eb2755fb9285
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-webrtc-sys
    version: 0.25.3
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gtk4
    version: 0.11.5
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gtk4-macros
    version: 0.11.5
  - kind: git
    commit: 2fcbc1544689df84b4f607d4dd6e7be668482494
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gtk4-sys
    version: 0.11.5
  - kind: registry
    name: h2
    version: 0.3.27
    sha: 0beca50380b1fc32983fc1cb4587bfa4bb9e78fc259aad4a0032d2080309222d
  - kind: registry
    name: h2
    version: 0.4.19
    sha: ef8e5e5a340588f4452631496976cf8636d4a7ecf600239fdc27615d2530bc16
  - kind: registry
    name: half
    version: 2.7.1
    sha: 6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b
  - kind: registry
    name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - kind: registry
    name: hashbrown
    version: 0.13.2
    sha: 43a3c133739dddd0d2990f9a4bdf8eb4b21ef50e4851ca85ab661199821d510e
  - kind: registry
    name: hashbrown
    version: 0.15.5
    sha: 9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1
  - kind: registry
    name: hashbrown
    version: 0.16.1
    sha: 841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100
  - kind: registry
    name: hashbrown
    version: 0.17.1
    sha: ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a
  - kind: registry
    name: headers
    version: 0.4.1
    sha: b3314d5adb5d94bcdf56771f2e50dbbc80bb4bdf88967526706205ac9eff24eb
  - kind: registry
    name: headers-core
    version: 0.3.0
    sha: 54b4a22553d4242c49fddb9ba998a99962b5cc6f22cb5a3482bec22522403ce4
  - kind: registry
    name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - kind: registry
    name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - kind: registry
    name: hermit-abi
    version: 0.5.3
    sha: e17592d60ebacc7d5e169f4663c5f84f9161cc90328abcfe8456f41e4dfcb284
  - kind: registry
    name: hex
    version: 0.4.3
    sha: 7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70
  - kind: registry
    name: hexf-parse
    version: 0.2.1
    sha: dfa686283ad6dd069f105e5ab091b04c62850d3e4cf5d67debad1933f55023df
  - kind: registry
    name: hmac
    version: 0.12.1
    sha: 6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e
  - kind: registry
    name: hmac
    version: 0.13.0
    sha: 6303bc9732ae41b04cb554b844a762b4115a61bfaa81e3e83050991eeb56863f
  - kind: registry
    name: home
    version: 0.5.12
    sha: cc627f471c528ff0c4a49e1d5e60450c8f6461dd6d10ba9dcd3a61d3dff7728d
  - kind: registry
    name: hound
    version: 3.5.1
    sha: 62adaabb884c94955b19907d60019f4e145d091c75345379e70d1ee696f7854f
  - kind: registry
    name: hrtf
    version: 0.8.1
    sha: 0f4de47a84fd55fa33aa5ef337016814fdc869fdad23e7898b5322fa290248e6
  - kind: registry
    name: http
    version: 0.2.12
    sha: 601cbb57e577e2f5ef5be8e7b83f0f63994f25aa94d673e54a92d5c516d101f1
  - kind: registry
    name: http
    version: 1.5.0
    sha: 918d3568bebf352712bc2ef3d46a8bcf1a75b373be6539de198e9105cbbf9ce0
  - kind: registry
    name: http-body
    version: 0.4.6
    sha: 7ceab25649e9960c0311ea418d17bee82c0dcec1bd053b5f9a66e265a693bed2
  - kind: registry
    name: http-body
    version: 1.1.0
    sha: ca2a8f2913ee65f60facd6a5905613afaa448497a0230cc41ce022d93290bc2c
  - kind: registry
    name: http-body-util
    version: 0.1.5
    sha: 23169fe34a5fbcdd3f3862e78fb9b6fccd5f02a6dc6f732547005d45631ce71c
  - kind: registry
    name: httparse
    version: 1.10.1
    sha: 6dbf3de79e51f3d586ab4cb9d5c3e2c14aa28ed23d180cf89b4df0454a69cc87
  - kind: registry
    name: httpdate
    version: 1.0.3
    sha: df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9
  - kind: registry
    name: human_bytes
    version: 0.4.3
    sha: 91f255a4535024abf7640cb288260811fc14794f62b063652ed349f9a6c2348e
  - kind: registry
    name: hxdmp
    version: 0.2.1
    sha: a17b27f28a7466846baca75f0a5244e546e44178eb7f1c07a3820f413e91c6b0
  - kind: registry
    name: hybrid-array
    version: 0.4.15
    sha: 27f864f10dfb56725ce5ce5472bc52252c8f93a4ab86327122cebf62c5f59a17
  - kind: registry
    name: hyper
    version: 0.14.32
    sha: 41dfc780fdec9373c01bae43289ea34c972e40ee3c9f6b3c8801a35f35586ce7
  - kind: registry
    name: hyper
    version: 1.11.1
    sha: 27b501faa50e7a26c3d3560ca625132f4078a17771f4810baf70475ae48cbe43
  - kind: registry
    name: hyper-proxy2
    version: 0.1.0
    sha: 9043b7b23fb0bc4a1c7014c27b50a4fc42cc76206f71d34fc0dfe5b28ddc3faf
  - kind: registry
    name: hyper-rustls
    version: 0.24.2
    sha: ec3efd23720e2049821a693cbc7e65ea87c72f1c58ff2f9522ff332b1491e590
  - kind: registry
    name: hyper-rustls
    version: 0.26.0
    sha: a0bea761b46ae2b24eb4aef630d8d1c398157b6fc29e6350ecf090a0b70c952c
  - kind: registry
    name: hyper-rustls
    version: 0.27.10
    sha: dfa8e654703247911e29c23fbeaa261834bd9bb74efba2f9acddc37bfb127f53
  - kind: registry
    name: hyper-util
    version: 0.1.20
    sha: 96547c2556ec9d12fb1578c4eaf448b04993e7fb79cbaad930a656880a6bdfa0
  - kind: registry
    name: hyphenation
    version: 0.8.4
    sha: bcf4dd4c44ae85155502a52c48739c8a48185d1449fff1963cffee63c28a50f0
  - kind: registry
    name: hyphenation_commons
    version: 0.8.4
    sha: 5febe7a2ade5c7d98eb8b75f946c046b335324b06a14ea0998271504134c05bf
  - kind: registry
    name: iana-time-zone
    version: 0.1.65
    sha: e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470
  - kind: registry
    name: iana-time-zone-haiku
    version: 0.1.2
    sha: f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f
  - kind: registry
    name: icu_collections
    version: 2.3.0
    sha: fa68d21081c4a05d5a901a1c62add574c77048b6a1c67be3b50ce0b60d4ca513
  - kind: registry
    name: icu_locale
    version: 2.3.1
    sha: 785f595c61ef57169a467eeed7b4b6936a66f6cacbb116a96ee86da983251bf4
  - kind: registry
    name: icu_locale_core
    version: 2.3.0
    sha: d56e28588da92eee5c3201a6eff33fabdd49b62269c8938d4ff050ce4d900deb
  - kind: registry
    name: icu_locale_fallback
    version: 2.3.0
    sha: 251af8e57c9400e3eb58242fe5b8b1152b2a64fdf4cf632f923c38ccee6f2fa9
  - kind: registry
    name: icu_locale_fallback_data
    version: 2.3.0
    sha: decf2a22ec8fa68f1a0c1129a3f8583f8f8bc24e8b9ccbe98ead99f62a4dc3a8
  - kind: registry
    name: icu_normalizer
    version: 2.3.0
    sha: 12f9cf5f235641ed274641dd81c3f28d870e276763d0797aeeab72317b1c646f
  - kind: registry
    name: icu_normalizer_data
    version: 2.3.0
    sha: 1563da1ed3e0b3bf3d74c9b85917ac9c56464d2f57242270c09c9e752f8021a0
  - kind: registry
    name: icu_properties
    version: 2.3.0
    sha: 7e7ca276ad3145661a65914e6daf131ca5120cd3dcee8f8f3214b8875184a148
  - kind: registry
    name: icu_properties_data
    version: 2.3.0
    sha: e590f038c1464a96894fd6d10127e90a8be4509f56ff7ecef851b15cee0b7caa
  - kind: registry
    name: icu_provider
    version: 2.3.1
    sha: d27bbb9d3abbefac45d55f647c9de1d44aafcd1186eb91879afef17c396c3e73
  - kind: registry
    name: icu_segmenter
    version: 2.3.0
    sha: 82d07aafccd67af15d02512a6adf5896fbc5ed00f2e99b471d2efa14016db3db
  - kind: registry
    name: icu_segmenter_data
    version: 2.3.0
    sha: ae293c039020f9ec10710af98d29ce6aa2051486638b49c9a6409f3b4a9e98ad
  - kind: registry
    name: ident_case
    version: 1.0.1
    sha: b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39
  - kind: registry
    name: idna
    version: 1.1.0
    sha: 3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de
  - kind: registry
    name: idna_adapter
    version: 1.2.2
    sha: cb68373c0d6620ef8105e855e7745e18b0d00d3bdb07fb532e434244cdb9a714
  - kind: registry
    name: image
    version: 0.25.10
    sha: 85ab80394333c02fe689eaf900ab500fbd0c2213da414687ebf995a65d5a6104
  - kind: registry
    name: image-webp
    version: 0.2.4
    sha: 525e9ff3e1a4be2fbea1fdf0e98686a6d98b4d8f937e1bf7402245af1909e8c3
  - kind: registry
    name: image_hasher
    version: 3.1.1
    sha: dd266c66b0a0e2d4c6db8e710663fc163a2d33595ce997b6fbda407c8759d344
  - kind: registry
    name: imgref
    version: 1.12.3
    sha: 6e44b0a4eaa4c82f441d50a963f2d5f05a787240aeee097597033e72accfd22f
  - kind: registry
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.14.2
    sha: cc4e190f5d26ca7051642629da2c52fc03bde85a03197c99408dcd291734c855
  - kind: registry
    name: indicatif
    version: 0.18.6
    sha: 9433806cd6b4ec1aba79c021c7e4c58fb4c3b9977c085062e611ac929998fb0c
  - kind: registry
    name: inflections
    version: 1.1.1
    sha: a257582fdcde896fd96463bf2d40eefea0580021c0712a0e2b028b60b47a837a
  - kind: registry
    name: inout
    version: 0.1.4
    sha: 879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01
  - kind: registry
    name: inout
    version: 0.2.2
    sha: 4250ce6452e92010fdf7268ccc5d14faa80bb12fc741938534c58f16804e03c7
  - kind: registry
    name: interpolate_name
    version: 0.2.4
    sha: c34819042dc3d3971c46c2190835914dfbe0c3c13f61449b2997f4e9722dfa60
  - kind: registry
    name: ipnet
    version: 2.12.2
    sha: 791930b43c0d5973160d90a8f3894509f2b273430f5c5c73b668636d0287c5c0
  - kind: registry
    name: is-docker
    version: 0.2.0
    sha: 928bae27f42bc99b60d9ac7334e3a21d10ad8f1835a4e12ec3ec0464765ed1b3
  - kind: registry
    name: is-wsl
    version: 0.4.0
    sha: 173609498df190136aa7dea1a91db051746d339e18476eed5ca40521f02d7aa5
  - kind: registry
    name: is_terminal_polyfill
    version: 1.70.2
    sha: a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695
  - kind: registry
    name: iso8601
    version: 0.6.6
    sha: 4ffd3254cf2b0fc53e38414bdba99719f3e269db8a6519731b68a3a90040c41b
  - kind: registry
    name: itertools
    version: 0.11.0
    sha: b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57
  - kind: registry
    name: itertools
    version: 0.12.1
    sha: ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569
  - kind: registry
    name: itertools
    version: 0.13.0
    sha: 413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186
  - kind: registry
    name: itertools
    version: 0.14.0
    sha: 2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285
  - kind: registry
    name: itertools
    version: 0.15.0
    sha: 8b4baf93f58d4425749ca49a51c50ebab072c5df6994d08fed93541c331481dc
  - kind: registry
    name: itoa
    version: 1.0.18
    sha: 8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682
  - kind: registry
    name: jiff
    version: 0.2.37
    sha: 0ab1baf72f08796de0260609515130699b890ac25f30e610ad894bc5856cafdb
  - kind: registry
    name: jiff-core
    version: 0.1.1
    sha: 5e52fe76043ccecc9005d2305ebaadf7d7fc0cc89ca6baa10a94d6bc68c7128c
  - kind: registry
    name: jiff-static
    version: 0.2.37
    sha: 378268a1116ad67ae6228701118ac9f491d78fda38a40a1f1a9e1348de6f7212
  - kind: registry
    name: jiff-tzdb
    version: 0.1.8
    sha: 142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e
  - kind: registry
    name: jiff-tzdb-platform
    version: 0.1.3
    sha: 875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8
  - kind: registry
    name: jni
    version: 0.21.1
    sha: 1a87aa2bb7d2af34197c04845522473242e1aa17c12f4935d5856491a7fb8c97
  - kind: registry
    name: jni
    version: 0.22.4
    sha: 5efd9a482cf3a427f00d6b35f14332adc7902ce91efb778580e180ff90fa3498
  - kind: registry
    name: jni-macros
    version: 0.22.4
    sha: a00109accc170f0bdb141fed3e393c565b6f5e072365c3bd58f5b062591560a3
  - kind: registry
    name: jni-sys
    version: 0.3.1
    sha: 41a652e1f9b6e0275df1f15b32661cf0d4b78d4d87ddec5e0c3c20f097433258
  - kind: registry
    name: jni-sys
    version: 0.4.1
    sha: c6377a88cb3910bee9b0fa88d4f42e1d2da8e79915598f65fb0c7ee14c878af2
  - kind: registry
    name: jni-sys-macros
    version: 0.4.1
    sha: 38c0b942f458fe50cdac086d2f946512305e5631e720728f2a61aabcd47a6264
  - kind: registry
    name: jobserver
    version: 0.1.35
    sha: 1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3
  - kind: registry
    name: js-sys
    version: 0.3.105
    sha: ce57d20d1ea864ce2ac172ab472d409214f4fd359f0b2a2775abdf522e2af99e
  - kind: registry
    name: jsonwebtoken
    version: 10.4.0
    sha: eba32bfb4ffdeaca3e34431072faf01745c9b26d25504aa7a6cf5684334fc4fc
  - kind: registry
    name: khronos-egl
    version: 6.0.0
    sha: 6aae1df220ece3c0ada96b8153459b67eebe9ae9212258bb0134ae60416fdf76
  - kind: registry
    name: khronos_api
    version: 3.1.0
    sha: e2db585e1d738fc771bf08a151420d3ed193d9d895a36df7f6f8a9456b911ddc
  - kind: registry
    name: kio
    version: 0.5.9
    sha: 3033155c4fffcd86959a9ebdfbcadbed7ec4bfcc2fb545469778f791adf704eb
  - kind: registry
    name: kstring
    version: 2.0.2
    sha: 558bf9508a558512042d3095138b1f7b8fe90c5467d94f9f1da28b3731c5dbd1
  - kind: registry
    name: lazy_static
    version: 1.5.0
    sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
  - kind: registry
    name: lebe
    version: 0.5.3
    sha: 7a79a3332a6609480d7d0c9eab957bca6b455b91bb84e66d19f5ff66294b85b8
  - kind: registry
    name: lewton
    version: 0.10.2
    sha: 777b48df9aaab155475a83a7df3070395ea1ac6902f5cd062b8f2b028075c030
  - kind: registry
    name: libbz2-rs-sys
    version: 0.2.5
    sha: 34b357333733e8260735ba5894eb928c02ecc69c78715f01a8019e7fa7f2db4c
  - kind: registry
    name: libc
    version: 0.2.189
    sha: 3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2
  - kind: registry
    name: libfuzzer-sys
    version: 0.4.13
    sha: a9fd2f41a1cba099f79a0b6b6c35656cf7c03351a7bae8ff0f28f25270f929d2
  - kind: registry
    name: libloading
    version: 0.8.9
    sha: d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55
  - kind: registry
    name: libloading
    version: 0.9.0
    sha: 754ca22de805bb5744484a5b151a9e1a8e837d5dc232c2d7d8c2e3492edc8b60
  - kind: registry
    name: liblzma
    version: 0.4.8
    sha: 2fe0a34ca854fd4f20c07f696fc8675aec78f87d88d29f5e10257a7490a1b2e1
  - kind: registry
    name: liblzma-sys
    version: 0.4.9
    sha: 7c7e3581f367a78d7b7e7ae948d023310556f0cfc13156c2e4e00e25616492b9
  - kind: registry
    name: libm
    version: 0.2.16
    sha: b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981
  - kind: registry
    name: libredox
    version: 0.1.24
    sha: 6480ccc157a1389bb2e4891b24751b0f798ba640d22386f23143fbcc89da195a
  - kind: registry
    name: librespot-audio
    version: 0.8.0
    sha: b3fe76acb49f58165484303edf0e7bd778f0e6d96f5c59e9d6b6fde1a90d36ff
  - kind: registry
    name: librespot-core
    version: 0.8.0
    sha: 168bbe1c416980ddd9a969ebd6b50fb6c924eb1a3ded194285fa8ec0e2b1c68b
  - kind: registry
    name: librespot-metadata
    version: 0.8.0
    sha: 9a9c688aa2acd3ed2498e31a95d6f2be49c0f18128db8958450ffd628aa88532
  - kind: registry
    name: librespot-oauth
    version: 0.8.0
    sha: d686417d49c9d2c363392ffe28d6e469daca20a82dc414740930e078f5829661
  - kind: registry
    name: librespot-playback
    version: 0.8.0
    sha: 88258620bf3e6808ea1fadd11639648d77c06280b9f5a4c9d14ea79f6f998af6
  - kind: registry
    name: librespot-protocol
    version: 0.8.0
    sha: 3e01f0b2d39f83fa162eb91d4a16313bcf99e77daf258abe8f7b7bcb1160b084
  - kind: registry
    name: libsodium-sys
    version: 0.2.7
    sha: 6b779387cd56adfbc02ea4a668e704f729be8d6a6abd2c27ca5ee537849a92fd
  - kind: registry
    name: libwebp-sys2
    version: 0.1.11
    sha: 4790186411a6843ecc0a141c8948c8e623a0bb5e886834b1b6c90f3dfa85bb99
  - kind: registry
    name: libwebp-sys2
    version: 0.2.0
    sha: 6dc3d00aeaa1d6bf4f35f3003bc1835135e0fb41f2fc19082a3f98d619792505
  - kind: registry
    name: linux-raw-sys
    version: 0.12.1
    sha: 32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53
  - kind: registry
    name: linux-raw-sys
    version: 0.4.15
    sha: d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab
  - kind: registry
    name: litemap
    version: 0.8.3
    sha: 47d9d19d1d6efa0109d2f65ff4c85cddd50bd572e5a00127ab10987290bcefae
  - kind: registry
    name: litrs
    version: 1.0.0
    sha: 11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092
  - kind: registry
    name: livekit-api
    version: 0.5.4
    sha: d2150a76435ae6129101ab74e75d8fd0bc24fc57d71477f59c67fad9b0541d85
  - kind: registry
    name: livekit-protocol
    version: 0.7.11
    sha: 735a237deeff60124edd7831fcabce32b4b9f667d5c4c5688c9d18a2808422c4
  - kind: registry
    name: livekit-runtime
    version: 0.4.0
    sha: 532e84c6cdc5fe774f2b5d9912597b5f3bea561927a48296d03e24549d21c3f6
  - kind: registry
    name: lock_api
    version: 0.4.14
    sha: 224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965
  - kind: registry
    name: log
    version: 0.4.34
    sha: f9f8bd3e56ce4dfc153cf470fffbfa98c7620958b312ca5c3a4b8d5181fd13c6
  - kind: registry
    name: loom
    version: 0.7.2
    sha: 419e0dc8046cb947daa77eb95ae174acfbddb7673b4151f56d1eed8e93fbfaca
  - kind: registry
    name: loop9
    version: 0.1.5
    sha: 0fae87c125b03c1d2c0150c90365d7d6bcc53fb73a9acaef207d2d065860f062
  - kind: registry
    name: lru
    version: 0.16.4
    sha: 7f66e8d5d03f609abc3a39e6f08e4164ebf1447a732906d39eb9b99b7919ef39
  - kind: registry
    name: lru
    version: 0.18.4
    sha: ff9840bcc50b71349309900da0ce7279aa336ae71d73250b07998932c7d97c25
  - kind: registry
    name: lru-slab
    version: 0.1.3
    sha: 4050469837a6ff301cd14c1f8f24f88549e6d548f24f64e2148eb0f72cebc51f
  - kind: registry
    name: lzma-rust2
    version: 0.16.5
    sha: ca93e534d1142d1d0dcca6d25fe302508a5dfb40b302802904577725ea0b695b
  - kind: registry
    name: m3u8-rs
    version: 6.0.1
    sha: c94fe25bd0d08c68fd0fac4f9537f747246579cd270658fa9fee3d10af382716
  - kind: registry
    name: macerator
    version: 0.3.4
    sha: 2ddeaadb76e307b1d2b4836adee77910d405b9f6c1ca031bc81a7a398e2b22f2
  - kind: registry
    name: macerator-macros
    version: 0.2.0
    sha: d2a397d020af346358830d6f28579f26283003ce87af3dd79173ac9ee2d3ac28
  - kind: registry
    name: matchers
    version: 0.2.0
    sha: d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9
  - kind: registry
    name: matrixmultiply
    version: 0.3.11
    sha: 3f607c237553f086e7043417a51df26b2eb899d3caff94e6a67592ff992fedc7
  - kind: registry
    name: maybe-rayon
    version: 0.1.1
    sha: 8ea1f30cedd69f0a2954655f7188c6a834246d2bcf1e315e2ac40c4b24dc9519
  - kind: registry
    name: md-5
    version: 0.11.0
    sha: 69b6441f590336821bb897fb28fc622898ccceb1d6cea3fde5ea86b090c4de98
  - kind: registry
    name: md5
    version: 0.8.1
    sha: 7ebb8d8732c6a6df3d8f032a82911cfc747e00efb95cc46e8d0acd5b5b88570c
  - kind: registry
    name: memchr
    version: 2.8.3
    sha: cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98
  - kind: registry
    name: memmap2
    version: 0.9.11
    sha: d1219ed1b7f229ee7104d281dd01d6802fe28bb6e95d292942c4daacdeb798c0
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: mime
    version: 0.3.17
    sha: 6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a
  - kind: registry
    name: mime_guess
    version: 2.0.5
    sha: f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e
  - kind: registry
    name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - kind: registry
    name: miniz_oxide
    version: 0.8.9
    sha: 1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316
  - kind: registry
    name: miniz_oxide
    version: 0.9.1
    sha: b63fbc4a50860e98e7b2aa7804ded1db5cbc3aff9193adaff57a6931bf7c4b4c
  - kind: registry
    name: mio
    version: 1.2.3
    sha: 4b18443e9c262bfe8fa82f51666e2642c53393f7e5c27b3e1aeab922cff5b9d8
  - kind: registry
    name: moddef
    version: 0.3.0
    sha: 4a0b3262dc837d2513fe2ef31ff8461352ef932dcca31ba0c0abe33547cf6b9b
  - kind: registry
    name: more-asserts
    version: 0.3.1
    sha: 1fafa6961cabd9c63bcd77a45d7e3b7f3b552b70417831fb0f56db717e72407e
  - kind: registry
    name: moxcms
    version: 0.8.1
    sha: bb85c154ba489f01b25c0d36ae69a87e4a1c73a72631fc6c0eb6dde34a73e44b
  - kind: registry
    name: mp4-atom
    version: 0.15.0
    sha: f3d7433df407a636db7047600422af07145adf6ee25e0622745b0131516dbc3c
  - kind: registry
    name: muldiv
    version: 1.0.1
    sha: 956787520e75e9bd233246045d19f42fb73242759cc57fba9611d940ae96d4b0
  - kind: registry
    name: multimap
    version: 0.10.1
    sha: 1d87ecb2933e8aeadb3e3a02b828fed80a7528047e68b4f424523a0981a3a084
  - kind: registry
    name: multiversion
    version: 0.9.0
    sha: b4ca4bea16ffc3f443cf7d866912118196bfef4c6a1556ca00f9f9b00bb43f7c
  - kind: registry
    name: multiversion-macros
    version: 0.9.0
    sha: 0d416831a7317ef4b08bee00b69cbbb9c8763da7959a7026244d6266869f9c83
  - kind: registry
    name: multiversion_no_op
    version: 1.0.0
    sha: 743fb55ba31b18fb1ecef6bdc9aa2743314978ac084044301a7eee33fb99a20d
  - kind: registry
    name: mykey
    version: 1.0.0
    sha: 238a3040fa73be8aabde857ed01f83f55c722c37b386d668261f1d2da31aa13f
  - kind: registry
    name: naga
    version: 29.0.4
    sha: b2bf919621e7975acb27d881bae2fb993e0d45c8e0446e85e6272971e00dc8df
  - kind: registry
    name: nasm-rs
    version: 0.3.2
    sha: 706bf8a5e8c8ddb99128c3291d31bd21f4bcde17f0f4c20ec678d85c74faa149
  - kind: registry
    name: nb
    version: 0.1.3
    sha: 801d31da0513b6ec5214e9bf433a77966320625a37860f910be265be6e18d06f
  - kind: registry
    name: nb
    version: 1.1.0
    sha: 8d5439c4ad607c3c23abf66de8c8bf57ba8adcd1f129e699851a6e43935d339d
  - kind: registry
    name: ndarray
    version: 0.17.2
    sha: 520080814a7a6b4a6e9070823bb24b4531daac8c4627e08ba5de8c5ef2f2752d
  - kind: registry
    name: ndk-sys
    version: 0.6.0+11769913
    sha: ee6cda3051665f1fb8d9e08fc35c96d5a244fb1be711a03b71118828afc9a873
  - kind: registry
    name: new_debug_unreachable
    version: 1.0.6
    sha: 650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086
  - kind: registry
    name: nix
    version: 0.31.3
    sha: cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d
  - kind: registry
    name: nnnoiseless
    version: 0.5.2
    sha: 805d5964d1e7a0006a7fdced7dae75084d66d18b35f1dfe81bd76929b1f8da0c
  - kind: registry
    name: no_std_io2
    version: 0.9.4
    sha: 418abd1b6d34fbf6cae440dc874771b0525a604428704c76e48b29a5e67b8003
  - kind: registry
    name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - kind: registry
    name: nom
    version: 8.0.0
    sha: df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405
  - kind: registry
    name: nonzero_ext
    version: 0.3.0
    sha: 38bf9645c8b145698bb0b18a4637dcacbc421ea49bef2317e4fd8065a387cf21
  - kind: registry
    name: noop_proc_macro
    version: 0.3.0
    sha: 0676bb32a98c1a483ce53e500a81ad9c3d5b3f7c920c28c24e9cb0980d0b5bc8
  - kind: registry
    name: ntapi
    version: 0.4.3
    sha: c3b335231dfd352ffb0f8017f3b6027a4917f7df785ea2143d8af2adc66980ae
  - kind: registry
    name: nu-ansi-term
    version: 0.50.3
    sha: 7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5
  - kind: registry
    name: num
    version: 0.4.3
    sha: 35bd024e8b2ff75562e5f34e7f4905839deb4b22955ef5e73d2fea1b9813cb23
  - kind: registry
    name: num-bigint
    version: 0.4.8
    sha: c89e69e7e0f03bea5ef08013795c25018e101932225a656383bd384495ecc367
  - kind: registry
    name: num-bigint-dig
    version: 0.8.6
    sha: e661dda6640fad38e827a6d4a310ff4763082116fe217f279885c97f511bb0b7
  - kind: registry
    name: num-complex
    version: 0.4.6
    sha: 73f88a1307638156682bada9d7604135552957b7818057dcef22705b4d509495
  - kind: registry
    name: num-conv
    version: 0.2.2
    sha: 521739c6d2bac4aa25192232afe6841231376b2b26d4d9fae5ecf8ca5772e441
  - kind: registry
    name: num-derive
    version: 0.4.2
    sha: ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202
  - kind: registry
    name: num-integer
    version: 0.1.47
    sha: 7ce2d95d4b3734dc35aa2f45e1aa22cd416814592a4f9d9205e11affd5b8e10b
  - kind: registry
    name: num-iter
    version: 0.1.46
    sha: c92800bd69a1eac91786bcfe9da64a897eb72911b8dc3095decbd07429e8048b
  - kind: registry
    name: num-rational
    version: 0.4.2
    sha: f83d14da390562dca69fc84082e73e548e1ad308d24accdedd2720017cb37824
  - kind: registry
    name: num-traits
    version: 0.2.19
    sha: 071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841
  - kind: registry
    name: num_cpus
    version: 1.17.0
    sha: 91df4bbde75afed763b708b7eee1e8e7651e02d97f6d5dd763e89367e957b23b
  - kind: registry
    name: num_threads
    version: 0.1.7
    sha: 5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9
  - kind: registry
    name: oauth2
    version: 5.0.0
    sha: 51e219e79014df21a225b1860a479e2dcd7cbd9130f4defd4bd0e191ea31d67d
  - kind: registry
    name: objc2
    version: 0.6.4
    sha: 3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d5851dd3d98950e8c5a89f
  - kind: registry
    name: objc2-cloud-kit
    version: 0.3.2
    sha: 73ad74d880bb43877038da939b7427bba67e9dd42004a18b809ba7d87cee241c
  - kind: registry
    name: objc2-core-data
    version: 0.3.2
    sha: 0b402a653efbb5e82ce4df10683b6b28027616a2715e90009947d50b8dd298fa
  - kind: registry
    name: objc2-core-foundation
    version: 0.3.2
    sha: 2a180dd8642fa45cdb7dd721cd4c11b1cadd4929ce112ebd8b9f5803cc79d536
  - kind: registry
    name: objc2-core-graphics
    version: 0.3.2
    sha: e022c9d066895efa1345f8e33e584b9f958da2fd4cd116792e15e07e4720a807
  - kind: registry
    name: objc2-core-image
    version: 0.3.2
    sha: e5d563b38d2b97209f8e861173de434bd0214cf020e3423a52624cd1d989f006
  - kind: registry
    name: objc2-core-location
    version: 0.3.2
    sha: ca347214e24bc973fc025fd0d36ebb179ff30536ed1f80252706db19ee452009
  - kind: registry
    name: objc2-core-text
    version: 0.3.2
    sha: 0cde0dfb48d25d2b4862161a4d5fcc0e3c24367869ad306b0c9ec0073bfed92d
  - kind: registry
    name: objc2-encode
    version: 4.1.0
    sha: ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33
  - kind: registry
    name: objc2-foundation
    version: 0.3.2
    sha: e3e0adef53c21f888deb4fa59fc59f7eb17404926ee8a6f59f5df0fd7f9f3272
  - kind: registry
    name: objc2-io-kit
    version: 0.3.2
    sha: 33fafba39597d6dc1fb709123dfa8289d39406734be322956a69f0931c73bb15
  - kind: registry
    name: objc2-io-surface
    version: 0.3.2
    sha: 180788110936d59bab6bd83b6060ffdfffb3b922ba1396b312ae795e1de9d81d
  - kind: registry
    name: objc2-metal
    version: 0.3.2
    sha: a0125f776a10d00af4152d74616409f0d4a2053a6f57fa5b7d6aa2854ac04794
  - kind: registry
    name: objc2-quartz-core
    version: 0.3.2
    sha: 96c1358452b371bf9f104e21ec536d37a650eb10f7ee379fff67d2e08d537f1f
  - kind: registry
    name: objc2-ui-kit
    version: 0.3.2
    sha: d87d638e33c06f577498cbcc50491496a3ed4246998a7fbba7ccb98b1e7eab22
  - kind: registry
    name: objc2-user-notifications
    version: 0.3.2
    sha: 9df9128cbbfef73cda168416ccf7f837b62737d748333bfe9ab71c245d76613e
  - kind: registry
    name: object
    version: 0.37.3
    sha: ff76201f031d8863c38aa7f905eca4f53abbfa15f609db4277d44cd8938f33fe
  - kind: registry
    name: ogg
    version: 0.9.2
    sha: fdab8dcd8d4052eaacaf8fb07a3ccd9a6e26efadb42878a413c68fc4af1dee2b
  - kind: registry
    name: oid-registry
    version: 0.8.1
    sha: 12f40cff3dde1b6087cc5d5f5d4d65712f34016a03ed60e9c08dcc392736b5b7
  - kind: registry
    name: once_cell
    version: 1.21.4
    sha: 9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50
  - kind: registry
    name: once_cell_polyfill
    version: 1.70.2
    sha: 384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe
  - kind: registry
    name: oneshot
    version: 0.2.1
    sha: cfe21416a02c693fb9f980befcb230ecc70b0b3d1cc4abf88b9675c4c1457f0c
  - kind: registry
    name: open
    version: 5.4.4
    sha: aa576c76302b7b808eecc68061e67336c47833ef9d22caa74dda10fa9675eebc
  - kind: registry
    name: openssl-probe
    version: 0.1.6
    sha: d05e27ee213611ffe7d6348b942e8f942b37114c00cc03cec254295a4a17852e
  - kind: registry
    name: openssl-probe
    version: 0.2.1
    sha: 7c87def4c32ab89d880effc9e097653c8da5d6ef28e6b539d313baaacfbafcbe
  - kind: registry
    name: option-ext
    version: 0.2.0
    sha: 04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d
  - kind: registry
    name: option-operations
    version: 0.6.1
    sha: aca39cf52b03268400c16eeb9b56382ea3c3353409309b63f5c8f0b1faf42754
  - kind: registry
    name: ordered-float
    version: 5.5.0
    sha: 8c7c9e0d9b23589f26070720bac724174bfec1083e82f7854cdd0267518343c0
  - kind: registry
    name: os_info
    version: 3.15.0
    sha: 9cf20a545b305cf1da722b236b5155c9bb35f1d5ceb28c048bd96ca842f41b5b
  - kind: registry
    name: outref
    version: 0.5.2
    sha: 1a80800c0488c3a21695ea981a54918fbb37abf04f4d0720c453632255e2ff0e
  - kind: registry
    name: oxideav-core
    version: 0.1.36
    sha: a78b502f679c580ceb7cc834d23f80821673b0a393a3083d54ef82668bb9c028
  - kind: registry
    name: oxideav-pixfmt
    version: 0.1.8
    sha: e7a6735155781b67b9b1fe2ca764b5ad5cc3d452853d6f4b72f7747bc781e8d0
  - kind: registry
    name: oxideav-subtitle
    version: 0.1.2
    sha: 88e41289024a95ea82051cd18af77885afd7be3c23a38255cb1edbe49872273a
  - kind: registry
    name: p256
    version: 0.13.2
    sha: c9863ad85fa8f4460f9c48cb909d38a0d689dba1f6f6988a5e3e0d31071bcd4b
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pango
    version: 0.22.10
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pango-sys
    version: 0.22.10
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pangocairo
    version: 0.22.10
  - kind: git
    commit: 08a30b9cccafc82194cb24df13806a176f20b0ae
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pangocairo-sys
    version: 0.22.10
  - kind: registry
    name: parking
    version: 2.2.1
    sha: f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba
  - kind: registry
    name: parking_lot
    version: 0.12.5
    sha: 93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a
  - kind: registry
    name: parking_lot_core
    version: 0.9.12
    sha: 2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1
  - kind: registry
    name: parse_link_header
    version: 0.4.1
    sha: 4eb9c7a76731a2792f9b97fb34c1e774fff008badcd449d61fcdacb7a912392b
  - kind: registry
    name: paste
    version: 1.0.15
    sha: 57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a
  - kind: registry
    name: pastey
    version: 0.1.1
    sha: 35fb2e5f958ec131621fdd531e9fc186ed768cbe395337403ae56c17a74c68ec
  - kind: registry
    name: pastey
    version: 0.2.3
    sha: 2ee67f1008b1ba2321834326597b8e186293b049a023cdef258527550b9935b4
  - kind: registry
    name: pbjson
    version: 0.6.0
    sha: 1030c719b0ec2a2d25a5df729d6cff1acf3cc230bf766f4f97833591f7577b90
  - kind: registry
    name: pbjson-build
    version: 0.6.2
    sha: 2580e33f2292d34be285c5bc3dba5259542b083cfad6037b6d70345f24dcb735
  - kind: registry
    name: pbjson-types
    version: 0.6.0
    sha: 18f596653ba4ac51bdecbb4ef6773bc7f56042dc13927910de1684ad3d32aa12
  - kind: registry
    name: pbkdf2
    version: 0.12.2
    sha: f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2
  - kind: registry
    name: pbkdf2
    version: 0.13.0
    sha: 112d82ceb8c5bf524d9af484d4e4970c9fd5a0cc15ba14ad93dccd28873b0629
  - kind: registry
    name: pcap-file
    version: 2.0.0
    sha: 1fc1f139757b058f9f37b76c48501799d12c9aa0aa4c0d4c980b062ee925d1b2
  - kind: registry
    name: pem
    version: 4.0.0
    sha: d354a98a3d1251555de99e8fdd8afda05573c31b82f59063a7b0a29b5527f120
  - kind: registry
    name: pem-rfc7468
    version: 0.7.0
    sha: 88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412
  - kind: registry
    name: percent-encoding
    version: 2.3.2
    sha: 9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220
  - kind: registry
    name: petgraph
    version: 0.6.5
    sha: b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db
  - kind: registry
    name: petgraph
    version: 0.8.3
    sha: 8701b58ea97060d5e5b155d383a69952a60943f0e6dfe30b04c287beb0b27455
  - kind: registry
    name: pin-project
    version: 1.1.13
    sha: 2466b2336ed02bcdca6b294417127b90ec92038d1d5c4fbeac971a922e0e0924
  - kind: registry
    name: pin-project-internal
    version: 1.1.13
    sha: c96395f0a926bc13b1c17622aaddda1ecb55d49c8f1bf9777e4d877800a43f8b
  - kind: registry
    name: pin-project-lite
    version: 0.2.17
    sha: a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd
  - kind: registry
    name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - kind: registry
    name: pkcs1
    version: 0.7.5
    sha: c8ffb9f10fa047879315e6625af03c164b16962a5368d724ed16323b68ace47f
  - kind: registry
    name: pkcs8
    version: 0.10.2
    sha: f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7
  - kind: registry
    name: pkg-config
    version: 0.3.34
    sha: f6b464fbc74e149a392436b17d523f769e057cb6877f6a5c4618bc6f11800548
  - kind: registry
    name: png
    version: 0.18.1
    sha: 60769b8b31b2a9f263dae2776c37b1b28ae246943cf719eb6946a1db05128a61
  - kind: registry
    name: pocket-resources
    version: 0.3.2
    sha: c135f38778ad324d9e9ee68690bac2c1a51f340fdf96ca13e2ab3914eb2e51d8
  - kind: registry
    name: polling
    version: 3.11.0
    sha: 5d0e4f59085d47d8241c88ead0f274e8a0cb551f3625263c05eb8dd897c34218
  - kind: registry
    name: portable-atomic
    version: 1.15.0
    sha: 05c8b63e8d9609db387f0324918f81d68fe27748f084ef092fb35954d0539a85
  - kind: registry
    name: portable-atomic-util
    version: 0.2.8
    sha: 10ab3eb7f3becc3a1cbc4f2c6f20267996cfc1a6467a873763411b136a122715
  - kind: registry
    name: potential_utf
    version: 0.1.6
    sha: d83eb9bc6d8e5cf568e7a1101d60ee05e81ed50ea106026f3d18deeb046d7661
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - kind: registry
    name: ppmd-rust
    version: 1.5.0
    sha: 196a7c80b9a7652aba7cc070827516c2abe4ccdf53d128e1944003cf5726cff1
  - kind: registry
    name: ppv-lite86
    version: 0.2.21
    sha: 85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9
  - kind: registry
    name: presser
    version: 0.3.1
    sha: e8cf8e6a8aa66ce33f63993ffc4ea4271eb5b0530a9002db8455ea6050c77bfa
  - kind: registry
    name: pretty_assertions
    version: 1.4.1
    sha: 3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d
  - kind: registry
    name: prettyplease
    version: 0.2.37
    sha: 479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b
  - kind: registry
    name: prettyplease
    version: 0.3.0
    sha: 2bfe0f4c752e450fc2faf62654f1c134747922825d5b04ca717b8874f41a40c0
  - kind: registry
    name: primal-check
    version: 0.3.4
    sha: dc0d895b311e3af9902528fbb8f928688abbd95872819320517cc24ca6b2bd08
  - kind: registry
    name: primeorder
    version: 0.13.6
    sha: 353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6
  - kind: registry
    name: priority-queue
    version: 2.7.0
    sha: 93980406f12d9f8140ed5abe7155acb10bb1e69ea55c88960b9c2f117445ef96
  - kind: registry
    name: proc-macro-crate
    version: 3.5.0
    sha: e67ba7e9b2b56446f1d419b1d807906278ffa1a658a8a5d8a39dcb1f5a78614f
  - kind: registry
    name: proc-macro2
    version: 1.0.107
    sha: 985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9
  - kind: registry
    name: profiling
    version: 1.0.18
    sha: 3d595e54a326bc53c1c197b32d295e14b169e3cfeaa8dc82b529f947fba6bcf5
  - kind: registry
    name: profiling-procmacros
    version: 1.0.18
    sha: 4488a4a36b9a4ba6b9334a32a39971f77c1436ec82c38707bce707699cc3bbcb
  - kind: registry
    name: prost
    version: 0.12.6
    sha: deb1435c188b76130da55f17a466d252ff7b1418b2ad3e037d127b94e3411f29
  - kind: registry
    name: prost-build
    version: 0.12.6
    sha: 22505a5c94da8e3b7c2996394d1c933236c4d743e81a410bcca4e6989fc066a4
  - kind: registry
    name: prost-derive
    version: 0.12.6
    sha: 81bddcdb20abf9501610992b6759a4c888aef7d1a7247ef75e2404275ac24af1
  - kind: registry
    name: prost-types
    version: 0.12.6
    sha: 9091c90b0a32608e984ff2fa4091273cbdd755d54935c51d520887f4a1dbd5b0
  - kind: registry
    name: protobuf
    version: 3.7.2
    sha: d65a1d4ddae7d8b5de68153b48f6aa3bba8cb002b243dbdbc55a5afbc98f99f4
  - kind: registry
    name: protobuf-codegen
    version: 3.7.2
    sha: 5d3976825c0014bbd2f3b34f0001876604fe87e0c86cd8fa54251530f1544ace
  - kind: registry
    name: protobuf-json-mapping
    version: 3.7.2
    sha: e0d6e4be637b310d8a5c02fa195243328e2d97fa7df1127a27281ef1187fcb1d
  - kind: registry
    name: protobuf-parse
    version: 3.7.2
    sha: b4aeaa1f2460f1d348eeaeed86aea999ce98c1bded6f089ff8514c9d9dbdc973
  - kind: registry
    name: protobuf-support
    version: 3.7.2
    sha: 3e36c2f31e0a47f9280fb347ef5e461ffcd2c52dd520d8e216b52f93b0b0d7d6
  - kind: registry
    name: psl-types
    version: 2.0.11
    sha: 33cb294fe86a74cbcf50d4445b37da762029549ebeea341421c7c70370f86cac
  - kind: registry
    name: publicsuffix
    version: 2.3.0
    sha: 6f42ea446cab60335f76979ec15e12619a2165b5ae2c12166bef27d283a9fadf
  - kind: registry
    name: pulp
    version: 0.22.3
    sha: 046aa45b989642ec2e4717c8e72d677b13edd831a4d3b6cf37d9a3e54912496a
  - kind: registry
    name: pulp-wasm-simd-flag
    version: 0.1.1
    sha: 1d8f70e07b9c3962945a74e59ca1c511bba65b6419468acc217c457d93f3c740
  - kind: registry
    name: pxfm
    version: 0.1.30
    sha: d55d956fa96f5ec02be2e13af0e20391a5aa83d6a074e3ad368959d0fab299ea
  - kind: registry
    name: pyo3
    version: 0.29.2
    sha: 4688ddedf473e32662b9b067670129a8afb8c18e351482c70d62ba4a88171e8b
  - kind: registry
    name: pyo3-build-config
    version: 0.29.2
    sha: f41027e41b4bd03f6e60f9f417fe24a6341a6bb744edd62b6f709f2a52ea30e9
  - kind: registry
    name: pyo3-ffi
    version: 0.29.2
    sha: e591a95526fead067432c3b3a33fc74770b87b1e04e73671090d9c2055a2b327
  - kind: registry
    name: pyo3-macros
    version: 0.29.2
    sha: 73225868fc1cd84eef2c3c230ddb91273bf1de46aeb8a4248da76d32a0924a1c
  - kind: registry
    name: pyo3-macros-backend
    version: 0.29.2
    sha: 571575aa3749fa6216757dd47d2a3e7ef360f329a40f0666a9fbd14889024952
  - kind: registry
    name: qoi
    version: 0.4.1
    sha: 7f6d64c71eb498fe9eae14ce4ec935c555749aef511cca85b5568910d6e48001
  - kind: registry
    name: quick-error
    version: 2.0.1
    sha: a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3
  - kind: registry
    name: quick-xml
    version: 0.38.4
    sha: b66c2058c55a409d601666cffe35f04333cf1013010882cec174a7467cd4e21c
  - kind: registry
    name: quick-xml
    version: 0.42.0
    sha: 41b1177fdf999d2321d3fb46ff47159d9c1fb9ad66a4879f8c50a0b504615e9b
  - kind: registry
    name: quinn
    version: 0.11.12
    sha: 4051e23e9185c255a7e33ef59cdbca87a22d359052eecd22fc6b901fb37d9d11
  - kind: registry
    name: quinn-proto
    version: 0.11.18
    sha: a9746dbde176634f4f2f1faf2404e30a31b2bc1e9cafb5329c95d8177a18c9fc
  - kind: registry
    name: quinn-udp
    version: 0.5.15
    sha: 35a133f956daabe89a61a685c2649f13d82d5aa4bd5d12d1277e1072a21c0694
  - kind: registry
    name: quote
    version: 1.0.47
    sha: 1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001
  - kind: registry
    name: r-efi
    version: 5.3.0
    sha: 69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f
  - kind: registry
    name: r-efi
    version: 6.0.0
    sha: f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf
  - kind: registry
    name: rand
    version: 0.10.3
    sha: 65c9fb96cbc91e3478eaae79a69fcd3f1ae4ad052e471fe6732fff548984b4af
  - kind: registry
    name: rand
    version: 0.8.8
    sha: e058c7de0b26af77780c769414d6257830bb240f3c38477dbc2c16e5f54d6d4c
  - kind: registry
    name: rand
    version: 0.9.5
    sha: b9ef1d0d795eb7d84685bca4f72f3649f064e6641543d3a8c415898726a57b41
  - kind: registry
    name: rand_chacha
    version: 0.3.1
    sha: e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88
  - kind: registry
    name: rand_chacha
    version: 0.9.0
    sha: d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb
  - kind: registry
    name: rand_core
    version: 0.10.1
    sha: 63b8176103e19a2643978565ca18b50549f6101881c443590420e4dc998a3c69
  - kind: registry
    name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - kind: registry
    name: rand_core
    version: 0.9.5
    sha: 76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c
  - kind: registry
    name: rand_distr
    version: 0.5.1
    sha: 6a8615d50dcf34fa31f7ab52692afec947c4dd0ab803cc87cb3b0b4570ff7463
  - kind: registry
    name: rand_distr
    version: 0.6.0
    sha: 4d431c2703ccf129de4d45253c03f49ebb22b97d6ad79ee3ecfc7e3f4862c1d8
  - kind: registry
    name: rand_pcg
    version: 0.10.2
    sha: caa0f4137e1c0a72f4c651489402276c8e8e1cf081f3b0ba156d2cbeef09e86a
  - kind: registry
    name: range-alloc
    version: 0.1.5
    sha: ca45419789ae5a7899559e9512e58ca889e41f04f1f2445e9f4b290ceccd1d08
  - kind: registry
    name: raptorq
    version: 2.0.0
    sha: 90b1b1fad69672f0b901b5004863ea4307f03d168a3db5f2bcba4d3dfed88e97
  - kind: registry
    name: rav1e
    version: 0.8.1
    sha: 43b6dd56e85d9483277cde964fd1bdb0428de4fec5ebba7540995639a21cb32b
  - kind: registry
    name: ravif
    version: 0.13.0
    sha: e52310197d971b0f5be7fe6b57530dcd27beb35c1b013f29d66c1ad73fbbcc45
  - kind: registry
    name: raw-cpuid
    version: 11.6.0
    sha: 498cd0dc59d73224351ee52a95fee0f1a617a2eae0e7d9d720cc622c73a54186
  - kind: registry
    name: raw-window-handle
    version: 0.6.2
    sha: 20675572f6f24e9e76ef639bc5552774ed45f1c30e2951e1e99c59888861c539
  - kind: registry
    name: raw-window-metal
    version: 1.1.0
    sha: 40d213455a5f1dc59214213c7330e074ddf8114c9a42411eb890c767357ce135
  - kind: registry
    name: rawpointer
    version: 0.2.1
    sha: 60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3
  - kind: registry
    name: rayon
    version: 1.12.0
    sha: fb39b166781f92d482534ef4b4b1b2568f42613b53e5b6c160e24cfbfa30926d
  - kind: registry
    name: rayon-core
    version: 1.13.0
    sha: 22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91
  - kind: registry
    name: rcgen
    version: 0.14.10
    sha: 8774e05a7d0de114588e6a28fe7e71694b82614ed569d86d8b389dfbc98b8ad8
  - kind: registry
    name: realfft
    version: 3.5.0
    sha: f821338fddb99d089116342c46e9f1fbf3828dba077674613e734e01d6ea8677
  - kind: registry
    name: reborrow
    version: 0.5.5
    sha: 03251193000f4bd3b042892be858ee50e8b3719f2b08e5833ac4353724632430
  - kind: registry
    name: redox_syscall
    version: 0.5.18
    sha: ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d
  - kind: registry
    name: redox_users
    version: 0.5.3
    sha: 60dc65c0ff1a7ae1294b0c67b9f14baf70b644404010370171787bfac1038fc0
  - kind: registry
    name: ref-cast
    version: 1.0.27
    sha: 7e440fb4e4b4147295338efb76001ab9e4efc0e5839df2c47fc5ac2381d365c3
  - kind: registry
    name: ref-cast-impl
    version: 1.0.27
    sha: 92ecd8964f8453721699a1ed72037b0db49ce2f5a5138486ee89bed6f67cdf3a
  - kind: registry
    name: regex
    version: 1.13.1
    sha: f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d
  - kind: registry
    name: regex-automata
    version: 0.4.18
    sha: ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2
  - kind: registry
    name: regex-lite
    version: 0.1.9
    sha: cab834c73d247e67f4fae452806d17d3c7501756d98c8808d7c9c7aa7d18f973
  - kind: registry
    name: regex-syntax
    version: 0.8.11
    sha: d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4
  - kind: registry
    name: renderdoc-sys
    version: 1.1.0
    sha: 19b30a45b0cd0bcca8037f3d0dc3421eaf95327a17cad11964fb8179b4fc4832
  - kind: registry
    name: reqwest
    version: 0.12.28
    sha: eddd3ca559203180a307f12d114c268abf583f59b03cb906fd0b3ff8646c1147
  - kind: registry
    name: reqwest
    version: 0.13.5
    sha: 16a1cfa75cc186dd73d5818e510e042e40927bccc9c236b061cea97e1eb08029
  - kind: registry
    name: rfc6979
    version: 0.4.0
    sha: f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2
  - kind: registry
    name: rgb
    version: 0.8.53
    sha: 47b34b781b31e5d73e9fbc8689c70551fd1ade9a19e3e28cfec8580a79290cc4
  - kind: registry
    name: ring
    version: 0.17.14
    sha: a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7
  - kind: registry
    name: rmp
    version: 0.8.15
    sha: 4ba8be72d372b2c9b35542551678538b562e7cf86c3315773cae48dfbfe7790c
  - kind: registry
    name: rmp-serde
    version: 1.3.1
    sha: 72f81bee8c8ef9b577d1681a70ebbc962c232461e397b22c208c43c04b67a155
  - kind: registry
    name: rqrr
    version: 0.11.0
    sha: 8d084c50c5cfa397a081850da329566c8667b0b6c4e81da16abff1fef27de93b
  - kind: registry
    name: rsa
    version: 0.9.10
    sha: b8573f03f5883dcaebdfcf4725caa1ecb9c15b2ef50c43a07b816e06799bb12d
  - kind: registry
    name: rtcp-types
    version: 0.3.0
    sha: c081c846edea632bb47332fada9d4ac2fdf54d84beaf547fc947b58489e5f619
  - kind: registry
    name: rtp-types
    version: 0.1.2
    sha: 7bb90df8268abfe08452ef2dae9e867a54edfdaa71b3127ef47d8b031f77ac73
  - kind: registry
    name: rtsp-types
    version: 0.1.3
    sha: f47bf238c3da7994ef66a71724f385cb1ee25dcf04a156402d2727ad84dc1433
  - kind: registry
    name: rubato
    version: 0.14.1
    sha: e6dd52e80cfc21894deadf554a5673002938ae4625f7a283e536f9cf7c17b0d5
  - kind: registry
    name: rustc-demangle
    version: 0.1.28
    sha: b74b56ffa8bb2830709a538c2cbcae9aa062db0d2a42563bfb09bdaae44020eb
  - kind: registry
    name: rustc-hash
    version: 1.1.0
    sha: 08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2
  - kind: registry
    name: rustc-hash
    version: 2.1.3
    sha: 6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d
  - kind: registry
    name: rustc_version
    version: 0.4.1
    sha: cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92
  - kind: registry
    name: rustdct
    version: 0.7.1
    sha: 8b61555105d6a9bf98797c063c362a1d24ed8ab0431655e38f1cf51e52089551
  - kind: registry
    name: rustfft
    version: 6.4.1
    sha: 21db5f9893e91f41798c88680037dba611ca6674703c1a18601b01a72c8adb89
  - kind: registry
    name: rusticata-macros
    version: 4.1.0
    sha: faf0c4a6ece9950b9abdb62b1cfcf2a68b3b67a10ba445b3bb85be2a293d0632
  - kind: registry
    name: rustix
    version: 0.38.44
    sha: fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154
  - kind: registry
    name: rustix
    version: 1.1.5
    sha: 891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d
  - kind: registry
    name: rustls
    version: 0.21.12
    sha: 3f56a14d1f48b391359b22f731fd4bd7e43c97f3c50eee276f3aa09c94784d3e
  - kind: registry
    name: rustls
    version: 0.22.4
    sha: bf4ef73721ac7bcd79b2b315da7779d8fc09718c6b3d2d1b2d94850eb8c18432
  - kind: registry
    name: rustls
    version: 0.23.45
    sha: 0d41d731c7d2f962d1ccc364cec258de3c0e93b38c2fb3ba97ac74513048d634
  - kind: registry
    name: rustls-native-certs
    version: 0.7.3
    sha: e5bfb394eeed242e909609f56089eecfe5fda225042e8b171791b9c95f5931e5
  - kind: registry
    name: rustls-native-certs
    version: 0.8.4
    sha: dab5152771c58876a2146916e53e35057e1a4dfa2b9df0f0305b07f611fdea4d
  - kind: registry
    name: rustls-pemfile
    version: 2.2.0
    sha: dce314e5fee3f39953d46bb63bb8a46d40c2f8fb7cc5a3b6cab2bde9721d6e50
  - kind: registry
    name: rustls-pki-types
    version: 1.15.1
    sha: 2f4925028c7eb5d1fcdaf196971378ed9d2c1c4efc7dc5d011256f76c99c0a96
  - kind: registry
    name: rustls-platform-verifier
    version: 0.7.0
    sha: 26d1e2536ce4f35f4846aa13bff16bd0ff40157cdb14cc056c7b14ba41233ba0
  - kind: registry
    name: rustls-platform-verifier-android
    version: 0.1.1
    sha: f87165f0995f63a9fbeea62b64d10b4d9d8e78ec6d7d51fb2125fda7bb36788f
  - kind: registry
    name: rustls-webpki
    version: 0.101.7
    sha: 8b6275d1ee7a1cd780b64aca7726599a1dbc893b1e64144529e55c3c2f745765
  - kind: registry
    name: rustls-webpki
    version: 0.102.8
    sha: 64ca1bc8749bd4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9
  - kind: registry
    name: rustls-webpki
    version: 0.103.15
    sha: f3c3cf1d8b1e7d4927e2d154c3fcb02979afb9939629c62cd9048d4f07b60ac2
  - kind: registry
    name: rustversion
    version: 1.0.23
    sha: cf54715a573b99ac80df0bc206da022bcd442c974952c7b9720069370852e21f
  - kind: registry
    name: ryu
    version: 1.0.23
    sha: 9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f
  - kind: registry
    name: safetensors
    version: 0.7.0
    sha: 675656c1eabb620b921efea4f9199f97fc86e36dd6ffd1fbbe48d0f59a4987f5
  - kind: registry
    name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - kind: registry
    name: sanitize-filename
    version: 0.6.0
    sha: bc984f4f9ceb736a7bb755c3e3bd17dc56370af2600c9780dcc48c66453da34d
  - kind: registry
    name: schannel
    version: 0.1.29
    sha: 91c1b7e4904c873ef0710c1f407dde2e6287de2bebc1bbbf7d430bb7cbffd939
  - kind: registry
    name: schemars
    version: 0.9.0
    sha: 4cd191f9397d57d581cddd31014772520aa448f65ef991055d7f61582c65165f
  - kind: registry
    name: schemars
    version: 1.2.2
    sha: 687274d293b6cdc6e73e0fee520bf2049650090d7164f87672d212a3c530cf4a
  - kind: registry
    name: scoped-tls
    version: 1.0.1
    sha: e1cf6437eb19a8f4a6cc0f7dca544973b0b78843adbfeb3683d1a94a0024a294
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - kind: registry
    name: sct
    version: 0.7.1
    sha: da046153aa2352493d6cb7da4b6e5c0c057d8a1d0a9aa8560baffdd945acd414
  - kind: registry
    name: sdp-types
    version: 0.1.8
    sha: 9bb6c636ace20de73fb9536017f9ef069b258308a6c341a4aaf3d2fd11afc570
  - kind: registry
    name: sec1
    version: 0.7.3
    sha: d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc
  - kind: registry
    name: security-framework
    version: 2.11.1
    sha: 897b2245f0b511c87893af39b033e5ca9cce68824c4d7e7630b5a1d339658d02
  - kind: registry
    name: security-framework
    version: 3.7.0
    sha: b7f4bc775c73d9a02cde8bf7b2ec4c9d12743edf609006c7facc23998404cd1d
  - kind: registry
    name: security-framework-sys
    version: 2.17.0
    sha: 6ce2691df843ecc5d231c0b14ece2acc3efb62c0a398c7e1d875f3983ce020e3
  - kind: registry
    name: semver
    version: 1.0.28
    sha: 8a7852d02fc848982e0c167ef163aaff9cd91dc640ba85e263cb1ce46fae51cd
  - kind: registry
    name: serde
    version: 1.0.229
    sha: 4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba
  - kind: registry
    name: serde_bytes
    version: 0.11.19
    sha: a5d440709e79d88e51ac01c4b72fc6cb7314017bb7da9eeff678aa94c10e3ea8
  - kind: registry
    name: serde_core
    version: 1.0.229
    sha: 67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48
  - kind: registry
    name: serde_derive
    version: 1.0.229
    sha: e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348
  - kind: registry
    name: serde_json
    version: 1.0.151
    sha: c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14
  - kind: registry
    name: serde_path_to_error
    version: 0.1.20
    sha: 10a9ff822e371bb5403e391ecd83e182e0e77ba7f6fe0160b795797109d1b457
  - kind: registry
    name: serde_spanned
    version: 1.1.1
    sha: 6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26
  - kind: registry
    name: serde_urlencoded
    version: 0.7.1
    sha: d3491c14715ca2294c4d6a88f15e84739788c1d030eed8c110436aafdaa2f3fd
  - kind: registry
    name: serde_with
    version: 3.23.0
    sha: 935177bb8c0cd8ca1a4e6d1a2ac8988bea69cab4f9d3a31311e012ad27868ea4
  - kind: registry
    name: serde_with_macros
    version: 3.23.0
    sha: 1d607aa01a3cb0ad757d6fd216136910db3c97b102fe686585689615a02dbcdc
  - kind: registry
    name: serial_test
    version: 3.5.0
    sha: 699f4197115b8a7e7ff19c9a315a4bd6fffec26cc4626ef45ecaea389e081c6d
  - kind: registry
    name: serial_test_derive
    version: 3.5.0
    sha: 94e153fc76e1c6a068703d6d29c508a0b15c061c4b7e43da59cc097bc342673c
  - kind: registry
    name: sfv
    version: 0.15.0
    sha: 890ef0e5532daf21fdaa3dbaf991417187f3a87ab69231fe69be942495746480
  - kind: registry
    name: sha1
    version: 0.10.7
    sha: a978451301f4db1d02937a4ab3ccce137717b81826e79b7d49ffe3244a13c3b8
  - kind: registry
    name: sha1
    version: 0.11.0
    sha: aacc4cc499359472b4abe1bf11d0b12e688af9a805fa5e3016f9a386dc2d0214
  - kind: registry
    name: sha2
    version: 0.10.9
    sha: a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283
  - kind: registry
    name: sha2
    version: 0.11.0
    sha: 446ba717509524cb3f22f17ecc096f10f4822d76ab5c0b9822c5f9c284e825f4
  - kind: registry
    name: sha256
    version: 1.6.0
    sha: f880fc8562bdeb709793f00eb42a2ad0e672c4f883bbe59122b926eca935c8f6
  - kind: registry
    name: shannon
    version: 0.2.0
    sha: 7ea5b41c9427b56caa7b808cb548a04fb50bb5b9e98590b53f28064ff4174561
  - kind: registry
    name: sharded-slab
    version: 0.1.7
    sha: f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6
  - kind: registry
    name: shell-words
    version: 1.1.1
    sha: dc6fe69c597f9c37bfeeeeeb33da3530379845f10be461a66d16d03eca2ded77
  - kind: registry
    name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - kind: registry
    name: shlex
    version: 2.0.1
    sha: f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba
  - kind: registry
    name: signal-hook
    version: 0.4.4
    sha: b2a0c28ca5908dbdbcd52e6fdaa00358ab88637f8ab33e1f188dd510eb44b53d
  - kind: registry
    name: signal-hook-registry
    version: 1.4.8
    sha: c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b
  - kind: registry
    name: signalsmith-stretch
    version: 0.1.3
    sha: 51dae6f10b5532510f65c309c4d868babe3aecf6ce0782678081338311f176fd
  - kind: registry
    name: signature
    version: 1.6.4
    sha: 74233d3b3b2f6d4b006dc19dee745e73e2a6bfb6f93607cd3b02bd5b00797d7c
  - kind: registry
    name: signature
    version: 2.2.0
    sha: 77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de
  - kind: registry
    name: simd-adler32
    version: 0.3.10
    sha: 3a219298ac11a56ea9a6d2120044824d6f01aeb034955e7af7bc16858527deea
  - kind: registry
    name: simd_cesu8
    version: 1.2.0
    sha: 11031e251abf8611c80f460e19dbdeb54a66db918e49c65a7065b46ac7aec520
  - kind: registry
    name: simd_helpers
    version: 0.1.0
    sha: 95890f873bec569a0362c235787f3aca6e1e887302ba4840839bcc6459c42da6
  - kind: registry
    name: simdutf8
    version: 0.1.5
    sha: e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e
  - kind: registry
    name: siphasher
    version: 1.0.3
    sha: 8ee5873ec9cce0195efcb7a4e9507a04cd49aec9c83d0389df45b1ef7ba2e649
  - kind: registry
    name: skia-bindings
    version: 0.153.3
    sha: eb325787c91b3f6c34a7c6f2b8a2297b20292d733ca53a08c233e5028aec49af
  - kind: registry
    name: skia-safe
    version: 0.153.3
    sha: c61cb643dac43067f3eb76c866635a74377ac0abca0ff2590674e1e295514c3d
  - kind: registry
    name: slab
    version: 0.4.12
    sha: 0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5
  - kind: registry
    name: slotmap
    version: 1.1.1
    sha: bdd58c3c93c3d278ca835519292445cb4b0d4dc59ccfdf7ceadaab3f8aeb4038
  - kind: registry
    name: slug
    version: 0.1.6
    sha: 882a80f72ee45de3cc9a5afeb2da0331d58df69e4e7d8eeb5d3c7784ae67e724
  - kind: registry
    name: smallvec
    version: 1.16.1
    sha: ba467056f1b547ed52077911161fc86985becbc60e8e1857c8a144dab0def891
  - kind: registry
    name: smawk
    version: 0.3.3
    sha: e8e2fb0f499abb4d162f2bedad68f5ef91a1682b5a03596ddb67efd37768d100
  - kind: registry
    name: socket2
    version: 0.5.10
    sha: e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678
  - kind: registry
    name: socket2
    version: 0.6.5
    sha: c3d1e2c7f27f8d4cb10542a02c49005dbd6e93095799d6f3be745fae9f8fedd4
  - kind: registry
    name: sodiumoxide
    version: 0.2.7
    sha: e26be3acb6c2d9a7aac28482586a7856436af4cfe7100031d219de2d2ecb0028
  - kind: registry
    name: spin
    version: 0.10.1
    sha: 023a211cb3138dbc438680b32560ad89f699977624c9f8dbb95a47d5b4c07dd3
  - kind: registry
    name: spin
    version: 0.9.9
    sha: 3763264f6b73151db08c50ff20d7d8a0b8796e021cdea7ceedad07b80155fa0e
  - kind: registry
    name: spinning_top
    version: 0.3.0
    sha: d96d2d1d716fb500937168cc09353ffdc7a012be8475ac7308e1bdf0e3923300
  - kind: registry
    name: spirv
    version: 0.4.0+sdk-1.4.341.0
    sha: d9571ea910ebd84c86af4b3ed27f9dbdc6ad06f17c5f96146b2b671e2976744f
  - kind: registry
    name: spki
    version: 0.7.3
    sha: d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d
  - kind: registry
    name: sprintf
    version: 0.4.3
    sha: b0e59842c3aac5c7901ea11bbb02e60e5d67263b43d4361dec9303cca8e764eb
  - kind: registry
    name: stable-vec
    version: 0.4.3
    sha: 047720fbc1c4cc7daa75c925adba9ce3fa8e1f7b039337c281b142d4ecc6d86b
  - kind: registry
    name: stable_deref_trait
    version: 1.2.1
    sha: 6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596
  - kind: registry
    name: static_assertions
    version: 1.1.0
    sha: a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f
  - kind: registry
    name: strength_reduce
    version: 0.2.4
    sha: fe895eb47f22e2ddd4dabc02bce419d2e643c8e3b585c78158b349195bc24d82
  - kind: registry
    name: strip-ansi-escapes
    version: 0.2.1
    sha: 2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025
  - kind: registry
    name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: subtle
    version: 2.6.1
    sha: 13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292
  - kind: registry
    name: symphonia
    version: 0.5.5
    sha: 5773a4c030a19d9bfaa090f49746ff35c75dfddfa700df7a5939d5e076a57039
  - kind: registry
    name: symphonia-bundle-flac
    version: 0.5.5
    sha: c91565e180aea25d9b80a910c546802526ffd0072d0b8974e3ebe59b686c9976
  - kind: registry
    name: symphonia-bundle-mp3
    version: 0.5.5
    sha: 4872dd6bb56bf5eac799e3e957aa1981086c3e613b27e0ac23b176054f7c57ed
  - kind: registry
    name: symphonia-codec-vorbis
    version: 0.5.5
    sha: f025837c309cd69ffef572750b4a2257b59552c5399a5e49707cc5b1b85d1c73
  - kind: registry
    name: symphonia-core
    version: 0.5.5
    sha: ea00cc4f79b7f6bb7ff87eddc065a1066f3a43fe1875979056672c9ef948c2af
  - kind: registry
    name: symphonia-format-ogg
    version: 0.5.5
    sha: 2b4955c67c1ed3aa8ae8428d04ca8397fbef6a19b2b051e73b5da8b1435639cb
  - kind: registry
    name: symphonia-metadata
    version: 0.5.5
    sha: 36306ff42b9ffe6e5afc99d49e121e0bd62fe79b9db7b9681d48e29fa19e6b16
  - kind: registry
    name: symphonia-utils-xiph
    version: 0.5.5
    sha: ee27c85ab799a338446b68eec77abf42e1a6f1bb490656e121c6e27bfbab9f16
  - kind: registry
    name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - kind: registry
    name: syn
    version: 2.0.119
    sha: 872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297
  - kind: registry
    name: syn
    version: 3.0.6
    sha: 8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee
  - kind: registry
    name: sync_wrapper
    version: 1.0.2
    sha: 0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263
  - kind: registry
    name: synstructure
    version: 0.13.2
    sha: 728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2
  - kind: registry
    name: synstructure
    version: 0.14.0
    sha: 901704edd0dfe137f1987838ee4f259e4e063c31371bdb423f7ae38ec6f77f02
  - kind: registry
    name: sysinfo
    version: 0.36.1
    sha: 252800745060e7b9ffb7b2badbd8b31cfa4aa2e61af879d0a3bf2a317c20217d
  - kind: registry
    name: sysinfo
    version: 0.38.4
    sha: 92ab6a2f8bfe508deb3c6406578252e491d299cbbf3bc0529ecc3313aee4a52f
  - kind: registry
    name: system-configuration
    version: 0.7.0
    sha: a13f3d0daba03132c0aa9767f98351b3488edc2c100cda2d2ec2b04f3d8d3c8b
  - kind: registry
    name: system-configuration-sys
    version: 0.6.0
    sha: 8e1d1b10ced5ca923a1fcb8d03e96b8d3268065d724548c0211415ff6ac6bac4
  - kind: registry
    name: system-deps
    version: 7.0.8
    sha: 396a35feb67335377e0251fcbc1092fc85c484bd4e3a7a54319399da127796e7
  - kind: registry
    name: system-deps
    version: 9.0.0
    sha: 8a0dae2cbca1f0ff93795713cfe0a4c02f760e3c0b8ae2ab4ec4045808ff429f
  - kind: registry
    name: tar
    version: 0.4.46
    sha: 3f6221d9a6003c78398e3b239969f352578258df48c8eb051caadae0015bc840
  - kind: registry
    name: target-lexicon
    version: 0.13.5
    sha: adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca
  - kind: registry
    name: tempfile
    version: 3.27.0
    sha: 32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd
  - kind: registry
    name: termcolor
    version: 1.4.1
    sha: 06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755
  - kind: registry
    name: test-log
    version: 0.2.21
    sha: 9b9c218384242b5c89b68303ab6f6fc53a312d923f0c14dc6bb860c6aeee40f1
  - kind: registry
    name: test-log-core
    version: 0.2.21
    sha: c26ef8b00e4d382e59f6a8ddb3cd790b3a5bb29f21a358a9a69ea2f29f13f27b
  - kind: registry
    name: test-log-macros
    version: 0.2.21
    sha: 944ad38adcbb71eaa682c56bceeb079e4ca82b4b3edc2a0fde5cb297b77dac8d
  - kind: registry
    name: test-with
    version: 0.16.3
    sha: 964c2c219d0e7658fc3cd7354826e9e8d997c1e7d592cc32f349fc1125b64a84
  - kind: registry
    name: test-with-derive
    version: 0.16.3
    sha: 52884ff2163f79cd0a7af841fd2e9aca103f2ff1207092d317bf00565abdc59c
  - kind: registry
    name: text_placeholder
    version: 0.5.1
    sha: dd5008f74a09742486ef0047596cf35df2b914e2a8dca5727fcb6ba6842a766b
  - kind: registry
    name: textdistance
    version: 1.1.1
    sha: aa672c55ab69f787dbc9126cc387dbe57fdd595f585e4524cf89018fa44ab819
  - kind: registry
    name: textwrap
    version: 0.16.4
    sha: 6ecfad6c3abc80a577f2b91c1e412ee57e7a060d430b553c1b0c940974ebcd49
  - kind: registry
    name: thiserror
    version: 1.0.69
    sha: b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52
  - kind: registry
    name: thiserror
    version: 2.0.20
    sha: ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f
  - kind: registry
    name: thiserror-impl
    version: 1.0.69
    sha: 4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1
  - kind: registry
    name: thiserror-impl
    version: 2.0.20
    sha: bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af
  - kind: registry
    name: thread_local
    version: 1.1.10
    sha: 1ad99c4c6d32803332c548b1af0540b357b3f5fc0be8f6c6bfe8b2e6ae784070
  - kind: registry
    name: tiff
    version: 0.11.3
    sha: b63feaf3343d35b6ca4d50483f94843803b0f51634937cc2ec519fc32232bc52
  - kind: registry
    name: time
    version: 0.3.55
    sha: cdb87b95ec50ddfa440816d227a17b2ccbdda963a316a727fda0fc4334f7d134
  - kind: registry
    name: time-core
    version: 0.1.9
    sha: 9e1c906769ad99c88eaa54e728060edef082f8e358ff32030cb7c7d315e81109
  - kind: registry
    name: time-macros
    version: 0.2.32
    sha: 7e689342a48d2ea927c87ea50cabf8594854bf940e9310208848d680d668ed85
  - kind: registry
    name: tiny-keccak
    version: 2.0.2
    sha: 2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237
  - kind: registry
    name: tinystr
    version: 0.8.4
    sha: b1e27c91459209c2986af3dcf603a5a74a4368754ce37414f59acc971167f643
  - kind: registry
    name: tinyvec
    version: 1.13.3
    sha: fd3ca314f692efd6c868f8408f53fe444634a845f96c028b97d35f6a1f79f0ee
  - kind: registry
    name: tokio
    version: 1.53.1
    sha: 202caea871b69668250d242070849eb495be178ed697a3e98aebce5bc81a0bed
  - kind: registry
    name: tokio-macros
    version: 2.7.2
    sha: 78773a2a397f451582ce068015985c33193cf6dea8b74d2a639fe457b2f07b0e
  - kind: registry
    name: tokio-rustls
    version: 0.24.1
    sha: c28327cf380ac148141087fbfb9de9d7bd4e84ab5d2c28fbc911d753de8a7081
  - kind: registry
    name: tokio-rustls
    version: 0.25.0
    sha: 775e0c0f0adb3a2f22a00c4745d728b479985fc15ee7ca6a2608388c5569860f
  - kind: registry
    name: tokio-rustls
    version: 0.26.5
    sha: b0c85f2c3ef0b1cd58b36682f4b17aaa995f0e5db534d85692b4903abce21f67
  - kind: registry
    name: tokio-stream
    version: 0.1.19
    sha: a3d06f0b082ba57c26b79407372e57cf2a1e28124f78e9479fe80322cf53420b
  - kind: registry
    name: tokio-tungstenite
    version: 0.28.0
    sha: d25a406cddcc431a75d3d9afc6a7c0f7428d4891dd973e4d54c56b46127bf857
  - kind: registry
    name: tokio-tungstenite
    version: 0.29.0
    sha: 8f72a05e828585856dacd553fba484c242c46e391fb0e58917c942ee9202915c
  - kind: registry
    name: tokio-util
    version: 0.7.19
    sha: 494815d09bf52b5548659851081238f0ca39ff638363907596da739561c62c52
  - kind: registry
    name: toml
    version: 1.1.6+spec-1.1.0
    sha: 920602543f0911ab71da12c50d59701da54c196d1a2bf5cb4b75667f137a406a
  - kind: registry
    name: toml_datetime
    version: 1.1.1+spec-1.1.0
    sha: 3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7
  - kind: registry
    name: toml_edit
    version: 0.25.15+spec-1.1.0
    sha: 1340ea94a5856333492c9064b02c778b191dd2c853778d9609debdcdfea3a614
  - kind: registry
    name: toml_parser
    version: 1.1.3+spec-1.1.0
    sha: 1d38ac1cf9b95face32296c0a3ede1fdc270627c9d9c02a7274dd6d960dc4d56
  - kind: registry
    name: toml_writer
    version: 1.1.2+spec-1.1.0
    sha: 7d56353a2a665ad0f41a421187180aab746c8c325620617ad883a99a1cbe66d2
  - kind: registry
    name: tower
    version: 0.5.3
    sha: ebe5ef63511595f1344e2d5cfa636d973292adc0eec1f0ad45fae9f0851ab1d4
  - kind: registry
    name: tower-http
    version: 0.6.11
    sha: 4cfcf7e2740e6fc6d4d688b4ef00650406bb94adf4731e43c096c3a19fe40840
  - kind: registry
    name: tower-layer
    version: 0.3.3
    sha: 121c2a6cda46980bb0fcd1647ffaf6cd3fc79a013de288782836f6df9c48780e
  - kind: registry
    name: tower-service
    version: 0.3.3
    sha: 8df9b6e13f2d32c91b9bd719c00d1958837bc7dec474d94952798cc8e69eeec3
  - kind: registry
    name: tracel-ash
    version: 0.39.5+sdk1.4.357
    sha: 9802d90b2e66f00a395a3acf337ddd49dd1e90cb3287fc31a4148f875d7be7c5
  - kind: registry
    name: tracel-llvm
    version: 20.1.4-7
    sha: 982535db9eb1a30ac0f2c50239a0eec3e5cf50993a88e92b04747bd2f4d365b2
  - kind: registry
    name: tracel-llvm-bundler
    version: 20.1.4-7
    sha: 3c75b8e477cb8d49d907afab029ca74d48459f5b88c27bdb4c6cd6acb5e61977
  - kind: registry
    name: tracel-mlir-rs
    version: 20.1.4-7
    sha: 77a478a35efd68d0ba73f747adfb7923b121c64e7f5be9cd8364ca1dcb772d5c
  - kind: registry
    name: tracel-mlir-rs-macros
    version: 20.1.4-7
    sha: 7a94f36868c3b10b1825945223d99d106c73f4d249f063caa4651deeb9379344
  - kind: registry
    name: tracel-mlir-sys
    version: 20.1.4-7
    sha: 02f26d31af0c225a6d2e3d65d012fd6de848c9fc776897b152ee83b7d1bd15c4
  - kind: registry
    name: tracel-rspirv
    version: 0.12.1+sdk-1.4.341.0
    sha: 1653aa21b867351f48c51f1063a2f872f8e82931951cae469d8a53aa4d7d72e8
  - kind: registry
    name: tracel-tblgen-rs
    version: 20.1.4-7
    sha: 00d2581070380418ccc33b500f3739e4d4869421fdb477fcea51ff97c6253a52
  - kind: registry
    name: tracing
    version: 0.1.44
    sha: 63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100
  - kind: registry
    name: tracing-attributes
    version: 0.1.31
    sha: 7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da
  - kind: registry
    name: tracing-core
    version: 0.1.36
    sha: db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a
  - kind: registry
    name: tracing-log
    version: 0.2.0
    sha: ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3
  - kind: registry
    name: tracing-subscriber
    version: 0.3.23
    sha: cb7f578e5945fb242538965c2d0b04418d38ec25c79d160cd279bf0731c8d319
  - kind: registry
    name: transpose
    version: 0.2.3
    sha: 1ad61aed86bc3faea4300c7aee358b4c6d0c8d6ccc36524c96e4c92ccf26e77e
  - kind: registry
    name: try-lock
    version: 0.2.5
    sha: e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b
  - kind: registry
    name: tungstenite
    version: 0.28.0
    sha: 8628dcc84e5a09eb3d8423d6cb682965dea9133204e8fb3efee74c2a0c259442
  - kind: registry
    name: tungstenite
    version: 0.29.0
    sha: 6c01152af293afb9c7c2a57e4b559c5620b421f6d133261c60dd2d0cdb38e6b8
  - kind: registry
    name: tungstenite
    version: 0.30.0
    sha: e48ac77174b19c110a50ab2128b24215ac9cb40e0e12e093fb602d175c569d22
  - kind: registry
    name: tynm
    version: 0.2.0
    sha: a21cdb0fc8f85c98b1ec812bc4cd69faf6c0fa2fc17d44ea3c2cdd38dc08e999
  - kind: registry
    name: type-map
    version: 0.5.1
    sha: cb30dbbd9036155e74adad6812e9898d03ec374946234fbcebd5dfc7b9187b90
  - kind: registry
    name: typed-arena
    version: 2.0.2
    sha: 6af6ae20167a9ece4bcb41af5b80f8a1f1df981f6391189ce00fd257af04126a
  - kind: registry
    name: typed-path
    version: 0.12.3
    sha: 8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e
  - kind: registry
    name: typenum
    version: 1.20.1
    sha: b6f5e870be6c3b371b77fe0ee0bafb859fa4964b4404c27de1d380043c4dda20
  - kind: registry
    name: unicase
    version: 2.9.0
    sha: dbc4bc3a9f746d862c45cb89d705aa10f187bb96c76001afab07a0d35ce60142
  - kind: registry
    name: unicode-ident
    version: 1.0.26
    sha: d245f478577f809a851594d02313b640fb437e0bb33866753cff937863096954
  - kind: registry
    name: unicode-normalization
    version: 0.1.25
    sha: 5fd4f6878c9cb28d874b009da9e8d183b5abc80117c40bbd187a1fde336be6e8
  - kind: registry
    name: unicode-segmentation
    version: 1.13.3
    sha: c6f5d3c3b1bf09027a88a6bc961fc00497d651009560b5463668dc81b0fa87a8
  - kind: registry
    name: unicode-width
    version: 0.2.2
    sha: b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254
  - kind: registry
    name: unicode-xid
    version: 0.2.6
    sha: ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853
  - kind: registry
    name: unicode_categories
    version: 0.1.1
    sha: 39ec24b3121d976906ece63c9daad25b85969647682eee313cb5779fdd69e14e
  - kind: registry
    name: unindent
    version: 0.2.4
    sha: 7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3
  - kind: registry
    name: unit-prefix
    version: 0.5.2
    sha: 81e544489bf3d8ef66c953931f56617f423cd4b5494be343d9b9d3dda037b9a3
  - kind: registry
    name: untrusted
    version: 0.7.1
    sha: a156c684c91ea7d62626509bce3cb4e1d9ed5c4d978f7b4352658f96a4c26b4a
  - kind: registry
    name: untrusted
    version: 0.9.0
    sha: 8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1
  - kind: registry
    name: unty
    version: 0.0.4
    sha: 6d49784317cd0d1ee7ec5c716dd598ec5b4483ea832a2dced265471cc0f690ae
  - kind: registry
    name: url
    version: 2.5.8
    sha: ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed
  - kind: registry
    name: url-escape
    version: 0.1.2
    sha: fd4105a4fc511f6b1c9616a372a1313ae7c15afcaac839617c1c7cf25ce0a965
  - kind: registry
    name: urlencoding
    version: 2.1.3
    sha: daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da
  - kind: registry
    name: utf-8
    version: 0.7.6
    sha: 09cc8ee72d2a9becf2f2febe0205bbed8fc6615b7cb429ad062dc7b7ddd036a9
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
    version: 1.26.1
    sha: 2ef6dac1e96601b4fb3acccccff2139741fcb757cb9a36089bf5be91cfb285ce
  - kind: registry
    name: v_frame
    version: 0.3.9
    sha: 666b7727c8875d6ab5db9533418d7c764233ac9c0cff1d469aec8fa127597be2
  - kind: registry
    name: va_list
    version: 0.1.4
    sha: 350bd5ef744f978a387cd08ce514be4e3766746496f355d59d68af36f52d36da
  - kind: registry
    name: valuable
    version: 0.1.1
    sha: ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65
  - kind: registry
    name: variadics_please
    version: 1.1.0
    sha: 41b6d82be61465f97d42bd1d15bf20f3b0a3a0905018f38f9d6f6962055b0b5c
  - kind: registry
    name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
  - kind: registry
    name: vergen
    version: 9.0.6
    sha: 6b2bf58be11fc9414104c6d3a2e464163db5ef74b12296bda593cac37b6e4777
  - kind: registry
    name: vergen-gitcl
    version: 1.0.8
    sha: b9dfc1de6eb2e08a4ddf152f1b179529638bedc0ea95e6d667c014506377aefe
  - kind: registry
    name: vergen-lib
    version: 0.1.6
    sha: 9b07e6010c0f3e59fcb164e0163834597da68d1f864e2b8ca49f74de01e9c166
  - kind: registry
    name: version-compare
    version: 0.2.1
    sha: 03c2856837ef78f57382f06b2b8563a2f512f7185d732608fd9176cb3b8edf0e
  - kind: registry
    name: version_check
    version: 0.9.5
    sha: 0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a
  - kind: registry
    name: void
    version: 1.0.2
    sha: 6a02e4885ed3bc0f2de90ea6dd45ebcbb66dacffe03547fadbb0eeae2770887d
  - kind: registry
    name: vsimd
    version: 0.8.0
    sha: 5c3082ca00d5a5ef149bb8b555a72ae84c9c59f7250f013ac822ac2e49b19c64
  - kind: registry
    name: vte
    version: 0.14.1
    sha: 231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077
  - kind: registry
    name: vvdec
    version: 0.6.11
    sha: 689743f6dc5c608197123319f088d73d3048a9e5d93682b95b8a347243975cb0
  - kind: registry
    name: vvdec-sys
    version: 0.7.0
    sha: 18df9e7fd48eb13204c547ccd570774b701981878489779c9a427ee97579f24d
  - kind: registry
    name: waker-fn
    version: 1.2.0
    sha: 317211a0dc0ceedd78fb2ca9a44aed3d7b9b26f81870d485c07122b4350673b7
  - kind: registry
    name: walkdir
    version: 2.5.0
    sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
  - kind: registry
    name: want
    version: 0.3.1
    sha: bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e
  - kind: registry
    name: warp
    version: 0.4.3
    sha: c0a808122a8a77eecdabaefd88ddb1913c4be5ea1465399f63ba64c7aa705fea
  - kind: registry
    name: wasi
    version: 0.11.1+wasi-snapshot-preview1
    sha: ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b
  - kind: registry
    name: wasip2
    version: 1.0.4+wasi-0.2.12
    sha: b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487
  - kind: registry
    name: wasm-bindgen
    version: 0.2.128
    sha: aecb87a33d3b0c5e3b7aa46336eaf486cffafbd281b195e4c8b80d50df2351bf
  - kind: registry
    name: wasm-bindgen-futures
    version: 0.4.78
    sha: 6ef4c5d3d2cdf5c54f4231181768f5510842e350db025faf1f7163b1030ed928
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.128
    sha: a690d511e3c1a8b3a55e33511e3c2c00c78415cd23650f32b808627f5696b9ed
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.128
    sha: 411e4887f0071ef2d2164a9d5fdf2d20efbef78fccd3a78b0c10a1dc5295e48a
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.128
    sha: 81941cd78d0c92026c33e5e01312845a4cb1e9af3407f9134b100dd03144103e
  - kind: registry
    name: wasm-streams
    version: 0.5.0
    sha: 9d1ec4f6517c9e11ae630e200b2b65d193279042e28edd4a2cda233e46670bbb
  - kind: registry
    name: wayland-sys
    version: 0.31.11
    sha: d8eab23fefc9e41f8e841df4a9c707e8a8c4ed26e944ef69297184de2785e3be
  - kind: registry
    name: web-sys
    version: 0.3.105
    sha: 9fbddc4a036f00ec4f18c83445bd3115cb306a91da554919a099d9222fe4a7f8
  - kind: registry
    name: web-time
    version: 1.1.0
    sha: 5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb
  - kind: registry
    name: web-transport-proto
    version: 0.6.2
    sha: 1a81bcc79bf48ad0b819bfa51ec28524ee7c356056d43c316727d6b505dcc71e
  - kind: registry
    name: web-transport-quinn
    version: 0.12.1
    sha: 63a239cba370789ab705c39b66d223e3b8aef85e2762046fd6b59e560f156756
  - kind: registry
    name: web-transport-trait
    version: 0.4.0
    sha: 2a916df726e858e8e6cc21e852129f59e6277d3a01bb2254c0506dcf829fdd5d
  - kind: registry
    name: webm-iterable
    version: 0.7.1
    sha: 2b1f0c637f1c2b46d58a1b42b150135f8a31b024bfdcd56cc82febfbb20ba4c0
  - kind: registry
    name: webpki
    version: 0.22.4
    sha: ed63aea5ce73d0ff405984102c42de94fc55a6b75765d621c65262469b3c9b53
  - kind: registry
    name: webpki-root-certs
    version: 1.0.9
    sha: b96554aa2acc8ccdb7e1c9a58a7a68dd5d13bccc69cd124cb09406db612a1c9b
  - kind: registry
    name: webpki-roots
    version: 0.26.11
    sha: 521bc38abb08001b01866da9f51eb7c5d647a19260e00054a8c7fd5f9e57f7a9
  - kind: registry
    name: webpki-roots
    version: 1.0.9
    sha: 7dcd9d09a39985f5344844e66b0c530a33843579125f23e21e9f0f220850f22a
  - kind: registry
    name: weezl
    version: 0.1.12
    sha: a28ac98ddc8b9274cb41bb4d9d4d5c425b6020c50c46f25559911905610b4a88
  - kind: registry
    name: wgpu
    version: 29.0.4
    sha: 76e8840e1ba2881d4cbb18d2147627a56af426ff064c0401eb0c8410c6325d07
  - kind: registry
    name: wgpu-core
    version: 29.0.4
    sha: 2f519832254e56965a9940c4af57dcb75f702b6f6fa4a0b172f685395843a4d7
  - kind: registry
    name: wgpu-core-deps-apple
    version: 29.0.4
    sha: f5e39e26c4c0e07589e67d18546cf79ff45383659fc72fca4dd293358a0347f3
  - kind: registry
    name: wgpu-core-deps-emscripten
    version: 29.0.4
    sha: 01e09be551dc939498bdd5f6b2c66e55ab275dad25825267a08605a80fc9f0af
  - kind: registry
    name: wgpu-core-deps-windows-linux-android
    version: 29.0.4
    sha: 4e592c1bbef6ad047647ae6e666ebd8cee7a32bb4544d9700ec96cbf73230257
  - kind: registry
    name: wgpu-hal
    version: 29.0.4
    sha: 97ace1c17727311c22a46e4e3faf56ea6de81af99dcc839bdfb54857b94d448d
  - kind: registry
    name: wgpu-naga-bridge
    version: 29.0.4
    sha: 95226013f547544b223281cd16a4fb549aa9dcb562adbda0faae4c73ffbbc161
  - kind: registry
    name: wgpu-types
    version: 29.0.4
    sha: 84bf84cd9ca8ca45e2b223a3868f1adf9bfc0c66aeac212e76ee7e40fdadf8f5
  - kind: registry
    name: which
    version: 4.4.2
    sha: 87ba24419a2078cd2b0f2ede2691b6c66d8e47836da3b6db8265ebad47afbfc7
  - kind: registry
    name: whisper-rs
    version: 0.16.0
    sha: 2088172d00f936c348d6a72f488dc2660ab3f507263a195df308a3c2383229f6
  - kind: registry
    name: whisper-rs-sys
    version: 0.15.0
    sha: 6986c0fe081241d391f09b9a071fbcbb59720c3563628c3c829057cf69f2a56f
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
    version: 0.1.11
    sha: c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22
  - kind: registry
    name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - kind: registry
    name: windows
    version: 0.61.3
    sha: 9babd3a767a4c1aef6900409f85f5d53ce2544ccdfaa86dad48c91782c6d6893
  - kind: registry
    name: windows
    version: 0.62.2
    sha: 527fadee13e0c05939a6a05d5bd6eec6cd2e3dbd648b9f8e447c6518133d8580
  - kind: registry
    name: windows-collections
    version: 0.2.0
    sha: 3beeceb5e5cfd9eb1d76b381630e82c4241ccd0d27f1a39ed41b2760b255c5e8
  - kind: registry
    name: windows-collections
    version: 0.3.2
    sha: 23b2d95af1a8a14a3c7367e1ed4fc9c20e0a26e79551b1454d72583c97cc6610
  - kind: registry
    name: windows-core
    version: 0.61.2
    sha: c0fdd3ddb90610c7638aa2b3a3ab2904fb9e5cdbecc643ddb3647212781c4ae3
  - kind: registry
    name: windows-core
    version: 0.62.2
    sha: b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb
  - kind: registry
    name: windows-future
    version: 0.2.1
    sha: fc6a41e98427b19fe4b73c550f060b59fa592d7d686537eebf9385621bfbad8e
  - kind: registry
    name: windows-future
    version: 0.3.2
    sha: e1d6f90251fe18a279739e78025bd6ddc52a7e22f921070ccdc67dde84c605cb
  - kind: registry
    name: windows-implement
    version: 0.60.2
    sha: 053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf
  - kind: registry
    name: windows-interface
    version: 0.59.3
    sha: 3f316c4a2570ba26bbec722032c4099d8c8bc095efccdc15688708623367e358
  - kind: registry
    name: windows-link
    version: 0.1.3
    sha: 5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a
  - kind: registry
    name: windows-link
    version: 0.2.1
    sha: f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5
  - kind: registry
    name: windows-numerics
    version: 0.2.0
    sha: 9150af68066c4c5c07ddc0ce30421554771e528bde427614c61038bc2c92c2b1
  - kind: registry
    name: windows-numerics
    version: 0.3.1
    sha: 6e2e40844ac143cdb44aead537bbf727de9b044e107a0f1220392177d15b0f26
  - kind: registry
    name: windows-registry
    version: 0.6.1
    sha: 02752bf7fbdcce7f2a27a742f798510f3e5ad88dbe84871e5168e2120c3d5720
  - kind: registry
    name: windows-result
    version: 0.3.4
    sha: 56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6
  - kind: registry
    name: windows-result
    version: 0.4.1
    sha: 7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5
  - kind: registry
    name: windows-strings
    version: 0.4.2
    sha: 56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57
  - kind: registry
    name: windows-strings
    version: 0.5.1
    sha: 7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091
  - kind: registry
    name: windows-sys
    version: 0.45.0
    sha: 75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0
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
    version: 0.61.2
    sha: ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc
  - kind: registry
    name: windows-targets
    version: 0.42.2
    sha: 8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071
  - kind: registry
    name: windows-targets
    version: 0.52.6
    sha: 9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973
  - kind: registry
    name: windows-threading
    version: 0.1.0
    sha: b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6
  - kind: registry
    name: windows-threading
    version: 0.2.1
    sha: 3949bd5b99cafdf1c7ca86b43ca564028dfe27d66958f2470940f73d86d75b37
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.42.2
    sha: 597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.52.6
    sha: 32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.42.2
    sha: e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.52.6
    sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
  - kind: registry
    name: windows_i686_gnu
    version: 0.42.2
    sha: c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f
  - kind: registry
    name: windows_i686_gnu
    version: 0.52.6
    sha: 8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.52.6
    sha: 0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66
  - kind: registry
    name: windows_i686_msvc
    version: 0.42.2
    sha: 44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060
  - kind: registry
    name: windows_i686_msvc
    version: 0.52.6
    sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.42.2
    sha: 8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.52.6
    sha: 147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.42.2
    sha: 26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.52.6
    sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.42.2
    sha: 9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.52.6
    sha: 589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec
  - kind: registry
    name: winnow
    version: 1.0.4
    sha: 23b97319f7b8343df12cc98938e5c3eb436064524c8d2b4e30a1d3a36eecdf81
  - kind: registry
    name: wit-bindgen
    version: 0.57.1
    sha: 1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e
  - kind: registry
    name: writeable
    version: 0.6.4
    sha: 3ad82d2a33cdc9674dc7465672f271e096168fcdbe0f799d9e6db8c5892679dc
  - kind: registry
    name: x25519-dalek
    version: 2.0.1
    sha: c7e468321c81fb07fa7f4c636c3972b9100f0346e5b6a9f2bd0603a52f7ed277
  - kind: registry
    name: x509-parser
    version: 0.18.1
    sha: d43b0f71ce057da06bc0851b23ee24f3f86190b07203dd8f567d0b706a185202
  - kind: registry
    name: xattr
    version: 1.6.1
    sha: 32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156
  - kind: registry
    name: xml
    version: 1.4.0
    sha: 2f45bb2c13fec6a6cb4c0f76a7e94839e110a14ec803ec2940777a94c347bc52
  - kind: registry
    name: xml-rs
    version: 0.8.29
    sha: e450f9b2ed1dff33c94c12589a87338689467b9c4f5d8a5710bd09a847d2c8a7
  - kind: registry
    name: xmlparser
    version: 0.13.6
    sha: 66fee0b777b0f5ac1c69bb06d361268faafa61cd4682ae064a171c16c433e9e4
  - kind: registry
    name: xmltree
    version: 0.12.0
    sha: cbc04313cab124e498ab1724e739720807b6dc405b9ed0edc5860164d2e4ff70
  - kind: registry
    name: xxhash-rust
    version: 0.8.18
    sha: aee1b19627c7c60102ab80d3a9cbe18de90bfe03bfa6c3715447681f0e8c8af6
  - kind: registry
    name: y4m
    version: 0.8.0
    sha: 7a5a4b21e1a62b67a2970e6831bc091d7b87e119e7f9791aef9702e3bef04448
  - kind: registry
    name: yansi
    version: 1.0.1
    sha: cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049
  - kind: registry
    name: yasna
    version: 0.6.0
    sha: b5f6765e852b9b4dc8e2a76843e4d64d1cea8e79bcde0b6901aea8e7c7f08282
  - kind: registry
    name: yoke
    version: 0.8.3
    sha: 709fe23a0424b6a435d82152b1bd3fdfb0833487d5fa90d05d42762a9891fef5
  - kind: registry
    name: yoke-derive
    version: 0.8.3
    sha: 33811428bee40dbceb6d545e95754741d17a6aef9a4849f0fd62e2ba4f412a78
  - kind: registry
    name: zerocopy
    version: 0.8.57
    sha: d35102a9f36d089ccae9e4c6802bc118be4487b80aaffc0ab4e0cf5ce92d2873
  - kind: registry
    name: zerocopy-derive
    version: 0.8.57
    sha: 146c01f5ab44258da43cf276c74a2763db2ff3969c9c652c3f2de07041d0b2bc
  - kind: registry
    name: zerofrom
    version: 0.1.8
    sha: 0ec05a11813ea801ff6d75110ad09cd0824ddba17dfe17128ea0d5f68e6c5272
  - kind: registry
    name: zerofrom-derive
    version: 0.1.8
    sha: f75b4683f6c7f45248d4d64056a24298c6281e0993356d7d1b4a1a962ef10d4a
  - kind: registry
    name: zeroize
    version: 1.9.0
    sha: e13c156562582aa81c60cb29407084cdb54c4164760106ab78e6c5b0858cf64e
  - kind: registry
    name: zeroize_derive
    version: 1.5.0
    sha: 3c50655cbb0fe3fc43170059e702f1ce5e19b84cec58dc87b037a09935c2f328
  - kind: registry
    name: zerotrie
    version: 0.2.5
    sha: 4ea269c3bd32f0a32c321907a2ae912ba6f4649bb0fc764a15627e99a7095a3f
  - kind: registry
    name: zerovec
    version: 0.11.8
    sha: bb0464e17806c1d976d5cba29399c7f08e516e279e2ba493f63123b5fca67dd8
  - kind: registry
    name: zerovec-derive
    version: 0.11.6
    sha: 34df6fc39dbd26ddc9c10e6a2984476e13acce22e64e4487636ef494369225da
  - kind: registry
    name: zip
    version: 8.6.0
    sha: 2d04a6b5381502aa6087c94c669499eb1602eb9c5e8198e534de571f7154809b
  - kind: registry
    name: zlib-rs
    version: 0.6.8
    sha: b268e58e7c693d7c271f93ffc4ba3b380412554231c85bf61ca7af91042a4112
  - kind: registry
    name: zmij
    version: 1.0.23
    sha: 29666d0abbfad1e3dc4dcf6144730dd3a3ab225bbbdac83319345b1b44ccfc1b
  - kind: registry
    name: zopfli
    version: 0.8.3
    sha: f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125800027ad6017d2b5249
  - kind: registry
    name: zstd
    version: 0.13.3
    sha: e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a
  - kind: registry
    name: zstd-safe
    version: 7.3.0
    sha: 64d80649ab6db9d9f6f9c80a40becd948eda4714a0a5ac8c4d157a32231c7882
  - kind: registry
    name: zstd-sys
    version: 2.1.0+zstd.1.5.7
    sha: 0ef0a8027ec3ee71300ab3bcbcd0393f434aa72b91ca6d635a39941deae8eea0
  - kind: registry
    name: zune-core
    version: 0.5.3
    sha: d56377fd46368984a170bc5aac5567e52ca5da874caa60bea39fcbca78fb658b
  - kind: registry
    name: zune-inflate
    version: 0.2.54
    sha: 73ab332fe2f6680068f3582b16a24f90ad7096d5d39b974d1c0aff0125116f02
  - kind: registry
    name: zune-jpeg
    version: 0.5.15
    sha: 27bc9d5b815bc103f142aa054f561d9187d191692ec7c2d1e2b4737f8dbd7296
- kind: patch
  # adapted from https://build.opensuse.org/projects/openSUSE:Factory:RISCV/packages/gstreamer-plugins-rs/files/vendor.patch?expand=1
  path: patches/gstreamer-plugins-rs/gst-plugins-rs-0.13.0-libsodium-sys-riscv64.patch
