kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: 
    tar_https:static.rust-lang.org/dist/rust-1.92.0-loongarch64-unknown-linux-gnu.tar.xz
  ref: bd7d8d94709e5a6320f655cf469fd5ecd0b596e29247cd4f46ce0fbef2a21072
