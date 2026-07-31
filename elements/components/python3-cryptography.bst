# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-maturin.bst
- components/pkg-config.bst
- components/python3-setuptools.bst

depends:
- components/python3-cffi.bst
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pyca/cryptography.git
  track: '*.*.*'
  ref: 50.0.0-0-gdcb7050b807b00392fa9fe2eac7cb362fcf355cc
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
    version: 0.23.0
    sha: b25655df2c3cdd83c5e5b293b88acd880332b2ddadd7c30ac43144fdc0033da9
  - kind: registry
    name: bitflags
    version: 2.13.1
    sha: b588b76d00fde79687d7646a9b5bdf3cc0f655e0bbd080335a95d7e96f3587da
  - kind: registry
    name: cc
    version: 1.4.0
    sha: 5add81bb678e6cb321aff7fa0dc7689ad82b112dbc032cea19f91d6b8e3582b9
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
    version: 0.2.189
    sha: 3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2
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
    version: 4.0.0
    sha: d354a98a3d1251555de99e8fdd8afda05573c31b82f59063a7b0a29b5527f120
  - kind: registry
    name: pkg-config
    version: 0.3.33
    sha: 19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e
  - kind: registry
    name: portable-atomic
    version: 1.14.0
    sha: 3d20d5497ef88037a52ff98267d066e7f11fcc5e99bbfbd58a42336193aacec3
  - kind: registry
    name: proc-macro2
    version: 1.0.107
    sha: 985e7ec9bb745e6ce6535b544d84d6cd6f7ad8bd711c398938ae983b91a766d9
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
    version: 1.0.47
    sha: 1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001
  - kind: registry
    name: self_cell
    version: 1.3.0
    sha: 2ab42ca02749e120097e328d91d415325bdf43b1c72c4c8badf37375fe40a813
  - kind: registry
    name: shlex
    version: 2.0.1
    sha: f8fadd59c855ef2080decdef8ff161eb6661b86933c9d82e5ba29dc602a55aba
  - kind: registry
    name: syn
    version: 2.0.119
    sha: 872831b642d1a07999a962a351ed35b955ea2cfc8f3862091e2a240a84f17297
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
