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
  ref: v1.11.4-0-gb80ab1f95443db3d9614cdfa3f147b610e136890
- kind: cargo2
  cargo-lock: Cargo.lock
  ref:
  - kind: registry
    name: adler2
    version: 2.0.1
    sha: 320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa
  - kind: registry
    name: ahash
    version: 0.8.12
    sha: 5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75
  - kind: registry
    name: aho-corasick
    version: 1.1.4
    sha: ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301
  - kind: registry
    name: allocator-api2
    version: 0.2.21
    sha: 683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923
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
    version: 1.0.100
    sha: a23eb6b1614318a8071c9b2521f36b424b2c83db5eb3a0fead4a6c0809af6e61
  - kind: registry
    name: arbitrary
    version: 1.4.2
    sha: c3d036a3c4ab069c7b410a2ce876bd74808d2d0888a82667669f8e783a898bf1
  - kind: registry
    name: autocfg
    version: 1.5.0
    sha: c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8
  - kind: registry
    name: automod
    version: 1.0.15
    sha: ebb4bd301db2e2ca1f5be131c24eb8ebf2d9559bc3744419e93baf8ddea7e670
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: bitflags
    version: 2.10.0
    sha: 812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3
  - kind: registry
    name: block-buffer
    version: 0.10.4
    sha: 3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71
  - kind: registry
    name: boxcar
    version: 0.2.14
    sha: 36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e
  - kind: registry
    name: bstr
    version: 1.12.1
    sha: 63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab
  - kind: registry
    name: bumpalo
    version: 3.19.0
    sha: 46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43
  - kind: registry
    name: byteorder
    version: 1.5.0
    sha: 1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b
  - kind: registry
    name: bytes
    version: 1.11.0
    sha: b35204fbdc0b3f4446b89fc1ac2cf84a8a68971995d0bf2e925ec7cd960f9cb3
  - kind: registry
    name: bytesize
    version: 2.2.0
    sha: c99fa31e08a43eaa5913ef68d7e01c37a2bdce6ed648168239ad33b7d30a9cd8
  - kind: registry
    name: bzip2
    version: 0.6.1
    sha: f3a53fac24f34a81bc9954b5d6cfce0c21e18ec6959f44f56e8e90e4bb7c346c
  - kind: registry
    name: cab
    version: 0.6.0
    sha: 171228650e6721d5acc0868a462cd864f49ac5f64e4a42cde270406e64e404d2
  - kind: registry
    name: camino
    version: 1.2.1
    sha: 276a59bf2b2c967788139340c9f0c5b12d7fd6630315c15c217e559de85d2609
  - kind: registry
    name: cargo-config2
    version: 0.1.39
    sha: 3795d3a48839a46854805f56c8fe9c558f10804bcf57df53925ca843d87c788f
  - kind: registry
    name: cargo-options
    version: 0.7.6
    sha: f89e1d6d6f65fe04d5e21be9de19d31a074e3b7e43aa39ee5b85f4cee16c3188
  - kind: registry
    name: cargo-platform
    version: 0.1.9
    sha: e35af189006b9c0f00a064685c727031e3ed2d8020f7ba284d78cc2671bd36ea
  - kind: registry
    name: cargo-platform
    version: 0.2.0
    sha: 84982c6c0ae343635a3a4ee6dedef965513735c8b183caa7289fa6e27399ebd4
  - kind: registry
    name: cargo-util-schemas
    version: 0.2.0
    sha: e63d2780ac94487eb9f1fea7b0d56300abc9eb488800854ca217f102f5caccca
  - kind: registry
    name: cargo-xwin
    version: 0.18.6
    sha: 5dff83aad332bd6ee29072dd874b48892cd22c58e233c25735eb4417b3999685
  - kind: registry
    name: cargo-zigbuild
    version: 0.20.1
    sha: a9584d77470f7ffea2fb67fbcc9e8dbe9fa79a80dafd579a83507c0a08d1f658
  - kind: registry
    name: cargo_metadata
    version: 0.19.2
    sha: dd5eb614ed4c27c5d706420e4320fbe3216ab31fa1c33cd8246ac36dae4479ba
  - kind: registry
    name: cargo_metadata
    version: 0.20.0
    sha: 4f7835cfc6135093070e95eb2b53e5d9b5c403dc3a6be6040ee026270aa82502
  - kind: registry
    name: cbindgen
    version: 0.29.2
    sha: befbfd072a8e81c02f8c507aefce431fe5e7d051f83d48a23ffc9b9fe5a11799
  - kind: registry
    name: cc
    version: 1.2.46
    sha: b97463e1064cb1b1c1384ad0a0b9c8abd0988e2a91f52606c80ef14aadb63e36
  - kind: registry
    name: cfb
    version: 0.10.0
    sha: d8a4f8e55be323b378facfcf1f06aa97f6ec17cf4ac84fb17325093aaf62da41
  - kind: registry
    name: cfg-if
    version: 1.0.4
    sha: 9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801
  - kind: registry
    name: cfg_aliases
    version: 0.2.1
    sha: 613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724
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
    version: 4.5.52
    sha: aa8120877db0e5c011242f96806ce3c94e0737ab8108532a76a3300a01db2ab8
  - kind: registry
    name: clap_builder
    version: 4.5.52
    sha: 02576b399397b659c26064fbc92a75fede9d18ffd5f80ca1cd74ddab167016e1
  - kind: registry
    name: clap_complete
    version: 4.5.60
    sha: 8e602857739c5a4291dfa33b5a298aeac9006185229a700e5810a3ef7272d971
  - kind: registry
    name: clap_complete_command
    version: 0.6.1
    sha: da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62
  - kind: registry
    name: clap_complete_nushell
    version: 4.5.10
    sha: 685bc86fd34b7467e0532a4f8435ab107960d69a243785ef0275e571b35b641a
  - kind: registry
    name: clap_derive
    version: 4.5.49
    sha: 2a0b5487afeab2deb2ff4e03a807ad1a03ac532ff5a2cee5d86884440c7f7671
  - kind: registry
    name: clap_lex
    version: 0.7.6
    sha: a1d728cc89cf3aee9ff92b05e62b19ee65a02b5702cff7d5a377e32c6ae29d8d
  - kind: registry
    name: cli-table
    version: 0.4.9
    sha: b53f9241f288a7b12c56565f04aaeaeeab6b8923d42d99255d4ca428b4d97f89
  - kind: registry
    name: colorchoice
    version: 1.0.4
    sha: b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75
  - kind: registry
    name: configparser
    version: 3.1.0
    sha: e57e3272f0190c3f1584272d613719ba5fc7df7f4942fe542e63d949cf3a649b
  - kind: registry
    name: console
    version: 0.15.11
    sha: 054ccb5b10f9f2cbf51eb355ca1d05c2d279ce1804688d0db74b4733a5aeafd8
  - kind: registry
    name: console
    version: 0.16.1
    sha: b430743a6eb14e9764d4260d4c0d8123087d504eeb9c48f2b2a5e810dd369df4
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
    version: 0.8.7
    sha: 773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b
  - kind: registry
    name: cpufeatures
    version: 0.2.17
    sha: 59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280
  - kind: registry
    name: crc
    version: 3.3.0
    sha: 9710d3b3739c2e349eb44fe848ad0b7c8cb1e42bd87ee49371df2f7acaf3e675
  - kind: registry
    name: crc-catalog
    version: 2.4.0
    sha: 19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5
  - kind: registry
    name: crc32fast
    version: 1.5.0
    sha: 9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511
  - kind: registry
    name: crossbeam-channel
    version: 0.5.15
    sha: 82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2
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
    name: crypto-common
    version: 0.1.7
    sha: 78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a
  - kind: registry
    name: data-encoding
    version: 2.9.0
    sha: 2a2330da5de22e8a3cb63252ce2abb30116bf5265e89c0e01bc17015ce30a476
  - kind: registry
    name: deranged
    version: 0.5.5
    sha: ececcb659e7ba858fb4f10388c250a7252eb0a27373f1a72b8748afdd248e587
  - kind: registry
    name: derive_arbitrary
    version: 1.4.2
    sha: 1e567bd82dcff979e4b03460c307b3cdc9e96fde3d73bed1496d2bc75d9dd62a
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
    version: 1.0.10
    sha: 8975ffdaa0ef3661bfe02dbdcc06c9f829dfafe6a3c474de366a8d5e44276921
  - kind: registry
    name: dunce
    version: 1.0.5
    sha: 92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813
  - kind: registry
    name: dyn-clone
    version: 1.0.20
    sha: d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555
  - kind: registry
    name: either
    version: 1.15.0
    sha: 48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719
  - kind: registry
    name: encode_unicode
    version: 1.0.0
    sha: 34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0
  - kind: registry
    name: encoding_rs
    version: 0.8.35
    sha: 75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3
  - kind: registry
    name: env_home
    version: 0.1.0
    sha: c7f84e12ccf0a7ddc17a6c41c93326024c42920d7ee630d04950e6926645c0fe
  - kind: registry
    name: equivalent
    version: 1.0.2
    sha: 877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f
  - kind: registry
    name: erased-serde
    version: 0.4.9
    sha: 89e8918065695684b2b0702da20382d5ae6065cf3327bc2d6436bd49a71ce9f3
  - kind: registry
    name: errno
    version: 0.3.14
    sha: 39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb
  - kind: registry
    name: expect-test
    version: 1.5.1
    sha: 63af43ff4431e848fb47472a920f14fa71c24de13255a5692e93d4e90302acb0
  - kind: registry
    name: fastrand
    version: 2.3.0
    sha: 37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be
  - kind: registry
    name: fat-macho
    version: 0.4.10
    sha: a64465b99fa411ca36a47048e9b1deec20f609b072711e3949e6d135403ea16d
  - kind: registry
    name: filetime
    version: 0.2.26
    sha: bc0505cd1b6fa6580283f6bdf70a73fcf4aba1184038c90902b92b3dd0df63ed
  - kind: registry
    name: find-msvc-tools
    version: 0.1.5
    sha: 3a3076410a55c90011c298b04d0cfa770b00fa04e1e3c97d3f6c9de105a03844
  - kind: registry
    name: flate2
    version: 1.1.5
    sha: bfe33edd8e85a12a67454e37f8c75e730830d83e313556ab9ebf9ee7fbeb3bfb
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
    version: 1.2.2
    sha: cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf
  - kind: registry
    name: fs-err
    version: 3.2.0
    sha: 62d91fd049c123429b018c47887d3f75a265540dd3c30ba9cb7bae9197edb03a
  - kind: registry
    name: fs4
    version: 0.13.1
    sha: 8640e34b88f7652208ce9e88b1a37a2ae95227d84abec377ccd3c5cfeb141ed4
  - kind: registry
    name: futures-core
    version: 0.3.31
    sha: 05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e
  - kind: registry
    name: futures-macro
    version: 0.3.31
    sha: 162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650
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
    version: 0.2.16
    sha: 335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592
  - kind: registry
    name: getrandom
    version: 0.3.4
    sha: 899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd
  - kind: registry
    name: glob
    version: 0.3.3
    sha: 0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280
  - kind: registry
    name: globset
    version: 0.4.18
    sha: 52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3
  - kind: registry
    name: goblin
    version: 0.10.3
    sha: 51876e3748c4a347fe65b906f2b1ae46a1e55a497b22c94c1f4f2c469ff7673a
  - kind: registry
    name: hashbrown
    version: 0.14.5
    sha: e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1
  - kind: registry
    name: hashbrown
    version: 0.16.0
    sha: 5419bdc4f6a9207fbeba6d11b604d481addf78ecd10c11ad51e76c2f6482748d
  - kind: registry
    name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - kind: registry
    name: humantime
    version: 2.3.0
    sha: 135b12329e5e3ce057a9f972339ea52bc954fe1e9358ef27f95e89716fbc5424
  - kind: registry
    name: humantime-serde
    version: 1.1.1
    sha: 57a3db5ea5923d99402c94e9feb261dc5ee9b4efa158b0315f788cf549cc200c
  - kind: registry
    name: icu_collections
    version: 2.1.1
    sha: 4c6b649701667bbe825c3b7e6388cb521c23d88644678e83c0c4d0a621a34b43
  - kind: registry
    name: icu_locale_core
    version: 2.1.1
    sha: edba7861004dd3714265b4db54a3c390e880ab658fec5f7db895fae2046b5bb6
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
    version: 2.1.1
    sha: e93fcd3157766c0c8da2f8cff6ce651a31f0810eaa1c51ec363ef790bbb5fb99
  - kind: registry
    name: icu_properties_data
    version: 2.1.1
    sha: 02845b3647bb045f1100ecd6480ff52f34c35f82d9880e029d329c21d1054899
  - kind: registry
    name: icu_provider
    version: 2.1.1
    sha: 85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614
  - kind: registry
    name: idna
    version: 1.1.0
    sha: 3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de
  - kind: registry
    name: idna_adapter
    version: 1.2.1
    sha: 3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344
  - kind: registry
    name: ignore
    version: 0.4.25
    sha: d3d782a365a015e0f5c04902246139249abf769125006fbe7649e2ee88169b4a
  - kind: registry
    name: indexmap
    version: 2.12.0
    sha: 6717a8d2a5a929a1a2eb43a12812498ed141a0bcfb7e8f7844fbdbe4303bba9f
  - kind: registry
    name: indicatif
    version: 0.17.11
    sha: 183b3088984b400f4cfac3620d5e076c84da5364016b4f49473de574b2586235
  - kind: registry
    name: indoc
    version: 2.0.7
    sha: 79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706
  - kind: registry
    name: insta
    version: 1.43.2
    sha: 46fdb647ebde000f43b5b53f773c30cf9b0cb4300453208713fa38b2c70935a0
  - kind: registry
    name: is_terminal_polyfill
    version: 1.70.2
    sha: a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695
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
    version: 1.0.15
    sha: 4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c
  - kind: registry
    name: jobserver
    version: 0.1.34
    sha: 9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33
  - kind: registry
    name: js-sys
    version: 0.3.82
    sha: b011eec8cc36da2aab2d5cff675ec18454fad408585853910a202391cf9f8e65
  - kind: registry
    name: keyring
    version: 2.3.3
    sha: 363387f0019d714aa60cc30ab4fe501a747f4c08fc58f069dd14be971bd495a0
  - kind: registry
    name: lazy_static
    version: 1.5.0
    sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
  - kind: registry
    name: lddtree
    version: 0.4.0
    sha: 9cd71f004036b2ea41763739528084d0d2a9dea4fda11816a31d67edb2bd239f
  - kind: registry
    name: libbz2-rs-sys
    version: 0.2.2
    sha: 2c4a545a15244c7d945065b5d392b2d2d7f21526fba56ce51467b06ed445e8f7
  - kind: registry
    name: libc
    version: 0.2.177
    sha: 2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976
  - kind: registry
    name: libmimalloc-sys
    version: 0.1.44
    sha: 667f4fec20f29dfc6bc7357c582d91796c169ad7e2fce709468aefeb2c099870
  - kind: registry
    name: libredox
    version: 0.1.10
    sha: 416f7e718bdb06000964960ffa43b4335ad4012ae8b99060261aa4a8088d5ccb
  - kind: registry
    name: libz-rs-sys
    version: 0.5.2
    sha: 840db8cf39d9ec4dd794376f38acc40d0fc65eec2a8f484f7fd375b84602becd
  - kind: registry
    name: linux-keyutils
    version: 0.2.4
    sha: 761e49ec5fd8a5a463f9b84e877c373d888935b71c6be78f3767fe2ae6bed18e
  - kind: registry
    name: linux-raw-sys
    version: 0.11.0
    sha: df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039
  - kind: registry
    name: litemap
    version: 0.8.1
    sha: 6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77
  - kind: registry
    name: lock_api
    version: 0.4.14
    sha: 224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965
  - kind: registry
    name: log
    version: 0.4.28
    sha: 34080505efa8e45a4b816c349525ebe327ceaa8559756f0356cba97ef3bf7432
  - kind: registry
    name: lzma-rust2
    version: 0.13.0
    sha: c60a23ffb90d527e23192f1246b14746e2f7f071cb84476dd879071696c18a4a
  - kind: registry
    name: lzma-sys
    version: 0.1.20
    sha: 5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27
  - kind: registry
    name: lzxd
    version: 0.2.6
    sha: 7b29dffab797218e12e4df08ef5d15ab9efca2504038b1b32b9b32fc844b39c9
  - kind: registry
    name: mailparse
    version: 0.16.1
    sha: 60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f
  - kind: registry
    name: matchers
    version: 0.2.0
    sha: d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9
  - kind: registry
    name: memchr
    version: 2.7.6
    sha: f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273
  - kind: registry
    name: memmap2
    version: 0.9.9
    sha: 744133e4a0e0a658e1374cf3bf8e415c4052a15a111acd372764c55b4177d490
  - kind: registry
    name: mimalloc
    version: 0.1.48
    sha: e1ee66a4b64c74f4ef288bcbb9192ad9c3feaad75193129ac8509af543894fd8
  - kind: registry
    name: mime
    version: 0.3.17
    sha: 6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a
  - kind: registry
    name: mime_guess
    version: 2.0.5
    sha: f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e
  - kind: registry
    name: minijinja
    version: 2.12.0
    sha: a9f264d75233323f4b7d2f03aefe8a990690cdebfbfe26ea86bcbaec5e9ac990
  - kind: registry
    name: minimal-lexical
    version: 0.2.1
    sha: 68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a
  - kind: registry
    name: miniz_oxide
    version: 0.8.9
    sha: 1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316
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
    version: 0.2.14
    sha: 87de3442987e9dbec73158d5c715e7ad9072fda936bb03d19d7fa10e00520f0e
  - kind: registry
    name: nix
    version: 0.30.1
    sha: 74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6
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
    version: 1.5.0
    sha: bf23ab2b905654b4cb177e30b629937b3868311d4e1cba859f899c041046e69b
  - kind: registry
    name: nu-ansi-term
    version: 0.50.3
    sha: 7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5
  - kind: registry
    name: num-conv
    version: 0.1.0
    sha: 51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9
  - kind: registry
    name: num-traits
    version: 0.2.19
    sha: 071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841
  - kind: registry
    name: number_prefix
    version: 0.4.0
    sha: 830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3
  - kind: registry
    name: once_cell
    version: 1.21.3
    sha: 42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d
  - kind: registry
    name: once_cell_polyfill
    version: 1.70.2
    sha: 384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe
  - kind: registry
    name: openssl
    version: 0.10.75
    sha: 08838db121398ad17ab8531ce9de97b244589089e290a384c900cb9ff7434328
  - kind: registry
    name: openssl-macros
    version: 0.1.1
    sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
  - kind: registry
    name: openssl-probe
    version: 0.1.6
    sha: d05e27ee213611ffe7d6348b942e8f942b37114c00cc03cec254295a4a17852e
  - kind: registry
    name: openssl-sys
    version: 0.9.111
    sha: 82cab2d520aa75e3c58898289429321eb788c3106963d0dc886ec7a5f4adc321
  - kind: registry
    name: option-ext
    version: 0.2.0
    sha: 04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d
  - kind: registry
    name: ordered-float
    version: 2.10.1
    sha: 68f19d67e5a2795c94e73e0bb1cc1a7edeb2e28efd39e2e1c9b7a40c1108b11c
  - kind: registry
    name: os_pipe
    version: 1.2.3
    sha: 7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967
  - kind: registry
    name: parking_lot
    version: 0.12.5
    sha: 93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a
  - kind: registry
    name: parking_lot_core
    version: 0.9.12
    sha: 2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1
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
    version: 2.3.2
    sha: 9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220
  - kind: registry
    name: pin-project-lite
    version: 0.2.16
    sha: 3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b
  - kind: registry
    name: pin-utils
    version: 0.1.0
    sha: 8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184
  - kind: registry
    name: pkg-config
    version: 0.3.32
    sha: 7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c
  - kind: registry
    name: plain
    version: 0.2.3
    sha: b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6
  - kind: registry
    name: platform-info
    version: 2.0.5
    sha: 7539aeb3fdd8cb4f6a331307cf71a1039cee75e94e8a71725b9484f4a0d9451a
  - kind: registry
    name: portable-atomic
    version: 1.11.1
    sha: f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483
  - kind: registry
    name: potential_utf
    version: 0.1.4
    sha: b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77
  - kind: registry
    name: powerfmt
    version: 0.2.0
    sha: 439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391
  - kind: registry
    name: ppv-lite86
    version: 0.2.21
    sha: 85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9
  - kind: registry
    name: pretty_assertions
    version: 1.4.1
    sha: 3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d
  - kind: registry
    name: proc-macro-crate
    version: 3.4.0
    sha: 219cb19e96be00ab2e37d6e299658a0cfa83e52429179969b0f0121b4ac46983
  - kind: registry
    name: proc-macro2
    version: 1.0.103
    sha: 5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8
  - kind: registry
    name: psm
    version: 0.1.27
    sha: e66fcd288453b748497d8fb18bccc83a16b0518e3906d4b8df0a8d42d93dbb1c
  - kind: registry
    name: pyproject-toml
    version: 0.13.7
    sha: f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2
  - kind: registry
    name: python-pkginfo
    version: 0.6.6
    sha: 464e5e2e0fb6c8c2c7aedc0cd6615258a3def4e34b417f6bf8835e76e7d441d4
  - kind: registry
    name: quote
    version: 1.0.42
    sha: a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f
  - kind: registry
    name: quoted_printable
    version: 0.5.1
    sha: 640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73
  - kind: registry
    name: r-efi
    version: 5.3.0
    sha: 69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f
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
    version: 1.11.0
    sha: 368f01d005bf8fd9b1206fb6fa653e6c4a81ceb1466406b81792d87c5677a58f
  - kind: registry
    name: rayon-core
    version: 1.13.0
    sha: 22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91
  - kind: registry
    name: redox_syscall
    version: 0.5.18
    sha: ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d
  - kind: registry
    name: redox_users
    version: 0.4.6
    sha: ba009ff324d1fc1b900bd1fdb31564febe58a8ccc8a6fdbb93b543d33b13ca43
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
    version: 1.12.2
    sha: 843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4
  - kind: registry
    name: regex-automata
    version: 0.4.13
    sha: 5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c
  - kind: registry
    name: regex-syntax
    version: 0.8.8
    sha: 7a2d987857b319362043e95f5353c0535c1f58eec5336fdfcf626430af7def58
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
    version: 0.17.14
    sha: a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7
  - kind: registry
    name: rstest
    version: 0.26.1
    sha: f5a3193c063baaa2a95a33f03035c8a72b83d97a54916055ba22d35ed3839d49
  - kind: registry
    name: rstest_macros
    version: 0.26.1
    sha: 9c845311f0ff7951c5506121a9ad75aec44d083c31583b2ea5a30bcb0b0abba0
  - kind: registry
    name: rustc-hash
    version: 2.1.1
    sha: 357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d
  - kind: registry
    name: rustc_version
    version: 0.4.1
    sha: cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92
  - kind: registry
    name: rustflags
    version: 0.1.7
    sha: a39e0e9135d7a7208ee80aa4e3e4b88f0f5ad7be92153ed70686c38a03db2e63
  - kind: registry
    name: rustix
    version: 1.1.2
    sha: cd15f8a2c5551a84d56efdc1cd049089e409ac19a3072d5037a17fd70719ff3e
  - kind: registry
    name: rustls
    version: 0.23.35
    sha: 533f54bc6a7d4f647e46ad909549eda97bf5afc1585190ef692b4286b198bd8f
  - kind: registry
    name: rustls-pemfile
    version: 2.2.0
    sha: dce314e5fee3f39953d46bb63bb8a46d40c2f8fb7cc5a3b6cab2bde9721d6e50
  - kind: registry
    name: rustls-pki-types
    version: 1.13.0
    sha: 94182ad936a0c91c324cd46c6511b9510ed16af436d7b5bab34beab0afd55f7a
  - kind: registry
    name: rustls-webpki
    version: 0.103.8
    sha: 2ffdfa2f5286e2247234e03f680868ac2815974dc39e00ea15adc445d0aafe52
  - kind: registry
    name: rustversion
    version: 1.0.22
    sha: b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d
  - kind: registry
    name: ryu
    version: 1.0.20
    sha: 28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f
  - kind: registry
    name: same-file
    version: 1.0.6
    sha: 93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502
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
    version: 1.1.0
    sha: 9558e172d4e8533736ba97870c4b2cd63f84b382a3d6eb063da41b91cce17289
  - kind: registry
    name: schemars_derive
    version: 1.1.0
    sha: 301858a4023d78debd2353c7426dc486001bddc91ae31a76fb1f55132f7e2633
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - kind: registry
    name: scroll
    version: 0.13.0
    sha: c1257cd4248b4132760d6524d6dda4e053bc648c9070b960929bf50cfb1e7add
  - kind: registry
    name: scroll_derive
    version: 0.13.1
    sha: ed76efe62313ab6610570951494bdaa81568026e0318eaa55f167de70eeea67d
  - kind: registry
    name: sdd
    version: 3.0.10
    sha: 490dcfcbfef26be6800d11870ff2df8774fa6e86d047e3e8c8a76b25655e41ca
  - kind: registry
    name: security-framework
    version: 2.11.1
    sha: 897b2245f0b511c87893af39b033e5ca9cce68824c4d7e7630b5a1d339658d02
  - kind: registry
    name: security-framework-sys
    version: 2.15.0
    sha: cc1f0cbffaac4852523ce30d8bd3c5cdc873501d96ff467ca09b6767bb8cd5c0
  - kind: registry
    name: semver
    version: 1.0.27
    sha: d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2
  - kind: registry
    name: serde
    version: 1.0.228
    sha: 9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e
  - kind: registry
    name: serde-untagged
    version: 0.1.9
    sha: f9faf48a4a2d2693be24c6289dbe26552776eb7737074e6722891fadbe6c5058
  - kind: registry
    name: serde-value
    version: 0.7.0
    sha: f3a1a3341211875ef120e117ea7fd5228530ae7e7036a779fdc9117be6b3282c
  - kind: registry
    name: serde_core
    version: 1.0.228
    sha: 41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad
  - kind: registry
    name: serde_derive
    version: 1.0.228
    sha: d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79
  - kind: registry
    name: serde_derive_internals
    version: 0.29.1
    sha: 18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711
  - kind: registry
    name: serde_json
    version: 1.0.145
    sha: 402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c
  - kind: registry
    name: serde_spanned
    version: 0.6.9
    sha: bf41e0cfaf7226dca15e8197172c295a782857fcb97fad1808a166870dee75a3
  - kind: registry
    name: serde_spanned
    version: 1.0.3
    sha: e24345aa0fe688594e73770a5f6d1b216508b4f93484c0026d521acd30134392
  - kind: registry
    name: serial_test
    version: 3.2.0
    sha: 1b258109f244e1d6891bf1053a55d63a5cd4f8f4c30cf9a1280989f80e7a1fa9
  - kind: registry
    name: serial_test_derive
    version: 3.2.0
    sha: 5d69265a08751de7844521fd15003ae0a888e035773ba05695c5c759a6f89eef
  - kind: registry
    name: sha2
    version: 0.10.9
    sha: a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283
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
    version: 2.7.0
    sha: bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa
  - kind: registry
    name: slab
    version: 0.4.11
    sha: 7a2ae44ef20feb57a68b23d846850f861394c2e02dc425a50098ae8c90267589
  - kind: registry
    name: smallvec
    version: 1.15.1
    sha: 67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03
  - kind: registry
    name: smawk
    version: 0.3.2
    sha: b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c
  - kind: registry
    name: snapbox
    version: 0.6.23
    sha: 96fa1ce81be900d083b30ec2d481e6658c2acfaa2cfc7be45ccc2cc1b820edb3
  - kind: registry
    name: snapbox-macros
    version: 0.4.0
    sha: 3b750c344002d7cc69afb9da00ebd9b5c0f8ac2eb7d115d9d45d5b5f47718d74
  - kind: registry
    name: socks
    version: 0.3.4
    sha: f0c3dbbd9ae980613c6dd8e28a9407b50509d3803b57624d5dfe8315218cd58b
  - kind: registry
    name: stable_deref_trait
    version: 1.2.1
    sha: 6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596
  - kind: registry
    name: stacker
    version: 0.1.22
    sha: e1f8b29fb42aafcea4edeeb6b2f2d7ecd0d969c48b4cf0d2e64aafc471dd6e59
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
    name: syn
    version: 2.0.110
    sha: a99801b5bd34ede4cf3fc688c5919368fea4e4814a4664359503e6015b280aea
  - kind: registry
    name: synstructure
    version: 0.13.2
    sha: 728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2
  - kind: registry
    name: tar
    version: 0.4.44
    sha: 1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a
  - kind: registry
    name: target-lexicon
    version: 0.13.3
    sha: df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c
  - kind: registry
    name: tempfile
    version: 3.23.0
    sha: 2d31c77bdf42a745371d260a26ca7163f1e0924b64afa0b688e61b5a9fa02f16
  - kind: registry
    name: termcolor
    version: 1.4.1
    sha: 06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755
  - kind: registry
    name: terminal_size
    version: 0.4.3
    sha: 60b8cb979cb11c32ce1603f8137b22262a9d131aaa5c37b5678025f22b8becd0
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
    version: 2.0.17
    sha: f63587ca0f12b72a0600bcba1d40081f830876000bb46dd2337a3051618f4fc8
  - kind: registry
    name: thiserror-impl
    version: 1.0.69
    sha: 4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1
  - kind: registry
    name: thiserror-impl
    version: 2.0.17
    sha: 3ff15c8ecd7de3849db632e14d18d2571fa09dfc5ed93479bc4485c7a517c913
  - kind: registry
    name: thread_local
    version: 1.1.9
    sha: f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185
  - kind: registry
    name: time
    version: 0.3.44
    sha: 91e7d9e3bb61134e77bde20dd4825b97c010155709965fedf0f49bb138e52a9d
  - kind: registry
    name: time-core
    version: 0.1.6
    sha: 40868e7c1d2f0b8d73e4a8c7f0ff63af4f6d19be117e90bd73eb1d62cf831c6b
  - kind: registry
    name: time-macros
    version: 0.2.24
    sha: 30cfb0125f12d9c277f35663a0a33f8c30190f4e4574868a330595412d34ebf3
  - kind: registry
    name: tinystr
    version: 0.8.2
    sha: 42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869
  - kind: registry
    name: toml
    version: 0.8.23
    sha: dc1beb996b9d83529a9e75c17a1686767d148d70663143c7854d8b4a09ced362
  - kind: registry
    name: toml
    version: 0.9.8
    sha: f0dc8b1fb61449e27716ec0e1bdf0f6b8f3e8f6b05391e8497b8b6d7804ea6d8
  - kind: registry
    name: toml_datetime
    version: 0.6.11
    sha: 22cddaf88f4fbc13c51aebbf5f8eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c
  - kind: registry
    name: toml_datetime
    version: 0.7.3
    sha: f2cdb639ebbc97961c51720f858597f7f24c4fc295327923af55b74c3c724533
  - kind: registry
    name: toml_edit
    version: 0.22.27
    sha: 41fe8c660ae4257887cf66394862d21dbca4a6ddd26f04a3560410406a2f819a
  - kind: registry
    name: toml_edit
    version: 0.23.7
    sha: 6485ef6d0d9b5d0ec17244ff7eb05310113c3f316f2d14200d4de56b3cb98f8d
  - kind: registry
    name: toml_parser
    version: 1.0.4
    sha: c0cbe268d35bdb4bb5a56a2de88d0ad0eb70af5384a99d648cd4b3d04039800e
  - kind: registry
    name: toml_write
    version: 0.1.2
    sha: 5d99f8c9a7727884afe522e9bd5edbfc91a3312b36a77b5fb8926e4c31a41801
  - kind: registry
    name: toml_writer
    version: 1.0.4
    sha: df8b2b54733674ad286d16267dcfc7a71ed5c776e4ac7aa3c3e2561f7c637bf2
  - kind: registry
    name: tracing
    version: 0.1.41
    sha: 784e0ac535deb450455cbfa28a6f0df145ea1bb7ae51b821cf5e7927fdcfbdd0
  - kind: registry
    name: tracing-attributes
    version: 0.1.30
    sha: 81383ab64e72a7a8b8e13130c49e3dab29def6d0c7d76a03087b3cf71c5c6903
  - kind: registry
    name: tracing-core
    version: 0.1.34
    sha: b9d12581f227e93f094d3af2ae690a574abb8a2b9b7a96e7cfe9647b2b617678
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
    version: 0.3.20
    sha: 2054a14f5307d601f88daf0553e1cbf472acc4f2c51afab632431cdcd72124d5
  - kind: registry
    name: trycmd
    version: 0.15.11
    sha: a81ea3136ddc88e19c2cc2eb3176b72abee4e831367cd8949f2a88ac5497e64e
  - kind: registry
    name: twox-hash
    version: 1.6.3
    sha: 97fee6b57c6a41524a810daee9286c02d7752c4253064d0b05472833a438f675
  - kind: registry
    name: typeid
    version: 1.0.3
    sha: bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c
  - kind: registry
    name: typenum
    version: 1.19.0
    sha: 562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb
  - kind: registry
    name: unicase
    version: 2.8.1
    sha: 75b844d17643ee918803943289730bec8aac480150456169e647ed0b576ba539
  - kind: registry
    name: unicode-ident
    version: 1.0.22
    sha: 9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5
  - kind: registry
    name: unicode-linebreak
    version: 0.1.5
    sha: 3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f
  - kind: registry
    name: unicode-width
    version: 0.1.14
    sha: 7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af
  - kind: registry
    name: unicode-width
    version: 0.2.2
    sha: b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254
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
    version: 2.12.1
    sha: 02d1a66277ed75f640d608235660df48c8e3c19f3b4edb6a263315626cc3c01d
  - kind: registry
    name: url
    version: 2.5.7
    sha: 08bc136a29a3d1758e07a9cca267be308aeebf5cfd5a10f3f67ab2097683ef5b
  - kind: registry
    name: urlencoding
    version: 2.1.3
    sha: daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da
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
    version: 1.18.1
    sha: 2f87b8aa10b915a06587d0dec516c282ff295b475d94abf425d62b57710070a2
  - kind: registry
    name: valuable
    version: 0.1.1
    sha: ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65
  - kind: registry
    name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
  - kind: registry
    name: version-ranges
    version: 0.1.2
    sha: 3595ffe225639f1e0fd8d7269dcc05d2fbfea93cfac2fea367daf1adb60aae91
  - kind: registry
    name: version_check
    version: 0.9.5
    sha: 0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a
  - kind: registry
    name: versions
    version: 6.3.2
    sha: f25d498b63d1fdb376b4250f39ab3a5ee8d103957346abacd911e2d8b612c139
  - kind: registry
    name: wait-timeout
    version: 0.2.1
    sha: 09ac3b126d3914f9849036f826e054cbabdc8519970b8998ddaf3b5bd3c65f11
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
    version: 1.0.1+wasi-0.2.4
    sha: 0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7
  - kind: registry
    name: wasm-bindgen
    version: 0.2.105
    sha: da95793dfc411fbbd93f5be7715b0578ec61fe87cb1a42b12eb625caa5c5ea60
  - kind: registry
    name: wasm-bindgen-macro
    version: 0.2.105
    sha: 04264334509e04a7bf8690f2384ef5265f05143a4bff3889ab7a3269adab59c2
  - kind: registry
    name: wasm-bindgen-macro-support
    version: 0.2.105
    sha: 420bc339d9f322e562942d52e115d57e950d12d88983a14c79b86859ee6c7ebc
  - kind: registry
    name: wasm-bindgen-shared
    version: 0.2.105
    sha: 76f218a38c84bcb33c25ec7059b07847d465ce0e0a76b995e134a45adcb6af76
  - kind: registry
    name: web-time
    version: 1.1.0
    sha: 5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb
  - kind: registry
    name: webpki-roots
    version: 0.26.11
    sha: 521bc38abb08001b01866da9f51eb7c5d647a19260e00054a8c7fd5f9e57f7a9
  - kind: registry
    name: webpki-roots
    version: 1.0.4
    sha: b2878ef029c47c6e8cf779119f20fcf52bde7ad42a731b2a304bc221df17571e
  - kind: registry
    name: which
    version: 7.0.3
    sha: 24d643ce3fd3e5b54854602a080f34fb10ab75e0b813ee32d00ca2b44fa74762
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
    version: 0.1.11
    sha: c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22
  - kind: registry
    name: winapi-x86_64-pc-windows-gnu
    version: 0.4.0
    sha: 712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f
  - kind: registry
    name: windows-link
    version: 0.2.1
    sha: f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5
  - kind: registry
    name: windows-sys
    version: 0.48.0
    sha: 677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9
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
    version: 0.48.5
    sha: 9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c
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
    version: 0.48.5
    sha: 2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8
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
    version: 0.48.5
    sha: dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc
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
    version: 0.48.5
    sha: a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e
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
    version: 0.48.5
    sha: 8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406
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
    version: 0.48.5
    sha: 53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e
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
    version: 0.48.5
    sha: 0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc
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
    version: 0.48.5
    sha: ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538
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
    version: 0.7.13
    sha: 21a0236b59786fed61e2a80582dd500fe61f18b5dca67a4a067d0bc9039339cf
  - kind: registry
    name: winsafe
    version: 0.0.19
    sha: d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904
  - kind: registry
    name: wit-bindgen
    version: 0.46.0
    sha: f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59
  - kind: registry
    name: writeable
    version: 0.6.2
    sha: 9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9
  - kind: registry
    name: xattr
    version: 1.6.1
    sha: 32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156
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
    version: 0.8.1
    sha: 72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954
  - kind: registry
    name: yoke-derive
    version: 0.8.1
    sha: b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d
  - kind: registry
    name: zerocopy
    version: 0.8.27
    sha: 0894878a5fa3edfd6da3f88c4805f4c8558e2b996227a3d864f47fe11e38282c
  - kind: registry
    name: zerocopy-derive
    version: 0.8.27
    sha: 88d2b8d9c68ad2b9e4340d7832716a4d21a22a1154777ad56ea55c51a9cf3831
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
    version: 2.4.2
    sha: fabe6324e908f85a1c52063ce7aa26b68dcb7eb6dbc83a2d148403c9bc3eba50
  - kind: registry
    name: zip
    version: 6.0.0
    sha: eb2a05c7c36fde6c09b08576c9f7fb4cda705990f73b58fe011abf7dfb24168b
  - kind: registry
    name: zlib-rs
    version: 0.5.2
    sha: 2f06ae92f42f5e5c42443fd094f245eb656abf56dd7cce9b8b263236565e00f2
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
