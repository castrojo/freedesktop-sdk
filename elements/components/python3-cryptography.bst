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
  ref: 49.0.0-0-ge300bbe2f1bec75e5ee7e0ab7b196958831b3db6
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
    version: 2.13.0
    sha: b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8
  - kind: registry
    name: cc
    version: 1.2.64
    sha: dad887fd958be91b5098c0248def011f4523ab786cd411be668777e55063501f
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
    version: 0.29.0
    sha: cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c
  - kind: registry
    name: pyo3-build-config
    version: 0.29.0
    sha: c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078
  - kind: registry
    name: pyo3-ffi
    version: 0.29.0
    sha: ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b
  - kind: registry
    name: pyo3-macros
    version: 0.29.0
    sha: 9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771
  - kind: registry
    name: pyo3-macros-backend
    version: 0.29.0
    sha: 4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362
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
    version: 2.0.1
    sha: f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba
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
