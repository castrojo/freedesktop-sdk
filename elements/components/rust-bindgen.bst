kind: manual

depends:
- components/llvm.bst

build-depends:
- components/rust.bst

environment:
  MAXJOBS: "%{max-jobs}"

environment-nocache:
- MAXJOBS

config:
  build-commands:
  - cargo build -j "${MAXJOBS}" --release --frozen

  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}" target/release/bindgen

sources:
- kind: git_repo
  track: v*
  url: github:rust-lang/rust-bindgen.git
  ref: v0.69.2-0-g2a22051bb06cf66bd4e3d9305c45a407b79cf1af
- kind: cargo
  url: crates:crates
  ref:
  - name: aho-corasick
    version: 0.7.20
    sha: cc936419f96fa211c1b9166887b38e5e40b19958e5b895be7c1f93adec7071ac
  - name: annotate-snippets
    version: 0.9.1
    sha: c3b9d411ecbaf79885c6df4d75fff75858d5995ff25385657a28af47e82f9c36
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: bitflags
    version: 2.2.1
    sha: 24a6904aef64d73cf10ab17ebace7befb918b82164785cb89907993be7f83813
  - name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
  - name: cc
    version: 1.0.78
    sha: a20104e2335ce8a659d6dd92a51a767a0c062599c73b343fd152cb401e828c3d
  - name: cexpr
    version: 0.6.0
    sha: 6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: clang-sys
    version: 1.4.0
    sha: fa2e27ae6ab525c3d369ded447057bca5438d86dc3a68f6faafb8269ba82ebf3
  - name: clap
    version: 4.1.4
    sha: f13b9c79b5d1dd500d20ef541215a6423c75829ef43117e1b4d17fd8af0b5d76
  - name: clap_complete
    version: 4.2.0
    sha: 01c22dcfb410883764b29953103d9ef7bb8fe21b3fa1158bc99986c2067294bd
  - name: clap_derive
    version: 4.1.0
    sha: 684a277d672e91966334af371f1a7b5833f9aa00b07c84e92fbce95e00208ce8
  - name: clap_lex
    version: 0.3.1
    sha: 783fe232adfca04f90f56201b26d79682d4cd2625e0bc7290b95123afe558ade
  - name: either
    version: 1.8.1
    sha: 7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91
  - name: env_logger
    version: 0.10.0
    sha: 85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0
  - name: env_logger
    version: 0.8.4
    sha: a19187fea3ac7e84da7dacf48de0c45d63c6a76f9490dae389aead16c243fce3
  - name: errno
    version: 0.3.1
    sha: 4bcfec3a70f97c962c307b2d2c56e358cf1d00b558d74262b5f929ee8cc7e73a
  - name: errno-dragonfly
    version: 0.1.2
    sha: aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf
  - name: fastrand
    version: 1.8.0
    sha: a7a407cfaa3385c4ae6b23e84623d48c2798d06e3e6a1878f7f59f17b3f86499
  - name: getrandom
    version: 0.2.8
    sha: c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31
  - name: glob
    version: 0.3.1
    sha: d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b
  - name: heck
    version: 0.4.0
    sha: 2540771e65fc8cb83cd6e8a237f70c319bd5c29f78ed1084ba5d50eeac86f7f9
  - name: hermit-abi
    version: 0.3.2
    sha: 443144c8cdadd93ebf52ddb4056d257f5b52c04d3c804e657d19eb73fc33668b
  - name: humantime
    version: 2.1.0
    sha: 9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4
  - name: instant
    version: 0.1.12
    sha: 7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c
  - name: io-lifetimes
    version: 1.0.4
    sha: e7d6c6f8c91b4b9ed43484ad1a938e393caf35960fce7f82a040497207bd8e9e
  - name: is-terminal
    version: 0.4.7
    sha: adcf93614601c8129ddf72e2d5633df827ba6551541c6d8c59520a371475be1f
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: lazycell
    version: 1.3.0
    sha: 830d08ce1d1d941e6b30645f1a0eb5643013d835ce3779a5fc208261dbe10f55
  - name: libc
    version: 0.2.139
    sha: 201de327520df007757c1f0adce6e827fe8562fbc28bfd9c15571c66ca1f5f79
  - name: libloading
    version: 0.7.4
    sha: b67380fd3b2fbe7527a606e18729d21c6f3951633d0500574c4dc22d2d638b9f
  - name: linux-raw-sys
    version: 0.1.4
    sha: f051f77a7c8e6957c0696eac88f26b0117e54f52d3fc682ab19397a8812846a4
  - name: linux-raw-sys
    version: 0.3.8
    sha: ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519
  - name: log
    version: 0.4.17
    sha: abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e
  - name: malloc_buf
    version: 0.0.6
    sha: 62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb
  - name: memchr
    version: 2.5.0
    sha: 2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d
  - name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - name: nom
    version: 7.1.3
    sha: d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a
  - name: objc
    version: 0.2.7
    sha: 915b1b472bc21c53464d6c8461c9d3af805ba1ef837e1cac254428f4a77177b1
  - name: once_cell
    version: 1.17.0
    sha: 6f61fba1741ea2b3d6a1e3178721804bb716a68a6aeba1149b5d52e3d464ea66
  - name: os_str_bytes
    version: 6.4.1
    sha: 9b7820b9daea5457c9f21c69448905d723fbd21136ccf521748f23fd49e723ee
  - name: owo-colors
    version: 3.5.0
    sha: c1b04fb49957986fdce4d6ee7a65027d55d4b6d2265e5848bbb507b58ccfdb6f
  - name: peeking_take_while
    version: 0.1.2
    sha: 19b17cddbe7ec3f8bc800887bab5e717348c95ea2ca0b1bf0837fb964dc67099
  - name: prettyplease
    version: 0.2.7
    sha: 43ded2b5b204571f065ab8540367d738dfe1b3606ab9eb669dcfb5e7a3a07501
  - name: proc-macro-error
    version: 1.0.4
    sha: da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c
  - name: proc-macro-error-attr
    version: 1.0.4
    sha: a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869
  - name: proc-macro2
    version: 1.0.60
    sha: dec2b086b7a862cf4de201096214fa870344cf922b2b30c167badb3af3195406
  - name: quickcheck
    version: 1.0.3
    sha: 588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6
  - name: quote
    version: 1.0.28
    sha: 1b9ab9c7eadfd8df19006f1cf1a4aed13540ed5cbc047010ece5826e10825488
  - name: rand
    version: 0.8.5
    sha: 34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404
  - name: rand_core
    version: 0.6.4
    sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
  - name: redox_syscall
    version: 0.2.16
    sha: fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a
  - name: regex
    version: 1.7.1
    sha: 48aaa5748ba571fb95cd2c85c09f629215d3a6ece942baa100950af03a34f733
  - name: regex-syntax
    version: 0.6.28
    sha: 456c603be3e8d448b072f410900c09faf164fbce2d480456f50eea6e25f9c848
  - name: rustc-hash
    version: 1.1.0
    sha: 08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2
  - name: rustix
    version: 0.36.16
    sha: 6da3636faa25820d8648e0e31c5d519bbb01f72fdf57131f0f5f7da5fed36eab
  - name: rustix
    version: 0.37.3
    sha: 62b24138615de35e32031d041a09032ef3487a616d901ca4db224e7d557efae2
  - name: shlex
    version: 1.1.0
    sha: 43b2853a4d09f215c24cc5489c992ce46052d359b5109343cbafbf26bc62f8a3
  - name: similar
    version: 2.2.1
    sha: 420acb44afdae038210c99e69aae24109f32f15500aa708e81d46c9f29d55fcf
  - name: strsim
    version: 0.10.0
    sha: 73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623
  - name: syn
    version: 1.0.107
    sha: 1f4064b5b16e03ae50984a5a8ed5d4f8803e6bc1fd170a3cda91a1be4b18e3f5
  - name: syn
    version: 2.0.18
    sha: 32d41677bcbe24c20c52e7c70b0d8db04134c5d1066bf98662e2871ad200ea3e
  - name: tempfile
    version: 3.4.0
    sha: af18f7ae1acd354b992402e9ec5864359d693cd8a79dcbef59f76891701c1e95
  - name: termcolor
    version: 1.2.0
    sha: be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6
  - name: unicode-ident
    version: 1.0.6
    sha: 84a22b9f218b40614adcb3f4ff08b703773ad44fa9423e4e0d346d5db86e4ebc
  - name: unicode-width
    version: 0.1.10
    sha: c0edd1e5b14653f783770bce4a4dabb4a5108a5370a5f5d8cfe8710c361f6c8b
  - name: version_check
    version: 0.9.4
    sha: 49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f
  - name: wasi
    version: 0.11.0+wasi-snapshot-preview1
    sha: 9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423
  - name: which
    version: 4.4.0
    sha: 2441c784c52b289a054b7201fc93253e288f094e2f4be9058343127c4226a269
  - name: winapi
    version: 0.3.9
    sha: 5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419
  - name: winapi-i686-pc-windows-gnu
    version: 0.4.0
    sha: ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6
  - name: winapi-util
    version: 0.1.5
    sha: 70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178
  - name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - name: windows-sys
    version: 0.42.0
    sha: 5a3e1820f08b8513f676f7ab6c1f99ff312fb97b553d30ff4dd86f9f15728aa7
  - name: windows-sys
    version: 0.45.0
    sha: 75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0
  - name: windows-sys
    version: 0.48.0
    sha: 677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9
  - name: windows-targets
    version: 0.42.2
    sha: 8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071
  - name: windows-targets
    version: 0.48.1
    sha: 05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f
  - name: windows_aarch64_gnullvm
    version: 0.42.2
    sha: 597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8
  - name: windows_aarch64_gnullvm
    version: 0.48.0
    sha: 91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc
  - name: windows_aarch64_msvc
    version: 0.42.2
    sha: e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43
  - name: windows_aarch64_msvc
    version: 0.48.0
    sha: b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3
  - name: windows_i686_gnu
    version: 0.42.2
    sha: c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f
  - name: windows_i686_gnu
    version: 0.48.0
    sha: 622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241
  - name: windows_i686_msvc
    version: 0.42.2
    sha: 44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060
  - name: windows_i686_msvc
    version: 0.48.0
    sha: 4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00
  - name: windows_x86_64_gnu
    version: 0.42.2
    sha: 8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36
  - name: windows_x86_64_gnu
    version: 0.48.0
    sha: ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1
  - name: windows_x86_64_gnullvm
    version: 0.42.2
    sha: 26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3
  - name: windows_x86_64_gnullvm
    version: 0.48.0
    sha: 7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953
  - name: windows_x86_64_msvc
    version: 0.42.2
    sha: 9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0
  - name: windows_x86_64_msvc
    version: 0.48.0
    sha: 1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a
  - name: yansi-term
    version: 0.1.2
    sha: fe5c30ade05e61656247b2e334a031dfd0cc466fadef865bdcdea8d537951bf1
