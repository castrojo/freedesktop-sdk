kind: manual

(@):
- elements/include/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.94.0-aarch64-unknown-linux-gnu.tar.xz
  ref: c6fd6d1c925ed986df3b2c0b89bbc90ce15afb62e4d522a054e7d50c856b3c1a
