kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- public-stacks/buildsystem-autotools.bst
- public-stacks/buildsystem-cmake.bst
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
  ref: 0.15.0-0-g53935446427da8e4a1170c8d2064fd914fab35c0
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
    name: ahash
    version: 0.8.12
    sha: 5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75
  - kind: registry
    name: aho-corasick
    version: 1.1.4
    sha: ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301
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
    version: 0.1.5
    sha: 819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311
  - kind: registry
    name: anstream
    version: 0.6.21
    sha: 43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a
  - kind: registry
    name: anstyle
    version: 1.0.13
    sha: 5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78
  - kind: registry
    name: anstyle-parse
    version: 0.2.7
    sha: 4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2
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
    version: 1.0.102
    sha: 7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c
  - kind: registry
    name: anymap3
    version: 1.0.1
    sha: 170433209e817da6aae2c51aa0dd443009a613425dd041ebfb2492d1c4c11a25
  - kind: registry
    name: arbitrary
    version: 1.4.2
    sha: c3d036a3c4ab069c7b410a2ce876bd74808d2d0888a82667669f8e783a898bf1
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
    version: 0.7.6
    sha: 7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50
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
    version: 0.7.1
    sha: 56624a96882bb8c26d61312ae18cb45868e5a9992ea73c58e45c3101e56a1e60
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
    version: 0.4.40
    sha: 7d67d43201f4d20c78bcda740c142ca52482d81da80681533d33bf3f0596c8e2
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
    version: 0.1.89
    sha: 9035ad2d096bed7955a320ee7e2230574d28fd3c3a0f186cbea1ff3c7eed5dbb
  - kind: registry
    name: async-tungstenite
    version: 0.33.0
    sha: f3b465d66478a9bb84abed46695c44a58e34f3e8d0abfb2e958218d420969049
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
    version: 0.1.13
    sha: 41e67cd8309bbd06cd603a9e693a784ac2e5d1e955f11286e355089fcab3047c
  - kind: registry
    name: autocfg
    version: 1.5.0
    sha: c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8
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
    name: aws-config
    version: 1.8.14
    sha: 8a8fc176d53d6fe85017f230405e3255cedb4a02221cb55ed6d76dccbbb099b2
  - kind: registry
    name: aws-credential-types
    version: 1.2.13
    sha: 6d203b0bf2626dcba8665f5cd0871d7c2c0930223d6b6be9097592fea21242d0
  - kind: registry
    name: aws-runtime
    version: 1.7.1
    sha: ede2ddc593e6c8acc6ce3358c28d6677a6dc49b65ba4b37a2befe14a11297e75
  - kind: registry
    name: aws-sdk-kinesisvideo
    version: 1.97.0
    sha: e77b2dad26f369f0ce285fd5a067f68200eebb11f403963f27f2cfec022f2e62
  - kind: registry
    name: aws-sdk-kinesisvideosignaling
    version: 1.95.0
    sha: c4f5541846cd94dbc80e25f486b436109ab0728aa4eb4c4b7b97583fde56523e
  - kind: registry
    name: aws-sdk-polly
    version: 1.100.0
    sha: c6ba218f91c491509426377c8280e18e7b7c6ee36e8f65e4f40b1e496f4eaa21
  - kind: registry
    name: aws-sdk-s3
    version: 1.124.0
    sha: 744c09d75dfec039a05cf8e117c995ded3b0baffa6eb83f3ed7075a01d8d8947
  - kind: registry
    name: aws-sdk-sso
    version: 1.95.0
    sha: 00c5ff27c6ba2cbd95e6e26e2e736676fdf6bcf96495b187733f521cfe4ce448
  - kind: registry
    name: aws-sdk-sts
    version: 1.99.0
    sha: 9acba7c62f3d4e2408fa998a3a8caacd8b9a5b5549cf36e2372fbdae329d5449
  - kind: registry
    name: aws-sdk-transcribestreaming
    version: 1.99.0
    sha: aaa06c3a4aff6e9c1d31a8c27aab9dfd7d03a00ff123264fd1b3d40790f79d0a
  - kind: registry
    name: aws-sdk-translate
    version: 1.95.0
    sha: 1cfc6c86cb7987f0653beb9a9fbf2c7c98aace144a1fac958ad30ffba6a0357c
  - kind: registry
    name: aws-sigv4
    version: 1.4.1
    sha: 37411f8e0f4bea0c3ca0958ce7f18f6439db24d555dbd809787262cd00926aa9
  - kind: registry
    name: aws-smithy-async
    version: 1.2.13
    sha: 5cc50d0f63e714784b84223abd7abbc8577de8c35d699e0edd19f0a88a08ae13
  - kind: registry
    name: aws-smithy-checksums
    version: 0.64.5
    sha: 180dddf5ef0f52a2f99e2fada10e16ea610e507ef6148a42bdc4d5867596aa00
  - kind: registry
    name: aws-smithy-eventstream
    version: 0.60.19
    sha: 1c0b3e587fbaa5d7f7e870544508af8ce82ea47cd30376e69e1e37c4ac746f79
  - kind: registry
    name: aws-smithy-http
    version: 0.63.5
    sha: d619373d490ad70966994801bc126846afaa0d1ee920697a031f0cf63f2568e7
  - kind: registry
    name: aws-smithy-http-client
    version: 1.1.11
    sha: 00ccbb08c10f6bcf912f398188e42ee2eab5f1767ce215a02a73bc5df1bbdd95
  - kind: registry
    name: aws-smithy-json
    version: 0.62.4
    sha: 27b3a779093e18cad88bbae08dc4261e1d95018c4c5b9356a52bcae7c0b6e9bb
  - kind: registry
    name: aws-smithy-observability
    version: 0.2.5
    sha: 4d3f39d5bb871aaf461d59144557f16d5927a5248a983a40654d9cf3b9ba183b
  - kind: registry
    name: aws-smithy-query
    version: 0.60.14
    sha: 05f76a580e3d8f8961e5d48763214025a2af65c2fa4cd1fb7f270a0e107a71b0
  - kind: registry
    name: aws-smithy-runtime
    version: 1.10.2
    sha: 22ccf7f6eba8b2dcf8ce9b74806c6c185659c311665c4bf8d6e71ebd454db6bf
  - kind: registry
    name: aws-smithy-runtime-api
    version: 1.11.5
    sha: b4af6e5def28be846479bbeac55aa4603d6f7986fc5da4601ba324dd5d377516
  - kind: registry
    name: aws-smithy-types
    version: 1.4.5
    sha: 8ca2734c16913a45343b37313605d84e7d8b34a4611598ce1d25b35860a2bed3
  - kind: registry
    name: aws-smithy-xml
    version: 0.60.14
    sha: b53543b4b86ed43f051644f704a98c7291b3618b67adf057ee77a366fa52fcaa
  - kind: registry
    name: aws-types
    version: 1.3.13
    sha: 0470cc047657c6e286346bdf10a8719d26efd6a91626992e0e64481e44323e96
  - kind: registry
    name: backtrace
    version: 0.3.76
    sha: bb531853791a215d7c62a30daf0dde835f381ab5de4589cfe7c649d2cbe92bd6
  - kind: registry
    name: base16ct
    version: 0.1.1
    sha: 349a06037c7bf932dd7e7d1f653678b2038b9ad46a74102f1fc7bd7872678cce
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
    name: base64-serde
    version: 0.8.0
    sha: 77c6d128af408d8ebd08331f0331cf2cf20d19e6c44a7aec58791641ecc8c0b5
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
    version: 0.8.0
    sha: 08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3
  - kind: registry
    name: bit-vec
    version: 0.8.0
    sha: 5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.11.0
    sha: 843867be96c8daad0d758b57df9392b6d8d271134fce549de6ce169ff98a92af
  - kind: registry
    name: bitreader
    version: 0.3.11
    sha: 886559b1e163d56c765bc3a985febb4eee8009f625244511d8ee3c432e08c066
  - kind: registry
    name: bitstream-io
    version: 4.9.0
    sha: 60d4bd9d1db2c6bdf285e223a7fa369d5ce98ec767dec949c6ca62863ce61757
  - kind: registry
    name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: block2
    version: 0.6.2
    sha: cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5
  - kind: registry
    name: bstr
    version: 1.12.1
    sha: 63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab
  - kind: registry
    name: built
    version: 0.8.0
    sha: f4ad8f11f288f48ca24471bbd51ac257aaeaaa07adae295591266b792902ae64
  - kind: registry
    name: bumpalo
    version: 3.20.2
    sha: 5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb
  - kind: registry
    name: burn
    version: 0.20.1
    sha: b78ff10ed98b73e1d477ea6e6e1ec1b9cf9f71a17afc3fea9f4dca482d43dcd4
  - kind: registry
    name: burn-backend
    version: 0.20.1
    sha: a724a5d8d5865a1f6b304f629eb19f51489760689501c583b3e1f4209f067357
  - kind: registry
    name: burn-core
    version: 0.20.1
    sha: 9c3634c3ba84397bcf2977ce746954d7e0a40e2d862e92362dd694c29e18df62
  - kind: registry
    name: burn-cpu
    version: 0.20.1
    sha: 60aa53c4536719f1c91c250d4b4348daca473c44cf0c45b81096785f5510c192
  - kind: registry
    name: burn-cubecl
    version: 0.20.1
    sha: 8d6d13aff03fec966da4300459688883f8a1d741dddbf19d1bfc2562656a9a9b
  - kind: registry
    name: burn-derive
    version: 0.20.1
    sha: 102d7e2f705b0cda2f89dd0e55e9bbfc6184029929d53487beb606c3303b29a5
  - kind: registry
    name: burn-ir
    version: 0.20.1
    sha: fd2b1b37a7289bd85438800deaaebde50507336429b80f96a71730794db5bc31
  - kind: registry
    name: burn-ndarray
    version: 0.20.1
    sha: 96be578991cecef163e41a73bf985d8d7eb7fb8ef7bececf8d48523c481ecddf
  - kind: registry
    name: burn-nn
    version: 0.20.1
    sha: 14b8c6c14b94e5b1dddd68f8e6d669f20bac8f99fcb2e4f1a480212d1b598133
  - kind: registry
    name: burn-optim
    version: 0.20.1
    sha: 5a8c376d835d92ea363c05c6f48ac19bb687b683c7958c310a716ef8d5d77ba3
  - kind: registry
    name: burn-std
    version: 0.20.1
    sha: 25a9ed8e34a4a49d3754586f306075d6b55a5e08343ac75c06f47e7d9f825271
  - kind: registry
    name: burn-store
    version: 0.20.1
    sha: 4be80a7b084a19901dc1d0a2e9b77e226c5c575879fe66de891c67062db41a6d
  - kind: registry
    name: burn-tensor
    version: 0.20.1
    sha: 3720e52e00ed0155ced4f8681d0e8a362e699cee36494ec5b97ad44fcc5194c0
  - kind: registry
    name: burn-wgpu
    version: 0.20.1
    sha: df78d62afc9b9fbb8ee4e49b72006485bb64f778a790e185a2d919479bcfc008
  - kind: registry
    name: byte-slice-cast
    version: 1.2.3
    sha: 7575182f7272186991736b70173b0ea045398f984bf5ebbb3804736ce1330c9d
  - kind: registry
    name: bytemuck
    version: 1.25.0
    sha: c8efb64bd706a16a1bdde310ae86b351e4d21550d98d056f22f8a7f7a2183fec
  - kind: registry
    name: bytemuck_derive
    version: 1.10.2
    sha: f9abbd1bc6865053c427f7198e6af43bfdedc55ab791faed4fbd361d789575ff
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
    version: 1.11.1
    sha: 1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33
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
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: cairo-rs
    version: 0.22.1
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: cairo-sys-rs
    version: 0.22.1
  - kind: registry
    name: caseless
    version: 0.2.2
    sha: 8b6fd507454086c8edfd769ca6ada439193cdb209c7681712ef6275cccbfe5d8
  - kind: registry
    name: cc
    version: 1.2.56
    sha: aebf35691d1bfb0ac386a69bac2fde4dd276fb618cf8bf4f5318fe285e821bb2
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
    version: 0.17.2
    sha: 8d4ba6e40bd1184518716a6e1a781bf9160e286d219ccdb8ab2612e74cfe4789
  - kind: registry
    name: cfg-if
    version: 1.0.4
    sha: 9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801
  - kind: registry
    name: cfg_aliases
    version: 0.2.1
    sha: 613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724
  - kind: registry
    name: chacha20
    version: 0.10.0
    sha: 6f8d983286843e49675a4b7a2d174efe136dc93a18d69130dd18198a6c167601
  - kind: registry
    name: chrono
    version: 0.4.43
    sha: fac4744fb15ae8337dc853fee7fb3f4e48c0fbaa23d0afe49c447b4fab126118
  - kind: registry
    name: cipher
    version: 0.4.4
    sha: 773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad
  - kind: registry
    name: clang-sys
    version: 1.8.1
    sha: 0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4
  - kind: registry
    name: clap
    version: 4.5.60
    sha: 2797f34da339ce31042b27d23607e051786132987f595b02ba4f6a6dffb7030a
  - kind: registry
    name: clap_builder
    version: 4.5.60
    sha: 24a241312cea5059b13574bb9b3861cabf758b879c15190b37b6d6fd63ab6876
  - kind: registry
    name: clap_derive
    version: 4.5.55
    sha: a92793da1a46a5f2a02a6f4c46c6496b28c43638adea8306fcb0caa1634f24e5
  - kind: registry
    name: clap_lex
    version: 1.0.0
    sha: 3a822ea5bc7590f9d40f1ba12c0dc3c2760f3482c6984db1573ad11031420831
  - kind: registry
    name: claxon
    version: 0.4.3
    sha: 4bfbf56724aa9eca8afa4fcfadeb479e722935bb2a0900c2d37e0cc477af0688
  - kind: registry
    name: cmake
    version: 0.1.57
    sha: 75443c44cd6b379beb8c5b45d85d0773baf31cce901fe7bb252f4eff3008ef7d
  - kind: registry
    name: codespan-reporting
    version: 0.12.0
    sha: fe6d2e5af09e8c8ad56c969f2157a3d4238cebc7c55f0a517728c38f7b200f81
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
    version: 1.0.4
    sha: b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75
  - kind: registry
    name: colored
    version: 3.1.1
    sha: faf9468729b8cbcea668e36183cb69d317348c2e08e994829fb56ebfdfbaac34
  - kind: registry
    name: combine
    version: 4.6.7
    sha: ba5a308b75df32fe02788e748662718f03fde005016435c444eea572398219fd
  - kind: registry
    name: compression-codecs
    version: 0.4.37
    sha: eb7b51a7d9c967fc26773061ba86150f19c50c0d65c887cb1fbe295fd16619b7
  - kind: registry
    name: compression-core
    version: 0.4.31
    sha: 75984efb6ed102a0d42db99afb6c1948f0380d1d91808d5529916e6c08b49d8d
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
    version: 0.16.2
    sha: 03e45a4a8926227e4197636ba97a9fc9b00477e9f4bd711395687c5f0734bec4
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
    version: 0.3.1
    sha: 7c74b8349d32d297c9134b8c88677813a227df8f779daa29bfc29c183fe3dca6
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
    version: 0.18.1
    sha: 4ddef33a339a91ea89fb53151bd0a4689cfce27055c291dfa69945475d22c747
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
    name: core-graphics-types
    version: 0.2.0
    sha: 3d44a101f213f6c4cdc1853d4b78aef6db6bdfa3468798cc1d9912f4735013eb
  - kind: registry
    name: core2
    version: 0.4.0
    sha: b49ba7ef1ad6107f8824dbe97de947cbaac53c44e7f9756a1fba0d37c1eec505
  - kind: registry
    name: cpufeatures
    version: 0.2.17
    sha: 59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280
  - kind: registry
    name: cpufeatures
    version: 0.3.0
    sha: 8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201
  - kind: registry
    name: crc
    version: 3.3.0
    sha: 9710d3b3739c2e349eb44fe848ad0b7c8cb1e42bd87ee49371df2f7acaf3e675
  - kind: registry
    name: crc-catalog
    version: 2.4.0
    sha: 19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5
  - kind: registry
    name: crc-fast
    version: 1.9.0
    sha: 2fd92aca2c6001b1bf5ba0ff84ee74ec8501b52bbef0cac80bf25a6c1d87a83d
  - kind: registry
    name: crc32fast
    version: 1.5.0
    sha: 9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511
  - kind: registry
    name: critical-section
    version: 1.2.0
    sha: 790eea4361631c5e7d22598ecd5723ff611904e3344ce8720784c93e3d83d40b
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
    name: crunchy
    version: 0.2.4
    sha: 460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5
  - kind: registry
    name: crypto-bigint
    version: 0.4.9
    sha: ef2b4b23cddf68b89b8f8069890e8c270d54e2d5fe1b143820234805e4cb17ef
  - kind: registry
    name: crypto-bigint
    version: 0.5.5
    sha: 0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76
  - kind: registry
    name: crypto-common
    version: 0.1.7
    sha: 78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a
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
    version: 3.5.1
    sha: 73736a89c4aff73035ba2ed2e565061954da00d4970fc9ac25dcc85a2a20d790
  - kind: registry
    name: cubecl
    version: 0.9.0
    sha: 053856efd5436224775b9423d43d86f53d5b1d3af9a6b9983d9a313a0922638f
  - kind: registry
    name: cubecl-common
    version: 0.9.0
    sha: 60bf8aaeb572c8cf2f2ffd07fa9bb1a2cf9336d1aa11ecd4d9a2f2e30c4be706
  - kind: registry
    name: cubecl-core
    version: 0.9.0
    sha: 98374a31d2b68b55709891169832ccf205408c201c5e023964482441f213d0b9
  - kind: registry
    name: cubecl-cpp
    version: 0.9.0
    sha: fb24d96c1ff84ab4def0a529e384311a15cb771310aaf2b640c312384c3bca23
  - kind: registry
    name: cubecl-cpu
    version: 0.9.0
    sha: 152588a6e16b6bda5e8216af7a6fad3d7de4697294b6ce0f6acbe3a9029ff674
  - kind: registry
    name: cubecl-cuda
    version: 0.9.0
    sha: 6f74a5750c45090d1fc5ddf6a19fea9a099aa1f6800b78f1167a2d60182d1d96
  - kind: registry
    name: cubecl-ir
    version: 0.9.0
    sha: 361b608ff9f05024c7a7e381852689acd95b6af5af956d68734692b27d5f75ef
  - kind: registry
    name: cubecl-macros
    version: 0.9.0
    sha: 7c9a872d16207c6a27ed45942fd311a281394dd384b14a21f72131db1556a977
  - kind: registry
    name: cubecl-macros-internal
    version: 0.9.0
    sha: aa3fa0626cdf28b9c49084c2bb51493bfde44378e22d90624aacaafb81da3588
  - kind: registry
    name: cubecl-opt
    version: 0.9.0
    sha: bdcff25fdcbd82ea4277c30a81e162722859f57c6ae105c0a3c53f8bb91154f6
  - kind: registry
    name: cubecl-runtime
    version: 0.9.0
    sha: b02e28997a8d75311afae4d2cea7b593eb125312f845874118a59d78c7a6b34c
  - kind: registry
    name: cubecl-spirv
    version: 0.9.0
    sha: d7d7d68a3e09d4782098f82b0b7347f3a9e54a9977b3b5a23145464a84cf14dc
  - kind: registry
    name: cubecl-std
    version: 0.9.0
    sha: e8ff5741c98b7a7a5944b4afb0b67dd7f5e0be41ce7f303b587f8b0d6430b29b
  - kind: registry
    name: cubecl-wgpu
    version: 0.9.0
    sha: 29787364632fc7ec6a11cf3d95187f82f6fcce17d6bb4f0fb0dde580b837631d
  - kind: registry
    name: cubecl-zspace
    version: 0.9.0
    sha: 7a0f819071413b19a00b7105497e0f6d2cf3e7e9d65cbb8d4ecf1ddb29c61dc2
  - kind: registry
    name: cubek
    version: 0.1.1
    sha: 1bb1cce47db02017925301bedec92ae84628493df3f9761ea7ac42a60c6146f8
  - kind: registry
    name: cubek-attention
    version: 0.1.1
    sha: 7278bd122b2428af479f9af05285160613733c33c93b63ab3c6d25cd0460c18b
  - kind: registry
    name: cubek-convolution
    version: 0.1.1
    sha: 18eb04bca4ae104d62a56def04b04f3d079c42fe49aac62202c96876f90fa28b
  - kind: registry
    name: cubek-matmul
    version: 0.1.1
    sha: a28f3b04b113760e97c65a8a4dca9afc220744031eeecd5ad6cd0e3be91ba3a9
  - kind: registry
    name: cubek-quant
    version: 0.1.1
    sha: 96ec3ae04af324df2d615c2b394e270d58d6f08cb833d67633e2ba794de75916
  - kind: registry
    name: cubek-random
    version: 0.1.1
    sha: 65a34844d8b7f739185c1d24896137dcb73f458830444103b45f678585ad983e
  - kind: registry
    name: cubek-reduce
    version: 0.1.1
    sha: 42397d9ed85bb3084dfb56ed26de75690b5b07caf42a32f4006b57eb23d5b6d6
  - kind: registry
    name: cudarc
    version: 0.18.2
    sha: 3aa12038120eb13347a6ae2ffab1d34efe78150125108627fd85044dd4d6ff1e
  - kind: registry
    name: darling
    version: 0.20.11
    sha: fc7f46116c46ff9ab3eb1597a45688b6715c6e628b5c133e288e709a29bcb4ee
  - kind: registry
    name: darling
    version: 0.21.3
    sha: 9cdf337090841a411e2a7f3deb9187445851f91b309c0c0a29e05f74a00a48c0
  - kind: registry
    name: darling_core
    version: 0.20.11
    sha: 0d00b9596d185e565c2207a0b01f8bd1a135483d02d9b7b0a54b11da8d53412e
  - kind: registry
    name: darling_core
    version: 0.21.3
    sha: 1247195ecd7e3c85f83c8d2a366e4210d588e802133e1e355180a9870b517ea4
  - kind: registry
    name: darling_macro
    version: 0.20.11
    sha: fc34b93ccb385b40dc71c6fceac4b2ad23662c7eeb248cf10d529b7e055b6ead
  - kind: registry
    name: darling_macro
    version: 0.21.3
    sha: d38308df82d1080de0afee5d069fa14b0326a88c14f15c5ccda35b4a6c414c81
  - kind: registry
    name: dash-mpd
    version: 0.19.3
    sha: 16f99145d4e107d5844981583d553ebd20a24c036e06225b2577243908de2fe2
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
    version: 2.10.0
    sha: d7a1e2f27636f116493b8b860f5546edb47c8d8f8ea73e1d2a20be88e28d1fea
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
    version: 0.7.0
    sha: 49bf11c4dc8fc1e7c94fc4198f82f64536fdb9eded7b5a076d9597d8b67e1fd1
  - kind: registry
    name: deflate64
    version: 0.1.10
    sha: 26bf8fc351c5ed29b5c2f0cbbac1b209b74f60ecd62e675a998df72c49af5204
  - kind: registry
    name: der
    version: 0.6.1
    sha: f1a467a65c5e759bce6e65eaf91cc29f466cdc57cb65777bd646872a8a1fd4de
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
    version: 0.5.6
    sha: cc3dc5ad92c2e2d1c193bbbbdf2ea477cb81331de4f3103f267ca18368b988c4
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
    name: diff
    version: 0.1.13
    sha: 56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8
  - kind: registry
    name: digest
    version: 0.10.7
    sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
  - kind: registry
    name: dirs
    version: 6.0.0
    sha: c3e8aa94d75141228480295a7d0e7feb620b1a5ad9f12bc40be62411e38cce4e
  - kind: registry
    name: dirs-sys
    version: 0.5.0
    sha: e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab
  - kind: registry
    name: dispatch2
    version: 0.3.0
    sha: 89a09f22a6c6069a18470eb92d2298acf25463f14256d24778e1230d789a2aec
  - kind: registry
    name: displaydoc
    version: 0.2.5
    sha: 97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0
  - kind: registry
    name: document-features
    version: 0.2.12
    sha: d4b8a88685455ed29a21542a33abd9cb6510b6b129abadabdcef0f4c55bc8f61
  - kind: registry
    name: dssim-core
    version: 3.4.0
    sha: e3c601412450ff29a9258b2f85b18b38f658caf70fad1692f40ca863d86cb753
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
    version: 0.6.3
    sha: 7b5173ac3752f08b526a6991509615e1a345b221ec3c58c7633433e8c9582312
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
    version: 0.14.8
    sha: 413301934810f597c1d19ca71c8710e99a3f1ba28a0d2ebc01551a2daeea3c5c
  - kind: registry
    name: ed25519
    version: 1.5.3
    sha: 91cff35c70bba8a626e3185d8cd48cc11b5437e1a5bcd15b9b5fa3c64b6dfee7
  - kind: registry
    name: either
    version: 1.15.0
    sha: 48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719
  - kind: registry
    name: elliptic-curve
    version: 0.12.3
    sha: e7bb888ab5300a19b8e5bceef25ac745ad065f3c9f7efc6de1b91958110891d3
  - kind: registry
    name: embassy-futures
    version: 0.1.2
    sha: dc2d050bdc5c21e0862a89256ed8029ae6c290a93aecefc73084b3002cdebb01
  - kind: registry
    name: embassy-time
    version: 0.4.0
    sha: f820157f198ada183ad62e0a66f554c610cdcd1a9f27d4b316358103ced7a1f8
  - kind: registry
    name: embassy-time-driver
    version: 0.2.1
    sha: a0a244c7dc22c8d0289379c8d8830cae06bb93d8f990194d0de5efb3b5ae7ba6
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
    version: 0.8.35
    sha: 75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3
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
    version: 1.1.10
    sha: 25b07a8dfbbbfc0064c0a6bdf9edcf966de6b1c33ce344bdeca3b41615452634
  - kind: registry
    name: enumset_derive
    version: 0.14.0
    sha: f43e744e4ea338060faee68ed933e46e722fb7f3617e722a5772d7e856d8b3ce
  - kind: registry
    name: env_filter
    version: 1.0.0
    sha: 7a1c3cc8e57274ec99de65301228b537f1e4eedc1b8e0f9411c6caac8ae7308f
  - kind: registry
    name: env_logger
    version: 0.11.9
    sha: b2daee4ea451f429a58296525ddf28b45a3b64f1acf6587e2067437bb11e218d
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
    version: 0.19.0
    sha: b119b9796ff800751a220394b8b3613f26dd30c48f254f6837e64c464872d1c7
  - kind: registry
    name: event-listener
    version: 5.4.1
    sha: e13b66accf52311f30a0db42147dadea9850cb48cd070028831ae5f5d4b856ab
  - kind: registry
    name: event-listener-strategy
    version: 0.5.4
    sha: 8be9f3dfaaffdae2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93
  - kind: registry
    name: fallible-iterator
    version: 0.3.0
    sha: 2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649
  - kind: registry
    name: fastbloom
    version: 0.14.1
    sha: 4e7f34442dbe69c60fe8eaf58a8cafff81a1f278816d8ab4db255b3bef4ac3c4
  - kind: registry
    name: fastrand
    version: 2.3.0
    sha: 37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be
  - kind: registry
    name: fdeflate
    version: 0.3.7
    sha: 1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c
  - kind: registry
    name: ff
    version: 0.12.1
    sha: d013fc25338cc558c5c2cfbad646908fb23591e2404481826742b651c9af7160
  - kind: git
    commit: bd9eabfc14c9ad53c37b32279e276619f4390ab8
    repo: github:rust-av/ffv1.git
    query:
      rev: bd9eabfc14c9ad53c37b32279e276619f4390ab8
    name: ffv1
    version: 0.0.0
  - kind: registry
    name: field-offset
    version: 0.3.6
    sha: 38e2275cc4e4fc009b0669731a1e5ab7ebf11f469eaede2bab9309a5b4d6057f
  - kind: registry
    name: filetime
    version: 0.2.27
    sha: f98844151eee8917efc50bd9e8318cb963ae8b297431495d3f758616ea5c57db
  - kind: registry
    name: find-msvc-tools
    version: 0.1.9
    sha: 5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582
  - kind: registry
    name: fixedbitset
    version: 0.4.2
    sha: 0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80
  - kind: registry
    name: flate2
    version: 1.1.9
    sha: 843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c
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
    version: 0.1.0
    sha: 5939bac0ef2ad7c83a53e4fb889c1d81f007b07061d648cd271071984d86f257
  - kind: registry
    name: float8
    version: 0.4.2
    sha: 4203231de188ebbdfb85c11f3c20ca2b063945710de04e7b59268731e728b462
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
    name: foreign-types
    version: 0.5.0
    sha: d737d9aa519fb7b749cbc3b962edcf310a8dd1f4b67c91c4f83975dbdd17d965
  - kind: registry
    name: foreign-types-macros
    version: 0.2.3
    sha: 1a5c6c585bc94aaf2c7b51dd4c2ba22680844aba4c687be581871a6f518c5742
  - kind: registry
    name: foreign-types-shared
    version: 0.3.1
    sha: aa9a19cbb55df58761df49b23516a86d432839add4af60fc256da840f66ed35b
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
    version: 0.3.32
    sha: 8b147ee9d1f6d097cef9ce628cd2ee62288d963e16fb287bd9286455b241382d
  - kind: registry
    name: futures-channel
    version: 0.3.32
    sha: 07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d
  - kind: registry
    name: futures-core
    version: 0.3.32
    sha: 7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d
  - kind: registry
    name: futures-executor
    version: 0.3.32
    sha: baf29c38818342a3b26b5b923639e7b1f4a61fc5e76102d4b1981c6dc7a7579d
  - kind: registry
    name: futures-io
    version: 0.3.32
    sha: cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718
  - kind: registry
    name: futures-lite
    version: 2.6.1
    sha: f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad
  - kind: registry
    name: futures-macro
    version: 0.3.32
    sha: e835b70203e41293343137df5c0664546da5745f82ec9b84d40be8336958447b
  - kind: registry
    name: futures-sink
    version: 0.3.32
    sha: c39754e157331b013978ec91992bde1ac089843443c49cbc7f46150b0fad0893
  - kind: registry
    name: futures-task
    version: 0.3.32
    sha: 037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393
  - kind: registry
    name: futures-timer
    version: 3.0.3
    sha: f288b0a4f20f9a56b5d1da57e2227c661b7b16168e2f72365f57b63326e29b24
  - kind: registry
    name: futures-util
    version: 0.3.32
    sha: 389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6
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
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gdk-pixbuf
    version: 0.22.1
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gdk-pixbuf-sys
    version: 0.22.1
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4
    version: 0.11.0
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-sys
    version: 0.11.0
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-wayland
    version: 0.11.0
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-wayland-sys
    version: 0.11.0
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-win32
    version: 0.11.0
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-win32-sys
    version: 0.11.0
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-x11
    version: 0.11.0
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-x11-sys
    version: 0.11.0
  - kind: registry
    name: generic-array
    version: 0.14.7
    sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
  - kind: registry
    name: generic_singleton
    version: 0.5.1
    sha: b2d5de0fc83987dac514f3b910c5d08392b220efe8cf72086c660029a197bf73
  - kind: registry
    name: getifaddrs
    version: 0.6.0
    sha: 06f770241660efeeedb30b48ccbe0a8e6f649322148237539e71f3ccd14a4461
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
    version: 0.4.1
    sha: 139ef39800118c7683f2fd3c98c1b23c09ae076556b435f8e9064ae108aaeeec
  - kind: registry
    name: gif
    version: 0.14.1
    sha: f5df2ba84018d80c213569363bdcd0c64e6933c67fe4c1d60ecf822971a3c35e
  - kind: registry
    name: gimli
    version: 0.32.3
    sha: e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gio
    version: 0.22.1
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gio-sys
    version: 0.22.1
  - kind: registry
    name: gl_generator
    version: 0.14.0
    sha: 1a95dfc23a2b4a9a2f5ab41d194f8bfda3cabec42af4e39f08c339eb2a0c124d
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: glib
    version: 0.22.1
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: glib-macros
    version: 0.22.1
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: glib-sys
    version: 0.22.1
  - kind: registry
    name: glob
    version: 0.3.3
    sha: 0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280
  - kind: registry
    name: glow
    version: 0.16.0
    sha: c5e5ea60d70410161c8bf5da3fdfeaa1c72ed2c15f8bbb9d19fe3a4fad085f08
  - kind: registry
    name: glutin_wgl_sys
    version: 0.6.1
    sha: 2c4ee00b289aba7a9e5306d57c2d05499b2e5dc427f84ac708bd2c090212cf3e
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gobject-sys
    version: 0.22.1
  - kind: registry
    name: governor
    version: 0.10.4
    sha: 9efcab3c1958580ff1f25a2a41be1668f7603d849bb63af523b208a3cc1223b8
  - kind: registry
    name: gpu-alloc
    version: 0.6.0
    sha: fbcd2dba93594b227a1f57ee09b8b9da8892c34d55aa332e034a228d0fe6a171
  - kind: registry
    name: gpu-alloc-types
    version: 0.3.0
    sha: 98ff03b468aa837d70984d55f5d3f846f6ec31fe34bbb97c4f85219caeee1ca4
  - kind: registry
    name: gpu-allocator
    version: 0.27.0
    sha: c151a2a5ef800297b4e79efa4f4bec035c5f51d5ae587287c9b952bdf734cacd
  - kind: registry
    name: gpu-descriptor
    version: 0.3.2
    sha: b89c83349105e3732062a895becfc71a8f921bb71ecbbdd8ff99263e3b53a0ca
  - kind: registry
    name: gpu-descriptor-types
    version: 0.2.0
    sha: fdf242682df893b86f33a73828fb09ca4b2d3bb6cc95249707fc684d27484b91
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: graphene-rs
    version: 0.22.1
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: graphene-sys
    version: 0.22.1
  - kind: registry
    name: group
    version: 0.12.1
    sha: 5dfbfb3a6cfbd390d5c9564ab283a0349b9b9fcd46a706c1eb10e0db70bfbac7
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gsk4
    version: 0.11.0
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gsk4-sys
    version: 0.11.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-allocators
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-allocators-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-analytics
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-analytics-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-app
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-app-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-audio
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-audio-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-base
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-base-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-check
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-check-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-egl
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-egl-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-wayland
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-wayland-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-x11
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-x11-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-net
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-net-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-pbutils
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-pbutils-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-rtp
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-rtp-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-sdp
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-sdp-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-tag
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-tag-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-utils
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-validate
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-validate-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-video
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-video-sys
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-webrtc
    version: 0.25.0
  - kind: git
    commit: fc295232362082c654232fbd84e95d94bc296efe
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-webrtc-sys
    version: 0.25.0
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gtk4
    version: 0.11.0
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gtk4-macros
    version: 0.11.0
  - kind: git
    commit: 12259c689cf3278ace2b82452cbcaba8c4942020
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gtk4-sys
    version: 0.11.0
  - kind: registry
    name: h2
    version: 0.3.27
    sha: 0beca50380b1fc32983fc1cb4587bfa4bb9e78fc259aad4a0032d2080309222d
  - kind: registry
    name: h2
    version: 0.4.13
    sha: 2f44da3a8150a6703ed5d34e164b875fd14c2cdab9af1252a9a1020bde2bdc54
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
    version: 0.5.2
    sha: fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c
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
    version: 1.4.0
    sha: e3ba2a386d7f85a81f119ad7498ebe444d2e22c2af0b86b069416ace48b3311a
  - kind: registry
    name: http-body
    version: 0.4.6
    sha: 7ceab25649e9960c0311ea418d17bee82c0dcec1bd053b5f9a66e265a693bed2
  - kind: registry
    name: http-body
    version: 1.0.1
    sha: 1efedce1fb8e6913f23e0c92de8e62cd5b772a67e7b3946df930a62566c93184
  - kind: registry
    name: http-body-util
    version: 0.1.3
    sha: b021d93e26becf5dc7e1b75b1bed1fd93124b374ceb73f43d4d4eafec896a64a
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
    name: hyper
    version: 0.14.32
    sha: 41dfc780fdec9373c01bae43289ea34c972e40ee3c9f6b3c8801a35f35586ce7
  - kind: registry
    name: hyper
    version: 1.8.1
    sha: 2ab2d4f250c3d7b1c9fcdff1cece94ea4e2dfbec68614f7b87cb205f24ca9d11
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
    version: 0.27.7
    sha: e3c93eb611681b207e1fe55d5a71ecf91572ec8a6705cdb6857f7d8d5242cf58
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
    version: 2.1.1
    sha: 4c6b649701667bbe825c3b7e6388cb521c23d88644678e83c0c4d0a621a34b43
  - kind: registry
    name: icu_locale
    version: 2.1.1
    sha: 532b11722e350ab6bf916ba6eb0efe3ee54b932666afec989465f9243fe6dd60
  - kind: registry
    name: icu_locale_core
    version: 2.1.1
    sha: edba7861004dd3714265b4db54a3c390e880ab658fec5f7db895fae2046b5bb6
  - kind: registry
    name: icu_locale_data
    version: 2.1.2
    sha: 1c5f1d16b4c3a2642d3a719f18f6b06070ab0aef246a6418130c955ae08aa831
  - kind: registry
    name: icu_normalizer
    version: 2.1.1
    sha: 5f6c8828b67bf8908d82127b2054ea1b4427ff0230ee9141c54251934ab1b599
  - kind: registry
    name: icu_normalizer_data
    version: 2.1.1
    sha: 7aedcccd01fc5fe81e6b489c15b247b8b0690feb23304303a9e560f37efc560a
  - kind: registry
    name: icu_properties
    version: 2.1.2
    sha: 020bfc02fe870ec3a66d93e677ccca0562506e5872c650f893269e08615d74ec
  - kind: registry
    name: icu_properties_data
    version: 2.1.2
    sha: 616c294cf8d725c6afcd8f55abc17c56464ef6211f9ed59cccffe534129c77af
  - kind: registry
    name: icu_provider
    version: 2.1.1
    sha: 85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614
  - kind: registry
    name: icu_segmenter
    version: 2.1.2
    sha: a807a7488f3f758629ae86d99d9d30dce24da2fb2945d74c80a4f4a62c71db73
  - kind: registry
    name: icu_segmenter_data
    version: 2.1.1
    sha: 6ebbb7321d9e21d25f5660366cb6c08201d0175898a3a6f7a41ee9685af21c80
  - kind: registry
    name: id-arena
    version: 2.3.0
    sha: 3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954
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
    version: 1.2.1
    sha: 3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344
  - kind: registry
    name: image
    version: 0.25.9
    sha: e6506c6c10786659413faa717ceebcb8f70731c0a60cbae39795fdf114519c1a
  - kind: registry
    name: image_hasher
    version: 3.1.0
    sha: 300d892b049fb36ce62fb515b68aeade53dca784bc02093e359edc6625c479ac
  - kind: registry
    name: imgref
    version: 1.12.0
    sha: e7c5cedc30da3a610cac6b4ba17597bdf7152cf974e8aab3afb3d54455e371c8
  - kind: registry
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.13.0
    sha: 7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017
  - kind: registry
    name: indicatif
    version: 0.18.4
    sha: 25470f23803092da7d239834776d653104d551bc4d7eacaf31e6837854b8e9eb
  - kind: registry
    name: inout
    version: 0.1.4
    sha: 879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01
  - kind: registry
    name: interpolate_name
    version: 0.2.4
    sha: c34819042dc3d3971c46c2190835914dfbe0c3c13f61449b2997f4e9722dfa60
  - kind: registry
    name: ipnet
    version: 2.11.0
    sha: 469fb0b9cefa57e3ef31275ee7cacb78f2fdca44e4765491884a2b119d4eb130
  - kind: registry
    name: iri-string
    version: 0.7.10
    sha: c91338f0783edbd6195decb37bae672fd3b165faffb89bf7b9e6942f8b1a731a
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
    version: 0.6.3
    sha: e1082f0c48f143442a1ac6122f67e360ceee130b967af4d50996e5154a45df46
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
    name: itoa
    version: 1.0.17
    sha: 92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2
  - kind: registry
    name: jiff
    version: 0.2.20
    sha: c867c356cc096b33f4981825ab281ecba3db0acefe60329f044c1789d94c6543
  - kind: registry
    name: jiff-static
    version: 0.2.20
    sha: f7946b4325269738f270bb55b3c19ab5c5040525f83fd625259422a9d25d9be5
  - kind: registry
    name: jni
    version: 0.21.1
    sha: 1a87aa2bb7d2af34197c04845522473242e1aa17c12f4935d5856491a7fb8c97
  - kind: registry
    name: jni-sys
    version: 0.3.0
    sha: 8eaf4bc02d17cbdd7ff4c7438cafcdf7fb9a4613313ad11b4f8fefe7d3fa0130
  - kind: registry
    name: jobserver
    version: 0.1.34
    sha: 9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33
  - kind: registry
    name: js-sys
    version: 0.3.86
    sha: d36139f1c97c42c0c86a411910b04e48d4939a0376e6e0f989420cbdee0120e5
  - kind: registry
    name: jsonwebtoken
    version: 9.3.1
    sha: 5a87cc7a48537badeae96744432de36f4be2b4a34a05a5ef32e9dd8a1c169dde
  - kind: registry
    name: khronos-egl
    version: 6.0.0
    sha: 6aae1df220ece3c0ada96b8153459b67eebe9ae9212258bb0134ae60416fdf76
  - kind: registry
    name: khronos_api
    version: 3.1.0
    sha: e2db585e1d738fc771bf08a151420d3ed193d9d895a36df7f6f8a9456b911ddc
  - kind: registry
    name: kstring
    version: 2.0.2
    sha: 558bf9508a558512042d3095138b1f7b8fe90c5467d94f9f1da28b3731c5dbd1
  - kind: registry
    name: lazy_static
    version: 1.5.0
    sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
  - kind: registry
    name: leb128fmt
    version: 0.1.0
    sha: 09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2
  - kind: registry
    name: lewton
    version: 0.10.2
    sha: 777b48df9aaab155475a83a7df3070395ea1ac6902f5cd062b8f2b028075c030
  - kind: registry
    name: libbz2-rs-sys
    version: 0.2.2
    sha: 2c4a545a15244c7d945065b5d392b2d2d7f21526fba56ce51467b06ed445e8f7
  - kind: registry
    name: libc
    version: 0.2.182
    sha: 6800badb6cb2082ffd7b6a67e6125bb39f18782f793520caee8cb8846be06112
  - kind: registry
    name: libfuzzer-sys
    version: 0.4.12
    sha: f12a681b7dd8ce12bff52488013ba614b869148d54dd79836ab85aafdd53f08d
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
    version: 0.4.6
    sha: b6033b77c21d1f56deeae8014eb9fbe7bdf1765185a6c508b5ca82eeaed7f899
  - kind: registry
    name: liblzma-sys
    version: 0.4.5
    sha: 9f2db66f3268487b5033077f266da6777d057949b8f93c8ad82e441df25e6186
  - kind: registry
    name: libm
    version: 0.2.16
    sha: b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981
  - kind: registry
    name: libredox
    version: 0.1.12
    sha: 3d0b95e02c851351f877147b7deea7b1afb1df71b63aa5f8270716e0c5720616
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
    version: 0.11.0
    sha: df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039
  - kind: registry
    name: linux-raw-sys
    version: 0.4.15
    sha: d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab
  - kind: registry
    name: litemap
    version: 0.8.1
    sha: 6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77
  - kind: registry
    name: litrs
    version: 1.0.0
    sha: 11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092
  - kind: registry
    name: livekit-api
    version: 0.4.14
    sha: fa90c56d727f9e51b6ab5ce6b14262d4817900c72a8a346a4f7208bde98207e6
  - kind: registry
    name: livekit-protocol
    version: 0.7.1
    sha: 01875112fb961da484dedf0c2d5705d8875c5e99da6d5aa1d567be1b7d03532a
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
    version: 0.4.29
    sha: 5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897
  - kind: registry
    name: lru
    version: 0.16.3
    sha: a1dc47f592c06f33f8e3aea9591776ec7c9f9e4124778ff8a3c3b87159f7e593
  - kind: registry
    name: lru-slab
    version: 0.1.2
    sha: 112b39cec0b298b6c1999fee3e31427f74f676e4cb9879ed1a121b43661a4154
  - kind: registry
    name: lzma-rust2
    version: 0.15.7
    sha: 1670343e58806300d87950e3401e820b519b9384281bbabfb15e3636689ffd69
  - kind: registry
    name: m3u8-rs
    version: 6.0.0
    sha: f03cd3335fb5f2447755d45cda9c70f76013626a9db44374973791b0926a86c3
  - kind: registry
    name: malloc_buf
    version: 0.0.6
    sha: 62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb
  - kind: registry
    name: matchers
    version: 0.2.0
    sha: d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9
  - kind: registry
    name: matrixmultiply
    version: 0.3.10
    sha: a06de3016e9fae57a36fd14dba131fccf49f74b40b7fbdb472f96e361ec71a08
  - kind: registry
    name: maybe-rayon
    version: 0.1.1
    sha: 8ea1f30cedd69f0a2954655f7188c6a834246d2bcf1e315e2ac40c4b24dc9519
  - kind: registry
    name: md-5
    version: 0.10.6
    sha: d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf
  - kind: registry
    name: md5
    version: 0.8.0
    sha: ae960838283323069879657ca3de837e9f7bbb4c7bf6ea7f1b290d5e9476d2e0
  - kind: registry
    name: memchr
    version: 2.8.0
    sha: f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79
  - kind: registry
    name: memmap2
    version: 0.9.10
    sha: 714098028fe011992e1c3962653c96b2d578c4b4bce9036e15ff220319b1e0e3
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: metal
    version: 0.32.0
    sha: 00c15a6f673ff72ddcc22394663290f870fb224c1bfce55734a75c414150e605
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
    name: mio
    version: 1.1.1
    sha: a69bcab0ad47271a0234d9422b131806bf3968021e5dc9328caf2d4cd58557fc
  - kind: registry
    name: more-asserts
    version: 0.3.1
    sha: 1fafa6961cabd9c63bcd77a45d7e3b7f3b552b70417831fb0f56db717e72407e
  - kind: registry
    name: moxcms
    version: 0.7.11
    sha: ac9557c559cd6fc9867e122e20d2cbefc9ca29d80d027a8e39310920ed2f0a97
  - kind: registry
    name: mp4-atom
    version: 0.10.1
    sha: 5e8e949244bbd26ea7eb6d936af3a6a0202be68bcfc9afce700f3c9026860ff7
  - kind: registry
    name: muldiv
    version: 1.0.1
    sha: 956787520e75e9bd233246045d19f42fb73242759cc57fba9611d940ae96d4b0
  - kind: registry
    name: multimap
    version: 0.10.1
    sha: 1d87ecb2933e8aeadb3e3a02b828fed80a7528047e68b4f424523a0981a3a084
  - kind: registry
    name: naga
    version: 26.0.0
    sha: 916cbc7cb27db60be930a4e2da243cf4bc39569195f22fd8ee419cd31d5b662c
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
    version: 0.30.1
    sha: 74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6
  - kind: registry
    name: nnnoiseless
    version: 0.5.2
    sha: 805d5964d1e7a0006a7fdced7dae75084d66d18b35f1dfe81bd76929b1f8da0c
  - kind: registry
    name: no-std-compat
    version: 0.2.0
    sha: df270209a7f04d62459240d890ecb792714d5db12c92937823574a09930276b4
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
    version: 0.4.6
    sha: a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9
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
    version: 0.2.0
    sha: cf97ec579c3c42f953ef76dbf8d55ac91fb219dde70e49aa4a6b7d74e9919050
  - kind: registry
    name: num-derive
    version: 0.4.2
    sha: ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202
  - kind: registry
    name: num-integer
    version: 0.1.46
    sha: 7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f
  - kind: registry
    name: num-iter
    version: 0.1.45
    sha: 1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf
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
    name: objc
    version: 0.2.7
    sha: 915b1b472bc21c53464d6c8461c9d3af805ba1ef837e1cac254428f4a77177b1
  - kind: registry
    name: objc2
    version: 0.6.3
    sha: b7c2599ce0ec54857b29ce62166b0ed9b4f6f1a70ccc9a71165b6154caca8c05
  - kind: registry
    name: objc2-app-kit
    version: 0.3.2
    sha: d49e936b501e5c5bf01fda3a9452ff86dc3ea98ad5f283e1455153142d97518c
  - kind: registry
    name: objc2-core-foundation
    version: 0.3.2
    sha: 2a180dd8642fa45cdb7dd721cd4c11b1cadd4929ce112ebd8b9f5803cc79d536
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
    version: 1.21.3
    sha: 42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d
  - kind: registry
    name: once_cell_polyfill
    version: 1.70.2
    sha: 384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe
  - kind: registry
    name: open
    version: 5.3.3
    sha: 43bb73a7fa3799b198970490a51174027ba0d4ec504b03cd08caf513d40024bc
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
    version: 5.0.0
    sha: e2c1f9f56e534ac6a9b8a4600bdf0f530fb393b5f393e7b4d03489c3cf0c3f01
  - kind: registry
    name: outref
    version: 0.5.2
    sha: 1a80800c0488c3a21695ea981a54918fbb37abf04f4d0720c453632255e2ff0e
  - kind: registry
    name: p256
    version: 0.11.1
    sha: 51f44edd08f51e2ade572f141051021c5af22677e42b7dd28a88155151c33594
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pango
    version: 0.22.1
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pango-sys
    version: 0.22.1
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pangocairo
    version: 0.22.1
  - kind: git
    commit: aa0dee233fcefd2d938a9f8024eac0e4a2eeb0a3
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pangocairo-sys
    version: 0.22.1
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
    version: 0.4.0
    sha: fbc23fdb8bbf668d582b0c17120bf6b7f91d85ccad3a5b39706f019a4efda005
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
    version: 0.2.1
    sha: b867cad97c0791bbd3aaa6472142568c6c9e8f71937e98379f584cfb0cf35bec
  - kind: registry
    name: pathdiff
    version: 0.2.3
    sha: df94ce210e5bc13cb6651479fa48d14f601d9858cfe0467f43ae157023b938d3
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
    name: pcap-file
    version: 2.0.0
    sha: 1fc1f139757b058f9f37b76c48501799d12c9aa0aa4c0d4c980b062ee925d1b2
  - kind: registry
    name: pem
    version: 3.0.6
    sha: 1d30c53c26bc5b31a98cd02d20f25a7c8567146caf63ed593a9d87b2775291be
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
    name: pin-project
    version: 1.1.10
    sha: 677f1add503faace112b9f1373e43e9e054bfdd22ff1a63c1bc485eaec6a6a8a
  - kind: registry
    name: pin-project-internal
    version: 1.1.10
    sha: 6e918e4ff8c4549eb882f14b3a4bc8c8bc93de829416eacf579f1207a8fbf861
  - kind: registry
    name: pin-project-lite
    version: 0.2.16
    sha: 3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b
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
    name: pkcs8
    version: 0.9.0
    sha: 9eca2c590a5f85da82668fa685c09ce2888b9430e83299debf1f34b65fd4a4ba
  - kind: registry
    name: pkg-config
    version: 0.3.32
    sha: 7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c
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
    version: 1.13.1
    sha: c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49
  - kind: registry
    name: portable-atomic-util
    version: 0.2.5
    sha: 7a9db96d7fa8782dd8c15ce32ffe8680bbd1e978a43bf51a34d39483540495f5
  - kind: registry
    name: potential_utf
    version: 0.1.4
    sha: b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - kind: registry
    name: ppmd-rust
    version: 1.4.0
    sha: efca4c95a19a79d1c98f791f10aebd5c1363b473244630bb7dbde1dc98455a24
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
    name: primal-check
    version: 0.3.4
    sha: dc0d895b311e3af9902528fbb8f928688abbd95872819320517cc24ca6b2bd08
  - kind: registry
    name: priority-queue
    version: 2.7.0
    sha: 93980406f12d9f8140ed5abe7155acb10bb1e69ea55c88960b9c2f117445ef96
  - kind: registry
    name: proc-macro-crate
    version: 3.4.0
    sha: 219cb19e96be00ab2e37d6e299658a0cfa83e52429179969b0f0121b4ac46983
  - kind: registry
    name: proc-macro-error-attr2
    version: 2.0.0
    sha: 96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5
  - kind: registry
    name: proc-macro-error2
    version: 2.0.1
    sha: 11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802
  - kind: registry
    name: proc-macro2
    version: 1.0.106
    sha: 8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934
  - kind: registry
    name: profiling
    version: 1.0.17
    sha: 3eb8486b569e12e2c32ad3e204dbaba5e4b5b216e9367044f25f1dba42341773
  - kind: registry
    name: profiling-procmacros
    version: 1.0.17
    sha: 52717f9a02b6965224f95ca2a81e2e0c5c43baacd28ca057577988930b6c3d5b
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
    name: pxfm
    version: 0.1.27
    sha: 7186d3822593aa4393561d186d1393b3923e9d6163d3fbfd6e825e3e6cf3e6a8
  - kind: registry
    name: pyo3
    version: 0.28.2
    sha: cf85e27e86080aafd5a22eae58a162e133a589551542b3e5cee4beb27e54f8e1
  - kind: registry
    name: pyo3-build-config
    version: 0.28.2
    sha: 8bf94ee265674bf76c09fa430b0e99c26e319c945d96ca0d5a8215f31bf81cf7
  - kind: registry
    name: pyo3-ffi
    version: 0.28.2
    sha: 491aa5fc66d8059dd44a75f4580a2962c1862a1c2945359db36f6c2818b748dc
  - kind: registry
    name: pyo3-macros
    version: 0.28.2
    sha: f5d671734e9d7a43449f8480f8b38115df67bef8d21f76837fa75ee7aaa5e52e
  - kind: registry
    name: pyo3-macros-backend
    version: 0.28.2
    sha: 22faaa1ce6c430a1f71658760497291065e6450d7b5dc2bcf254d49f66ee700a
  - kind: registry
    name: quick-xml
    version: 0.38.4
    sha: b66c2058c55a409d601666cffe35f04333cf1013010882cec174a7467cd4e21c
  - kind: registry
    name: quick-xml
    version: 0.39.2
    sha: 958f21e8e7ceb5a1aa7fa87fab28e7c75976e0bfe7e23ff069e0a260f894067d
  - kind: registry
    name: quinn
    version: 0.11.9
    sha: b9e20a958963c291dc322d98411f541009df2ced7b5a4f2bd52337638cfccf20
  - kind: registry
    name: quinn-proto
    version: 0.11.13
    sha: f1906b49b0c3bc04b5fe5d86a77925ae6524a19b816ae38ce1e426255f1d8a31
  - kind: registry
    name: quinn-udp
    version: 0.5.14
    sha: addec6a0dcad8a8d96a771f815f0eaf55f9d1805756410b39f5fa81332574cbd
  - kind: registry
    name: quote
    version: 1.0.44
    sha: 21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4
  - kind: registry
    name: r-efi
    version: 5.3.0
    sha: 69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f
  - kind: registry
    name: rand
    version: 0.10.0
    sha: bc266eb313df6c5c09c1c7b1fbe2510961e5bcd3add930c1e31f7ed9da0feff8
  - kind: registry
    name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - kind: registry
    name: rand
    version: 0.9.2
    sha: 6db2770f06117d490610c7488547d543617b21bfa07796d7a12f6f1bd53850d1
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
    version: 0.10.0
    sha: 0c8d0fd677905edcbeedbf2edb6494d676f0e98d54d5cf9bda0b061cb8fb8aba
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
    name: range-alloc
    version: 0.1.4
    sha: c3d6831663a5098ea164f89cff59c6284e95f4e3c76ce9848d4529f5ccca9bde
  - kind: registry
    name: raptorq
    version: 2.0.0
    sha: 90b1b1fad69672f0b901b5004863ea4307f03d168a3db5f2bcba4d3dfed88e97
  - kind: registry
    name: rav1e
    version: 0.8.1
    sha: 43b6dd56e85d9483277cde964fd1bdb0428de4fec5ebba7540995639a21cb32b
  - kind: registry
    name: raw-window-handle
    version: 0.6.2
    sha: 20675572f6f24e9e76ef639bc5552774ed45f1c30e2951e1e99c59888861c539
  - kind: registry
    name: rawpointer
    version: 0.2.1
    sha: 60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3
  - kind: registry
    name: rayon
    version: 1.11.0
    sha: 368f01d005bf8fd9b1206fb6fa653e6c4a81ceb1466406b81792d87c5677a58f
  - kind: registry
    name: rayon-core
    version: 1.13.0
    sha: 22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91
  - kind: registry
    name: rcgen
    version: 0.14.7
    sha: 10b99e0098aa4082912d4c649628623db6aba77335e4f4569ff5083a6448b32e
  - kind: registry
    name: realfft
    version: 3.5.0
    sha: f821338fddb99d089116342c46e9f1fbf3828dba077674613e734e01d6ea8677
  - kind: registry
    name: redox_syscall
    version: 0.5.18
    sha: ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d
  - kind: registry
    name: redox_syscall
    version: 0.7.1
    sha: 35985aa610addc02e24fc232012c86fd11f14111180f902b67e2d5331f8ebf2b
  - kind: registry
    name: redox_users
    version: 0.5.2
    sha: a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac
  - kind: registry
    name: ref-cast
    version: 1.0.25
    sha: f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d
  - kind: registry
    name: ref-cast-impl
    version: 1.0.25
    sha: b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da
  - kind: registry
    name: regex
    version: 1.12.3
    sha: e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276
  - kind: registry
    name: regex-automata
    version: 0.4.14
    sha: 6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f
  - kind: registry
    name: regex-lite
    version: 0.1.9
    sha: cab834c73d247e67f4fae452806d17d3c7501756d98c8808d7c9c7aa7d18f973
  - kind: registry
    name: regex-syntax
    version: 0.8.9
    sha: a96887878f22d7bad8a3b6dc5b7440e0ada9a245242924394987b21cf2210a4c
  - kind: registry
    name: renderdoc-sys
    version: 1.1.0
    sha: 19b30a45b0cd0bcca8037f3d0dc3421eaf95327a17cad11964fb8179b4fc4832
  - kind: registry
    name: reqwest
    version: 0.12.28
    sha: eddd3ca559203180a307f12d114c268abf583f59b03cb906fd0b3ff8646c1147
  - kind: registry
    name: rfc6979
    version: 0.3.1
    sha: 7743f17af12fa0b03b803ba12cd6a8d9483a587e89c69445e3909655c0b9fabb
  - kind: registry
    name: rgb
    version: 0.8.52
    sha: 0c6a884d2998352bb4daf0183589aec883f16a6da1f4dde84d8e2e9a5409a1ce
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
    version: 0.10.1
    sha: ffbe87d9e8db95652c25ded2418150e00b08c2fde09e23ec15896d2c470c6631
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
    version: 0.1.27
    sha: b50b8869d9fc858ce7266cce0194bd74df58b9d0e3f6df3a9fc8eb470d95c09d
  - kind: registry
    name: rustc-hash
    version: 1.1.0
    sha: 08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2
  - kind: registry
    name: rustc-hash
    version: 2.1.1
    sha: 357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d
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
    version: 1.1.3
    sha: 146c9e247ccc180c1f61615433868c99f3de3ae256a30a43b49f67c2d9171f34
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
    version: 0.23.36
    sha: c665f33d38cea657d9614f766881e4d510e0eda4239891eea56b4cadcf01801b
  - kind: registry
    name: rustls-native-certs
    version: 0.6.3
    sha: a9aace74cb666635c918e9c12bc0d348266037aa8eb599b5cba565709a8dff00
  - kind: registry
    name: rustls-native-certs
    version: 0.7.3
    sha: e5bfb394eeed242e909609f56089eecfe5fda225042e8b171791b9c95f5931e5
  - kind: registry
    name: rustls-native-certs
    version: 0.8.3
    sha: 612460d5f7bea540c490b2b6395d8e34a953e52b491accd6c86c8164c5932a63
  - kind: registry
    name: rustls-pemfile
    version: 1.0.4
    sha: 1c74cae0a4cf6ccbbf5f359f08efdf8ee7e1dc532573bf0db71968cb56b1448c
  - kind: registry
    name: rustls-pemfile
    version: 2.2.0
    sha: dce314e5fee3f39953d46bb63bb8a46d40c2f8fb7cc5a3b6cab2bde9721d6e50
  - kind: registry
    name: rustls-pki-types
    version: 1.14.0
    sha: be040f8b0a225e40375822a563fa9524378b9d63112f53e19ffff34df5d33fdd
  - kind: registry
    name: rustls-platform-verifier
    version: 0.6.2
    sha: 1d99feebc72bae7ab76ba994bb5e121b8d83d910ca40b36e0921f53becc41784
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
    version: 0.103.9
    sha: d7df23109aa6c1567d1c575b9952556388da57401e4ace1d15f79eedad0d8f53
  - kind: registry
    name: rustversion
    version: 1.0.22
    sha: b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d
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
    name: scc
    version: 2.4.0
    sha: 46e6f046b7fef48e2660c57ed794263155d713de679057f2d0c169bfc6e756cc
  - kind: registry
    name: schannel
    version: 0.1.28
    sha: 891d81b926048e76efe18581bf793546b4c0eaf8448d72be8de2bbee5fd166e1
  - kind: registry
    name: schemars
    version: 0.9.0
    sha: 4cd191f9397d57d581cddd31014772520aa448f65ef991055d7f61582c65165f
  - kind: registry
    name: schemars
    version: 1.2.1
    sha: a2b42f36aa1cd011945615b92222f6bf73c599a102a300334cd7f8dbeec726cc
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
    name: sdd
    version: 3.0.10
    sha: 490dcfcbfef26be6800d11870ff2df8774fa6e86d047e3e8c8a76b25655e41ca
  - kind: registry
    name: sdp-types
    version: 0.1.8
    sha: 9bb6c636ace20de73fb9536017f9ef069b258308a6c341a4aaf3d2fd11afc570
  - kind: registry
    name: sec1
    version: 0.3.0
    sha: 3be24c1842290c45df0a7bf069e0c268a747ad05a192f2fd7dcfdbc1cba40928
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
    version: 1.0.27
    sha: d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2
  - kind: registry
    name: serde
    version: 1.0.228
    sha: 9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e
  - kind: registry
    name: serde_bytes
    version: 0.11.19
    sha: a5d440709e79d88e51ac01c4b72fc6cb7314017bb7da9eeff678aa94c10e3ea8
  - kind: registry
    name: serde_core
    version: 1.0.228
    sha: 41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad
  - kind: registry
    name: serde_derive
    version: 1.0.228
    sha: d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79
  - kind: registry
    name: serde_json
    version: 1.0.149
    sha: 83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86
  - kind: registry
    name: serde_path_to_error
    version: 0.1.20
    sha: 10a9ff822e371bb5403e391ecd83e182e0e77ba7f6fe0160b795797109d1b457
  - kind: registry
    name: serde_spanned
    version: 1.0.4
    sha: f8bbf91e5a4d6315eee45e704372590b30e260ee83af6639d64557f51b067776
  - kind: registry
    name: serde_urlencoded
    version: 0.7.1
    sha: d3491c14715ca2294c4d6a88f15e84739788c1d030eed8c110436aafdaa2f3fd
  - kind: registry
    name: serde_with
    version: 3.16.1
    sha: 4fa237f2807440d238e0364a218270b98f767a00d3dada77b1c53ae88940e2e7
  - kind: registry
    name: serde_with_macros
    version: 3.16.1
    sha: 52a8e3ca0ca629121f70ab50f95249e5a6f925cc0f6ffe8256c45b728875706c
  - kind: registry
    name: serial_test
    version: 3.3.1
    sha: 0d0b343e184fc3b7bb44dff0705fffcf4b3756ba6aff420dddd8b24ca145e555
  - kind: registry
    name: serial_test_derive
    version: 3.3.1
    sha: 6f50427f258fb77356e4cd4aa0e87e2bd2c66dbcee41dc405282cae2bfc26c83
  - kind: registry
    name: sfv
    version: 0.14.0
    sha: 0d471eaefb14f4b30032525bdb124b36e55ba9cb1292080e06f1a236cd10fe87
  - kind: registry
    name: sha1
    version: 0.10.6
    sha: e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba
  - kind: registry
    name: sha2
    version: 0.10.9
    sha: a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283
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
    name: signal-hook
    version: 0.4.3
    sha: 3b57709da74f9ff9f4a27dce9526eec25ca8407c45a7887243b031a58935fb8e
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
    version: 0.3.8
    sha: e320a6c5ad31d271ad523dcf3ad13e2767ad8b1cb8f047f75a8aeaf8da139da2
  - kind: registry
    name: simd_helpers
    version: 0.1.0
    sha: 95890f873bec569a0362c235787f3aca6e1e887302ba4840839bcc6459c42da6
  - kind: registry
    name: siphasher
    version: 1.0.2
    sha: b2aa850e253778c88a04c3d7323b043aeda9d3e30d5971937c1855769763678e
  - kind: registry
    name: skia-bindings
    version: 0.93.0
    sha: cbb363ec9c62e2b0f48c7f62f1cb53ede1a4fcaec4640205197e27e8bfad07d2
  - kind: registry
    name: skia-safe
    version: 0.93.0
    sha: f5b1e4737fcde38a2bbe414ba4fbdaaec9e925f13642e4a81941225d399b007c
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
    version: 1.15.1
    sha: 67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03
  - kind: registry
    name: smawk
    version: 0.3.2
    sha: b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c
  - kind: registry
    name: socket2
    version: 0.5.10
    sha: e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678
  - kind: registry
    name: socket2
    version: 0.6.2
    sha: 86f4aa3ad99f2088c990dfa82d367e19cb29268ed67c574d10d0a4bfe71f07e0
  - kind: registry
    name: sodiumoxide
    version: 0.2.7
    sha: e26be3acb6c2d9a7aac28482586a7856436af4cfe7100031d219de2d2ecb0028
  - kind: registry
    name: spin
    version: 0.10.0
    sha: d5fe4ccb98d9c292d56fec89a5e07da7fc4cf0dc11e156b41793132775d3e591
  - kind: registry
    name: spin
    version: 0.9.8
    sha: 6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67
  - kind: registry
    name: spinning_top
    version: 0.3.0
    sha: d96d2d1d716fb500937168cc09353ffdc7a012be8475ac7308e1bdf0e3923300
  - kind: registry
    name: spirv
    version: 0.3.0+sdk-1.3.268.0
    sha: eda41003dc44290527a59b13432d4a0379379fa074b70174882adfbdfd917844
  - kind: registry
    name: spki
    version: 0.6.0
    sha: 67cf02bbac7a337dc36e4f5a693db6c21e7863f45070f7064577eb4367a3212b
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
    version: 0.4.1
    sha: d1dff32a2ce087283bec878419027cebd888760d8760b2941ad0843531dc9ec8
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
    version: 2.0.117
    sha: e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99
  - kind: registry
    name: sync_wrapper
    version: 1.0.2
    sha: 0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263
  - kind: registry
    name: synstructure
    version: 0.13.2
    sha: 728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2
  - kind: registry
    name: sysinfo
    version: 0.36.1
    sha: 252800745060e7b9ffb7b2badbd8b31cfa4aa2e61af879d0a3bf2a317c20217d
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
    version: 7.0.7
    sha: 48c8f33736f986f16d69b6cb8b03f55ddcad5c41acc4ccc39dd88e84aa805e7f
  - kind: registry
    name: tar
    version: 0.4.44
    sha: 1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a
  - kind: registry
    name: target-lexicon
    version: 0.12.16
    sha: 61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1
  - kind: registry
    name: target-lexicon
    version: 0.13.5
    sha: adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca
  - kind: registry
    name: tempfile
    version: 3.25.0
    sha: 0136791f7c95b1f6dd99f9cc786b91bb81c3800b639b3478e561ddb7be95e5f1
  - kind: registry
    name: termcolor
    version: 1.4.1
    sha: 06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755
  - kind: registry
    name: test-log
    version: 0.2.19
    sha: 37d53ac171c92a39e4769491c4b4dde7022c60042254b5fc044ae409d34a24d4
  - kind: registry
    name: test-log-macros
    version: 0.2.19
    sha: be35209fd0781c5401458ab66e4f98accf63553e8fae7425503e92fdd319783b
  - kind: registry
    name: test-with
    version: 0.15.7
    sha: 0d12b38781f6705ffaea00c4463a4ae8fdd4174eb8cefb81a047f7f61cba5179
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
    version: 0.16.2
    sha: c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057
  - kind: registry
    name: thiserror
    version: 1.0.69
    sha: b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52
  - kind: registry
    name: thiserror
    version: 2.0.18
    sha: 4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4
  - kind: registry
    name: thiserror-impl
    version: 1.0.69
    sha: 4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1
  - kind: registry
    name: thiserror-impl
    version: 2.0.18
    sha: ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5
  - kind: registry
    name: thread_local
    version: 1.1.9
    sha: f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185
  - kind: registry
    name: time
    version: 0.3.47
    sha: 743bd48c283afc0388f9b8827b976905fb217ad9e647fae3a379a9283c4def2c
  - kind: registry
    name: time-core
    version: 0.1.8
    sha: 7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca
  - kind: registry
    name: time-macros
    version: 0.2.27
    sha: 2e70e4c5a0e0a8a4823ad65dfe1a6930e4f4d756dcd9dd7939022b5e8c501215
  - kind: registry
    name: tiny-keccak
    version: 2.0.2
    sha: 2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237
  - kind: registry
    name: tinystr
    version: 0.8.2
    sha: 42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869
  - kind: registry
    name: tinyvec
    version: 1.10.0
    sha: bfa5fdc3bce6191a1dbc8c02d5c8bffcf557bafa17c124c5264a458f1b0613fa
  - kind: registry
    name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - kind: registry
    name: tokio
    version: 1.49.0
    sha: 72a2903cd7736441aac9df9d7688bd0ce48edccaadf181c3b90be801e81d3d86
  - kind: registry
    name: tokio-macros
    version: 2.6.0
    sha: af407857209536a95c8e56f8231ef2c2e2aff839b22e07a1ffcbc617e9db9fa5
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
    version: 0.26.4
    sha: 1729aa945f29d91ba541258c8df89027d5792d85a8841fb65e8bf0f4ede4ef61
  - kind: registry
    name: tokio-stream
    version: 0.1.18
    sha: 32da49809aab5c3bc678af03902d4ccddea2a87d028d86392a4b1560c6906c70
  - kind: registry
    name: tokio-tungstenite
    version: 0.20.1
    sha: 212d5dcb2a1ce06d81107c3d0ffa3121fe974b73f068c8282cb1c32328113b6c
  - kind: registry
    name: tokio-tungstenite
    version: 0.27.0
    sha: 489a59b6730eda1b0171fcfda8b121f4bee2b35cba8645ca35c5f7ba3eb736c1
  - kind: registry
    name: tokio-tungstenite
    version: 0.28.0
    sha: d25a406cddcc431a75d3d9afc6a7c0f7428d4891dd973e4d54c56b46127bf857
  - kind: registry
    name: tokio-util
    version: 0.7.18
    sha: 9ae9cec805b01e8fc3fd2fe289f89149a9b66dd16786abd8b19cfa7b48cb0098
  - kind: registry
    name: toml
    version: 0.9.12+spec-1.1.0
    sha: cf92845e79fc2e2def6a5d828f0801e29a2f8acc037becc5ab08595c7d5e9863
  - kind: registry
    name: toml_datetime
    version: 0.7.5+spec-1.1.0
    sha: 92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347
  - kind: registry
    name: toml_edit
    version: 0.23.10+spec-1.0.0
    sha: 84c8b9f757e028cee9fa244aea147aab2a9ec09d5325a9b01e0a49730c2b5269
  - kind: registry
    name: toml_edit
    version: 0.24.1+spec-1.1.0
    sha: 01f2eadbbc6b377a847be05f60791ef1058d9f696ecb51d2c07fe911d8569d8e
  - kind: registry
    name: toml_parser
    version: 1.0.9+spec-1.1.0
    sha: 702d4415e08923e7e1ef96cd5727c0dfed80b4d2fa25db9647fe5eb6f7c5a4c4
  - kind: registry
    name: toml_writer
    version: 1.0.6+spec-1.1.0
    sha: ab16f14aed21ee8bfd8ec22513f7287cd4a91aa92e44edfe2c17ddd004e92607
  - kind: registry
    name: tower
    version: 0.5.3
    sha: ebe5ef63511595f1344e2d5cfa636d973292adc0eec1f0ad45fae9f0851ab1d4
  - kind: registry
    name: tower-http
    version: 0.6.8
    sha: d4e6559d53cc268e5031cd8429d05415bc4cb4aefc4aa5d6cc35fbf5b924a1f8
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
    version: 0.38.0+1.3.296
    sha: 7318626319ea7b43d20b9c374f273b1b25600b8d8ddd103e209751f67fee67ad
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
    version: 0.3.22
    sha: 2f30143827ddab0d256fd843b7a66d164e9f271cfa0dde49142c5ca0ca291f1e
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
    version: 0.20.1
    sha: 9e3dac10fd62eaf6617d3a904ae222845979aec67c615d1c842b4002c7666fb9
  - kind: registry
    name: tungstenite
    version: 0.27.0
    sha: eadc29d668c91fcc564941132e17b28a7ceb2f3ebf0b9dae3e03fd7a6748eb0d
  - kind: registry
    name: tungstenite
    version: 0.28.0
    sha: 8628dcc84e5a09eb3d8423d6cb682965dea9133204e8fb3efee74c2a0c259442
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
    version: 1.19.0
    sha: 562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb
  - kind: registry
    name: unicase
    version: 2.9.0
    sha: dbc4bc3a9f746d862c45cb89d705aa10f187bb96c76001afab07a0d35ce60142
  - kind: registry
    name: unicode-ident
    version: 1.0.24
    sha: e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75
  - kind: registry
    name: unicode-linebreak
    version: 0.1.5
    sha: 3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f
  - kind: registry
    name: unicode-normalization
    version: 0.1.25
    sha: 5fd4f6878c9cb28d874b009da9e8d183b5abc80117c40bbd187a1fde336be6e8
  - kind: registry
    name: unicode-segmentation
    version: 1.12.0
    sha: f6ccf251212114b54433ec949fd6a7841275f9ada20dddd2f29e9ceea4501493
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
    version: 0.1.1
    sha: 44e0ce4d1246d075ca5abec4b41d33e87a6054d08e2366b63205665e950db218
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
    version: 1.21.0
    sha: b672338555252d43fd2240c714dc444b8c6fb0a5c5335e65a07bba7742735ddb
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
    version: 0.4.2
    sha: 51d06d9202adc1f15d709c4f4a2069be5428aa912cc025d6f268ac441ab066b0
  - kind: registry
    name: wasi
    version: 0.11.1+wasi-snapshot-preview1
    sha: ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b
  - kind: registry
    name: wasip2
    version: 1.0.2+wasi-0.2.9
    sha: 9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5
  - kind: registry
    name: wasip3
    version: 0.4.0+wasi-0.3.0-rc-2026-01-06
    sha: 5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5
  - kind: registry
    name: wasm-bindgen
    version: 0.2.109
    sha: 9ff9c7baef35ac3c0e17d8bfc9ad75eb62f85a2f02bccc906699dadb0aa9c622
  - kind: registry
    name: wasm-bindgen-futures
    version: 0.4.59
    sha: d24699cd39db9966cf6e2ef10d2f72779c961ad905911f395ea201c3ec9f545d
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.109
    sha: 39455e84ad887a0bbc93c116d72403f1bb0a39e37dd6f235a43e2128a0c7f1fd
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.109
    sha: dff4761f60b0b51fd13fec8764167b7bbcc34498ce3e52805fe1db6f2d56b6d6
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.109
    sha: bc6a171c53d98021a93a474c4a4579d76ba97f9517d871bc12e27640f218b6dd
  - kind: registry
    name: wasm-encoder
    version: 0.244.0
    sha: 990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319
  - kind: registry
    name: wasm-metadata
    version: 0.244.0
    sha: bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909
  - kind: registry
    name: wasm-streams
    version: 0.4.2
    sha: 15053d8d85c7eccdbefef60f06769760a563c7f0a9d6902a13d35c7800b0ad65
  - kind: registry
    name: wasmparser
    version: 0.244.0
    sha: 47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe
  - kind: registry
    name: web-sys
    version: 0.3.86
    sha: 668fa5d00434e890a452ab060d24e3904d1be93f7bb01b70e5603baa2b8ab23b
  - kind: registry
    name: web-time
    version: 1.1.0
    sha: 5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb
  - kind: registry
    name: web-transport-proto
    version: 0.5.4
    sha: 5afe275c02f899650c5497b946552fcc04f3f378bd2c3bc1e8005ff915772b97
  - kind: registry
    name: web-transport-quinn
    version: 0.11.6
    sha: 6d356bedff779480f8d88d94bf50a2eb8dedabb84414442f73c16dfee9db55b8
  - kind: registry
    name: web-transport-trait
    version: 0.3.3
    sha: 802d6aa508f2c63c9050ceabc17265bbf90ed4d6f4e4357e987583883628e79c
  - kind: registry
    name: webm-iterable
    version: 0.6.4
    sha: cd9fbf173b4b38f2f8bbb0082a0d4cb21f263a70811f5fccb1663c421c66d9f9
  - kind: registry
    name: webpki
    version: 0.22.4
    sha: ed63aea5ce73d0ff405984102c42de94fc55a6b75765d621c65262469b3c9b53
  - kind: registry
    name: webpki-root-certs
    version: 1.0.6
    sha: 804f18a4ac2676ffb4e8b5b5fa9ae38af06df08162314f96a68d2a363e21a8ca
  - kind: registry
    name: webpki-roots
    version: 0.26.11
    sha: 521bc38abb08001b01866da9f51eb7c5d647a19260e00054a8c7fd5f9e57f7a9
  - kind: registry
    name: webpki-roots
    version: 1.0.6
    sha: 22cfaf3c063993ff62e73cb4311efde4db1efb31ab78a3e5c457939ad5cc0bed
  - kind: registry
    name: weezl
    version: 0.1.12
    sha: a28ac98ddc8b9274cb41bb4d9d4d5c425b6020c50c46f25559911905610b4a88
  - kind: registry
    name: wgpu
    version: 26.0.1
    sha: 70b6ff82bbf6e9206828e1a3178e851f8c20f1c9028e74dd3a8090741ccd5798
  - kind: registry
    name: wgpu-core
    version: 26.0.1
    sha: d5f62f1053bd28c2268f42916f31588f81f64796e2ff91b81293515017ca8bd9
  - kind: registry
    name: wgpu-core-deps-apple
    version: 26.0.0
    sha: 18ae5fbde6a4cbebae38358aa73fcd6e0f15c6144b67ef5dc91ded0db125dbdf
  - kind: registry
    name: wgpu-core-deps-emscripten
    version: 26.0.0
    sha: d7670e390f416006f746b4600fdd9136455e3627f5bd763abf9a65daa216dd2d
  - kind: registry
    name: wgpu-core-deps-windows-linux-android
    version: 26.0.0
    sha: 720a5cb9d12b3d337c15ff0e24d3e97ed11490ff3f7506e7f3d98c68fa5d6f14
  - kind: registry
    name: wgpu-hal
    version: 26.0.6
    sha: a8d0e67224cc7305b3b4eb2cc57ca4c4c3afc665c1d1bee162ea806e19c47bdd
  - kind: registry
    name: wgpu-types
    version: 26.0.0
    sha: eca7a8d8af57c18f57d393601a1fb159ace8b2328f1b6b5f80893f7d672c9ae2
  - kind: registry
    name: which
    version: 4.4.2
    sha: 87ba24419a2078cd2b0f2ede2691b6c66d8e47836da3b6db8265ebad47afbfc7
  - kind: registry
    name: whisper-rs
    version: 0.15.1
    sha: 71ea5d2401f30f51d08126a2d133fee4c1955136519d7ac6cf6f5ac0a91e6bc8
  - kind: registry
    name: whisper-rs-sys
    version: 0.14.1
    sha: b5e2a6e06e7ac7b8f53c53a5f50bb0bc823ba69b63ecd887339f807a5598bbd2
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
    version: 0.58.0
    sha: dd04d41d93c4992d421894c18c8b43496aa748dd4c081bac0dc93eb0489272b6
  - kind: registry
    name: windows
    version: 0.61.3
    sha: 9babd3a767a4c1aef6900409f85f5d53ce2544ccdfaa86dad48c91782c6d6893
  - kind: registry
    name: windows-collections
    version: 0.2.0
    sha: 3beeceb5e5cfd9eb1d76b381630e82c4241ccd0d27f1a39ed41b2760b255c5e8
  - kind: registry
    name: windows-core
    version: 0.58.0
    sha: 6ba6d44ec8c2591c134257ce647b7ea6b20335bf6379a27dac5f1641fcf59f99
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
    name: windows-implement
    version: 0.58.0
    sha: 2bbd5b46c938e506ecbce286b6628a02171d56153ba733b6c741fc627ec9579b
  - kind: registry
    name: windows-implement
    version: 0.60.2
    sha: 053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf
  - kind: registry
    name: windows-interface
    version: 0.58.0
    sha: 053c4c462dc91d3b1504c6fe5a726dd15e216ba718e84a0e46a88fbe5ded3515
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
    name: windows-registry
    version: 0.6.1
    sha: 02752bf7fbdcce7f2a27a742f798510f3e5ad88dbe84871e5168e2120c3d5720
  - kind: registry
    name: windows-result
    version: 0.2.0
    sha: 1d1043d8214f791817bab27572aaa8af63732e11bf84aa21a45a78d6c317ae0e
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
    version: 0.1.0
    sha: 4cd9b125c486025df0eabcb585e62173c6c9eddcec5d117d3b6e8c30e2ee4d10
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
    version: 0.60.2
    sha: f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb
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
    name: windows-targets
    version: 0.53.5
    sha: 4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3
  - kind: registry
    name: windows-threading
    version: 0.1.0
    sha: b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.42.2
    sha: 597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.52.6
    sha: 32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.53.1
    sha: a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.42.2
    sha: e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.52.6
    sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.53.1
    sha: b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006
  - kind: registry
    name: windows_i686_gnu
    version: 0.42.2
    sha: c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f
  - kind: registry
    name: windows_i686_gnu
    version: 0.52.6
    sha: 8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b
  - kind: registry
    name: windows_i686_gnu
    version: 0.53.1
    sha: 960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.52.6
    sha: 0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.53.1
    sha: fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c
  - kind: registry
    name: windows_i686_msvc
    version: 0.42.2
    sha: 44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060
  - kind: registry
    name: windows_i686_msvc
    version: 0.52.6
    sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
  - kind: registry
    name: windows_i686_msvc
    version: 0.53.1
    sha: 1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.42.2
    sha: 8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.52.6
    sha: 147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.53.1
    sha: 9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.42.2
    sha: 26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.52.6
    sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.53.1
    sha: 0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.42.2
    sha: 9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.52.6
    sha: 589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.53.1
    sha: d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650
  - kind: registry
    name: winnow
    version: 0.7.14
    sha: 5a5364e9d77fcdeeaa6062ced926ee3381faa2ee02d3eb83a5c27a8825540829
  - kind: registry
    name: wit-bindgen
    version: 0.51.0
    sha: d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5
  - kind: registry
    name: wit-bindgen-core
    version: 0.51.0
    sha: ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc
  - kind: registry
    name: wit-bindgen-rust
    version: 0.51.0
    sha: b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21
  - kind: registry
    name: wit-bindgen-rust-macro
    version: 0.51.0
    sha: 0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a
  - kind: registry
    name: wit-component
    version: 0.244.0
    sha: 9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2
  - kind: registry
    name: wit-parser
    version: 0.244.0
    sha: ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736
  - kind: registry
    name: writeable
    version: 0.6.2
    sha: 9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9
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
    version: 1.2.1
    sha: b8aa498d22c9bbaf482329839bc5620c46be275a19a812e9a22a2b07529a642a
  - kind: registry
    name: xml-rs
    version: 0.8.28
    sha: 3ae8337f8a065cfc972643663ea4279e04e7256de865aa66fe25cec5fb912d3f
  - kind: registry
    name: xmlparser
    version: 0.13.6
    sha: 66fee0b777b0f5ac1c69bb06d361268faafa61cd4682ae064a171c16c433e9e4
  - kind: registry
    name: xmltree
    version: 0.12.0
    sha: cbc04313cab124e498ab1724e739720807b6dc405b9ed0edc5860164d2e4ff70
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
    version: 0.5.2
    sha: e17bb3549cc1321ae1296b9cdc2698e2b6cb1992adfa19a8c72e5b7a738f44cd
  - kind: registry
    name: yoke
    version: 0.8.1
    sha: 72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954
  - kind: registry
    name: yoke-derive
    version: 0.8.1
    sha: b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d
  - kind: registry
    name: zerocopy
    version: 0.8.39
    sha: db6d35d663eadb6c932438e763b262fe1a70987f9ae936e60158176d710cae4a
  - kind: registry
    name: zerocopy-derive
    version: 0.8.39
    sha: 4122cd3169e94605190e77839c9a40d40ed048d305bfdc146e7df40ab0f3e517
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
    version: 1.8.2
    sha: b97154e67e32c85465826e8bcc1c59429aaaf107c1e4a9e53c8d8ccd5eff88d0
  - kind: registry
    name: zeroize_derive
    version: 1.4.3
    sha: 85a5b4158499876c763cb03bc4e49185d3cccbabb15b33c627f7884f43db852e
  - kind: registry
    name: zerotrie
    version: 0.2.3
    sha: 2a59c17a5562d507e4b54960e8569ebee33bee890c70aa3fe7b97e85a9fd7851
  - kind: registry
    name: zerovec
    version: 0.11.5
    sha: 6c28719294829477f525be0186d13efa9a3c602f7ec202ca9e353d310fb9a002
  - kind: registry
    name: zerovec-derive
    version: 0.11.2
    sha: eadce39539ca5cb3985590102671f2567e659fca9666581ad3411d59207951f3
  - kind: registry
    name: zip
    version: 7.2.0
    sha: c42e33efc22a0650c311c2ef19115ce232583abbe80850bc8b66509ebef02de0
  - kind: registry
    name: zlib-rs
    version: 0.6.2
    sha: c745c48e1007337ed136dc99df34128b9faa6ed542d80a1c673cf55a6d7236c8
  - kind: registry
    name: zmij
    version: 1.0.21
    sha: b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa
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
    version: 7.2.4
    sha: 8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d
  - kind: registry
    name: zstd-sys
    version: 2.0.16+zstd.1.5.7
    sha: 91e19ebc2adc8f83e43039e79776e3fda8ca919132d68a1fed6a5faca2683748
- kind: patch
  # adapted from https://build.opensuse.org/projects/openSUSE:Factory:RISCV/packages/gstreamer-plugins-rs/files/vendor.patch?expand=1
  path: patches/gstreamer-plugins-rs/gst-plugins-rs-0.13.0-libsodium-sys-riscv64.patch
