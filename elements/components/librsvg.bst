kind: autotools

depends:
- bootstrap-import.bst
- components/gdk-pixbuf.bst
- components/pango.bst
- components/cairo.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/rust.bst
- components/vala.bst
- components/gtk-doc.bst
- components/gobject-introspection.bst

variables:
  conf-local: |
    --enable-gtk-doc \
    --enable-vala

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/librsvg-2.so'

environment:
  PATH: /usr/bin:/usr/lib/sdk/rust/bin

sources:
- kind: git_tag
  url: gnome:librsvg.git
  track: librsvg-2.48
  exclude:
  - '*.*[13579].*'
  ref: 2.48.11-0-g0ca67e3c81ac67d12ad84bfc34e325e240bb5128
- kind: cargo
  url: crates:crates
  ref:
  - name: aho-corasick
    version: 0.7.15
    sha: 7404febffaa47dac81aa44dba71523c9d069b1bdc50a77db41195149e17f68e5
  - name: alga
    version: 0.9.3
    sha: 4f823d037a7ec6ea2197046bafd4ae150e6bc36f9ca347404f46a46823fa84f2
  - name: approx
    version: 0.3.2
    sha: f0e60b75072ecd4168020818c0107f2857bb6c4e64252d8d3983f6263b40a5c3
  - name: atty
    version: 0.2.14
    sha: d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8
  - name: autocfg
    version: 1.0.1
    sha: cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a
  - name: bitflags
    version: 1.2.1
    sha: cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693
  - name: block
    version: 0.1.6
    sha: 0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a
  - name: bstr
    version: 0.2.15
    sha: a40b47ad93e1a5404e6c18dec46b628214fee441c70f4ab5d6942142cc268a3d
  - name: bumpalo
    version: 3.6.1
    sha: 63396b8a4b9de3f4fdfb320ab6080762242f66a8ef174c49d8e19b674db4cdbe
  - name: bytemuck
    version: 1.5.1
    sha: bed57e2090563b83ba8f83366628ce535a7584c9afa4c9fc0612a03925c6df58
  - name: byteorder
    version: 1.4.3
    sha: 14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610
  - name: cairo-rs
    version: 0.8.1
    sha: 157049ba9618aa3a61c39d5d785102c04d3b1f40632a706c621a9aedc21e6084
  - name: cairo-sys-rs
    version: 0.9.2
    sha: ff65ba02cac715be836f63429ab00a767d48336efc5497c5637afb53b4f14d63
  - name: cast
    version: 0.2.5
    sha: cc38c385bfd7e444464011bb24820f40dd1c76bcdfa1b78611cb7c2e5cafab75
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: clap
    version: 2.33.3
    sha: 37e58ac78573c40708d45522f0d80fa2f01cc4f9b4e2bf749807255454312002
  - name: convert_case
    version: 0.4.0
    sha: 6245d59a3e82a7fc217c5828a6692dbc6dfb63a0c8c90495621f7b9d79704a0e
  - name: criterion
    version: 0.3.4
    sha: ab327ed7354547cc2ef43cbe20ef68b988e70b4b593cbd66a2a61733123a3d23
  - name: criterion-plot
    version: 0.4.3
    sha: e022feadec601fba1649cfa83586381a4ad31c6bf3a9ab7d408118b05dd9889d
  - name: crossbeam-channel
    version: 0.5.1
    sha: 06ed27e177f16d65f0f0c22a213e17c696ace5dd64b14258b52f9417ccb52db4
  - name: crossbeam-deque
    version: 0.8.0
    sha: 94af6efb46fef72616855b036a624cf27ba656ffc9be1b9a3c931cfc7749a9a9
  - name: crossbeam-epoch
    version: 0.9.3
    sha: 2584f639eb95fea8c798496315b297cf81b9b58b6d30ab066a75455333cf4b12
  - name: crossbeam-utils
    version: 0.8.3
    sha: e7e9d99fa91428effe99c5c6d4634cdeba32b8cf784fc428a2a687f61a952c49
  - name: cssparser
    version: 0.27.2
    sha: 754b69d351cdc2d8ee09ae203db831e005560fc6030da058f86ad60c92a9cb0a
  - name: cssparser-macros
    version: 0.6.0
    sha: dfae75de57f2b2e85e8768c3ea840fd159c8f33e2b6522c7835b7abac81be16e
  - name: csv
    version: 1.1.6
    sha: 22813a6dc45b335f9bade10bf7271dc477e81113e89eb251a0bc2a8a81c536e1
  - name: csv-core
    version: 0.1.10
    sha: 2b2466559f260f48ad25fe6317b3c8dac77b5bdb5763ac7d9d6103530663bc90
  - name: data-url
    version: 0.1.0
    sha: d33fe99ccedd6e84bc035f1931bb2e6be79739d6242bd895e7311c886c50dc9c
  - name: derive_more
    version: 0.99.13
    sha: f82b1b72f1263f214c0f823371768776c4f5841b942c9883aa8e5ec584fd0ba6
  - name: downcast-rs
    version: 1.2.0
    sha: 9ea835d29036a4087793836fa931b08837ad5e957da9e23886b29586fb9b6650
  - name: dtoa
    version: 0.4.8
    sha: 56899898ce76aaf4a0f24d914c97ea6ed976d42fec6ad33fcbb0a1103e07b2b0
  - name: dtoa-short
    version: 0.3.3
    sha: bde03329ae10e79ede66c9ce4dc930aa8599043b0743008548680f25b91502d6
  - name: either
    version: 1.6.1
    sha: e78d4f1cc4ae33bbfc157ed5d5a5ef3bc29227303d595861deb238fcec4e9457
  - name: encoding
    version: 0.2.33
    sha: 6b0d943856b990d12d3b55b359144ff341533e516d94098b1d3fc1ac666d36ec
  - name: encoding-index-japanese
    version: 1.20141219.5
    sha: 04e8b2ff42e9a05335dbf8b5c6f7567e5591d0d916ccef4e0b1710d32a0d0c91
  - name: encoding-index-korean
    version: 1.20141219.5
    sha: 4dc33fb8e6bcba213fe2f14275f0963fd16f0a02c878e3095ecfdf5bee529d81
  - name: encoding-index-simpchinese
    version: 1.20141219.5
    sha: d87a7194909b9118fc707194baa434a4e3b0fb6a5a757c73c3adb07aa25031f7
  - name: encoding-index-singlebyte
    version: 1.20141219.5
    sha: 3351d5acffb224af9ca265f435b859c7c01537c0849754d3db3fdf2bfe2ae84a
  - name: encoding-index-tradchinese
    version: 1.20141219.5
    sha: fd0e20d5688ce3cab59eb3ef3a2083a5c77bf496cb798dc6fcdb75f323890c18
  - name: encoding_index_tests
    version: 0.1.4
    sha: a246d82be1c9d791c5dfde9a2bd045fc3cbba3fa2b11ad558f27d01712f00569
  - name: float-cmp
    version: 0.6.0
    sha: da62c4f1b81918835a8c6a484a397775fff5953fe83529afd51b05f5c6a6617d
  - name: form_urlencoded
    version: 1.0.1
    sha: 5fc25a87fa4fd2094bffb06925852034d90a17f0d1e05197d4956d3555752191
  - name: futf
    version: 0.1.4
    sha: 7c9c1ce3fa9336301af935ab852c437817d14cd33690446569392e65170aac3b
  - name: futures-channel
    version: 0.3.14
    sha: ce79c6a52a299137a6013061e0cf0e688fce5d7f1bc60125f520912fdb29ec25
  - name: futures-core
    version: 0.3.14
    sha: 098cd1c6dda6ca01650f1a37a794245eb73181d0d4d4e955e2f3c37db7af1815
  - name: futures-executor
    version: 0.3.14
    sha: 10f6cb7042eda00f0049b1d2080aa4b93442997ee507eb3828e8bd7577f94c9d
  - name: futures-io
    version: 0.3.14
    sha: 365a1a1fb30ea1c03a830fdb2158f5236833ac81fa0ad12fe35b29cddc35cb04
  - name: futures-macro
    version: 0.3.14
    sha: 668c6733a182cd7deb4f1de7ba3bf2120823835b3bcfbeacf7d2c4a773c1bb8b
  - name: futures-task
    version: 0.3.14
    sha: ba7aa51095076f3ba6d9a1f702f74bd05ec65f555d70d2033d55ba8d69f581bc
  - name: futures-util
    version: 0.3.14
    sha: 3c144ad54d60f23927f0a6b6d816e4271278b64f005ad65e4e35291d2de9c025
  - name: fxhash
    version: 0.2.1
    sha: c31b6d751ae2c7f11320402d34e41349dd1016f8d5d45e48c4312bc8625af50c
  - name: gdk-pixbuf
    version: 0.8.0
    sha: e248220c46b329b097d4b158d2717f8c688f16dd76d0399ace82b3e98062bdd7
  - name: gdk-pixbuf-sys
    version: 0.9.1
    sha: d8991b060a9e9161bafd09bf4a202e6fd404f5b4dd1a08d53a1e84256fb34ab0
  - name: generic-array
    version: 0.13.3
    sha: f797e67af32588215eaaab8327027ee8e71b9dd0b2b26996aedf20c030fce309
  - name: getrandom
    version: 0.1.16
    sha: 8fc3cb4d91f53b50155bdcfd23f6a4c39ae1969c2ae85982b135750cccaf5fce
  - name: gio
    version: 0.8.1
    sha: 0cd10f9415cce39b53f8024bf39a21f84f8157afa52da53837b102e585a296a5
  - name: gio-sys
    version: 0.9.1
    sha: 4fad225242b9eae7ec8a063bb86974aca56885014672375e5775dc0ea3533911
  - name: glib
    version: 0.9.3
    sha: 40fb573a09841b6386ddf15fd4bc6655b4f5b106ca962f57ecaecde32a0061c0
  - name: glib-sys
    version: 0.9.1
    sha: 95856f3802f446c05feffa5e24859fe6a183a7cb849c8449afc35c86b1e316e2
  - name: gobject-sys
    version: 0.9.1
    sha: 31d1a804f62034eccf370006ccaef3708a71c31d561fee88564abe71177553d9
  - name: half
    version: 1.7.1
    sha: 62aca2aba2d62b4a7f5b33f3712cb1b0692779a56fb510499d5c0aa594daeaf3
  - name: hermit-abi
    version: 0.1.18
    sha: 322f4de77956e22ed0e5032c359a0f1273f1f7f0d79bfa3b8ffbc730d7fbcc5c
  - name: idna
    version: 0.2.2
    sha: 89829a5d69c23d348314a7ac337fe39173b61149a9864deabd260983aed48c21
  - name: itertools
    version: 0.10.0
    sha: 37d572918e350e82412fe766d24b15e6682fb2ed2bbe018280caa810397cb319
  - name: itertools
    version: 0.8.2
    sha: f56a2d0bc861f9165be4eb3442afd3c236d8a98afd426f65d92324ae1091a484
  - name: itertools
    version: 0.9.0
    sha: 284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b
  - name: itoa
    version: 0.4.7
    sha: dd25036021b0de88a0aff6b850051563c6516d0bf53f8638938edbb9de732736
  - name: js-sys
    version: 0.3.50
    sha: 2d99f9e3e84b8f67f846ef5b4cbbc3b1c29f6c759fcbce6f01aa0e73d932a24c
  - name: language-tags
    version: 0.2.2
    sha: a91d884b6667cd606bb5a69aa0c99ba811a115fc68915e7056ec08a46e93199a
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: libc
    version: 0.2.93
    sha: 9385f66bf6105b241aa65a61cb923ef20efc665cb9f9bb50ac2f0c4b7f378d41
  - name: libm
    version: 0.2.1
    sha: c7d73b3f436185384286bd8098d17ec07c9a7d2388a6599f824d8502b529702a
  - name: locale_config
    version: 0.3.0
    sha: 08d2c35b16f4483f6c26f0e4e9550717a2f6575bcd6f12a53ff0c490a94a6934
  - name: log
    version: 0.4.14
    sha: 51b9bbe6c47d51fc3e1a9b945965946b4c44142ab8792c50835a980d362c2710
  - name: mac
    version: 0.1.1
    sha: c41e0c4fef86961ac6d6f8a82609f55f31b05e4fce149ac5710e439df7619ba4
  - name: malloc_buf
    version: 0.0.6
    sha: 62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb
  - name: markup5ever
    version: 0.10.0
    sha: aae38d669396ca9b707bfc3db254bc382ddb94f57cc5c235f34623a669a01dab
  - name: matches
    version: 0.1.8
    sha: 7ffc5c5338469d4d3ea17d269fa8ea3512ad247247c30bd2df69e68309ed0a08
  - name: matrixmultiply
    version: 0.2.4
    sha: 916806ba0031cd542105d916a97c8572e1fa6dd79c9c51e7eb43a09ec2dd84c1
  - name: memchr
    version: 2.3.4
    sha: 0ee1c47aaa256ecabcaea351eae4a9b01ef39ed810004e298d2511ed284b1525
  - name: memoffset
    version: 0.6.3
    sha: f83fb6581e8ed1f85fd45c116db8405483899489e38406156c25eb743554361d
  - name: nalgebra
    version: 0.19.0
    sha: 0abb021006c01b126a936a8dd1351e0720d83995f4fc942d0d426c654f990745
  - name: new_debug_unreachable
    version: 1.0.4
    sha: e4a24736216ec316047a1fc4252e27dabb04218aa4a3f37c6e7ddbf1f9782b54
  - name: nodrop
    version: 0.1.14
    sha: 72ef4a56884ca558e5ddb05a1d1e7e1bfd9a68d9ed024c21704cc98872dae1bb
  - name: num-complex
    version: 0.2.4
    sha: b6b19411a9719e753aff12e5187b74d60d3dc449ec3f4dc21e3989c3f554bc95
  - name: num-integer
    version: 0.1.44
    sha: d2cc698a63b549a70bc047073d2949cce27cd1c7b0a4a862d08a8031bc2801db
  - name: num-rational
    version: 0.2.4
    sha: 5c000134b5dbf44adc5cb772486d335293351644b801551abe8f75c84cfa4aef
  - name: num-traits
    version: 0.2.14
    sha: 9a64b1ec5cda2586e284722486d802acf1f7dbdc623e2bfc57e65ca1cd099290
  - name: num_cpus
    version: 1.13.0
    sha: 05499f3756671c15885fee9034446956fff3f243d6077b91e5767df161f766b3
  - name: objc
    version: 0.2.7
    sha: 915b1b472bc21c53464d6c8461c9d3af805ba1ef837e1cac254428f4a77177b1
  - name: objc-foundation
    version: 0.1.1
    sha: 1add1b659e36c9607c7aab864a76c7a4c2760cd0cd2e120f3fb8b952c7e22bf9
  - name: objc_id
    version: 0.1.1
    sha: c92d4ddb4bd7b50d730c215ff871754d0da6b2178849f8a2a2ab69712d0c073b
  - name: once_cell
    version: 1.7.2
    sha: af8b08b04175473088b46763e51ee54da5f9a164bc162f615b91bc179dbf15a3
  - name: oorandom
    version: 11.1.3
    sha: 0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb1e66b63caa84da26b575
  - name: pango
    version: 0.8.0
    sha: 1e9c6b728f1be8edb5f9f981420b651d5ea30bdb9de89f1f1262d0084a020577
  - name: pango-sys
    version: 0.9.1
    sha: 86b93d84907b3cf0819bff8f13598ba72843bee579d5ebc2502e4b0367b4be7d
  - name: pangocairo
    version: 0.9.0
    sha: bdd1077c0db2e5eb9225cc040514aa856cb6a4c4890c542cf50d37880e1c572d
  - name: pangocairo-sys
    version: 0.10.1
    sha: a3921b31ab776b23e28c8f6e474dda52fdc28bc2689101caeb362ba976719efe
  - name: percent-encoding
    version: 2.1.0
    sha: d4fd5641d01c8f18a23da7b6fe29298ff4b55afcccdf78973b24cf3175fee32e
  - name: phf
    version: 0.8.0
    sha: 3dfb61232e34fcb633f43d12c58f83c1df82962dcdfa565a4e866ffc17dafe12
  - name: phf_codegen
    version: 0.8.0
    sha: cbffee61585b0411840d3ece935cce9cb6321f01c45477d30066498cd5e1a815
  - name: phf_generator
    version: 0.8.0
    sha: 17367f0cc86f2d25802b2c26ee58a7b23faeccf78a396094c13dced0d0182526
  - name: phf_macros
    version: 0.8.0
    sha: 7f6fde18ff429ffc8fe78e2bf7f8b7a5a5a6e2a8b58bc5a9ac69198bbda9189c
  - name: phf_shared
    version: 0.8.0
    sha: c00cf8b9eafe68dde5e9eaa2cef8ee84a9336a47d566ec55ca16589633b65af7
  - name: pin-project-lite
    version: 0.2.6
    sha: dc0e1f259c92177c30a4c9d177246edd0a3568b25756a977d0632cf8fa37e905
  - name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - name: pkg-config
    version: 0.3.19
    sha: 3831453b3449ceb48b6d9c7ad7c96d5ea673e9b470a1dc578c2ce6521230884c
  - name: plotters
    version: 0.3.0
    sha: 45ca0ae5f169d0917a7c7f5a9c1a3d3d9598f18f529dd2b8373ed988efea307a
  - name: plotters-backend
    version: 0.3.0
    sha: b07fffcddc1cb3a1de753caa4e4df03b79922ba43cf882acc1bdd7e8df9f4590
  - name: plotters-svg
    version: 0.3.0
    sha: b38a02e23bd9604b842a812063aec4ef702b57989c37b655254bb61c471ad211
  - name: ppv-lite86
    version: 0.2.10
    sha: ac74c624d6b2d21f425f752262f42188365d7b8ff1aff74c82e45136510a4857
  - name: precomputed-hash
    version: 0.1.1
    sha: 925383efa346730478fb4838dbe9137d2a47675ad789c546d150a6e1dd4ab31c
  - name: proc-macro-hack
    version: 0.5.19
    sha: dbf0c48bc1d91375ae5c3cd81e3722dff1abcf81a30960240640d223f59fe0e5
  - name: proc-macro-nested
    version: 0.1.7
    sha: bc881b2c22681370c6a780e47af9840ef841837bc98118431d4e1868bd0c1086
  - name: proc-macro2
    version: 1.0.26
    sha: a152013215dca273577e18d2bf00fa862b89b24169fb78c4c95aeb07992c9cec
  - name: quote
    version: 1.0.9
    sha: c3d0b9745dc2debf507c8422de05d7226cc1f0644216dfdfead988f9b1ab32a7
  - name: rand
    version: 0.7.3
    sha: 6a6b1679d49b24bbfe0c803429aa1874472f50d9b363131f0e89fc356b544d03
  - name: rand_chacha
    version: 0.2.2
    sha: f4c8ed856279c9737206bf725bf36935d8666ead7aa69b52be55af369d193402
  - name: rand_core
    version: 0.5.1
    sha: 90bde5296fc891b0cef12a6d03ddccc162ce7b2aff54160af9338f8d40df6d19
  - name: rand_distr
    version: 0.2.2
    sha: 96977acbdd3a6576fb1d27391900035bf3863d4a16422973a409b488cf29ffb2
  - name: rand_hc
    version: 0.2.0
    sha: ca3129af7b92a17112d59ad498c6f81eaf463253766b90396d39ea7a39d6613c
  - name: rand_pcg
    version: 0.2.1
    sha: 16abd0c1b639e9eb4d7c50c0b8100b0d0f849be2349829c740fe8e6eb4816429
  - name: rawpointer
    version: 0.2.1
    sha: 60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3
  - name: rayon
    version: 1.5.0
    sha: 8b0d8e0819fadc20c74ea8373106ead0600e3a67ef1fe8da56e39b9ae7275674
  - name: rayon-core
    version: 1.9.0
    sha: 9ab346ac5921dc62ffa9f89b7a773907511cdfa5490c572ae9be1be33e8afa4a
  - name: rctree
    version: 0.3.3
    sha: be9e29cb19c8fe84169fcb07f8f11e66bc9e6e0280efd4715c54818296f8a4a8
  - name: regex
    version: 1.4.5
    sha: 957056ecddbeba1b26965114e191d2e8589ce74db242b6ea25fc4062427a5c19
  - name: regex-automata
    version: 0.1.9
    sha: ae1ded71d66a4a97f5e961fd0cb25a5f366a42a41570d16a763a69c092c26ae4
  - name: regex-syntax
    version: 0.6.23
    sha: 24d5f089152e60f62d28b835fbff2cd2e8dc0baf1ac13343bef92ab7eed84548
  - name: rgb
    version: 0.8.27
    sha: 8fddb3b23626145d1776addfc307e1a1851f60ef6ca64f376bcb889697144cf0
  - name: rustc_version
    version: 0.2.3
    sha: 138e3e0acb6c9fb258b19b67cb8abd63c00679d2851805ea151465464fe9030a
  - name: ryu
    version: 1.0.5
    sha: 71d301d4193d031abdd79ff7e3dd721168a9572ef3fe51a1517aba235bd8f86e
  - name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
  - name: scopeguard
    version: 1.1.0
    sha: d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd
  - name: selectors
    version: 0.22.0
    sha: df320f1889ac4ba6bc0cdc9c9af7af4bd64bb927bccdf32d81140dc1f9be12fe
  - name: semver
    version: 0.9.0
    sha: 1d7eb9ef2c18661902cc47e535f9bc51b78acd254da71d375c2f6720d9a40403
  - name: semver-parser
    version: 0.7.0
    sha: 388a1df253eca08550bef6c72392cfe7c30914bf41df5269b68cbd6ff8f570a3
  - name: serde
    version: 1.0.125
    sha: 558dc50e1a5a5fa7112ca2ce4effcb321b0300c0d4ccf0776a9f60cd89031171
  - name: serde_cbor
    version: 0.11.1
    sha: 1e18acfa2f90e8b735b2836ab8d538de304cbb6729a7360729ea5a895d15a622
  - name: serde_derive
    version: 1.0.125
    sha: b093b7a2bb58203b5da3056c05b4ec1fed827dcfdb37347a8841695263b3d06d
  - name: serde_json
    version: 1.0.64
    sha: 799e97dc9fdae36a5c8b8f2cae9ce2ee9fdce2058c57a93e6099d919fd982f79
  - name: servo_arc
    version: 0.1.1
    sha: d98238b800e0d1576d8b6e3de32827c2d74bee68bb97748dcf5071fb53965432
  - name: siphasher
    version: 0.3.5
    sha: cbce6d4507c7e4a3962091436e56e95290cb71fa302d0d270e32130b75fbff27
  - name: slab
    version: 0.4.2
    sha: c111b5bd5695e56cffe5129854aa230b39c93a305372fdbb2668ca2394eea9f8
  - name: smallvec
    version: 1.6.1
    sha: fe0f37c9e8f3c5a4a66ad655a93c74daac4ad00c441533bf5c6e7990bb42604e
  - name: stable_deref_trait
    version: 1.2.0
    sha: a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3
  - name: string_cache
    version: 0.8.1
    sha: 8ddb1139b5353f96e429e1a5e19fbaf663bddedaa06d1dbd49f82e352601209a
  - name: string_cache_codegen
    version: 0.5.1
    sha: f24c8e5e19d22a726626f1a5e16fe15b132dcf21d10177fa5a45ce7962996b97
  - name: syn
    version: 1.0.69
    sha: 48fe99c6bd8b1cc636890bcc071842de909d902c81ac7dab53ba33c421ab8ffb
  - name: tendril
    version: 0.4.2
    sha: a9ef557cb397a4f0a5a3a628f06515f78563f2209e64d47055d9dc6052bf5e33
  - name: textwrap
    version: 0.11.0
    sha: d326610f408c7a4eb6f51c37c330e496b08506c9457c9d34287ecc38809fb060
  - name: thin-slice
    version: 0.1.1
    sha: 8eaa81235c7058867fa8c0e7314f33dcce9c215f535d1913822a2b3f5e289f3c
  - name: time
    version: 0.1.44
    sha: 6db9e6914ab8b1ae1c260a4ae7a49b6c5611b40328a735b21862567685e73255
  - name: tinytemplate
    version: 1.2.1
    sha: be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc
  - name: tinyvec
    version: 1.2.0
    sha: 5b5220f05bb7de7f3f53c7c065e1199b3172696fe2db9f9c4d8ad9b4ee74c342
  - name: tinyvec_macros
    version: 0.1.0
    sha: cda74da7e1a664f795bb1f8a87ec406fb89a02522cf6e50620d016add6dbbf5c
  - name: typenum
    version: 1.13.0
    sha: 879f6906492a7cd215bfa4cf595b600146ccfac0c79bcbd1f3000162af5e8b06
  - name: unicode-bidi
    version: 0.3.5
    sha: eeb8be209bb1c96b7c177c7420d26e04eccacb0eeae6b980e35fcb74678107e0
  - name: unicode-normalization
    version: 0.1.17
    sha: 07fbfce1c8a97d547e8b5334978438d9d6ec8c20e38f56d4a4374d181493eaef
  - name: unicode-width
    version: 0.1.8
    sha: 9337591893a19b88d8d87f2cec1e73fad5cdfd10e5a6f349f498ad6ea2ffb1e3
  - name: unicode-xid
    version: 0.2.1
    sha: f7fe0bb3479651439c9112f72b6c505038574c9fbb575ed1bf3b797fa39dd564
  - name: url
    version: 2.2.1
    sha: 9ccd964113622c8e9322cfac19eb1004a07e636c545f325da085d5cdde6f1f8b
  - name: utf-8
    version: 0.7.5
    sha: 05e42f7c18b8f902290b009cde6d651262f956c98bc51bca4cd1d511c9cd85c7
  - name: walkdir
    version: 2.3.2
    sha: 808cf2735cd4b6866113f648b791c6adc5714537bc222d9347bb203386ffda56
  - name: wasi
    version: 0.10.0+wasi-snapshot-preview1
    sha: 1a143597ca7c7793eff794def352d41792a93c481eb1042423ff7ff72ba2c31f
  - name: wasi
    version: 0.9.0+wasi-snapshot-preview1
    sha: cccddf32554fecc6acb585f82a32a72e28b48f8c4c1883ddfeeeaa96f7d8e519
  - name: wasm-bindgen
    version: 0.2.73
    sha: 83240549659d187488f91f33c0f8547cbfef0b2088bc470c116d1d260ef623d9
  - name: wasm-bindgen-backend
    version: 0.2.73
    sha: ae70622411ca953215ca6d06d3ebeb1e915f0f6613e3b495122878d7ebec7dae
  - name: wasm-bindgen-macro
    version: 0.2.73
    sha: 3e734d91443f177bfdb41969de821e15c516931c3c3db3d318fa1b68975d0f6f
  - name: wasm-bindgen-macro-support
    version: 0.2.73
    sha: d53739ff08c8a68b0fdbcd54c372b8ab800b1449ab3c9d706503bc7dd1621b2c
  - name: wasm-bindgen-shared
    version: 0.2.73
    sha: d9a543ae66aa233d14bb765ed9af4a33e81b8b58d1584cf1b47ff8cd0b9e4489
  - name: web-sys
    version: 0.3.50
    sha: a905d57e488fec8861446d3393670fb50d27a262344013181c2cdf9fff5481be
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
  - name: xml5ever
    version: 0.16.1
    sha: 0b1b52e6e8614d4a58b8e70cf51ec0cc21b256ad8206708bcff8139b5bbd6a59
