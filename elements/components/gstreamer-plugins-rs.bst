# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

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
  ref: 0.15.2-0-g43af825d36368c55037c91abdda48f2905c230c2
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
    version: 0.4.42
    sha: e79b3f8a79cccc2898f31920fc69f304859b3bd567490f75ebf51ae1c792a9ac
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
    version: 0.34.1
    sha: 8447f02eaa65412035e2d3eeaa3fc82bbb8d7137c84c5976b4af685136012ee9
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
    version: 1.8.16
    sha: 50f156acdd2cf55f5aa53ee416c4ac851cf1222694506c0b1f78c85695e9ca9d
  - kind: registry
    name: aws-credential-types
    version: 1.2.14
    sha: 8f20799b373a1be121fe3005fba0c2090af9411573878f224df44b42727fcaf7
  - kind: registry
    name: aws-runtime
    version: 1.7.3
    sha: 5dcd93c82209ac7413532388067dce79be5a8780c1786e5fae3df22e4dee2864
  - kind: registry
    name: aws-sdk-kinesisvideo
    version: 1.100.0
    sha: 423ac3b091283a64e28c0d89bb8d285502c635c8d85a87f74c618ebe84a6a0af
  - kind: registry
    name: aws-sdk-kinesisvideosignaling
    version: 1.98.0
    sha: 02e60f628d8e7d9a4764857341e4a82604ce4bc3bfb72a021e71f70e594f02fe
  - kind: registry
    name: aws-sdk-polly
    version: 1.106.0
    sha: aedf8415d6909f5cd0ffd6669313eafd5b10a110b7306de2f3df2d3ebdb8844b
  - kind: registry
    name: aws-sdk-s3
    version: 1.132.0
    sha: 5575840a3a6b11f6011463ebe359320dfe5b67babb5e9b06fed6ddf809a9ab40
  - kind: registry
    name: aws-sdk-sso
    version: 1.98.0
    sha: d69c77aafa20460c68b6b3213c84f6423b6e76dbf89accd3e1789a686ffd9489
  - kind: registry
    name: aws-sdk-sts
    version: 1.103.0
    sha: c2249b81a2e73a8027c41c378463a81ec39b8510f184f2caab87de912af0f49b
  - kind: registry
    name: aws-sdk-transcribestreaming
    version: 1.103.0
    sha: 9e3025be53b063917cc86846bbe0c235542fb44ad38163b85de400ced3cda234
  - kind: registry
    name: aws-sdk-translate
    version: 1.98.0
    sha: 7eb0e2f6b3f4dbaedc768eb6cd9b20c11ace5db6b64094ec7ddb6450c8577d56
  - kind: registry
    name: aws-sigv4
    version: 1.4.3
    sha: 68dc0b907359b120170613b5c09ccc61304eac3998ff6274b97d93ee6490115a
  - kind: registry
    name: aws-smithy-async
    version: 1.2.14
    sha: 2ffcaf626bdda484571968400c326a244598634dc75fd451325a54ad1a59acfc
  - kind: registry
    name: aws-smithy-checksums
    version: 0.64.7
    sha: 10efbbcec1e044b81600e2fc562a391951d291152d95b482d5b7e7132299d762
  - kind: registry
    name: aws-smithy-eventstream
    version: 0.60.20
    sha: faf09d74e5e32f76b8762da505a3cd59303e367a664ca67295387baa8c1d7548
  - kind: registry
    name: aws-smithy-http
    version: 0.63.6
    sha: ba1ab2dc1c2c3749ead27180d333c42f11be8b0e934058fb4b2258ee8dbe5231
  - kind: registry
    name: aws-smithy-http-client
    version: 1.1.12
    sha: 6a2f165a7feee6f263028b899d0a181987f4fa7179a6411a32a439fba7c5f769
  - kind: registry
    name: aws-smithy-json
    version: 0.62.5
    sha: 9648b0bb82a2eedd844052c6ad2a1a822d1f8e3adee5fbf668366717e428856a
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
    version: 1.11.1
    sha: 0504b1ab12debb5959e5165ee5fe97dd387e7aa7ea6a477bfd7635dfe769a4f5
  - kind: registry
    name: aws-smithy-runtime-api
    version: 1.12.0
    sha: b71a13df6ada0aafbf21a73bdfcdf9324cfa9df77d96b8446045be3cde61b42e
  - kind: registry
    name: aws-smithy-runtime-api-macros
    version: 1.0.0
    sha: 8d7396fd9500589e62e460e987ecb671bad374934e55ec3b5f498cc7a8a8a7b7
  - kind: registry
    name: aws-smithy-types
    version: 1.4.7
    sha: 9d73dbfbaa8e4bc57b9045137680b958d274823509a360abfd8e1d514d40c95c
  - kind: registry
    name: aws-smithy-xml
    version: 0.60.15
    sha: 0ce02add1aa3677d022f8adf81dcbe3046a95f17a1b1e8979c145cd21d3d22b3
  - kind: registry
    name: aws-types
    version: 1.3.15
    sha: 2f4bbcaa9304ea40902d3d5f42a0428d1bd895a2b0f6999436fb279ffddc58ac
  - kind: registry
    name: backtrace
    version: 0.3.76
    sha: bb531853791a215d7c62a30daf0dde835f381ab5de4589cfe7c649d2cbe92bd6
  - kind: registry
    name: base16ct
    version: 0.1.1
    sha: 349a06037c7bf932dd7e7d1f653678b2038b9ad46a74102f1fc7bd7872678cce
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
    name: bit-vec
    version: 0.9.1
    sha: b71798fca2c1fe1086445a7258a4bc81e6e49dcd24c8d0dd9a1e57395b603f51
  - kind: registry
    name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - kind: registry
    name: bitflags
    version: 2.11.1
    sha: c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3
  - kind: registry
    name: bitreader
    version: 0.3.11
    sha: 886559b1e163d56c765bc3a985febb4eee8009f625244511d8ee3c432e08c066
  - kind: registry
    name: bitstream-io
    version: 4.10.0
    sha: 7eff00be299a18769011411c9def0d827e8f2d7bf0c3dbf53633147a8867fd1f
  - kind: registry
    name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: block-buffer
    version: 0.12.0
    sha: cdd35008169921d80bc60d3d0ab416eecb028c4cd653352907921d95084790be
  - kind: registry
    name: block2
    version: 0.6.2
    sha: cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5
  - kind: registry
    name: bs58
    version: 0.5.1
    sha: bf88ba1141d185c399bee5288d850d63b8369520c1eafc32a0430b5b6c287bf4
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
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: cairo-rs
    version: 0.22.7
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: cairo-sys-rs
    version: 0.22.7
  - kind: registry
    name: caseless
    version: 0.2.2
    sha: 8b6fd507454086c8edfd769ca6ada439193cdb209c7681712ef6275cccbfe5d8
  - kind: registry
    name: cc
    version: 1.2.62
    sha: a1dce859f0832a7d088c4f1119888ab94ef4b5d6795d1ce05afb7fe159d79f98
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
    version: 0.4.44
    sha: c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0
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
    version: 4.6.1
    sha: 1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51
  - kind: registry
    name: clap_builder
    version: 4.6.0
    sha: 714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f
  - kind: registry
    name: clap_derive
    version: 4.6.1
    sha: f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9
  - kind: registry
    name: clap_lex
    version: 1.1.0
    sha: c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9
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
    version: 0.5.3
    sha: 3f88a43d011fc4a6876cb7344703e297c71dda42494fee094d5f7c76bf13f746
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
    version: 1.0.5
    sha: 1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570
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
    version: 0.4.38
    sha: ce2548391e9c1929c21bf6aa2680af86fe4c1b33e6cea9ac1cfeec0bd11218cf
  - kind: registry
    name: compression-core
    version: 0.4.32
    sha: cc14f565cf027a105f7a44ccf9e5b424348421a1d8952a8fc9d499d313107789
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
    version: 0.16.3
    sha: d64e8af5551369d19cf50138de61f1c42074ab970f74e99be916646777f8fc87
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
    version: 2.5.0
    sha: 217698eaf96b4a3f0bc4f3662aaa55bdf913cd54d7204591faa790070c6d0853
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
    name: crypto-common
    version: 0.2.1
    sha: 77727bb15fa921304124b128af125e7e3b968275d1b108b379190264f4423710
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
    name: dash-mpd
    version: 0.20.2
    sha: 99aa4f01bf47635af7d137707d14665af5603d65fb410a64da42ad949527069c
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
    version: 2.11.0
    sha: a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8
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
    version: 0.1.12
    sha: ac6b926516df9c60bfa16e107b21086399f8285a44ca9711344b9e553c5146e2
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
    name: dirs-sys
    version: 0.5.0
    sha: e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab
  - kind: registry
    name: dispatch2
    version: 0.3.1
    sha: 1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38
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
    name: ecdsa
    version: 0.16.9
    sha: ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca
  - kind: registry
    name: ed25519
    version: 1.5.3
    sha: 91cff35c70bba8a626e3185d8cd48cc11b5437e1a5bcd15b9b5fa3c64b6dfee7
  - kind: registry
    name: ed25519
    version: 2.2.3
    sha: 115531babc129696a58c64a4fef0a8bf9e9698629fb97e9e40767d235cfbcd53
  - kind: registry
    name: ed25519-dalek
    version: 2.2.0
    sha: 70e796c081cee67dc755e1a36a0a172b897fab85fc3f6bc48307991f64e4eca9
  - kind: registry
    name: edit-distance
    version: 2.2.2
    sha: 324d428080b707bac399325341bd61af5ded1b30f33b7c949792ca464733c2d5
  - kind: registry
    name: either
    version: 1.15.0
    sha: 48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719
  - kind: registry
    name: elliptic-curve
    version: 0.12.3
    sha: e7bb888ab5300a19b8e5bceef25ac745ad065f3c9f7efc6de1b91958110891d3
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
    version: 0.4.0
    sha: f820157f198ada183ad62e0a66f554c610cdcd1a9f27d4b316358103ced7a1f8
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
    version: 1.1.12
    sha: 7f96a4a12fe60ac746ae295a1a4ecb5bb02debc20856506c8635288065f142de
  - kind: registry
    name: enumset_derive
    version: 0.15.0
    sha: 4bd536557b58c682b217b8fb199afdff47cd3eff260623f19e77074eb073d63a
  - kind: registry
    name: env_filter
    version: 1.0.1
    sha: 32e90c2accc4b07a8456ea0debdc2e7587bdd890680d71173a15d4ae604f6eef
  - kind: registry
    name: env_logger
    version: 0.11.10
    sha: 0621c04f2196ac3f488dd583365b9c09be011a4ab8b9f37248ffcc8f6198b56a
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
    version: 2.4.1
    sha: 9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6
  - kind: registry
    name: fdeflate
    version: 0.3.7
    sha: 1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c
  - kind: registry
    name: ff
    version: 0.12.1
    sha: d013fc25338cc558c5c2cfbad646908fb23591e2404481826742b651c9af7160
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
    version: 0.2.28
    sha: 2d5b2eef6fafbf69f877e55509ce5b11a760690ac9700a2921be067aa6afaef6
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
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gdk-pixbuf
    version: 0.22.7
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gdk-pixbuf-sys
    version: 0.22.7
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4
    version: 0.11.3
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-sys
    version: 0.11.3
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-wayland
    version: 0.11.3
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-wayland-sys
    version: 0.11.3
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-win32
    version: 0.11.3
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-win32-sys
    version: 0.11.3
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-x11
    version: 0.11.3
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gdk4-x11-sys
    version: 0.11.3
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
    version: 0.4.2
    sha: 0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555
  - kind: registry
    name: gif
    version: 0.14.2
    sha: ee8cfcc411d9adbbaba82fb72661cc1bcca13e8bba98b364e62b2dba8f960159
  - kind: registry
    name: gimli
    version: 0.32.3
    sha: e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gio
    version: 0.22.7
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gio-sys
    version: 0.22.7
  - kind: registry
    name: gl_generator
    version: 0.14.0
    sha: 1a95dfc23a2b4a9a2f5ab41d194f8bfda3cabec42af4e39f08c339eb2a0c124d
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: glib
    version: 0.22.7
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: glib-macros
    version: 0.22.7
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: glib-sys
    version: 0.22.7
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
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: gobject-sys
    version: 0.22.7
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
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: graphene-rs
    version: 0.22.7
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: graphene-sys
    version: 0.22.7
  - kind: registry
    name: group
    version: 0.12.1
    sha: 5dfbfb3a6cfbd390d5c9564ab283a0349b9b9fcd46a706c1eb10e0db70bfbac7
  - kind: registry
    name: group
    version: 0.13.0
    sha: f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gsk4
    version: 0.11.3
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gsk4-sys
    version: 0.11.3
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-allocators
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-allocators-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-analytics
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-analytics-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-app
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-app-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-audio
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-audio-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-base
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-base-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-check
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-check-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-egl
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-egl-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-wayland
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-wayland-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-x11
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-gl-x11-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-net
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-net-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-pbutils
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-pbutils-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-rtp
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-rtp-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-sdp
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-sdp-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-tag
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-tag-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-utils
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-validate
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-validate-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-video
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-video-sys
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-webrtc
    version: 0.25.2
  - kind: git
    commit: c1f88371d75cbd69e7b84567cd705d1ba3bd22db
    repo: freedesktop:gstreamer/gstreamer-rs
    query:
      branch: 0.25
    name: gstreamer-webrtc-sys
    version: 0.25.2
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gtk4
    version: 0.11.3
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gtk4-macros
    version: 0.11.3
  - kind: git
    commit: 867a6737f36c735865119cff649b059ce337dcb2
    repo: github:gtk-rs/gtk4-rs
    query:
      branch: 0.11
    name: gtk4-sys
    version: 0.11.3
  - kind: registry
    name: h2
    version: 0.3.27
    sha: 0beca50380b1fc32983fc1cb4587bfa4bb9e78fc259aad4a0032d2080309222d
  - kind: registry
    name: h2
    version: 0.4.14
    sha: 171fefbc92fe4a4de27e0698d6a5b392d6a0e333506bc49133760b3bcf948733
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
    name: hkdf
    version: 0.12.4
    sha: 7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7
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
    name: hybrid-array
    version: 0.4.12
    sha: 9155a582abd142abc056962c29e3ce5ff2ad5469f4246b537ed42c5deba857da
  - kind: registry
    name: hyper
    version: 0.14.32
    sha: 41dfc780fdec9373c01bae43289ea34c972e40ee3c9f6b3c8801a35f35586ce7
  - kind: registry
    name: hyper
    version: 1.9.0
    sha: 6299f016b246a94207e63da54dbe807655bf9e00044f73ded42c3ac5305fbcca
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
    version: 0.27.9
    sha: 33ca68d021ef39cf6463ab54c1d0f5daf03377b70561305bb89a8f83aab66e0f
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
    version: 2.2.0
    sha: 2984d1cd16c883d7935b9e07e44071dca8d917fd52ecc02c04d5fa0b5a3f191c
  - kind: registry
    name: icu_locale
    version: 2.2.0
    sha: d5a396343c7208121dc86e35623d3dfe19814a7613cfd14964994cdc9c9a2e26
  - kind: registry
    name: icu_locale_core
    version: 2.2.0
    sha: 92219b62b3e2b4d88ac5119f8904c10f8f61bf7e95b640d25ba3075e6cac2c29
  - kind: registry
    name: icu_locale_data
    version: 2.2.0
    sha: d5fdcc9ac77c6d74ff5cf6e65ef3181d6af32003b16fce3a77fb451d2f695993
  - kind: registry
    name: icu_normalizer
    version: 2.2.0
    sha: c56e5ee99d6e3d33bd91c5d85458b6005a22140021cc324cea84dd0e72cff3b4
  - kind: registry
    name: icu_normalizer_data
    version: 2.2.0
    sha: da3be0ae77ea334f4da67c12f149704f19f81d1adf7c51cf482943e84a2bad38
  - kind: registry
    name: icu_properties
    version: 2.2.0
    sha: bee3b67d0ea5c2cca5003417989af8996f8604e34fb9ddf96208a033901e70de
  - kind: registry
    name: icu_properties_data
    version: 2.2.0
    sha: 8e2bbb201e0c04f7b4b3e14382af113e17ba4f63e2c9d2ee626b720cbce54a14
  - kind: registry
    name: icu_provider
    version: 2.2.0
    sha: 139c4cf31c8b5f33d7e199446eff9c1e02decfc2f0eec2c8d71f65befa45b421
  - kind: registry
    name: icu_segmenter
    version: 2.2.0
    sha: 5c0794db0b1a86193ac9c48768d0e6c52c54448e0870ad87907d456ee0dac964
  - kind: registry
    name: icu_segmenter_data
    version: 2.2.0
    sha: e4a2c462a4d927d512f5f882a033ddd62f33a05bb9f230d98f736ac3dc85938f
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
    version: 1.2.2
    sha: cb68373c0d6620ef8105e855e7745e18b0d00d3bdb07fb532e434244cdb9a714
  - kind: registry
    name: image
    version: 0.25.10
    sha: 85ab80394333c02fe689eaf900ab500fbd0c2213da414687ebf995a65d5a6104
  - kind: registry
    name: image_hasher
    version: 3.1.1
    sha: dd266c66b0a0e2d4c6db8e710663fc163a2d33595ce997b6fbda407c8759d344
  - kind: registry
    name: imgref
    version: 1.12.1
    sha: 40fac9d56ed6437b198fddba683305e8e2d651aa42647f00f5ae542e7f5c94a2
  - kind: registry
    name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - kind: registry
    name: indexmap
    version: 2.14.0
    sha: d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9
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
    version: 2.12.0
    sha: d98f6fed1fde3f8c21bc40a1abb88dd75e67924f9cffc3ef95607bad8017f8e2
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
    version: 1.0.18
    sha: 8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682
  - kind: registry
    name: jiff
    version: 0.2.24
    sha: f00b5dbd620d61dfdcb6007c9c1f6054ebd75319f163d886a9055cec1155073d
  - kind: registry
    name: jiff-static
    version: 0.2.24
    sha: e000de030ff8022ea1da3f466fbb0f3a809f5e51ed31f6dd931c35181ad8e6d7
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
    version: 0.1.34
    sha: 9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33
  - kind: registry
    name: js-sys
    version: 0.3.98
    sha: 67df7112613f8bfd9150013a0314e196f4800d3201ae742489d999db2f979f08
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
    version: 0.2.3
    sha: b3a6a8c165077efc8f3a971534c50ea6a1a18b329ef4a66e897a7e3a1494565f
  - kind: registry
    name: libc
    version: 0.2.186
    sha: 68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66
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
    version: 0.4.6
    sha: 1a60851d15cd8c5346eca4ab8babff585be2ae4bc8097c067291d3ffe2add3b6
  - kind: registry
    name: libm
    version: 0.2.16
    sha: b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981
  - kind: registry
    name: libredox
    version: 0.1.16
    sha: e02f3bb43d335493c96bf3fd3a321600bf6bd07ed34bc64118e9293bdffea46c
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
    version: 0.8.2
    sha: 92daf443525c4cce67b150400bc2316076100ce0b3686209eb8cf3c31612e6f0
  - kind: registry
    name: litrs
    version: 1.0.0
    sha: 11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092
  - kind: registry
    name: livekit-api
    version: 0.4.19
    sha: 900451a686a1ce8488c420e81a2135831383b03aade6bc3075cf80463d3dd6a4
  - kind: registry
    name: livekit-protocol
    version: 0.7.5
    sha: 6cf1cc4ab39d7857fb31be648f43aa7068acb54a6960270dccd300dd5c8d0a98
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
    version: 0.16.4
    sha: 7f66e8d5d03f609abc3a39e6f08e4164ebf1447a732906d39eb9b99b7919ef39
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
    version: 0.11.0
    sha: 69b6441f590336821bb897fb28fc622898ccceb1d6cea3fde5ea86b090c4de98
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
    version: 1.2.0
    sha: 50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1
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
    version: 0.2.1
    sha: c6673768db2d862beb9b39a78fdcb1a69439615d5794a1be50caa9bc92c81967
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
    name: open
    version: 5.3.4
    sha: 9f3bab717c29a857abf75fcef718d441ec7cb2725f937343c734740a985d37fd
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
    name: os_info
    version: 3.14.0
    sha: e4022a17595a00d6a369236fdae483f0de7f0a339960a53118b818238e132224
  - kind: registry
    name: outref
    version: 0.5.2
    sha: 1a80800c0488c3a21695ea981a54918fbb37abf04f4d0720c453632255e2ff0e
  - kind: registry
    name: p256
    version: 0.11.1
    sha: 51f44edd08f51e2ade572f141051021c5af22677e42b7dd28a88155151c33594
  - kind: registry
    name: p256
    version: 0.13.2
    sha: c9863ad85fa8f4460f9c48cb909d38a0d689dba1f6f6988a5e3e0d31071bcd4b
  - kind: registry
    name: p384
    version: 0.13.1
    sha: fe42f1670a52a47d448f14b6a5c61dd78fce51856e68edaa38f7ae3a46b8d6b6
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pango
    version: 0.22.7
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pango-sys
    version: 0.22.7
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pangocairo
    version: 0.22.7
  - kind: git
    commit: ba575eeaf5c7cf043e55454620e5926593756c67
    repo: github:gtk-rs/gtk-rs-core
    query:
      branch: 0.22
    name: pangocairo-sys
    version: 0.22.7
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
    version: 0.2.2
    sha: c5a797f0e07bdf071d15742978fc3128ec6c22891c31a3a931513263904c982a
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
    version: 1.1.12
    sha: cbf0d9e68100b3a7989b4901972f265cd542e560a3a8a724e1e20322f4d06ce9
  - kind: registry
    name: pin-project-internal
    version: 1.1.12
    sha: a990e22f43e84855daf260dded30524ef4a9021cc7541c26540500a50b624389
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
    name: pkcs8
    version: 0.9.0
    sha: 9eca2c590a5f85da82668fa685c09ce2888b9430e83299debf1f34b65fd4a4ba
  - kind: registry
    name: pkg-config
    version: 0.3.33
    sha: 19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e
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
    version: 0.2.7
    sha: c2a106d1259c23fac8e543272398ae0e3c0b8d33c88ed73d0cc71b0f1d902618
  - kind: registry
    name: potential_utf
    version: 0.1.5
    sha: 0103b1cef7ec0cf76490e969665504990193874ea05c85ff9bab8b911d0a0564
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
    name: pxfm
    version: 0.1.29
    sha: e0c5ccf5294c6ccd63a74f1565028353830a9c2f5eb0c682c355c471726a6e3f
  - kind: registry
    name: pyo3
    version: 0.28.3
    sha: 91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12
  - kind: registry
    name: pyo3-build-config
    version: 0.28.3
    sha: e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e
  - kind: registry
    name: pyo3-ffi
    version: 0.28.3
    sha: 7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e
  - kind: registry
    name: pyo3-macros
    version: 0.28.3
    sha: df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813
  - kind: registry
    name: pyo3-macros-backend
    version: 0.28.3
    sha: c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb
  - kind: registry
    name: quick-xml
    version: 0.38.4
    sha: b66c2058c55a409d601666cffe35f04333cf1013010882cec174a7467cd4e21c
  - kind: registry
    name: quick-xml
    version: 0.39.4
    sha: cdcc8dd4e2f670d309a5f0e83fe36dfdc05af317008fea29144da1a2ac858e5e
  - kind: registry
    name: quinn
    version: 0.11.9
    sha: b9e20a958963c291dc322d98411f541009df2ced7b5a4f2bd52337638cfccf20
  - kind: registry
    name: quinn-proto
    version: 0.11.14
    sha: 434b42fec591c96ef50e21e886936e66d3cc3f737104fdb9b737c40ffb94c098
  - kind: registry
    name: quinn-udp
    version: 0.5.14
    sha: addec6a0dcad8a8d96a771f815f0eaf55f9d1805756410b39f5fa81332574cbd
  - kind: registry
    name: quote
    version: 1.0.45
    sha: 41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924
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
    version: 0.10.1
    sha: d2e8e8bcc7961af1fdac401278c6a831614941f6164ee3bf4ce61b7edb162207
  - kind: registry
    name: rand
    version: 0.8.6
    sha: 5ca0ecfa931c29007047d1bc58e623ab12e5590e8c7cc53200d5202b69266d8a
  - kind: registry
    name: rand
    version: 0.9.4
    sha: 44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea
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
    name: raw-window-handle
    version: 0.6.2
    sha: 20675572f6f24e9e76ef639bc5552774ed45f1c30e2951e1e99c59888861c539
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
    version: 0.14.8
    sha: 57f6d249aad744e274e682777a50283a225a32705394ee6d5fcc01efa25e4055
  - kind: registry
    name: realfft
    version: 3.5.0
    sha: f821338fddb99d089116342c46e9f1fbf3828dba077674613e734e01d6ea8677
  - kind: registry
    name: redox_syscall
    version: 0.5.18
    sha: ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d
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
    version: 0.8.10
    sha: dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a
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
    version: 2.1.2
    sha: 94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe
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
    version: 1.1.4
    sha: b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190
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
    version: 0.23.40
    sha: ef86cd5876211988985292b91c96a8f2d298df24e75989a43a3c73f2d4d8168b
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
    version: 1.14.1
    sha: 30a7197ae7eb376e574fe940d068c30fe0462554a3ddbe4eca7838e049c937a9
  - kind: registry
    name: rustls-platform-verifier
    version: 0.6.2
    sha: 1d99feebc72bae7ab76ba994bb5e121b8d83d910ca40b36e0921f53becc41784
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
    version: 0.103.13
    sha: 61c429a8649f110dddef65e2a5ad240f747e85f7758a6bccc7e5777bd33f756e
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
    version: 0.1.29
    sha: 91c1b7e4904c873ef0710c1f407dde2e6287de2bebc1bbbf7d430bb7cbffd939
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
    version: 1.1.1
    sha: 6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26
  - kind: registry
    name: serde_urlencoded
    version: 0.7.1
    sha: d3491c14715ca2294c4d6a88f15e84739788c1d030eed8c110436aafdaa2f3fd
  - kind: registry
    name: serde_with
    version: 3.20.0
    sha: e72c1c2cb7b223fafb600a619537a871c2818583d619401b785e7c0b746ccde2
  - kind: registry
    name: serde_with_macros
    version: 3.20.0
    sha: b90c488738ecb4fb0262f41f43bc40efc5868d9fb744319ddf5f5317f417bfac
  - kind: registry
    name: serial_test
    version: 3.4.0
    sha: 911bd979bf1070a3f3aa7b691a3b3e9968f339ceeec89e08c280a8a22207a32f
  - kind: registry
    name: serial_test_derive
    version: 3.4.0
    sha: 0a7d91949b85b0d2fb687445e448b40d322b6b3e4af6b44a29b21d9a5f33e6d9
  - kind: registry
    name: sfv
    version: 0.14.0
    sha: 0d471eaefb14f4b30032525bdb124b36e55ba9cb1292080e06f1a236cd10fe87
  - kind: registry
    name: sha1
    version: 0.10.6
    sha: e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba
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
    version: 0.3.9
    sha: 703d5c7ef118737c72f1af64ad2f6f8c5e1921f818cdcb97b8fe6fc69bf66214
  - kind: registry
    name: simd_cesu8
    version: 1.1.1
    sha: 94f90157bb87cddf702797c5dadfa0be7d266cdf49e22da2fcaa32eff75b2c33
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
    version: 0.93.1
    sha: 2359f7e30c9da3f322f8ca3d4ec0abbc12a40035ce758309db0cdab07b5d4476
  - kind: registry
    name: skia-safe
    version: 0.93.1
    sha: 7f9e837ea9d531c9efee8f980bfcdb7226b21db0285b0c3171d8be745829f940
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
    version: 0.6.3
    sha: 3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e
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
    version: 0.4.2
    sha: 6dac7bc0f7d0d44329b200020effbc25a534d89fa142af95e3ddf76113412a5e
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
    version: 7.0.8
    sha: 396a35feb67335377e0251fcbc1092fc85c484bd4e3a7a54319399da127796e7
  - kind: registry
    name: tar
    version: 0.4.45
    sha: 22692a6476a21fa75fdfc11d452fda482af402c008cdbaf3476414e122040973
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
    version: 3.27.0
    sha: 32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd
  - kind: registry
    name: termcolor
    version: 1.4.1
    sha: 06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755
  - kind: registry
    name: test-log
    version: 0.2.20
    sha: 2f46bf474f0a4afebf92f076d54fd5e63423d9438b8c278a3d2ccb0f47f7cdb3
  - kind: registry
    name: test-log-core
    version: 0.2.20
    sha: 37d4d41320b48bc4a211a9021678fcc0c99569b594ea31c93735b8e517102b4c
  - kind: registry
    name: test-log-macros
    version: 0.2.20
    sha: 9beb9249a81e430dffd42400a49019bcf548444f1968ff23080a625de0d4d320
  - kind: registry
    name: test-with
    version: 0.16.1
    sha: 3c292571fb159e65c78c7c88a96e5ddfc326d6819e49b3a040d7b0aa3497925b
  - kind: registry
    name: test-with-derive
    version: 0.16.1
    sha: 01b95b557b54c0d50b04688ab86aaeaf16f201a0341936f3bfa19497dee081bd
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
    version: 0.8.3
    sha: c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d
  - kind: registry
    name: tinyvec
    version: 1.11.0
    sha: 3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3
  - kind: registry
    name: tinyvec_macros
    version: 0.1.1
    sha: 1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20
  - kind: registry
    name: tokio
    version: 1.52.3
    sha: 8fc7f01b389ac15039e4dc9531aa973a135d7a4135281b12d7c1bc79fd57fffe
  - kind: registry
    name: tokio-macros
    version: 2.7.0
    sha: 385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496
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
    name: toml
    version: 1.1.2+spec-1.1.0
    sha: 81f3d15e84cbcd896376e6730314d59fb5a87f31e4b038454184435cd57defee
  - kind: registry
    name: toml_datetime
    version: 0.7.5+spec-1.1.0
    sha: 92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347
  - kind: registry
    name: toml_datetime
    version: 1.1.1+spec-1.1.0
    sha: 3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7
  - kind: registry
    name: toml_edit
    version: 0.25.11+spec-1.1.0
    sha: 0b59c4d22ed448339746c59b905d24568fcbb3ab65a500494f7b8c3e97739f2b
  - kind: registry
    name: toml_parser
    version: 1.1.2+spec-1.1.0
    sha: a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526
  - kind: registry
    name: toml_writer
    version: 1.1.1+spec-1.1.0
    sha: 756daf9b1013ebe47a8776667b466417e2d4c5679d441c26230efd9ef78692db
  - kind: registry
    name: tower
    version: 0.5.3
    sha: ebe5ef63511595f1344e2d5cfa636d973292adc0eec1f0ad45fae9f0851ab1d4
  - kind: registry
    name: tower-http
    version: 0.6.10
    sha: 68d6fdd9f81c2819c9a8b0e0cd91660e7746a8e6ea2ba7c6b2b057985f6bcb51
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
    name: tungstenite
    version: 0.29.0
    sha: 6c01152af293afb9c7c2a57e4b559c5620b421f6d133261c60dd2d0cdb38e6b8
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
    version: 1.20.0
    sha: 40ce102ab67701b8526c123c1bab5cbe42d7040ccfd0f64af1a385808d2f43de
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
    version: 1.13.2
    sha: 9629274872b2bfaf8d66f5f15725007f635594914870f65218920345aa11aa8c
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
    version: 1.23.1
    sha: ddd74a9687298c6858e9b88ec8935ec45d22e8fd5e6394fa1bd4e99a87789c76
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
    version: 0.4.3
    sha: c0a808122a8a77eecdabaefd88ddb1913c4be5ea1465399f63ba64c7aa705fea
  - kind: registry
    name: wasi
    version: 0.11.1+wasi-snapshot-preview1
    sha: ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b
  - kind: registry
    name: wasip2
    version: 1.0.3+wasi-0.2.9
    sha: 20064672db26d7cdc89c7798c48a0fdfac8213434a1186e5ef29fd560ae223d6
  - kind: registry
    name: wasip3
    version: 0.4.0+wasi-0.3.0-rc-2026-01-06
    sha: 5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5
  - kind: registry
    name: wasm-bindgen
    version: 0.2.121
    sha: 49ace1d07c165b0864824eee619580c4689389afa9dc9ed3a4c75040d82e6790
  - kind: registry
    name: wasm-bindgen-futures
    version: 0.4.71
    sha: 96492d0d3ffba25305a7dc88720d250b1401d7edca02cc3bcd50633b424673b8
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.121
    sha: 8e68e6f4afd367a562002c05637acb8578ff2dea1943df76afb9e83d177c8578
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.121
    sha: d95a9ec35c64b2a7cb35d3fead40c4238d0940c86d107136999567a4703259f2
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.121
    sha: c4e0100b01e9f0d03189a92b96772a1fb998639d981193d7dbab487302513441
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
    version: 0.3.98
    sha: 4b572dff8bcf38bad0fa19729c89bb5748b2b9b1d8be70cf90df697e3a8f32aa
  - kind: registry
    name: web-time
    version: 1.1.0
    sha: 5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb
  - kind: registry
    name: web-transport-proto
    version: 0.6.0
    sha: 0225d295c8ac00a2e9a498aefeaf3f3c6186da12a251c938189b15b82ea22808
  - kind: registry
    name: web-transport-quinn
    version: 0.11.9
    sha: cac11b6caf163be7f980442a26fcba15e8074a5f22e85fbb71f0f77d11cecf60
  - kind: registry
    name: web-transport-trait
    version: 0.3.4
    sha: cb67841c4a481ca3c1412ee4c9f463987401991e1ddc000903df2124f3dc85e9
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
    version: 1.0.7
    sha: f31141ce3fc3e300ae89b78c0dd67f9708061d1d2eda54b8209346fd6be9a92c
  - kind: registry
    name: webpki-roots
    version: 0.26.11
    sha: 521bc38abb08001b01866da9f51eb7c5d647a19260e00054a8c7fd5f9e57f7a9
  - kind: registry
    name: webpki-roots
    version: 1.0.7
    sha: 52f5ee44c96cf55f1b349600768e3ece3a8f26010c05265ab73f945bb1a2eb9d
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
    version: 0.7.15
    sha: df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945
  - kind: registry
    name: winnow
    version: 1.0.2
    sha: 2ee1708bef14716a11bae175f579062d4554d95be2c6829f518df847b7b3fdd0
  - kind: registry
    name: wit-bindgen
    version: 0.51.0
    sha: d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5
  - kind: registry
    name: wit-bindgen
    version: 0.57.1
    sha: 1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e
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
    version: 0.6.3
    sha: 1ffae5123b2d3fc086436f8834ae3ab053a283cfac8fe0a0b8eaae044768a4c4
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
    version: 1.3.0
    sha: 636f85e5ca6488e96401b61eb7de54f4e44755c988af0f52cf90230c312a1a89
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
    version: 0.6.0
    sha: b5f6765e852b9b4dc8e2a76843e4d64d1cea8e79bcde0b6901aea8e7c7f08282
  - kind: registry
    name: yoke
    version: 0.8.2
    sha: abe8c5fda708d9ca3df187cae8bfb9ceda00dd96231bed36e445a1a48e66f9ca
  - kind: registry
    name: yoke-derive
    version: 0.8.2
    sha: de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e
  - kind: registry
    name: zerocopy
    version: 0.8.48
    sha: eed437bf9d6692032087e337407a86f04cd8d6a16a37199ed57949d415bd68e9
  - kind: registry
    name: zerocopy-derive
    version: 0.8.48
    sha: 70e3cd084b1788766f53af483dd21f93881ff30d7320490ec3ef7526d203bad4
  - kind: registry
    name: zerofrom
    version: 0.1.7
    sha: 69faa1f2a1ea75661980b013019ed6687ed0e83d069bc1114e2cc74c6c04c4df
  - kind: registry
    name: zerofrom-derive
    version: 0.1.7
    sha: 11532158c46691caf0f2593ea8358fed6bbf68a0315e80aae9bd41fbade684a1
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
    version: 0.2.4
    sha: 0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf
  - kind: registry
    name: zerovec
    version: 0.11.6
    sha: 90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239
  - kind: registry
    name: zerovec-derive
    version: 0.11.3
    sha: 625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555
  - kind: registry
    name: zip
    version: 7.2.0
    sha: c42e33efc22a0650c311c2ef19115ce232583abbe80850bc8b66509ebef02de0
  - kind: registry
    name: zlib-rs
    version: 0.6.3
    sha: 3be3d40e40a133f9c916ee3f9f4fa2d9d63435b5fbe1bfc6d9dae0aa0ada1513
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
