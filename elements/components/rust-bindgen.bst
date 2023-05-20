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
  ref: v0.65.1-0-g7d243056d335fdc4537f7bca73c06d01aae24ddc
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
  - name: clap_derive
    version: 4.1.0
    sha: 684a277d672e91966334af371f1a7b5833f9aa00b07c84e92fbce95e00208ce8
  - name: clap_lex
    version: 0.3.1
    sha: 783fe232adfca04f90f56201b26d79682d4cd2625e0bc7290b95123afe558ade
  - name: diff
    version: 0.1.13
    sha: 56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8
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
    version: 0.2.8
    sha: f639046355ee4f37944e44f60642c6f3a7efa3cf6b78c78a0d989a8ce6c396a1
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
    version: 0.2.6
    sha: ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7
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
    version: 0.4.2
    sha: 28dfb6c8100ccc63462345b67d1bbc3679177c75ee4bf59bf29c8b1d110b8189
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
  - name: peeking_take_while
    version: 0.1.2
    sha: 19b17cddbe7ec3f8bc800887bab5e717348c95ea2ca0b1bf0837fb964dc67099
  - name: prettyplease
    version: 0.2.0
    sha: 4508c0eff4d1e708551034de4bddd61bf8bda8c7b5ae72bd844cf68ea21117ac
  - name: proc-macro-error
    version: 1.0.4
    sha: da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c
  - name: proc-macro-error-attr
    version: 1.0.4
    sha: a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869
  - name: proc-macro2
    version: 1.0.52
    sha: 1d0e1ae9e836cc3beddd63db0df682593d7e2d3d891ae8c9083d2113e1744224
  - name: quickcheck
    version: 1.0.3
    sha: 588f6378e4dd99458b60ec275b4477add41ce4fa9f64dcba6f15adccb19b50d6
  - name: quote
    version: 1.0.26
    sha: 4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc
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
    version: 0.36.7
    sha: d4fdebc4b395b7fbb9ab11e462e20ed9051e7b16e42d24042c776eca0ac81b03
  - name: shlex
    version: 1.1.0
    sha: 43b2853a4d09f215c24cc5489c992ce46052d359b5109343cbafbf26bc62f8a3
  - name: strsim
    version: 0.10.0
    sha: 73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623
  - name: syn
    version: 1.0.107
    sha: 1f4064b5b16e03ae50984a5a8ed5d4f8803e6bc1fd170a3cda91a1be4b18e3f5
  - name: syn
    version: 2.0.7
    sha: 9a9a90d19f27bb60792270bb90225f96d97fc5705395134b2ca1dcbb3acc27f4
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
  - name: windows_aarch64_gnullvm
    version: 0.42.1
    sha: 8c9864e83243fdec7fc9c5444389dcbbfd258f745e7853198f365e3c4968a608
  - name: windows_aarch64_msvc
    version: 0.42.1
    sha: 4c8b1b673ffc16c47a9ff48570a9d85e25d265735c503681332589af6253c6c7
  - name: windows_i686_gnu
    version: 0.42.1
    sha: de3887528ad530ba7bdbb1faa8275ec7a1155a45ffa57c37993960277145d640
  - name: windows_i686_msvc
    version: 0.42.1
    sha: bf4d1122317eddd6ff351aa852118a2418ad4214e6613a50e0191f7004372605
  - name: windows_x86_64_gnu
    version: 0.42.1
    sha: c1040f221285e17ebccbc2591ffdc2d44ee1f9186324dd3e84e99ac68d699c45
  - name: windows_x86_64_gnullvm
    version: 0.42.1
    sha: 628bfdf232daa22b0d64fdb62b09fcc36bb01f05a3939e20ab73aaf9470d0463
  - name: windows_x86_64_msvc
    version: 0.42.1
    sha: 447660ad36a13288b1db4d4248e857b510e8c3a225c822ba4fb748c0aafecffd
  - name: yansi-term
    version: 0.1.2
    sha: fe5c30ade05e61656247b2e334a031dfd0cc466fadef865bdcdea8d537951bf1
