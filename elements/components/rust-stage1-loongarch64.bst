kind: manual

(@):
- elements/components/rust-stage1-common.yml

# Use the previous version of the compiler to bootstrap the new one.
# That's how upstream recommends doing it.
sources:
- kind: tar
  url: tar_https:static.rust-lang.org/dist/rust-1.99.1-loongarch64-unknown-linux-gnu.tar.xz
  ref: bc2c4c8ee4d8649cd3a3b81b4455e58161bb57fa86a03190668e7c7ab1b52fec
