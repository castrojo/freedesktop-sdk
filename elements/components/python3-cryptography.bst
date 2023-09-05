kind: pyproject

build-depends:
- public-stacks/buildsystem-python-maturin.bst
- components/python3-setuptools.bst
- components/rust.bst
- components/pkg-config.bst
- components/gcc.bst
- components/stripper.bst

depends:
- components/python3.bst
- components/python3-cffi.bst

sources:
- kind: git_repo
  url: github:pyca/cryptography.git
  track: '*.*.*'
  ref: 43.0.1-0-ga7733878281ca261c4ada04022fc706ba5de9d8b
- kind: cargo2
  cargo-lock: src/rust/Cargo.lock
  ref:
  - kind: registry
    name: asn1
    version: 0.16.2
    sha: 532ceda058281b62096b2add4ab00ab3a453d30dee28b8890f62461a0109ebbd
  - kind: registry
    name: asn1_derive
    version: 0.16.2
    sha: 56e6076d38cc17cc22b0f65f31170a2ee1975e6b07f0012893aefd86ce19c987
  - kind: registry
    name: autocfg
    version: 1.3.0
    sha: 0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: bitflags
    version: 2.6.0
    sha: b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de
  - kind: registry
    name: cc
    version: 1.1.6
    sha: 2aba8f4e9906c7ce3c73463f62a7f0c65183ada1a2d47e397cc8810827f9694f
  - kind: registry
    name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - kind: registry
    name: foreign-types
    version: 0.3.2
    sha: f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1
  - kind: registry
    name: foreign-types-shared
    version: 0.1.1
    sha: 00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b
  - kind: registry
    name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - kind: registry
    name: indoc
    version: 2.0.5
    sha: b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5
  - kind: registry
    name: libc
    version: 0.2.155
    sha: 97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: once_cell
    version: 1.19.0
    sha: 3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92
  - kind: registry
    name: openssl
    version: 0.10.66
    sha: 9529f4786b70a3e8c61e11179af17ab6188ad8d0ded78c5529441ed39d4bd9c1
  - kind: registry
    name: openssl-macros
    version: 0.1.1
    sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
  - kind: registry
    name: openssl-sys
    version: 0.9.103
    sha: 7f9e8deee91df40a943c71b917e5874b951d32a802526c85721ce3b776c929d6
  - kind: registry
    name: pem
    version: 3.0.4
    sha: 8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae
  - kind: registry
    name: pkg-config
    version: 0.3.30
    sha: d231b230927b5e4ad203db57bbcbee2802f6bce620b1e4a9024a07d94e2907ec
  - kind: registry
    name: portable-atomic
    version: 1.7.0
    sha: da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044ecfc67265
  - kind: registry
    name: proc-macro2
    version: 1.0.86
    sha: 5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77
  - kind: registry
    name: pyo3
    version: 0.22.2
    sha: 831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433
  - kind: registry
    name: pyo3-build-config
    version: 0.22.2
    sha: 1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8
  - kind: registry
    name: pyo3-ffi
    version: 0.22.2
    sha: 5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6
  - kind: registry
    name: pyo3-macros
    version: 0.22.2
    sha: eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206
  - kind: registry
    name: pyo3-macros-backend
    version: 0.22.2
    sha: ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372
  - kind: registry
    name: quote
    version: 1.0.36
    sha: 0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7
  - kind: registry
    name: self_cell
    version: 1.0.4
    sha: d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a
  - kind: registry
    name: syn
    version: 2.0.71
    sha: b146dcf730474b4bcd16c311627b31ede9ab149045db4d6088b3becaea046462
  - kind: registry
    name: target-lexicon
    version: 0.12.15
    sha: 4873307b7c257eddcb50c9bedf158eb669578359fb28428bef438fec8e6ba7c2
  - kind: registry
    name: unicode-ident
    version: 1.0.12
    sha: 3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b
  - kind: registry
    name: unindent
    version: 0.2.3
    sha: c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce
  - kind: registry
    name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
