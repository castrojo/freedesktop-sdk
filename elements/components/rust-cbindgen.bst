kind: manual

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- components/rust.bst
- components/gcc.bst
- components/stripper.bst

config:
  build-commands:
  - cargo build --release --frozen

  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}" target/release/cbindgen

sources:
- kind: git_repo
  track: v*
  url: github:mozilla/cbindgen.git
  ref: v0.29.0-0-g802154245edebe6bd031e473737da4c2fbdea8a3
- kind: cargo2
  cargo-lock: Cargo.lock
  ref:
  - kind: registry
    name: anstream
    version: 0.6.15
    sha: 64e15c1ab1f89faffbf04a634d5e1962e9074f2741eef6d97f3c4e322426d526
  - kind: registry
    name: anstyle
    version: 1.0.8
    sha: 1bec1de6f59aedf83baf9ff929c98f2ad654b97c9510f4e70cf6f661d49fd5b1
  - kind: registry
    name: anstyle-parse
    version: 0.2.5
    sha: eb47de1e80c2b463c735db5b217a0ddc39d612e7ac9e2e96a5aed1f57616c1cb
  - kind: registry
    name: anstyle-query
    version: 1.1.1
    sha: 6d36fc52c7f6c869915e99412912f22093507da8d9e942ceaf66fe4b7c14422a
  - kind: registry
    name: anstyle-wincon
    version: 3.0.4
    sha: 5bf74e1b6e971609db8ca7a9ce79fd5768ab6ae46441c572e46cf596f59e57f8
  - kind: registry
    name: autocfg
    version: 1.3.0
    sha: 0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0
  - kind: registry
    name: bitflags
    version: 2.6.0
    sha: b048fb63fd8b5923fc5aa7b340d8e156aec7ec02f0c78fa8a6ddc2613f6f71de
  - kind: registry
    name: cfg-if
    version: 1.0.0
    sha: baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd
  - kind: registry
    name: clap
    version: 4.5.15
    sha: 11d8838454fda655dafd3accb2b6e2bea645b9e4078abe84a22ceb947235c5cc
  - kind: registry
    name: clap_builder
    version: 4.5.15
    sha: 216aec2b177652e3846684cbfe25c9964d18ec45234f0f5da5157b207ed1aab6
  - kind: registry
    name: clap_lex
    version: 0.7.2
    sha: 1462739cb27611015575c0c11df5df7601141071f07518d56fcc1be504cbec97
  - kind: registry
    name: colorchoice
    version: 1.0.2
    sha: d3fd119d74b830634cea2a0f58bbd0d54540518a14397557951e79340abc28c0
  - kind: registry
    name: dashmap
    version: 5.5.3
    sha: 978747c1d849a7d2ee5e8adc0159961c48fb7e5db2f06af6723b80123bb53856
  - kind: registry
    name: diff
    version: 0.1.13
    sha: 56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8
  - kind: registry
    name: equivalent
    version: 1.0.1
    sha: 5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5
  - kind: registry
    name: errno
    version: 0.3.9
    sha: 534c5cf6194dfab3db3242765c03bbe257cf92f22b38f6bc0c58d59108a820ba
  - kind: registry
    name: fastrand
    version: 2.1.0
    sha: 9fc0510504f03c51ada170672ac806f1f105a88aa97a5281117e1ddc3368e51a
  - kind: registry
    name: hashbrown
    version: 0.14.5
    sha: e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1
  - kind: registry
    name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - kind: registry
    name: indexmap
    version: 2.3.0
    sha: de3fc2e30ba82dd1b3911c8de1ffc143c74a914a14e99514d7637e3099df5ea0
  - kind: registry
    name: is_terminal_polyfill
    version: 1.70.1
    sha: 7943c866cc5cd64cbc25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf
  - kind: registry
    name: itoa
    version: 1.0.11
    sha: 49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b
  - kind: registry
    name: lazy_static
    version: 1.5.0
    sha: bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe
  - kind: registry
    name: libc
    version: 0.2.155
    sha: 97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c
  - kind: registry
    name: linux-raw-sys
    version: 0.4.14
    sha: 78b3ae25bc7c8c38cec158d1f2757ee79e9b3740fbc7ccf0e59e4b08d793fa89
  - kind: registry
    name: lock_api
    version: 0.4.12
    sha: 07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17
  - kind: registry
    name: log
    version: 0.4.22
    sha: a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24
  - kind: registry
    name: memchr
    version: 2.7.4
    sha: 78ca9ab1a0babb1e7d5695e3530886289c18cf2f87ec19a575a0abdce112e3a3
  - kind: registry
    name: once_cell
    version: 1.19.0
    sha: 3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92
  - kind: registry
    name: parking_lot
    version: 0.12.3
    sha: f1bf18183cf54e8d6059647fc3063646a1801cf30896933ec2311622cc4b9a27
  - kind: registry
    name: parking_lot_core
    version: 0.9.10
    sha: 1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8
  - kind: registry
    name: pretty_assertions
    version: 1.4.0
    sha: af7cee1a6c8a5b9208b3cb1061f10c0cb689087b3d8ce85fb9d2dd7a29b6ba66
  - kind: registry
    name: proc-macro2
    version: 1.0.86
    sha: 5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77
  - kind: registry
    name: quote
    version: 1.0.36
    sha: 0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7
  - kind: registry
    name: redox_syscall
    version: 0.5.3
    sha: 2a908a6e00f1fdd0dfd9c0eb08ce85126f6d8bbda50017e74bc4a4b7d4a926a4
  - kind: registry
    name: rustix
    version: 0.38.34
    sha: 70dc5ec042f7a43c4a73241207cecc9873a06d45debb38b329f8541d85c2730f
  - kind: registry
    name: ryu
    version: 1.0.18
    sha: f3cb5ba0dc43242ce17de99c180e96db90b235b8a9fdc9543c96d2209116bd9f
  - kind: registry
    name: scopeguard
    version: 1.2.0
    sha: 94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49
  - kind: registry
    name: serde
    version: 1.0.205
    sha: e33aedb1a7135da52b7c21791455563facbbcc43d0f0f66165b42c21b3dfb150
  - kind: registry
    name: serde_derive
    version: 1.0.205
    sha: 692d6f5ac90220161d6774db30c662202721e64aed9058d2c394f451261420c1
  - kind: registry
    name: serde_json
    version: 1.0.122
    sha: 784b6203951c57ff748476b126ccb5e8e2959a5c19e5c617ab1956be3dbc68da
  - kind: registry
    name: serde_spanned
    version: 0.6.7
    sha: eb5b1b31579f3811bf615c144393417496f152e12ac8b7663bf664f4a815306d
  - kind: registry
    name: serial_test
    version: 2.0.0
    sha: 0e56dd856803e253c8f298af3f4d7eb0ae5e23a737252cd90bb4f3b435033b2d
  - kind: registry
    name: serial_test_derive
    version: 2.0.0
    sha: 91d129178576168c589c9ec973feedf7d3126c01ac2bf08795109aa35b69fb8f
  - kind: registry
    name: smallvec
    version: 1.13.2
    sha: 3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67
  - kind: registry
    name: strsim
    version: 0.11.1
    sha: 7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f
  - kind: registry
    name: syn
    version: 2.0.85
    sha: 5023162dfcd14ef8f32034d8bcd4cc5ddc61ef7a247c024a33e24e1f24d21b56
  - kind: registry
    name: tempfile
    version: 3.12.0
    sha: 04cbcdd0c794ebb0d4cf35e88edd2f7d2c4c3e9a5a6dab322839b321c6a87a64
  - kind: registry
    name: toml
    version: 0.8.19
    sha: a1ed1f98e3fdc28d6d910e6737ae6ab1a93bf1985935a1193e68f93eeb68d24e
  - kind: registry
    name: toml_datetime
    version: 0.6.8
    sha: 0dd7358ecb8fc2f8d014bf86f6f638ce72ba252a2c3a2572f2a795f1d23efb41
  - kind: registry
    name: toml_edit
    version: 0.22.20
    sha: 583c44c02ad26b0c3f3066fe629275e50627026c51ac2e595cca4c230ce1ce1d
  - kind: registry
    name: unicode-ident
    version: 1.0.12
    sha: 3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b
  - kind: registry
    name: utf8parse
    version: 0.2.2
    sha: 06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821
  - kind: registry
    name: windows-sys
    version: 0.52.0
    sha: 282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d
  - kind: registry
    name: windows-sys
    version: 0.59.0
    sha: 1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b
  - kind: registry
    name: windows-targets
    version: 0.52.6
    sha: 9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973
  - kind: registry
    name: windows_aarch64_gnullvm
    version: 0.52.6
    sha: 32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3
  - kind: registry
    name: windows_aarch64_msvc
    version: 0.52.6
    sha: 09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469
  - kind: registry
    name: windows_i686_gnu
    version: 0.52.6
    sha: 8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b
  - kind: registry
    name: windows_i686_gnullvm
    version: 0.52.6
    sha: 0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66
  - kind: registry
    name: windows_i686_msvc
    version: 0.52.6
    sha: 240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66
  - kind: registry
    name: windows_x86_64_gnu
    version: 0.52.6
    sha: 147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78
  - kind: registry
    name: windows_x86_64_gnullvm
    version: 0.52.6
    sha: 24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d
  - kind: registry
    name: windows_x86_64_msvc
    version: 0.52.6
    sha: 589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec
  - kind: registry
    name: winnow
    version: 0.6.18
    sha: 68a9bda4691f099d435ad181000724da8e5899daa10713c2d432552b9ccd3a6f
  - kind: registry
    name: yansi
    version: 0.5.1
    sha: 09041cd90cf85f7f8b2df60c646f853b7f535ce68f85244eb6731cf89fa498ec
