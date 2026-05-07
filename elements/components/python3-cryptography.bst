kind: pyproject

build-depends:
- public-stacks/buildsystem-python-maturin.bst
- components/python3-setuptools.bst
- components/pkg-config.bst

depends:
- components/python3.bst
- components/python3-cffi.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pyca/cryptography.git
  track: '*.*.*'
  ref: 48.0.0-0-g8e03e30e3aae01632a697e903e3593c924f0139d
- kind: cargo2
  cargo-lock: Cargo.lock
  ref:
  - kind: registry
    name: asn1
    version: 0.24.1
    sha: c9795210620c0cb3f9a7ce4f882808c38e1ef7b347c90591dceae0886e031fb1
  - kind: registry
    name: asn1_derive
    version: 0.24.1
    sha: 909e307f1cc32bb8bccbd98f446e6d1bf03fa30f7b53a4337da7181ad30fa11a
  - kind: registry
    name: base64
    version: 0.22.1
    sha: 72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6
  - kind: registry
    name: bitflags
    version: 2.11.1
    sha: c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3
  - kind: registry
    name: cc
    version: 1.2.61
    sha: d16d90359e986641506914ba71350897565610e87ce0ad9e6f28569db3dd5c6d
  - kind: registry
    name: cfg-if
    version: 1.0.4
    sha: 9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801
  - kind: registry
    name: find-msvc-tools
    version: 0.1.9
    sha: 5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582
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
    name: itoa
    version: 1.0.18
    sha: 8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682
  - kind: registry
    name: libc
    version: 0.2.186
    sha: 68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66
  - kind: registry
    name: once_cell
    version: 1.21.4
    sha: 9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50
  - kind: registry
    name: openssl
    version: 0.10.79
    sha: bf0b434746ee2832f4f0baf10137e1cabb18cbe6912c69e2e33263c45250f542
  - kind: registry
    name: openssl-macros
    version: 0.1.1
    sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
  - kind: registry
    name: openssl-sys
    version: 0.9.115
    sha: 158fe5b292746440aa6e7a7e690e55aeb72d41505e2804c23c6973ad0e9c9781
  - kind: registry
    name: pem
    version: 3.0.6
    sha: 1d30c53c26bc5b31a98cd02d20f25a7c8567146caf63ed593a9d87b2775291be
  - kind: registry
    name: pkg-config
    version: 0.3.33
    sha: 19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e
  - kind: registry
    name: portable-atomic
    version: 1.13.1
    sha: c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49
  - kind: registry
    name: proc-macro2
    version: 1.0.106
    sha: 8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934
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
    name: quote
    version: 1.0.45
    sha: 41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924
  - kind: registry
    name: self_cell
    version: 1.2.2
    sha: b12e76d157a900eb52e81bc6e9f3069344290341720e9178cde2407113ac8d89
  - kind: registry
    name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - kind: registry
    name: syn
    version: 2.0.117
    sha: e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99
  - kind: registry
    name: target-lexicon
    version: 0.13.5
    sha: adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca
  - kind: registry
    name: unicode-ident
    version: 1.0.24
    sha: e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75
  - kind: registry
    name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
