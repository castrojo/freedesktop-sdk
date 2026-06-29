# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
  - public-stacks/buildsystem-make.bst
  - components/rust.bst
  - components/cargo-c.bst
  - components/openssl.bst
  - components/pkg-config.bst

depends:
  - public-stacks/runtime-minimal.bst
  - components/ostree.bst

sources:
  - kind: git_repo
    url: github:coreos/bootupd
    track: v*
    ref: v0.3.2-0-g74828e964db0ad7414c570750f122299962c8d9e
  - kind: cargo2
    ref:
      - kind: registry
        name: aho-corasick
        version: 1.1.4
        sha: ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301
      - kind: registry
        name: ambient-authority
        version: 0.0.2
        sha: e9d4ee0d472d1cd2e28c97dfa124b3d8d992e10eb0a035f33f5d12e3a177ba3b
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
        version: 1.0.104
        sha: 330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470
      - kind: registry
        name: autocfg
        version: 1.5.0
        sha: c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8
      - kind: registry
        name: bitfield-struct
        version: 0.13.0
        sha: 3ca6739863c590881f038d033a146c51ddae239186a4327014839fd864f44ed5
      - kind: registry
        name: bitflags
        version: 2.11.0
        sha: 843867be96c8daad0d758b57df9392b6d8d271134fce549de6ce169ff98a92af
      - kind: registry
        name: block-buffer
        version: 0.10.4
        sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
      - kind: registry
        name: bootc-internal-blockdev
        version: 1.16.10
        sha: dd516789b3f7657d780a56f22fba9b20510d7389d8cbef6a0ec07d94b064df93
      - kind: registry
        name: bootc-internal-mount
        version: 1.16.11
        sha: 102fd10588989152a7890a7a8a1fba19cfbbfaece3a0565942f2e8ea7a599c26
      - kind: registry
        name: bootc-internal-utils
        version: 1.16.11
        sha: 6ef5845cbdaa40abd824d47ab4aa02d8264950b2016adc6e04272d88c1ca6bff
      - kind: registry
        name: bumpalo
        version: 3.20.2
        sha: 5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb
      - kind: registry
        name: byteorder
        version: 1.5.0
        sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
      - kind: registry
        name: bytes
        version: 1.11.1
        sha: 1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33
      - kind: registry
        name: camino
        version: 1.2.5
        sha: bb1307f12aa967b5a58416e87b3653360e0fd614a016b6e970db08fecbb1b80d
      - kind: registry
        name: cap-primitives
        version: 4.0.3
        sha: 8b5f74729fd2f44701d1a8eb47e906cdb3ccd9ec0f02baad85a744b791940b18
      - kind: registry
        name: cap-std
        version: 4.0.3
        sha: c1ec78e242cfa2cfe276807ac2ecc00315a6c97786977414bcd1c3963b6c91b8
      - kind: registry
        name: cap-std-ext
        version: 5.1.2
        sha: 6c6c5ac70c4465b47c3a322330f87c2df31e42ac527497d94dc1f1d1cb8989f9
      - kind: registry
        name: cap-tempfile
        version: 4.0.2
        sha: 42f22d5c0b1147e8bd9105fa004450f673c139d7e632f7edc3980f94a51f20f3
      - kind: registry
        name: cc
        version: 1.2.57
        sha: 7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423
      - kind: registry
        name: cfg-if
        version: 1.0.4
        sha: 9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801
      - kind: registry
        name: cfg_aliases
        version: 0.2.1
        sha: 613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724
      - kind: registry
        name: chrono
        version: 0.4.45
        sha: 1aa79e62e7697b8e29b513a68abacf485adcd1fe8284a4316c5ae868e6633327
      - kind: registry
        name: clap
        version: 4.6.3
        sha: 0fb99565819980999fb7b4a1796046a5c949e6d4ff132cf5fadf5a641e20d776
      - kind: registry
        name: clap_builder
        version: 4.6.2
        sha: f09628afdcc538b57f3c6341e9c8e9970f18e4a481690a64974d7023bd33548b
      - kind: registry
        name: clap_derive
        version: 4.6.3
        sha: 32f2392eae7f16557a3d727ef3a12e57b2b2ca6f98566a5f4fb41ffe305df077
      - kind: registry
        name: clap_lex
        version: 1.1.0
        sha: c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9
      - kind: registry
        name: colorchoice
        version: 1.0.5
        sha: 1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570
      - kind: registry
        name: core-foundation-sys
        version: 0.8.7
        sha: 773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b
      - kind: registry
        name: cpufeatures
        version: 0.2.17
        sha: 59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280
      - kind: registry
        name: crypto-common
        version: 0.1.7
        sha: 78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a
      - kind: registry
        name: digest
        version: 0.10.7
        sha: 9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292
      - kind: registry
        name: env_filter
        version: 2.0.0
        sha: 900d271a03799a1ee8d1ca9b19893b48ca674a9284fefcfb85f05e74ed314217
      - kind: registry
        name: env_logger
        version: 0.11.11
        sha: de671bd27a75a797dc9ae289ba1e77276e75e2026408aab65185384e2d5cd3f6
      - kind: registry
        name: equivalent
        version: 1.0.2
        sha: 877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f
      - kind: registry
        name: errno
        version: 0.3.14
        sha: 39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb
      - kind: registry
        name: fail
        version: 0.5.1
        sha: fe5e43d0f78a42ad591453aedb1d7ae631ce7ee445c7643691055a9ed8d3b01c
      - kind: registry
        name: fastrand
        version: 2.3.0
        sha: 37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be
      - kind: registry
        name: find-msvc-tools
        version: 0.1.9
        sha: 5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582
      - kind: registry
        name: fn-error-context
        version: 0.2.1
        sha: 2cd66269887534af4b0c3e3337404591daa8dc8b9b2b3db71f9523beb4bafb41
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
        name: fs-set-times
        version: 0.20.3
        sha: 94e7099f6313ecacbe1256e8ff9d617b75d1bcb16a6fddef94866d225a01a14a
      - kind: registry
        name: generic-array
        version: 0.14.7
        sha: 85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a
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
        name: hashbrown
        version: 0.15.5
        sha: 9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1
      - kind: registry
        name: hashbrown
        version: 0.16.1
        sha: 841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100
      - kind: registry
        name: heck
        version: 0.5.0
        sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
      - kind: registry
        name: hmac
        version: 0.12.1
        sha: 6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e
      - kind: registry
        name: iana-time-zone
        version: 0.1.65
        sha: e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470
      - kind: registry
        name: iana-time-zone-haiku
        version: 0.1.2
        sha: f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f
      - kind: registry
        name: id-arena
        version: 2.3.0
        sha: 3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954
      - kind: registry
        name: indexmap
        version: 2.13.0
        sha: 7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017
      - kind: registry
        name: io-extras
        version: 0.19.0
        sha: 20fd6de4ccfcc187e38bc21cfa543cb5a302cb86a8b114eb7f0bf0dc9f8ac00f
      - kind: registry
        name: io-lifetimes
        version: 2.0.4
        sha: 06432fb54d3be7964ecd3649233cddf80db2832f47fec34c01f65b3d9d774983
      - kind: registry
        name: io-lifetimes
        version: 3.0.1
        sha: 2f0fb0570afe1fed943c5c3d4102d5358592d8625fda6a0007fdbe65a92fba96
      - kind: registry
        name: ipnet
        version: 2.12.0
        sha: d98f6fed1fde3f8c21bc40a1abb88dd75e67924f9cffc3ef95607bad8017f8e2
      - kind: registry
        name: is_terminal_polyfill
        version: 1.70.2
        sha: a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695
      - kind: registry
        name: itoa
        version: 1.0.17
        sha: 92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2
      - kind: registry
        name: jiff
        version: 0.2.23
        sha: 1a3546dc96b6d42c5f24902af9e2538e82e39ad350b0c766eb3fbf2d8f3d8359
      - kind: registry
        name: jiff-static
        version: 0.2.23
        sha: 2a8c8b344124222efd714b73bb41f8b5120b27a7cc1c75593a6ff768d9d05aa4
      - kind: registry
        name: js-sys
        version: 0.3.91
        sha: b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c
      - kind: registry
        name: lazy_static
        version: 1.5.0
        sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
      - kind: registry
        name: leb128fmt
        version: 0.1.0
        sha: 09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2
      - kind: registry
        name: libc
        version: 0.2.189
        sha: 3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2
      - kind: registry
        name: libsystemd
        version: 0.7.2
        sha: 19c97a761fc86953c5b885422b22c891dbf5bcb9dcc99d0110d6ce4c052759f0
      - kind: registry
        name: linux-raw-sys
        version: 0.12.1
        sha: 32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53
      - kind: registry
        name: log
        version: 0.4.34
        sha: f9f8bd3e56ce4dfc153cf470fffbfa98c7620958b312ca5c3a4b8d5181fd13c6
      - kind: registry
        name: matchers
        version: 0.2.0
        sha: d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9
      - kind: registry
        name: maybe-owned
        version: 0.3.4
        sha: 4facc753ae494aeb6e3c22f839b158aebd4f9270f55cd3c79906c45476c47ab4
      - kind: registry
        name: memchr
        version: 2.8.0
        sha: f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79
      - kind: registry
        name: memoffset
        version: 0.9.1
        sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
      - kind: registry
        name: mio
        version: 1.1.1
        sha: a69bcab0ad47271a0234d9422b131806bf3968021e5dc9328caf2d4cd58557fc
      - kind: registry
        name: nix
        version: 0.29.0
        sha: 71e2746dc3a24dd78b3cfcb7be93368c6de9963d30f43a6a73998a9cf4b17b46
      - kind: registry
        name: nom
        version: 8.0.0
        sha: df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405
      - kind: registry
        name: nu-ansi-term
        version: 0.50.3
        sha: 7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5
      - kind: registry
        name: num-traits
        version: 0.2.19
        sha: 071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841
      - kind: registry
        name: once_cell
        version: 1.21.4
        sha: 9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50
      - kind: registry
        name: once_cell_polyfill
        version: 1.70.2
        sha: 384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe
      - kind: registry
        name: openssl
        version: 0.10.81
        sha: 77823a27f0babb03091cb9ed9ef80af3b39dbc82f97e8fa530374b7dafd87a45
      - kind: registry
        name: openssl-macros
        version: 0.1.1
        sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
      - kind: registry
        name: openssl-sys
        version: 0.9.117
        sha: b47e7e6bb2c38cd930d25a23b40fa52e068c10e85f3e03a7f5ba5aaca5713695
      - kind: registry
        name: os-release
        version: 0.1.0
        sha: 82f29ae2f71b53ec19cc23385f8e4f3d90975195aa3d09171ba3bef7159bec27
      - kind: registry
        name: owo-colors
        version: 4.3.0
        sha: d211803b9b6b570f68772237e415a029d5a50c65d382910b879fb19d3271f94d
      - kind: registry
        name: pin-project-lite
        version: 0.2.17
        sha: a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd
      - kind: registry
        name: pkg-config
        version: 0.3.32
        sha: 7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c
      - kind: registry
        name: portable-atomic
        version: 1.13.1
        sha: c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49
      - kind: registry
        name: portable-atomic-util
        version: 0.2.6
        sha: 091397be61a01d4be58e7841595bd4bfedb15f1cd54977d79b8271e94ed799a3
      - kind: registry
        name: ppv-lite86
        version: 0.2.21
        sha: 85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9
      - kind: registry
        name: prettyplease
        version: 0.2.37
        sha: 479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b
      - kind: registry
        name: proc-macro2
        version: 1.0.106
        sha: 8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934
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
        version: 0.6.4
        sha: ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c
      - kind: registry
        name: rand_core
        version: 0.9.5
        sha: 76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c
      - kind: registry
        name: regex
        version: 1.13.1
        sha: f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d
      - kind: registry
        name: regex-automata
        version: 0.4.16
        sha: 8fcfdb36bda0c880c5931cdc7a2bcdc8ba4556847b9d912bca70bc94708711ad
      - kind: registry
        name: regex-syntax
        version: 0.8.11
        sha: d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4
      - kind: registry
        name: rpm-version
        version: 0.5.1
        sha: 61e5905b7c264d3aec4c631f6a90f0b68bec5bcf9dc0be2bb793c4cf797eae7d
      - kind: registry
        name: rustix
        version: 1.1.4
        sha: b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190
      - kind: registry
        name: rustix-linux-procfs
        version: 0.1.1
        sha: 2fc84bf7e9aa16c4f2c758f27412dc9841341e16aa682d9c7ac308fe3ee12056
      - kind: registry
        name: rustversion
        version: 1.0.22
        sha: b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d
      - kind: registry
        name: same-file
        version: 1.0.6
        sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
      - kind: registry
        name: semver
        version: 1.0.27
        sha: d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2
      - kind: registry
        name: serde
        version: 1.0.229
        sha: 4148590afebada386688f18773da617792bf2ef03ffc1e4cbd2b1d45b023e0ba
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
        name: sha2
        version: 0.10.9
        sha: a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283
      - kind: registry
        name: sharded-slab
        version: 0.1.7
        sha: f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6
      - kind: registry
        name: shlex
        version: 1.3.0
        sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
      - kind: registry
        name: shlex
        version: 2.0.1
        sha: f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba
      - kind: registry
        name: signal-hook-registry
        version: 1.4.8
        sha: c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b
      - kind: registry
        name: smallvec
        version: 1.15.1
        sha: 67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03
      - kind: registry
        name: strsim
        version: 0.11.1
        sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
      - kind: registry
        name: subtle
        version: 2.6.1
        sha: 13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292
      - kind: registry
        name: syn
        version: 2.0.117
        sha: e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99
      - kind: registry
        name: syn
        version: 3.0.1
        sha: 5edbec4ed188954a10c12c038215f8ce7606b2d5c973cd8dc43e8795065c5f2f
      - kind: registry
        name: tempfile
        version: 3.27.0
        sha: 32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd
      - kind: registry
        name: terminal_size
        version: 0.4.4
        sha: 230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874
      - kind: registry
        name: thiserror
        version: 2.0.18
        sha: 4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4
      - kind: registry
        name: thiserror-impl
        version: 2.0.18
        sha: ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5
      - kind: registry
        name: thread_local
        version: 1.1.9
        sha: f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185
      - kind: registry
        name: tokio
        version: 1.50.0
        sha: 27ad5e34374e03cfffefc301becb44e9dc3c17584f414349ebe29ed26661822d
      - kind: registry
        name: tokio-macros
        version: 2.6.1
        sha: 5c55a2eff8b69ce66c84f85e1da1c233edc36ceb85a2058d11b0d6a3c7e7569c
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
        name: tracing-journald
        version: 0.3.2
        sha: 2d3a81ed245bfb62592b1e2bc153e77656d94ee6a0497683a65a12ccaf2438d0
      - kind: registry
        name: tracing-log
        version: 0.2.0
        sha: ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3
      - kind: registry
        name: tracing-subscriber
        version: 0.3.23
        sha: cb7f578e5945fb242538965c2d0b04418d38ec25c79d160cd279bf0731c8d319
      - kind: registry
        name: typenum
        version: 1.19.0
        sha: 562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb
      - kind: registry
        name: uapi-version
        version: 0.4.0
        sha: 849f6b1fe8a0fb07170737d7f3acf72cac5462fb3f4e86614474a49f7fac3b65
      - kind: registry
        name: uguid
        version: 2.2.1
        sha: 0c8352f8c05e47892e7eaf13b34abd76a7f4aeaf817b716e88789381927f199c
      - kind: registry
        name: unicode-ident
        version: 1.0.24
        sha: e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75
      - kind: registry
        name: unicode-xid
        version: 0.2.6
        sha: ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853
      - kind: registry
        name: utf8parse
        version: 0.2.2
        sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
      - kind: registry
        name: uuid
        version: 1.22.0
        sha: a68d3c8f01c0cfa54a75291d83601161799e4a89a39e0929f4b0354d88757a37
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
        name: virtfw-libefi
        version: 0.6.4
        sha: f8508c830cd7bd67ed6103ddc02a04b7aabfe6d2d57b1a1767ff8ec20b706a39
      - kind: registry
        name: walkdir
        version: 2.5.0
        sha: 29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b
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
        version: 0.2.114
        sha: 6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e
      - kind: registry
        name: wasm-bindgen-macro
        version: 0.2.114
        sha: 18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6
      - kind: registry
        name: wasm-bindgen-macro-support
        version: 0.2.114
        sha: 03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3
      - kind: registry
        name: wasm-bindgen-shared
        version: 0.2.114
        sha: 75a326b8c223ee17883a4251907455a2431acc2791c98c26279376490c378c16
      - kind: registry
        name: wasm-encoder
        version: 0.244.0
        sha: 990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319
      - kind: registry
        name: wasm-metadata
        version: 0.244.0
        sha: bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909
      - kind: registry
        name: wasmparser
        version: 0.244.0
        sha: 47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe
      - kind: registry
        name: winapi-util
        version: 0.1.11
        sha: c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22
      - kind: registry
        name: windows-core
        version: 0.62.2
        sha: b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb
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
        version: 0.2.1
        sha: f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5
      - kind: registry
        name: windows-result
        version: 0.4.1
        sha: 7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5
      - kind: registry
        name: windows-strings
        version: 0.5.1
        sha: 7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091
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
        version: 0.52.6
        sha: 9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973
      - kind: registry
        name: windows-targets
        version: 0.53.5
        sha: 4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3
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
        version: 0.52.6
        sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
      - kind: registry
        name: windows_aarch64_msvc
        version: 0.53.1
        sha: b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006
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
        version: 0.52.6
        sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
      - kind: registry
        name: windows_i686_msvc
        version: 0.53.1
        sha: 1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2
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
        version: 0.52.6
        sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
      - kind: registry
        name: windows_x86_64_gnullvm
        version: 0.53.1
        sha: 0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1
      - kind: registry
        name: windows_x86_64_msvc
        version: 0.52.6
        sha: 589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec
      - kind: registry
        name: windows_x86_64_msvc
        version: 0.53.1
        sha: d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650
      - kind: registry
        name: winx
        version: 0.36.4
        sha: 3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a17f49d82a6c1d1f42d
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
        name: zerocopy
        version: 0.8.42
        sha: f2578b716f8a7a858b7f02d5bd870c14bf4ddbbcf3a4c05414ba6503640505e3
      - kind: registry
        name: zerocopy-derive
        version: 0.8.42
        sha: 7e6cc098ea4d3bd6246687de65af3f920c430e236bee1e3bf2e441463f08a02f
      - kind: registry
        name: zmij
        version: 1.0.21
        sha: b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa
