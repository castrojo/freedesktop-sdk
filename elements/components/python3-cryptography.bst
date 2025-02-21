kind: pyproject

build-depends:
- public-stacks/buildsystem-python-maturin.bst
- components/python3-setuptools.bst
- components/pkg-config.bst

depends:
- components/python3.bst
- components/python3-cffi.bst

sources:
- kind: git_repo
  url: github:pyca/cryptography.git
  track: '*.*.*'
  ref: 44.0.1-0-gadaaaed77db676bbaa9d171175db81dce056e2a7
- kind: cargo2
  cargo-lock: Cargo.lock
  ref:
  - kind: registry
    name: asn1
    version: 0.20.0
    sha: 2d8b84b4ea1de2bf1dcd2a759737ddb328fb6695b2a95eb7e44fed67e3406f32
  - kind: registry
    name: asn1_derive
    version: 0.20.0
    sha: a200809d0138620b3dba989f1d08d0620e76248bc1e62a2ec1b2df5eb1ee08ad
  - kind: registry
    name: autocfg
    version: 1.4.0
    sha: ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26
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
    version: 1.2.1
    sha: fd9de9f2205d5ef3fd67e685b0df337994ddd4495e2a28d185500d0e1edfea47
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
    name: itoa
    version: 1.0.14
    sha: d75a2a4b1b190afb6f5425f10f6a8f959d2ea0b9c2b1d79553551850539e4674
  - kind: registry
    name: libc
    version: 0.2.166
    sha: c2ccc108bbc0b1331bd061864e7cd823c0cab660bbe6970e66e2c0614decde36
  - kind: registry
    name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - kind: registry
    name: once_cell
    version: 1.20.2
    sha: 1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775
  - kind: registry
    name: openssl
    version: 0.10.68
    sha: 6174bc48f102d208783c2c84bf931bb75927a617866870de8a4ea85597f871f5
  - kind: registry
    name: openssl-macros
    version: 0.1.1
    sha: a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c
  - kind: registry
    name: openssl-sys
    version: 0.9.104
    sha: 45abf306cbf99debc8195b66b7346498d7b10c210de50418b5ccd7ceba08c741
  - kind: registry
    name: pem
    version: 3.0.4
    sha: 8e459365e590736a54c3fa561947c84837534b8e9af6fc5bf781307e82658fae
  - kind: registry
    name: pkg-config
    version: 0.3.31
    sha: 953ec861398dccce10c670dfeaf3ec4911ca479e9c02154b3a215178c5f566f2
  - kind: registry
    name: portable-atomic
    version: 1.10.0
    sha: 280dc24453071f1b63954171985a0b0d30058d287960968b9b2aca264c8d4ee6
  - kind: registry
    name: proc-macro2
    version: 1.0.92
    sha: 37d3544b3f2748c54e147655edb5025752e2303145b5aefb3c3ea2c78b973bb0
  - kind: registry
    name: pyo3
    version: 0.23.4
    sha: 57fe09249128b3173d092de9523eaa75136bf7ba85e0d69eca241c7939c933cc
  - kind: registry
    name: pyo3-build-config
    version: 0.23.4
    sha: 1cd3927b5a78757a0d71aa9dff669f903b1eb64b54142a9bd9f757f8fde65fd7
  - kind: registry
    name: pyo3-ffi
    version: 0.23.4
    sha: dab6bb2102bd8f991e7749f130a70d05dd557613e39ed2deeee8e9ca0c4d548d
  - kind: registry
    name: pyo3-macros
    version: 0.23.4
    sha: 91871864b353fd5ffcb3f91f2f703a22a9797c91b9ab497b1acac7b07ae509c7
  - kind: registry
    name: pyo3-macros-backend
    version: 0.23.4
    sha: 43abc3b80bc20f3facd86cd3c60beed58c3e2aa26213f3cda368de39c60a27e4
  - kind: registry
    name: quote
    version: 1.0.37
    sha: b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af
  - kind: registry
    name: self_cell
    version: 1.0.4
    sha: d369a96f978623eb3dc28807c4852d6cc617fed53da5d3c400feff1ef34a714a
  - kind: registry
    name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - kind: registry
    name: syn
    version: 2.0.89
    sha: 44d46482f1c1c87acd84dea20c1bf5ebff4c757009ed6bf19cfd36fb10e92c4e
  - kind: registry
    name: target-lexicon
    version: 0.12.16
    sha: 61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1
  - kind: registry
    name: unicode-ident
    version: 1.0.14
    sha: adb9e6ca4f869e1180728b7950e35922a7fc6397f7b641499e8f3ef06e50dc83
  - kind: registry
    name: unindent
    version: 0.2.3
    sha: c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce
  - kind: registry
    name: vcpkg
    version: 0.2.15
    sha: accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426
