kind: manual

depends:
- bootstrap-import.bst

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
  - install -Dm755 -t "%{install-root}%{bindir}" target/release/cbindgen

sources:
- kind: git_repo
  track: v*
  url: github:mozilla/cbindgen.git
  ref: v0.26.0-0-g703b53c06f9fe2dbc0193d67626558cfa84a0f62
- kind: cargo
  cargo-lock: Cargo.lock
  ref:
  - name: atty
    version: 0.2.14
    sha: d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8
  - name: autocfg
    version: 1.1.0
    sha: d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa
  - name: bitflags
    version: 1.3.2
    sha: bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a
  - name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - name: clap
    version: 3.2.25
    sha: 4ea181bf566f71cb9a5d17a59e1871af638180a18fb0035c92ae62b705207123
  - name: clap_lex
    version: 0.2.4
    sha: 2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f952765261c5
  - name: fastrand
    version: 1.9.0
    sha: e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be
  - name: hashbrown
    version: 0.12.3
    sha: 8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888
  - name: heck
    version: 0.4.1
    sha: 95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8
  - name: hermit-abi
    version: 0.1.19
    sha: 62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33
  - name: indexmap
    version: 1.9.3
    sha: bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99
  - name: instant
    version: 0.1.12
    sha: 7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c
  - name: itoa
    version: 1.0.6
    sha: 453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6
  - name: lazy_static
    version: 1.4.0
    sha: e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646
  - name: libc
    version: 0.2.144
    sha: 2b00cc1c228a6782d0f076e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1
  - name: lock_api
    version: 0.4.9
    sha: 435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df
  - name: log
    version: 0.4.17
    sha: abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e
  - name: os_str_bytes
    version: 6.5.0
    sha: ceedf44fb00f2d1984b0bc98102627ce622e083e49a5bacdb3e514fa4238e267
  - name: parking_lot
    version: 0.11.2
    sha: 7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99
  - name: parking_lot_core
    version: 0.8.6
    sha: 60a2cfe6f0ad2bfc16aefa463b497d5c7a5ecd44a23efa72aa342d90177356dc
  - name: proc-macro2
    version: 1.0.66
    sha: 18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9
  - name: quote
    version: 1.0.27
    sha: 8f4f29d145265ec1c483c7c654450edde0bfe043d3938d6972630663356d9500
  - name: redox_syscall
    version: 0.2.16
    sha: fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a
  - name: remove_dir_all
    version: 0.5.3
    sha: 3acd125665422973a33ac9d3dd2df85edad0f4ae9b00dafb1a05e43a9f5ef8e7
  - name: ryu
    version: 1.0.13
    sha: f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a77a79041
  - name: scopeguard
    version: 1.1.0
    sha: d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd
  - name: serde
    version: 1.0.163
    sha: 2113ab51b87a539ae008b5c6c02dc020ffa39afd2d83cffcb3f4eb2722cebec2
  - name: serde_derive
    version: 1.0.163
    sha: 8c805777e3930c8883389c602315a24224bcc738b63905ef87cd1420353ea93e
  - name: serde_json
    version: 1.0.96
    sha: 057d394a50403bcac12672b2b18fb387ab6d289d957dab67dd201875391e52f1
  - name: serial_test
    version: 0.5.1
    sha: e0bccbcf40c8938196944a3da0e133e031a33f4d6b72db3bda3cc556e361905d
  - name: serial_test_derive
    version: 0.5.1
    sha: b2acd6defeddb41eb60bb468f8825d0cfd0c2a76bc03bfd235b6a1dc4f6a1ad5
  - name: smallvec
    version: 1.10.0
    sha: a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0
  - name: strsim
    version: 0.10.0
    sha: 73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623
  - name: syn
    version: 1.0.109
    sha: 72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237
  - name: syn
    version: 2.0.16
    sha: a6f671d4b5ffdb8eadec19c0ae67fe2639df8684bd7bc4b83d986b8db549cf01
  - name: tempfile
    version: 3.3.0
    sha: 5cdb1ef4eaeeaddc8fbd371e5017057064af0911902ef36b39801f67cc6d79e4
  - name: termcolor
    version: 1.2.0
    sha: be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6
  - name: textwrap
    version: 0.16.0
    sha: 222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d
  - name: toml
    version: 0.5.11
    sha: f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234
  - name: unicode-ident
    version: 1.0.8
    sha: e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4
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
